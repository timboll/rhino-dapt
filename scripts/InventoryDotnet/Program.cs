using Mono.Cecil;
using System.Text.Json;
using System.Security.Cryptography;
class Program {
 static JsonSerializerOptions JO=new(){NumberHandling=System.Text.Json.Serialization.JsonNumberHandling.AllowNamedFloatingPointLiterals};
 static string Serialize(object o)=>JsonSerializer.Serialize(o,JO);
 static string NS(TypeDefinition t)=>t.DeclaringType==null?t.Namespace:NS(t.DeclaringType);
 static string TN(TypeReference t) => t.FullName.Replace('/','.');
 static string DT(TypeReference t) {
  if(t is GenericParameter g) return (g.Type==GenericParameterType.Method?"``":"`")+g.Position;
  if(t is ByReferenceType b) return DT(b.ElementType)+"@";
  if(t is PointerType p) return DT(p.ElementType)+"*";
  if(t is ArrayType a) return DT(a.ElementType)+(a.IsVector?"[]":"["+string.Join(",",Enumerable.Repeat("0:",a.Rank))+"]");
  if(t is GenericInstanceType gi) {
   int offset=0;var parts=new List<string>();
   foreach(var segment in gi.ElementType.FullName.Split('/')){
    var match=System.Text.RegularExpressions.Regex.Match(segment,"`([0-9]+)$");int count=match.Success?int.Parse(match.Groups[1].Value):0;
    var n=match.Success?segment[..match.Index]:segment;
    if(count>0){n+="{"+string.Join(",",gi.GenericArguments.Skip(offset).Take(count).Select(DT))+"}";offset+=count;}
    parts.Add(n);
   }
   return string.Join(".",parts);
  }
  if(t is OptionalModifierType om) return DT(om.ElementType);
  if(t is RequiredModifierType rm) return DT(rm.ElementType);
  return TN(t);
 }
 static string Params(IEnumerable<ParameterDefinition> ps) => ps.Any()?"("+string.Join(",",ps.Select(p=>DT(p.ParameterType)))+")":"";
 static string Doc(IMemberDefinition m) {
  if(m is TypeDefinition t) return "T:"+TN(t);
  var n=TN(m.DeclaringType)+"."+m.Name.Replace('.','#').Replace('<','{').Replace('>','}');
  if(m is MethodDefinition mm) return "M:"+n+(mm.HasGenericParameters?"``"+mm.GenericParameters.Count:"")+Params(mm.Parameters)+((mm.Name=="op_Implicit"||mm.Name=="op_Explicit")?"~"+DT(mm.ReturnType):"");
  if(m is PropertyDefinition pp) return "P:"+n+Params(pp.Parameters);
  return (m is EventDefinition?"E:":"F:")+n;
 }
 static bool Visible(TypeDefinition t)=> t.DeclaringType==null?t.IsPublic:Visible(t.DeclaringType)&&(t.IsNestedPublic||t.IsNestedFamily||t.IsNestedFamilyOrAssembly);
 static bool MV(MethodDefinition? m)=>m!=null&&(m.IsPublic||m.IsFamily||m.IsFamilyOrAssembly);
 static bool MemberVisible(IMemberDefinition m)=>m is TypeDefinition t?Visible(t):Visible(m.DeclaringType)&&(m is MethodDefinition mm?MV(mm):m is FieldDefinition f?(f.IsPublic||f.IsFamily||f.IsFamilyOrAssembly):m is PropertyDefinition p?(MV(p.GetMethod)||MV(p.SetMethod)):m is EventDefinition e?(MV(e.AddMethod)||MV(e.RemoveMethod)||MV(e.InvokeMethod)):false);
 static object[] Attr(ICustomAttributeProvider p)=>p.CustomAttributes.Select(a=>(object)new {type=TN(a.AttributeType),arguments=a.ConstructorArguments.Select(AV).ToArray(),fields=a.Fields.Select(f=>new {name=f.Name,value=AV(f.Argument)}).ToArray(),properties=a.Properties.Select(f=>new {name=f.Name,value=AV(f.Argument)}).ToArray()}).ToArray();
 static object? AV(CustomAttributeArgument a)=>a.Value is CustomAttributeArgument boxed?AV(boxed):a.Value is CustomAttributeArgument[] ar?ar.Select(AV).ToArray():a.Value is TypeReference tr?TN(tr):a.Value;
 static object[] GP(IGenericParameterProvider p)=>p.GenericParameters.Select(g=>(object)new {name=g.Name,position=g.Position,attributes=g.Attributes.ToString(),constraints=g.Constraints.Select(c=>TN(c.ConstraintType)).ToArray(),custom_attributes=Attr(g)}).ToArray();
 static object[] PP(IEnumerable<ParameterDefinition> ps)=>ps.Select(p=>(object)new {name=p.Name,position=p.Index,type=TN(p.ParameterType),attributes=p.Attributes.ToString(),has_default=p.HasConstant,default_value=p.HasConstant?p.Constant:null,custom_attributes=Attr(p)}).ToArray();
 static IEnumerable<TypeDefinition> Types(IEnumerable<TypeDefinition> ts) { foreach(var t in ts){yield return t;foreach(var n in Types(t.NestedTypes))yield return n;} }
 static void Main(string[] args) {
  using var input=JsonDocument.Parse(File.ReadAllText(args[0]));
  var resolver=new DefaultAssemblyResolver();resolver.AddSearchDirectory("sources/assembly_resolution");
  using var output=new StreamWriter(args[1]);using var assemblies=new StreamWriter(args[2]);using var errors=new StreamWriter(args[3]);
  using var nonpublic=new StreamWriter(args.Length>4?args[4]:"manifest/nonpublic_symbols.raw.jsonl");
  foreach(var src in input.RootElement.EnumerateArray()) {
   string path=src.GetProperty("cache_path").GetString()!, source=src.GetProperty("id").GetString()!;
   try {
    using var a=AssemblyDefinition.ReadAssembly(path,new ReaderParameters{ReadSymbols=false,ReadingMode=ReadingMode.Deferred,AssemblyResolver=resolver});
    var company=a.CustomAttributes.FirstOrDefault(x=>x.AttributeType.Name=="AssemblyCompanyAttribute")?.ConstructorArguments.FirstOrDefault().Value?.ToString();
    string name=a.Name.Name;
    bool include=(company?.Contains("McNeel",StringComparison.OrdinalIgnoreCase)??false)||name.StartsWith("Rhino")||name.StartsWith("McNeel.")||name.StartsWith("Ed.")||name.StartsWith("GH_")||name=="Grasshopper"||name.StartsWith("Eto")||name is "NodeInCode" or "PanelingToolsDotNet" or "KangarooSolver" or "Galapagos";
    string family=name=="RhinoWindows"?"rhino_windows":name=="Rhino.Inside"?"rhino_inside_loader":name=="Rhino3dm"?"rhino3dm":name=="RhinoCommon"?"rhinocommon":name=="Rhino.UI"?"rhino_ui":name=="Grasshopper"?"grasshopper":name=="GH_IO"?"gh_io":name.StartsWith("Eto")?"eto":"other_dotnet";
    assemblies.WriteLine(Serialize(new {name,version=a.Name.Version.ToString(),company,source,include,api_family=family,reason=include?"Installed first-party or explicitly required SDK candidate; all public/protected metadata retained":"Third-party dependency; broader general ecosystem outside core SDK; retained in installation inventory",custom_attributes=Attr(a),references=a.MainModule.AssemblyReferences.Select(x=>x.FullName).ToArray()}));
    if(!include)continue;
    foreach(var t in Types(a.MainModule.Types)){
     var all=new List<IMemberDefinition>{t};all.AddRange(t.Methods);all.AddRange(t.Fields);all.AddRange(t.Properties);all.AddRange(t.Events);
     foreach(var m in all.Where(m=>!MemberVisible(m)))nonpublic.WriteLine(Serialize(new {id=name+"|"+Doc(m),assembly=name,doc_id=Doc(m),source_id=source,reason="nonpublic declaration or nonpublic declaring type, verified from selected binary metadata"}));
    }
    foreach(var t in Types(a.MainModule.Types).Where(Visible)) {
     var members=new List<IMemberDefinition>{t};members.AddRange(t.Methods.Where(MV));members.AddRange(t.Fields.Where(f=>f.IsPublic||f.IsFamily||f.IsFamilyOrAssembly));members.AddRange(t.Properties.Where(p=>MV(p.GetMethod)||MV(p.SetMethod)));members.AddRange(t.Events.Where(e=>MV(e.AddMethod)||MV(e.RemoveMethod)||MV(e.InvokeMethod)));
     foreach(var m in members) {
      string doc=Doc(m),id=name+"|"+doc;
      var d=new Dictionary<string,object?> { ["id"]=id,["doc_id"]=doc,["assembly"]=name,["assembly_version"]=a.Name.Version.ToString(),["api_family"]=family,["namespace"]=NS(t),["declaring_type"]=TN(t),["name"]=m.Name,["source_id"]=source,["metadata_token"]=m.MetadataToken.ToInt32(),["custom_attributes"]=Attr(m),["signature"]=m.FullName.Replace('/','.') };
      if(m is TypeDefinition tt){d["kind"]=tt.IsEnum?"enum":tt.IsInterface?"interface":tt.BaseType?.FullName=="System.MulticastDelegate"?"delegate":tt.IsValueType?"struct":"class";d["base_type"]=tt.BaseType==null?null:TN(tt.BaseType);d["interfaces"]=tt.Interfaces.Select(x=>TN(x.InterfaceType)).ToArray();d["generic_parameters"]=GP(tt);d["visibility"]=tt.Attributes.ToString();}
      if(m is MethodDefinition mm){d["kind"]=mm.IsConstructor?"constructor":"method";d["parameters"]=PP(mm.Parameters);d["return_type"]=TN(mm.ReturnType);d["return_attributes"]=Attr(mm.MethodReturnType);d["generic_parameters"]=GP(mm);d["visibility"]=mm.Attributes.ToString();d["is_accessor"]=mm.IsGetter||mm.IsSetter||mm.IsAddOn||mm.IsRemoveOn||mm.IsFire;d["overrides"]=mm.Overrides.Select(x=>x.FullName).ToArray();}
      if(m is FieldDefinition ff){d["kind"]=t.IsEnum&&ff.HasConstant&&ff.IsStatic?"enum_value":"field";d["type"]=TN(ff.FieldType);d["visibility"]=ff.Attributes.ToString();d["has_constant"]=ff.HasConstant;d["constant"]=ff.HasConstant?ff.Constant:null;}
      if(m is PropertyDefinition pp){d["kind"]="property";d["type"]=TN(pp.PropertyType);d["parameters"]=PP(pp.Parameters);d["get"]=pp.GetMethod==null?null:Doc(pp.GetMethod);d["set"]=pp.SetMethod==null?null:Doc(pp.SetMethod);d["visibility"]=new[]{pp.GetMethod?.Attributes.ToString(),pp.SetMethod?.Attributes.ToString()};}
      if(m is EventDefinition ee){d["kind"]="event";d["type"]=TN(ee.EventType);d["visibility"]=new[]{ee.AddMethod?.Attributes.ToString(),ee.RemoveMethod?.Attributes.ToString()};}
      output.WriteLine(Serialize(d));
     }
    }
   } catch(Exception e){errors.WriteLine(Serialize(new {source,path,error=e.ToString()}));}
   output.Flush();assemblies.Flush();errors.Flush();
  }
 }
}
