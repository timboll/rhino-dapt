"""Explicit, source-specific review decisions; not fuzzy deletion rules."""
from common import *
import tarfile,re
base='mcneel/developer.rhino3d.com@548b769596103d0408b16f61c2b10a9078a618a8:'
overrides={}
def decision(path,status,reason):overrides[base+'content/en/guides/'+path]={'status':status,'reason':reason}
for path in ['compute/compute-javascript-getting-started/index.md','compute/compute-net-getting-started/index.md','compute/compute-python-getting-started/index.md','cpp/making-plugins-that-expire/index.md','eto/view-and-data/view-models/_index.md','general/creating-command-macros/index.md','general/developing-software-in-public/index.md','rhinocommon/plugin-installers-windows/index.md','rhinocommon/using-nuget/index.md','rhinopython/7/python-troubleshooting-install/index.md','yak/what-is-yak/index.md','yak/yak-cli-reference/index.md']:
 decision(path,'included','Reviewed WIP wording describes historical release channels, sample plug-in licensing or article draft status; it does not introduce a Rhino 9-only API. Version-specific source context retained.')
for path,reason in [('compute/compute-linux-getting-started/index.md','Linux Compute is identified as a Rhino 9 feature by official new-in-v9 guide; outside Rhino 8 target'),('general/new-in-v9/index.md','Rhino 9 release documentation'),('rhinocommon/debug-rhinowip-mac/index.md','Instructions target WIP application explicitly; standard Rhino 8 debugging guides retained'),('general/developer-docs-style-guide/index.md','Website-authoring implementation, not RhinoSDK development'),('general/how-this-site-works/index.md','Website-authoring implementation, not RhinoSDK development'),('rhinocommon/moving-to-dotnet-core/index.md','Replaced by pinned Rhino 8-specific revision 6e4aa57; current document mixes .NET 10/Rhino 9 requirements')]:decision(path,'excluded',reason)
overrides[base+'content/en/api/RhinoScriptSyntax/index.md']={'status':'excluded','reason':'Dynamic reference wrapper with no independent technical body; full installed rhinoscript source/docstrings represented by scripting family'}
for s in rows('manifest/sources.jsonl'):
 if s.get('api_family')=='samples' and (s.get('archive_path') in ['README.md','rhinoscript/README.md','rhinocommon/cs/SampleCsRendererIntegration/MockingBird/README.md','zoo/SampleCsZoo/SampleCsZooClass.cs','zoo/SampleVbZoo/SampleVbZooClass.vb']):overrides[s['id']]={'status':'included','reason':'Reviewed WIP is historical branch/setup context or licensing mode, not a future SDK API'}
 if s['id']=='scripting:py39-rh8/samples/advanced/AnnotateCurveForm.py':overrides[s['id']]={'status':'included','reason':'Official installed example preserved verbatim with explicit syntax failure; not executed; defect not silently repaired','validation_exception':'unexpected indentation at line 122 in shipped source'}
overrides[base+'content/en/guides/rhinocommon/cloudzoo/cloudzoo-product/index.md']={'status':'included','reason':'Reviewed relatedProducts example uses product version numbers to explain backward-compatible licensing; it introduces no Rhino 9 SDK symbol. Historical Rhino 6 WIP download URL is sample JSON data.'}
jsonwrite('config/source_reviews.json',overrides)
# Historic official guide and source files linked through download-script shortcodes.
sources={s['id']:s for s in rows('manifest/sources.jsonl')}
p=ROOT/'sources/snapshots/netcore-rhino8.md';h,c=cache(p);sid='mcneel/developer.rhino3d.com@6e4aa57c1598706b3d729384b59cbf55c95615f9:content/en/guides/rhinocommon/moving-to-dotnet-core/index.md'
sources[sid]={'id':sid,'source_location':'https://raw.githubusercontent.com/mcneel/developer.rhino3d.com/6e4aa57c1598706b3d729384b59cbf55c95615f9/content/en/guides/rhinocommon/moving-to-dotnet-core/index.md','cache_path':c,'sha256':h,'retrieved_at':sources.get(sid,{}).get('retrieved_at',stamp()),'version':'Rhino 8; historic official .NET 8 migration guide','commit':'6e4aa57c1598706b3d729384b59cbf55c95615f9','api_family':'guides','archive_path':'content/en/guides/rhinocommon/moving-to-dotnet-core/index.md','source_type':'repository_file','owner':'Robert McNeel & Associates','redistribution_reviewed':False}
with tarfile.open(ROOT/'sources/snapshots/guides.tar.gz') as tf:
 for m in tf:
  rel='/'.join(Path(m.name).parts[1:])
  if not m.isfile() or not rel.startswith('static/files/') or Path(rel).suffix.lower() not in ('.py','.cs','.vb','.cpp','.h','.js','.txt','.md'):continue
  b=tf.extractfile(m).read();h=digest(b);dest=ROOT/'sources/raw'/h
  if not dest.exists():dest.write_bytes(b)
  sid=base+rel;sources[sid]={'id':sid,'source_location':'https://github.com/mcneel/developer.rhino3d.com/blob/548b769596103d0408b16f61c2b10a9078a618a8/'+rel,'archive_id':'archive:mcneel/developer.rhino3d.com@548b769596103d0408b16f61c2b10a9078a618a8','archive_path':rel,'cache_path':str(dest.relative_to(ROOT)),'sha256':h,'retrieved_at':sources.get(sid,{}).get('retrieved_at',stamp()),'version':'official guide attachment; version inherited from guide subject to validation','api_family':'samples','source_type':'repository_file','owner':'Robert McNeel & Associates','redistribution_reviewed':False}
jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)])
