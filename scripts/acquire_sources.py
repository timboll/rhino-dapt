"""Register pinned downloaded archives and safely extract/cache source documents.
Network downloads are explicit curl commands in config/downloads.json, not discovery at rebuild time.
"""
from common import *
import tarfile, subprocess
ARCHIVES=[('opennurbs','opennurbs-8.tar.gz','mcneel/opennurbs','eb92af3ba1806b0a34a99aba0d3bda83e3d46083','8.35.26251.13001'),('samples','samples-8.tar.gz','mcneel/rhino-developer-samples','8462fc3487f8b7a58595ef73f6a5c09f92717f60','8 branch; per-example checks required'),('guides','guides.tar.gz','mcneel/developer.rhino3d.com','548b769596103d0408b16f61c2b10a9078a618a8','mixed; per-guide checks required')]
def register():
 sources={s['id']:s for s in rows('manifest/sources.jsonl')};inventory=[];downloads=readj('config/downloads.json') if (ROOT/'config/downloads.json').exists() else []
 for family,filename,repo,sha,version in ARCHIVES:
  archive=ROOT/'sources/snapshots'/filename
  if not archive.exists():raise FileNotFoundError(archive)
  archive_hash,c=cache(archive);aid='archive:'+repo+'@'+sha
  sources.setdefault(aid,{'id':aid,'source_location':'https://github.com/'+repo+'/archive/'+sha+'.tar.gz','cache_path':c,'sha256':archive_hash,'retrieved_at':stamp(),'version':version,'commit':sha,'owner':'Robert McNeel & Associates','source_type':'archive','redistribution_reviewed':False})
  rel_archive=str(archive.relative_to(ROOT));previous=next((d for d in downloads if d['path']==rel_archive),None)
  if previous:assert previous['sha256']==archive_hash,'Pinned archive changed: '+rel_archive
  else:downloads.append({'url':sources[aid]['source_location'],'path':rel_archive,'sha256':archive_hash})
  with tarfile.open(archive) as tf:
   for m in tf:
    if not m.isfile():continue
    rel='/'.join(Path(m.name).parts[1:]);ext=Path(rel).suffix.lower();sid=repo+'@'+sha+':'+rel
    text_ext=ext in ('.h','.hpp','.cpp','.c','.cs','.py','.vb','.js','.ts','.md','.txt','.xml','.csproj','.vbproj','.vcxproj','.props','.yml','.yaml','.json','.xaml','.rst','.dox') or Path(rel).name in ('LICENSE','makefile','CMakeLists.txt')
    selected=text_ext and (family!='guides' or rel.startswith('content/en/') or 'LICENSE' in rel.upper())
    reason='candidate source; normalization/version validation pending' if selected else 'binary/media or site implementation; kept in immutable archive'
    row={'id':sid,'archive_id':aid,'path':rel,'family':family,'size':m.size,'status':'candidate' if selected else 'excluded','reason':reason}
    if selected:
     b=tf.extractfile(m).read();h=digest(b);target=ROOT/'sources/raw'/h
     if not target.exists():target.write_bytes(b)
     row['sha256']=h
     sources.setdefault(sid,{'id':sid,'source_location':'https://github.com/'+repo+'/blob/'+sha+'/'+rel,'archive_id':aid,'archive_path':rel,'cache_path':str(target.relative_to(ROOT)),'sha256':h,'size':len(b),'retrieved_at':sources[aid]['retrieved_at'],'version':version,'commit':sha,'owner':'Robert McNeel & Associates; per-file third-party notices require classification','api_family':family,'source_type':'repository_file','redistribution_reviewed':False})
    inventory.append(row)
  jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)])
  jsonl('manifest/repository_files.jsonl',inventory)
 jsonwrite('config/downloads.json',downloads)
 print('Sources',len(sources),'repository files',len(inventory))
if __name__=='__main__':register()
