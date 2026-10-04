"""Cache discovered Rhino 8 host families; beta material stays discovery-only."""
from common import *
import tarfile,zipfile
ARCHIVES=[('rhino_inside_autocad','inside-autocad-1.3.5.tar.gz','https://github.com/mcneel/rhino.inside-autocad/archive/refs/tags/v1.3.5.tar.gz','1.3.5; Rhino8; commit a276f3d5480c3ca7b429e5a3910bec7da80b92e0'),('rhino_inside_loader','inside-8.tar.gz','https://github.com/mcneel/rhino.inside/archive/69c582bf7f10735b27ba07afd41e6a70b7a7534f.tar.gz','8.0.7-beta source branch'),('rhino_inside_python','inside-python-0.8.2.tar.gz','https://files.pythonhosted.org/packages/9d/99/f65101fcd18b5455e224a71f98d340f509a4ba8e59d89bd4f8307f773478/rhinoinside-0.8.2.tar.gz','0.8.2'),('rhino_inside_revit','inside-revit-1.35.tar.gz','https://github.com/mcneel/rhino.inside-revit/archive/faa6a97653e9da17c6779103ac39537efff60da8.tar.gz','1.35.9698.15636; Rhino8 configuration')]
EVIDENCE={'inside-autocad-releases.json':'https://api.github.com/repos/mcneel/rhino.inside-autocad/releases?per_page=20','inside-autocad-tag.json':'https://api.github.com/repos/mcneel/rhino.inside-autocad/git/ref/tags/v1.3.5','inside-autocad-commit.json':'https://api.github.com/repos/mcneel/rhino.inside-autocad/commits/main','rhino-testing-versions.json':'https://api.nuget.org/v3-flatcontainer/rhino.testing/index.json','rhino-testing-tags.json':'https://api.github.com/repos/mcneel/Rhino.Testing/tags?per_page=100','native-sdk-repo-branches.json':'https://api.github.com/repos/mcneel/rhino_sdk_cpp/branches?per_page=100','native-sdk-repo-readme.md':'https://raw.githubusercontent.com/mcneel/rhino_sdk_cpp/e8f449ea1d7f6c8c2b2bed0dad118cbd68ec8b66/README.md','inside-branches.json':'https://api.github.com/repos/mcneel/rhino.inside/branches?per_page=100','inside-revit-tags.json':'https://api.github.com/repos/mcneel/rhino.inside-revit/tags?per_page=100','inside-nuget-versions.json':'https://api.nuget.org/v3-flatcontainer/rhino.inside/index.json','inside-pypi.json':'https://pypi.org/pypi/rhinoinside/json','rhinomobile-repository.json':'https://api.github.com/repos/mcneel/RhinoMobile','rhinowindows-versions.json':'https://api.nuget.org/v3-flatcontainer/rhinowindows/index.json','inside-revit-release-notes.md':'https://raw.githubusercontent.com/mcneel/rhino.inside-revit/2292035974e6c4ad919e2ce28deeb698caad8e1a/docs/pages/_en/1.0/reference/release-notes.md','inside-revit-tree.json':'https://api.github.com/repos/mcneel/rhino.inside-revit/git/trees/2292035974e6c4ad919e2ce28deeb698caad8e1a?recursive=1','inside-revit-commit.json':'https://api.github.com/repos/mcneel/rhino.inside-revit/commits/2292035974e6c4ad919e2ce28deeb698caad8e1a','inside-8-commit.json':'https://api.github.com/repos/mcneel/rhino.inside/commits/69c582bf7f10735b27ba07afd41e6a70b7a7534f','inside-revit-releases.json':'https://api.github.com/repos/mcneel/rhino.inside-revit/releases?per_page=30'}
def run():
 sources={s['id']:s for s in rows('manifest/sources.jsonl')};downloads={d['path']:d for d in readj('config/downloads.json')};inventory=[]
 def add(sid,b,url,version,st,**kw):
  h=digest(b);p=ROOT/'sources/raw'/h
  if sid in sources:assert sources[sid]['sha256']==h,sid
  if not p.exists():p.write_bytes(b)
  sources[sid]={'id':sid,'sha256':h,'cache_path':str(p.relative_to(ROOT)),'size':len(b),'source_location':url,'version':version,'source_type':st,'owner':'Robert McNeel & Associates; exact per-file notices retained','retrieved_at':sources.get(sid,{}).get('retrieved_at',stamp()),'redistribution_reviewed':False,**kw};return h
 def archive(filename,url,aid,version,st,**kw):
  p=ROOT/'sources/snapshots'/filename;h=add(aid,p.read_bytes(),url,version,st,**kw);downloads[str(p.relative_to(ROOT))]={'path':str(p.relative_to(ROOT)),'url':url,'sha256':h}
 for family,filename,url,version in ARCHIVES:
  aid='host:'+family+'@'+version;archive(filename,url,aid,version,'archive',api_family=family)
  with tarfile.open(ROOT/'sources/snapshots'/filename) as t:
   for m in t:
    if not m.isfile():continue
    rel='/'.join(Path(m.name).parts[1:]);ext=Path(rel).suffix.lower();candidate=ext in ('.cs','.py','.h','.hpp','.cpp','.md','.rst','.csproj','.props','.targets','.json','.yml') or 'license' in Path(rel).name.lower()
    inventory.append({'archive_id':aid,'family':family,'path':rel,'size':m.size,'status':'candidate' if candidate else 'raw_archive_only','reason':'individual decision in inside_decisions' if candidate else 'binary/media/build asset retained in immutable archive'})
    if candidate:add(aid+':'+rel,t.extractfile(m).read(),url+'#'+rel,version,'inside_file',api_family=family,archive_id=aid,archive_path=rel)
 for package,version in [('rhinowindows','8.35.26251.13001'),('rhino.inside','8.0.7-beta'),('rhino.testing','8.0.28-beta')]:
  filename=package+'.'+version+'.nupkg';url='https://api.nuget.org/v3-flatcontainer/'+package+'/'+version+'/'+filename;aid='nuget:'+package+'@'+version;archive(filename,url,aid,version,'package_archive')
  with zipfile.ZipFile(ROOT/'sources/snapshots'/filename) as z:
   for n in z.namelist():
    if n.endswith(('.dll','.xml','.nuspec')):
     beta=package in ('rhino.inside','rhino.testing');st='excluded_beta_assembly' if beta and n.endswith('.dll') else 'assembly' if n.endswith('.dll') else 'package_metadata'
     add(aid+':'+n,z.read(n),url+'/'+n,version,st,api_family=('rhino_testing' if package=='rhino.testing' else 'rhino_inside_loader') if beta else 'rhino_windows' if 'RhinoWindows' in n else 'eto',archive_id=aid,archive_path=n)
 for filename,url in EVIDENCE.items():archive(filename,url,'evidence:host:'+filename,'retrieval snapshot','discovery_evidence')
 jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)]);jsonwrite('config/downloads.json',[downloads[k] for k in sorted(downloads)]);jsonl('manifest/inside_repository_files.jsonl',inventory)
 print('Host-family files inventoried',len(inventory),'source entries',len(sources))
if __name__=='__main__':run()
