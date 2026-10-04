using System.Text.Json;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using System.Security.Cryptography;
static string Hash(string s)=>Convert.ToHexString(SHA256.HashData(System.Text.Encoding.UTF8.GetBytes(s))).ToLowerInvariant();
using var output=new StreamWriter("manifest/inside_csharp_profiles.jsonl");
foreach(var line in File.ReadLines("manifest/sources.jsonl")){
 using var doc=JsonDocument.Parse(line);var r=doc.RootElement;
 if(!r.TryGetProperty("source_type",out var st)||st.GetString()!="inside_file"||!r.GetProperty("archive_path").GetString()!.EndsWith(".cs"))continue;
 string source=r.GetProperty("id").GetString()!,family=r.GetProperty("api_family").GetString()!,path=r.GetProperty("archive_path").GetString()!;
 if((family!="rhino_inside_revit"&&family!="rhino_inside_autocad")||!path.StartsWith("src/"))continue;
 if(args.Length>0&&family!=args[0])continue;
 string content=File.ReadAllText(r.GetProperty("cache_path").GetString()!);
 foreach(int year in family=="rhino_inside_revit"?Enumerable.Range(2017,11):new[]{2024,2025,2027}){
  // Authoritative External.csproj removes DB/Schemas/*/* and includes only
  // DB/Schemas/$(RevitVersion)/*.cs. Do not attribute a schema to other hosts.
  var schema=System.Text.RegularExpressions.Regex.Match(path,@"^src/RhinoInside.Revit.External/DB/Schemas/(\d{4})/");
  if(family=="rhino_inside_revit"&&schema.Success&&int.Parse(schema.Groups[1].Value)!=year)continue;
  var defines=new List<string>{"RHINO_7","RHINO_8","NETFRAMEWORK"};
  if(year>=2025){defines.Remove("NETFRAMEWORK");defines.Add("NET");defines.Add("NETCOREAPP");defines.Add("NET5_0_OR_GREATER");defines.Add(year==2027?"NET10_0":"NET8_0");}else defines.Add("NET481");
  if(family=="rhino_inside_autocad"){defines.Remove("RHINO_7");defines.Remove("RHINO_8");defines.Remove("NET481");if(year==2024)defines.Add("NET48");}
  if(family=="rhino_inside_revit")defines.AddRange(Enumerable.Range(2017,year-2017+1).Select(y=>"REVIT_"+y));
  var tree=CSharpSyntaxTree.ParseText(content,new CSharpParseOptions(LanguageVersion.Preview,preprocessorSymbols:defines));var root=tree.GetRoot();
  var chars=content.ToCharArray();
  foreach(var trivia in root.DescendantTrivia(descendIntoTrivia:true).Where(t=>t.IsKind(SyntaxKind.DisabledTextTrivia)||t.IsDirective))for(int i=trivia.FullSpan.Start;i<trivia.FullSpan.End;i++)if(chars[i]!='\n'&&chars[i]!='\r')chars[i]=' ';
  string filtered=new string(chars);
  var symbols=new List<object>();
  foreach(var m in root.DescendantNodes().OfType<MemberDeclarationSyntax>()){
   bool visible=m.Modifiers.Any(SyntaxKind.PublicKeyword)||m.Modifiers.Any(SyntaxKind.ProtectedKeyword)||m is EnumMemberDeclarationSyntax||m.Parent is InterfaceDeclarationSyntax;
   if(!visible||m.Ancestors().OfType<BaseTypeDeclarationSyntax>().Any(t=>!t.Modifiers.Any(SyntaxKind.PublicKeyword)&&!t.Modifiers.Any(SyntaxKind.ProtectedKeyword)))continue;
   string scope=string.Join(".",m.Ancestors().Reverse().Select(n=>n is BaseNamespaceDeclarationSyntax ns?ns.Name.ToString():n is BaseTypeDeclarationSyntax t?t.Identifier.Text:null).Where(n=>n!=null));
   string name=m switch{BaseTypeDeclarationSyntax t=>t.Identifier.Text,MethodDeclarationSyntax a=>a.Identifier.Text,ConstructorDeclarationSyntax a=>a.Identifier.Text,PropertyDeclarationSyntax a=>a.Identifier.Text,IndexerDeclarationSyntax=>"this[]",EnumMemberDeclarationSyntax a=>a.Identifier.Text,EventDeclarationSyntax a=>a.Identifier.Text,FieldDeclarationSyntax a=>string.Join(",",a.Declaration.Variables.Select(v=>v.Identifier.Text)),EventFieldDeclarationSyntax a=>string.Join(",",a.Declaration.Variables.Select(v=>v.Identifier.Text)),DelegateDeclarationSyntax a=>a.Identifier.Text,OperatorDeclarationSyntax a=>"operator"+a.OperatorToken.Text,ConversionOperatorDeclarationSyntax a=>"operator"+a.Type.ToString(),_=>m.Kind().ToString()};
   int ln=m.GetLocation().GetLineSpan().StartLinePosition.Line+1;
   // Signature tokens stop before executable/member bodies; full code is separately retained.
   int end=m switch{BaseTypeDeclarationSyntax a=>a.OpenBraceToken.SpanStart,MethodDeclarationSyntax a=>a.Body?.SpanStart??a.ExpressionBody?.SpanStart??a.Span.End,ConstructorDeclarationSyntax a=>a.Body?.SpanStart??a.ExpressionBody?.SpanStart??a.Span.End,PropertyDeclarationSyntax a=>a.AccessorList?.SpanStart??a.ExpressionBody?.SpanStart??a.Span.End,_=>m.Span.End};
   string sig=filtered.Substring(m.SpanStart,Math.Max(0,end-m.SpanStart)).Trim();string id="hostapi|"+source+"|"+scope+"."+name+"|"+ln+"|"+Hash(sig);
   symbols.Add(new{id,source_id=source,api_family=family,name,qualified_name=scope+"."+name,@namespace=scope,kind=m.Kind().ToString(),line=ln,signature=sig,documentation_xml=string.Concat(m.GetLeadingTrivia().Where(t=>t.IsKind(SyntaxKind.SingleLineDocumentationCommentTrivia)||t.IsKind(SyntaxKind.MultiLineDocumentationCommentTrivia))),documented=m.GetLeadingTrivia().Any(t=>t.IsKind(SyntaxKind.SingleLineDocumentationCommentTrivia)||t.IsKind(SyntaxKind.MultiLineDocumentationCommentTrivia)),inventory_method="Roslyn public/protected source AST under explicit Rhino8/Revit build defines; not binary or runtime binding proof"});
  }
  output.WriteLine(JsonSerializer.Serialize(new{source_id=source,profile=(family=="rhino_inside_revit"?"Rhino8-Revit":"Rhino8-AutoCAD-Civil3D")+year,defines,text=filtered,symbols,errors=tree.GetDiagnostics().Where(d=>d.Severity==DiagnosticSeverity.Error).Select(d=>d.ToString()).ToArray()}));
 }
}
