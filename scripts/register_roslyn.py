from common import *
import zipfile
sources={s['id']:s for s in rows('manifest/sources.jsonl')};downloads={d['path']:d for d in readj('config/downloads.json')};out=ROOT/'tools/roslyn';out.mkdir(exist_ok=True)
for pkg,version in [('microsoft.codeanalysis.csharp','4.14.0'),('microsoft.codeanalysis.common','4.14.0'),('system.collections.immutable','9.0.0'),('system.reflection.metadata','9.0.0'),('system.text.encoding.codepages','7.0.0')]:
 name=pkg+'.'+version+'.nupkg';p=ROOT/'sources/snapshots'/name;url='https://api.nuget.org/v3-flatcontainer/'+pkg+'/'+version+'/'+name;h,c=cache(p);aid='tooling:'+name;sources[aid]={'id':aid,'sha256':h,'cache_path':c,'source_location':url,'version':version,'owner':'Microsoft; MIT','source_type':'build_dependency','retrieved_at':sources.get(aid,{}).get('retrieved_at',stamp()),'redistribution_reviewed':False};downloads[str(p.relative_to(ROOT))]={'path':str(p.relative_to(ROOT)),'url':url,'sha256':h}
 with zipfile.ZipFile(p) as z:
  for n in z.namelist():
   if n.startswith('lib/netstandard2.0/') and n.count('/')==2 and n.endswith('.dll'):(out/Path(n).name).write_bytes(z.read(n))
jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)]);jsonwrite('config/downloads.json',[downloads[k] for k in sorted(downloads)])
