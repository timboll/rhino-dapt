from common import *
import subprocess,shutil
sources=rows('manifest/sources.jsonl');inputs=[r for r in sources if r['source_type']=='assembly']
# Runtime assemblies precede duplicate net48 reference assemblies.
inputs.sort(key=lambda r:('/ref/' in r['source_location'] or '/net48/' in r['source_location'],r['id']))
res=ROOT/'sources/assembly_resolution';res.mkdir(exist_ok=True)
for s in inputs:
 p=res/Path(s['source_location']).name
 if not p.exists():shutil.copyfile(ROOT/s['cache_path'],p)
# Add platform metadata dependencies needed to decode custom attribute enum values.
for f in Path('/Applications/Rhino 8.app/Contents').rglob('Microsoft.macOS.dll'):
 h,c=cache(f);shutil.copyfile(ROOT/c,res/f.name)
jsonwrite('manifest/assembly_inputs.json',inputs)
env=dict(os.environ,DOTNET_CLI_HOME=str(ROOT/'.dotnet-home'),DOTNET_CLI_TELEMETRY_OPTOUT='1',DOTNET_SKIP_FIRST_TIME_EXPERIENCE='1')
subprocess.run(['dotnet','build','scripts/InventoryDotnet','--configfile','NuGet.Config','-v','quiet','-p:UseSharedCompilation=false'],check=True,env=env,cwd=ROOT)
subprocess.run(['dotnet','scripts/InventoryDotnet/bin/Debug/net6.0/InventoryDotnet.dll','manifest/assembly_inputs.json','manifest/symbols.raw.jsonl','manifest/assemblies.jsonl','manifest/metadata_failures.jsonl'],check=True,cwd=ROOT)
unique={};duplicates=[]
for s in rows('manifest/symbols.raw.jsonl'):
 if s['id'] in unique:
  previous=unique[s['id']]; previous.setdefault('alternate_sources',[]).append(s['source_id']);duplicates.append({'id':s['id'],'source':s['source_id'],'reason':'same assembly XML symbol ID; runtime metadata preferred over net48 reference assembly'})
 else:unique[s['id']]=s
jsonl('manifest/symbols.jsonl',[unique[k] for k in sorted(unique)])
jsonl('manifest/duplicate_assembly_symbols.jsonl',duplicates)
nonpublic={s['id']:s for s in rows('manifest/nonpublic_symbols.raw.jsonl')}
jsonl('manifest/nonpublic_symbols.jsonl',[nonpublic[k] for k in sorted(nonpublic)])
print('Unique managed symbols:',len(unique),'metadata failures:',len(rows('manifest/metadata_failures.jsonl')))
