"""Pin and cache additional first-party families; never execute downloaded code."""
from common import *
import tarfile,zipfile

ARCHIVES=[
 ('rhino3dm','rhino3dm-8.35.tar.gz','https://github.com/mcneel/rhino3dm/archive/f44a7887955d471ad3e52327a5a410a96aad7957.tar.gz','8.35.0'),
 ('compute','compute-8.tar.gz','https://github.com/mcneel/compute.rhino3d/archive/aeec0a3fa7d5540b08a30f75f987cc1ae5338874.tar.gz','8.x@aeec0a3fa7d5540b08a30f75f987cc1ae5338874'),
 ('compute_python','compute-python-0.12.2.tar.gz','https://files.pythonhosted.org/packages/00/df/82db5c1385d46c0e066f299364462b4ef6195e225e5f9aec54487e454392/compute_rhino3d-0.12.2.tar.gz','0.12.2'),
 ('compute_javascript','compute-js-0.12.1.tgz','https://registry.npmjs.org/compute-rhino3d/-/compute-rhino3d-0.12.1.tgz','0.12.1')]

def run():
 sources={s['id']:s for s in rows('manifest/sources.jsonl')};downloads={d['path']:d for d in readj('config/downloads.json')};inventory=[]
 def add(sid,b,url,version,st,**extra):
  h=digest(b);p=ROOT/'sources/raw'/h
  if sid in sources:assert sources[sid]['sha256']==h,'Immutable source changed: '+sid
  if not p.exists():p.write_bytes(b)
  sources[sid]={'id':sid,'sha256':h,'cache_path':str(p.relative_to(ROOT)),'size':len(b),'source_location':url,'version':version,'source_type':st,'owner':'Robert McNeel & Associates (per-file notices retained)','retrieved_at':sources.get(sid,{}).get('retrieved_at',stamp()),'redistribution_reviewed':False,**extra}
  return h
 for family,filename,url,version in ARCHIVES:
  archive=ROOT/'sources/snapshots'/filename;aid='ecosystem:'+family+'@'+version
  h=add(aid,archive.read_bytes(),url,version,'archive',api_family=family)
  downloads[str(archive.relative_to(ROOT))]={'path':str(archive.relative_to(ROOT)),'url':url,'sha256':h}
  with tarfile.open(archive) as tf:
   for m in tf:
    if not m.isfile():continue
    rel='/'.join(Path(m.name).parts[1:]);sid=aid+':'+rel;ext=Path(rel).suffix.lower()
    candidate=ext in ('.cs','.py','.pyi','.js','.ts','.cpp','.h','.md','.rst','.txt','.json','.csproj') or Path(rel).name.upper().startswith(('LICENSE','COPYRIGHT'))
    inventory.append({'id':sid,'archive_id':aid,'path':rel,'family':family,'size':m.size,'status':'candidate' if candidate else 'excluded','reason':'versioned technical source; individual disposition in ecosystem_decisions' if candidate else 'media/build/dependency resource retained in immutable archive'})
    if candidate:add(sid,tf.extractfile(m).read(),url+'#'+rel,version,'ecosystem_file',api_family=family,archive_id=aid,archive_path=rel)
 filename='rhino3dm.8.35.0.nupkg';url='https://api.nuget.org/v3-flatcontainer/rhino3dm/8.35.0/'+filename;aid='nuget:rhino3dm@8.35.0';p=ROOT/'sources/snapshots'/filename
 h=add(aid,p.read_bytes(),url,'8.35.0','package_archive',api_family='rhino3dm');downloads[str(p.relative_to(ROOT))]={'path':str(p.relative_to(ROOT)),'url':url,'sha256':h}
 with zipfile.ZipFile(p) as z:
  for n in z.namelist():
   if n in ('lib/net7.0/Rhino3dm.dll','lib/net7.0/Rhino3dm.xml') or n.endswith('.nuspec'):
    add(aid+':'+n,z.read(n),url+'/'+n,'8.35.0','assembly' if n.endswith('.dll') else 'xml_documentation' if n.endswith('.xml') else 'package_metadata',api_family='rhino3dm',archive_id=aid)
 base='https://developer.rhino3d.com/api/rhinoscript/'
 pages=sorted(set(readj('config/rhinoscript_pages.json')+readj('config/rhinoscript_linked_pages.json')))
 for rel in pages:
  p=ROOT/'sources/snapshots/rhinoscript'/rel;sid='rhinoscript-reference:'+rel
  h=add(sid,p.read_bytes(),base+rel,'official legacy COM reference; Rhino 6-era reference retained for Rhino 8 Windows scripting','rhinoscript_reference',api_family='rhinoscript_vb',reference_path=rel)
  downloads[str(p.relative_to(ROOT))]={'path':str(p.relative_to(ROOT)),'url':base+rel,'sha256':h}
 for filename,url in [('typescript-5.9.3.tgz','https://registry.npmjs.org/typescript/-/typescript-5.9.3.tgz'),('rhino3dm-tags.json','https://api.github.com/repos/mcneel/rhino3dm/tags?per_page=100'),('compute-branches.json','https://api.github.com/repos/mcneel/compute.rhino3d/branches?per_page=100'),('compute-pypi.json','https://pypi.org/pypi/compute-rhino3d/json'),('compute-npm.json','https://registry.npmjs.org/compute-rhino3d')]:
  p=ROOT/'sources/snapshots'/filename;h=add('evidence:ecosystem:'+filename,p.read_bytes(),url,'retrieval snapshot','build_dependency' if filename.startswith('typescript') else 'discovery_evidence')
  if filename.startswith('typescript'):sources['evidence:ecosystem:'+filename]['owner']='Microsoft / TypeScript authors; Apache-2.0'
  downloads[str(p.relative_to(ROOT))]={'path':str(p.relative_to(ROOT)),'url':url,'sha256':h}
 jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)]);jsonwrite('config/downloads.json',[downloads[k] for k in sorted(downloads)]);jsonl('manifest/ecosystem_repository_files.jsonl',inventory)
 print('Registered additional ecosystem sources; total',len(sources))
if __name__=='__main__':run()
