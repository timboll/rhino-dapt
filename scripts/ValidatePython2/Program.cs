using System.Text.Json;
using IronPython.Hosting;
var engine=Python.CreateEngine();
using var output=new StreamWriter(args[1]);
foreach(var line in File.ReadLines(args[0])){
 using var row=JsonDocument.Parse(line);var r=row.RootElement;
 if(r.GetProperty("source_type").GetString()!="python_source"&&(!r.TryGetProperty("archive_path",out var path)||!path.GetString()!.EndsWith(".py")))continue;
 var source=r.GetProperty("id").GetString();string error=null;int? lineno=null;
 try{engine.CreateScriptSourceFromString(File.ReadAllText(r.GetProperty("cache_path").GetString()!)).Compile();}
 catch(Microsoft.Scripting.SyntaxErrorException e){error=e.Message;lineno=e.Line;}
 catch(Exception e){error=e.GetType().Name+": "+e.Message;}
 output.WriteLine(JsonSerializer.Serialize(new {source_id=source,validation="IronPython 2.7 syntax compilation only; code never executed",status=error==null?"passed":"failed",error,line=lineno}));
}
