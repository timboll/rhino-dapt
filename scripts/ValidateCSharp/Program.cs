using System.Text.Json;
using Microsoft.CodeAnalysis;
using Microsoft.CodeAnalysis.CSharp;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using var output=new StreamWriter(args[1]);
using var inventory=new StreamWriter("manifest/compute_csharp_symbols.jsonl");
foreach(var line in File.ReadLines(args[0])){
 using var row=JsonDocument.Parse(line);var r=row.RootElement;
 if(!r.TryGetProperty("archive_path",out var path)||!path.GetString()!.EndsWith(".cs"))continue;
 string source=r.GetProperty("id").GetString()!;
 var tree=CSharpSyntaxTree.ParseText(File.ReadAllText(r.GetProperty("cache_path").GetString()!),new CSharpParseOptions(LanguageVersion.Preview));
 var errors=tree.GetDiagnostics().Where(d=>d.Severity==DiagnosticSeverity.Error).Select(d=>new {id=d.Id,message=d.GetMessage(),line=d.Location.GetLineSpan().StartLinePosition.Line+1}).ToArray();
 output.WriteLine(JsonSerializer.Serialize(new {source_id=source,validation="C# syntax parse using cached Roslyn 4.14, preview language; does not prove target API binding",status=errors.Length==0?"passed":"failed",errors}));
 if(r.TryGetProperty("api_family",out var family)&&family.GetString()=="compute"){
  foreach(var member in tree.GetRoot().DescendantNodes().OfType<MemberDeclarationSyntax>()){
   var modifiers=member.Modifiers;
   if(!modifiers.Any(SyntaxKind.PublicKeyword)&&!modifiers.Any(SyntaxKind.ProtectedKeyword)&&member is not EnumMemberDeclarationSyntax&&member.Parent is not InterfaceDeclarationSyntax)continue;
   var scope=string.Join(".",member.Ancestors().Reverse().Select(n=>n is NamespaceDeclarationSyntax ns?ns.Name.ToString():n is BaseTypeDeclarationSyntax t?t.Identifier.Text:null).Where(n=>n!=null));
   string name=member switch{BaseTypeDeclarationSyntax t=>t.Identifier.Text,MethodDeclarationSyntax m=>m.Identifier.Text,ConstructorDeclarationSyntax c=>c.Identifier.Text,PropertyDeclarationSyntax p=>p.Identifier.Text,IndexerDeclarationSyntax=>"this[]",EnumMemberDeclarationSyntax e=>e.Identifier.Text,EventDeclarationSyntax e=>e.Identifier.Text,FieldDeclarationSyntax f=>string.Join(",",f.Declaration.Variables.Select(v=>v.Identifier.Text)),EventFieldDeclarationSyntax f=>string.Join(",",f.Declaration.Variables.Select(v=>v.Identifier.Text)),DelegateDeclarationSyntax d=>d.Identifier.Text,OperatorDeclarationSyntax o=>"operator"+o.OperatorToken.Text,ConversionOperatorDeclarationSyntax o=>"operator"+o.Type.ToString(),_=>member.Kind().ToString()};
   int lineNumber=member.GetLocation().GetLineSpan().StartLinePosition.Line+1;
   string text=member.ToFullString();
   string id="sourceapi|"+source+"|"+scope+"."+name+"|"+lineNumber;
   inventory.WriteLine(JsonSerializer.Serialize(new {id,source_id=source,api_family="compute",name,qualified_name=scope+"."+name,@namespace=scope,kind=member.Kind().ToString(),line=lineNumber,signature=text,documented=member.GetLeadingTrivia().Any(t=>t.IsKind(SyntaxKind.SingleLineDocumentationCommentTrivia)||t.IsKind(SyntaxKind.MultiLineDocumentationCommentTrivia)),inventory_method="Roslyn source declaration AST; remote client/service version is separate from RhinoCommon target metadata"}));
  }
 }
}
