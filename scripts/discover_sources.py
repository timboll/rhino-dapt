from common import *
import plistlib, platform
app=Path('/Applications/Rhino 8.app'); contents=app/'Contents';info=plistlib.loads((contents/'Info.plist').read_bytes())
version=info['CFBundleVersion']; assert version.startswith('8.')
config={'rhino_application':str(app),'rhino_build':version,'platform':platform.platform(),'training_allowed':False,'deployment_model':'/Users/timothyb/.lmstudio/models/gcoli/Qwen3.8-27B-oQ6e-mtp','upstream_model':None,'upstream_model_status':'must resolve from model publisher provenance','public_visibility':['public','protected','protected internal'],'brief_sha256':digest((ROOT/'docs/DAPT_CORPUS_BUILD_BRIEF.md').read_bytes())}
jsonwrite('config/target.json',config)
manifest=[];seen=set()
for f in sorted(contents.rglob('*')):
 if not f.is_file() or f.suffix.lower() not in ('.dll','.rhp','.gha','.xml','.py','.h','.hpp'): continue
 real=str(f.resolve())
 if real in seen: continue
 seen.add(real)
 rel=str(f.relative_to(contents))
 if '/dotnet/' in rel or f.name.startswith(('System.','Microsoft.')): status='excluded'; reason='Bundled general .NET framework, not RhinoSDK'
 elif f.suffix.lower() in ('.dll','.gha','.rhp'): status='inventory';reason='Managed metadata inspection; classify publisher and public SDK surface'
 elif f.suffix=='.xml' and f.with_suffix('.dll').exists():status='cache';reason='Installed associated assembly documentation'
 elif f.suffix in ('.h','.hpp'):status='review';reason='Installed native headers: determine public SDK relevance'
 else:status='review';reason='Inspect relevance; no silent omission'
 h=digest(f.read_bytes())
 manifest.append({'path':real,'relative_path':rel,'sha256':h,'size':f.stat().st_size,'status':status,'reason':reason})
jsonl('manifest/installation_files.jsonl',manifest)
selected=[r for r in manifest if r['status'] in ('inventory','cache')]
sources=[]
for r in selected:
 h,c=cache(r['path']); sources.append({'id':'local:'+r['relative_path'],'source_location':r['path'],'cache_path':c,'sha256':h,'size':r['size'],'version':version,'retrieved_at':stamp(),'owner':'see assembly publisher metadata; local Rhino distribution','source_type':'assembly' if r['status']=='inventory' else 'xml_documentation','redistribution_reviewed':False})
# Source shipped by the Rhino scripting environment, kept distinct by runtime.
for runtime in ('py27-rh8','py39-rh8'):
 base=Path.home()/'.rhinocode'/runtime/'site-rhinopython'
 if base.exists():
  for f in sorted(base.rglob('*.py')):
   h,c=cache(f);sources.append({'id':'scripting:'+runtime+'/'+str(f.relative_to(base)),'source_location':str(f),'cache_path':c,'sha256':h,'size':f.stat().st_size,'version':version,'version_evidence':'Rhino 8 runtime directory; exact package revision not yet established','retrieved_at':stamp(),'owner':'McNeel (verify file notice)','source_type':'python_source','redistribution_reviewed':False})
jsonl('manifest/sources.jsonl',sources)
jsonwrite('manifest/target_environment.json',{'rhino_build':version,'service_release':info['CFBundleShortVersionString'],'platform':platform.platform(),'application':str(app),'info_plist_sha256':cache(contents/'Info.plist')[0],'installation_files':len(manifest),'cached_sources':len(sources),'other_installed_rhino':'RhinoBETA.app excluded; target is Rhino 8.app'})
jsonwrite('STATE.json',{'phase':'target_inventory','status':'in_progress','completed':['full brief read','target environment locked','installation and local scripting sources cached'],'failures':[{'action':'git init','reason':'workspace policy denies writing .git'},{'action':'remote acquisition','reason':'DNS failed for developer.rhino3d.com and api.github.com; github.com and huggingface.co reachable'}],'next_actions':['build full managed metadata inventory','resolve and acquire pinned official remote sources','normalize and validate corpus','verify exact upstream tokenizer','complete reports and stop before training'],'training_started':False,'review_gate_passed':False})
print('Installed files',len(manifest),'Cached sources',len(sources))
