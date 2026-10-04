from common import *
import zipfile,shutil
sources={s['id']:s for s in rows('manifest/sources.jsonl')};downloads={d['path']:d for d in readj('config/downloads.json')}
name='microsoft.windowsdesktop.app.ref.7.0.0.nupkg';url='https://api.nuget.org/v3-flatcontainer/microsoft.windowsdesktop.app.ref/7.0.0/'+name;p=ROOT/'sources/snapshots'/name;h,c=cache(p);aid='tooling:'+name
sources[aid]={'id':aid,'source_location':url,'cache_path':c,'sha256':h,'version':'7.0.0','owner':'Microsoft','source_type':'build_dependency','retrieved_at':sources.get(aid,{}).get('retrieved_at',stamp()),'redistribution_reviewed':False};downloads[str(p.relative_to(ROOT))]={'path':str(p.relative_to(ROOT)),'url':url,'sha256':h}
with zipfile.ZipFile(p) as z:
 for n in z.namelist():
  if not n.startswith('ref/net7.0/') or not n.endswith('.dll'):continue
  b=z.read(n);h=digest(b);c='sources/raw/'+h
  if not (ROOT/c).exists():(ROOT/c).write_bytes(b)
  sid=aid+':'+n;sources[sid]={'id':sid,'source_location':url+'/'+n,'cache_path':c,'sha256':h,'version':'7.0.0','owner':'Microsoft','source_type':'metadata_dependency','retrieved_at':sources.get(sid,{}).get('retrieved_at',stamp()),'redistribution_reviewed':False};shutil.copyfile(ROOT/c,ROOT/'sources/assembly_resolution'/Path(n).name)
jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)]);jsonwrite('config/downloads.json',[downloads[k] for k in sorted(downloads)])
