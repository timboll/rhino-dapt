from common import *
import zipfile
sources={s['id']:s for s in rows('manifest/sources.jsonl')}
for file,package,version in [('rhinocommon.8.35.26251.13001.nupkg','rhinocommon','8.35.26251.13001'),('eto.forms.2.11.0.nupkg','eto.forms','2.11.0')]:
 p=ROOT/'sources/snapshots'/file;h,c=cache(p);aid='nuget:'+package+'@'+version
 sources[aid]={'id':aid,'source_location':'https://api.nuget.org/v3-flatcontainer/'+package+'/'+version+'/'+file,'cache_path':c,'sha256':h,'retrieved_at':sources.get(aid,{}).get('retrieved_at',stamp()),'version':version,'owner':'McNeel / Eto official NuGet package metadata','source_type':'package_archive','redistribution_reviewed':False}
 with zipfile.ZipFile(p) as z:
  for n in z.namelist():
   if not (n.startswith('lib/net7.0/') and n.endswith('.xml') or package=='eto.forms' and n=='lib/net8.0/Eto.xml' or n.endswith('.nuspec')):continue
   b=z.read(n);h=digest(b);dest=ROOT/'sources/raw'/h
   if not dest.exists():dest.write_bytes(b)
   sid=aid+':'+n;sources[sid]={'id':sid,'source_location':sources[aid]['source_location']+'#'+n,'archive_id':aid,'cache_path':str(dest.relative_to(ROOT)),'sha256':h,'retrieved_at':sources[aid]['retrieved_at'],'version':version,'owner':sources[aid]['owner'],'source_type':'xml_documentation' if n.endswith('.xml') else 'package_metadata','redistribution_reviewed':False}
jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)])
