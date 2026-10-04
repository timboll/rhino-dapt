from common import *
from normalize import version_risks
import ast,re
from collections import defaultdict,Counter

def run():
 profiles=defaultdict(list)
 for p in rows('manifest/inside_csharp_profiles.jsonl'):profiles[p['source_id']].append(p)
 records=[];symbols={};decisions=[];failures=[]
 sources=rows('manifest/sources.jsonl');doc_sources={s['archive_path']:s for s in sources if s.get('api_family')=='rhino_inside_revit' and 'archive_path' in s}
 from inside_docs import render
 for s in rows('manifest/sources.jsonl'):
  if s['source_type']!='inside_file':continue
  rel=s['archive_path'];family=s['api_family'];content,enc=decode_source((ROOT/s['cache_path']).read_bytes());status='excluded';reason='build/packaging/translation/media/site metadata retained in pinned archive';variants=[];changes=[]
  if family=='rhino_inside_loader':reason='Rhino8 NuGet loader is explicitly 8.0.7-beta; inventoried separately but excluded by brief prohibition on unapproved beta APIs. Installed Rhino.Runtime.InProcess and stable host wrappers remain included.'
  elif family=='rhino_inside_python':
   if rel=='rhinoinside/__init__.py':
    content=content.replace('# based on its own library version e.g. resolver v9 finds and loads Rhino v9','# based on its own library version')
    changes.append('Removed future-version illustration from one comment; executable source unchanged')
    variants=[{'text':content,'profiles':['Rhino8 Windows; stable CPython wrapper 0.8.2'],'symbols':[]}];status='included';reason='Stable wrapper supports explicit Rhino8 selection; bundled Rhino7/Rhino9 binaries excluded, Rhino8 beta loader dependency not reclassified as stable API'
    tree=ast.parse(content)
    for n in tree.body:
     if isinstance(n,(ast.FunctionDef,ast.ClassDef)) and not n.name.startswith('_'):
      sig=ast.get_source_segment(content,n).split(':\n',1)[0];sid='hostapi|'+s['id']+'|'+n.name;symbol={'id':sid,'api_family':family,'source_id':s['id'],'name':n.name,'namespace':'rhinoinside','kind':type(n).__name__,'signature':sig,'documented':bool(ast.get_docstring(n))};symbols[sid]=symbol;variants[0]['symbols'].append(sid)
   elif rel=='README.md':
    content=content.replace('- Rhino 7, 8, 9 (WIP)','- Rhino 7, 8');content=re.sub(r'# Loading Rhino 9.*?```','```',content,flags=re.S);changes.append('Removed explicitly Rhino9-only requirement and loading examples; Rhino8 and older compatibility retained');variants=[{'text':content,'profiles':['Rhino8'],'symbols':[]}];status='included';reason='Stable package official guide filtered by explicit Rhino major version'
  elif family in ('rhino_inside_revit','rhino_inside_autocad'):
   if s['id'] in profiles:
    groups={}
    for p in profiles[s['id']]:
     if p['errors']:failures.append({'source_id':s['id'],'profile':p['profile'],'errors':p['errors']})
     h=digest(p['text'].encode());v=groups.setdefault(h,{'text':p['text'],'profiles':[],'symbols':set()});v['profiles'].append(p['profile'])
     for a in p['symbols']:
      v['symbols'].add(a['id']);old=symbols.setdefault(a['id'],a);old.setdefault('profiles',[])
      if p['profile'] not in old['profiles']:old['profiles'].append(p['profile'])
    variants=[{**v,'symbols':sorted(v['symbols'])} for v in groups.values()];status='included';reason='Stable host source under all declared release framework configurations; inactive code removed with Roslyn and exact source retained. Revit selects RHINO_7/RHINO_8, never RHINO_9; AutoCAD selects net48/net8/net10';changes=['Inactive preprocessor branches and directives removed; source line positions preserved']
   elif family=='rhino_inside_autocad' and rel.endswith('.md') and not rel.startswith(('.github/','research/')):
    variants=[{'text':content,'profiles':['stable Rhino8 AutoCAD/Civil3D release'],'symbols':[]}];status='included';reason='Official stable integration guide'
   elif rel.startswith('docs/pages/_en/1.0/') and rel.endswith('.md') and not rel.endswith(('release-notes.md','known-issues.md')):
    content=re.sub(r'\A---\n.*?\n---\n','',content,flags=re.S)
    content=render(content,doc_sources)
    variants=[{'text':content,'profiles':['Rhino8-compatible stable host guide'],'symbols':[]}];status='included';reason='Official stable English host/API guide; release-history and beta documentation excluded'
   elif rel.startswith('src/') and Path(rel).suffix in ('.h','.hpp','.cpp'):
    variants=[{'text':content,'profiles':['stable native host bridge source'],'symbols':[]}];status='included';reason='First-party native Revit bridge source; not asserted as installed public RhinoCommon API'
  if family=='rhino_inside_revit' and rel=='docs/_data/components.json':
   data=json.loads(content);content='\n\n'.join('## '+c['title']+'\n\n'+'\n'.join(k+': '+str(v) for k,v in c.items() if v is not None and k not in ('iconsrc','icontag')) for c in data);variants=[{'text':content,'profiles':['stable component catalog'],'symbols':[]}];status='included';reason='Complete official component catalog, including descriptions and availability notes'
  risks=version_risks('\n'.join(v['text'] for v in variants))
  if family=='rhino_inside_autocad' and risks:
   # Stable host release compiles against RhinoCommon 8.0/8.26/8.32 only.
   # These are host-version discovery and compatibility comments, not Rhino9 SDK declarations.
   reason+='; explicit mixed-host compatibility review: Rhino9 strings describe optional runtime discovery, display names, and file-extension compatibility; all compile-time Rhino API references are Rhino8'
   risks=[x for x in risks if x.lower() not in ('rhino 9','rhino9','wip')]
  if rel=='docs/pages/_en/1.0/getting-started.md':risks=[r for r in risks if r.lower()!='rhino9'] # numbered illustration rir-rhino9.png, not a product version
  if any(re.search(r'(?i)Rhino\s*9|Grasshopper\s*2|GH2',x) for x in risks):status='pending';reason='Explicit future-version marker needs source-specific review'
  if family=='rhino_inside_autocad':status='excluded';reason='Publisher README explicitly labels project early Alpha testing despite GitHub prerelease=false; complete source/API inventory retained separately, not admitted under no-preview rule'
  decisions.append({'source_id':s['id'],'family':family,'path':rel,'status':status,'reason':reason,'transformations':changes,'version_risks':risks})
  if status=='included':
   for v in variants:
    code=Path(rel).suffix in ('.cs','.py','.h','.hpp','.cpp');lang={'.cs':'csharp','.py':'python','.h':'cpp','.hpp':'cpp','.cpp':'cpp'}.get(Path(rel).suffix,'technical_prose');text=v['text'];key=s['id']+'|'+digest(text.encode());text='# '+rel+'\n\nAPI family: '+family+'\nRelease: '+s['version']+'\nConfiguration: '+', '.join(v['profiles'])+'\n\n'+('```'+lang+'\n'+text+'\n```' if code else text)
    records.append({'id':'canonical:host:'+digest(key.encode()),'api_family':family,'source_type':'source_code' if code else 'guide','version':s['version'],'language':lang,'symbols':v['symbols'],'provenance':[s['id']]+([doc_sources['docs/_data/components.json']['id'],doc_sources['docs/_config.yml']['id']] if rel.startswith('docs/pages/') else []),'text':text,'status':'canonical','profiles':v['profiles'],'transformations':changes,'version_validation':'versioned stable host package with explicit Rhino8 source configuration; external host binding not executed'})
 jsonl('manifest/excluded_host_symbols.jsonl',[{**s,'scope_status':'excluded','exclusion_reason':'publisher labels AutoCAD/Civil3D early Alpha testing'} for s in symbols.values() if s['api_family']=='rhino_inside_autocad'])
 admitted={p for r in records for p in r['provenance']};symbols={k:s for k,s in symbols.items() if s['source_id'] in admitted}
 jsonl('normalized/inside.records.jsonl',sorted(records,key=lambda r:r['id']));jsonl('manifest/inside_symbols.jsonl',[symbols[k] for k in sorted(symbols)]);jsonl('manifest/inside_decisions.jsonl',decisions);jsonl('manifest/inside_parsing_failures.jsonl',failures)
 print('Host records',len(records),'symbols',len(symbols),'decisions',dict(Counter(d['status'] for d in decisions)),'failures',len(failures))
if __name__=='__main__':run()
