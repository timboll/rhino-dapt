"""Compile released Compute C# clients and reconcile remote endpoint names; no execution."""
from common import *
import subprocess,re
sources=rows('manifest/sources.jsonl');results=[]
runtime=Path('/Applications/Rhino 8.app/Contents/Frameworks/RhCore.framework/Versions/A/Resources')
refs=list((runtime/'dotnet/arm64/shared/Microsoft.NETCore.App/8.0.14').glob('*.dll'))
rhino3dm=next(s for s in sources if s['id']=='nuget:rhino3dm@8.35.0:lib/net7.0/Rhino3dm.dll')
newton=next(p for p in runtime.rglob('Newtonsoft.Json.dll') if '/ref/' not in str(p))
directory=ROOT/'normalized/code_validation/compute';directory.mkdir(parents=True,exist_ok=True)
for s in sources:
 if s.get('api_family')!='compute' or s.get('archive_path') not in ('src/compute.geometry/RhinoCompute.cs','src/compute.geometry/RhinoComputeAsync.cs'):continue
 sample=directory/Path(s['archive_path']).name;sample.write_bytes((ROOT/s['cache_path']).read_bytes())
 command=['dotnet','/usr/local/share/dotnet/sdk/6.0.202/Roslyn/bincore/csc.dll','-nologo','-target:library','-nostdlib+','-out:'+str(sample.with_suffix('.dll'))]+['-r:'+str(p) for p in refs+[ROOT/rhino3dm['cache_path'],newton]]+[str(sample)]
 p=subprocess.run(command,capture_output=True,text=True);results.append({'source_id':s['id'],'validation':'compile unmodified released Compute client against Rhino3dm 8.35 and Rhino bundled .NET8/Newtonsoft reference metadata; never execute or contact service','command':command,'exit_code':p.returncode,'diagnostics':p.stdout+p.stderr})
jsonl('manifest/ecosystem_compilation_results.jsonl',results)
managed=[s for s in rows('manifest/symbols.jsonl') if s['assembly']=='RhinoCommon'];names={s['doc_id'][2:].split('(')[0].lower():s['id'] for s in managed}
endpoints=[]
for s in sources:
 if s.get('api_family') not in ('compute_python','compute_javascript') or not s.get('archive_path','').endswith(('.py','.js')):continue
 content=decode_source((ROOT/s['cache_path']).read_bytes())[0]
 for endpoint in sorted(set(re.findall(r'[\"\'](rhino/[^\"\'\s]+)[\"\']',content))):
  name=endpoint.split('-')[0].replace('/','.');symbol=names.get(name)
  endpoints.append({'source_id':s['id'],'endpoint':endpoint,'target_symbol':symbol,'status':'target name exists; remote overload encoding not fully bound' if symbol else 'explicit exception: remote helper, inherited method, constructor or unavailable target name; no live service execution'})
jsonl('manifest/compute_endpoint_validation.jsonl',endpoints)
print('Compute client compilation',[(Path(r['source_id']).name,r['exit_code']) for r in results],'; endpoint names',len(endpoints),'matched',sum(bool(r['target_symbol']) for r in endpoints))
