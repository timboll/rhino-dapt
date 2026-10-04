from common import *
from normalize import *
from version_policy import newer_than_target
from collections import defaultdict,Counter
import xml.etree.ElementTree as ET

def build():
 sources=rows('manifest/sources.jsonl');source_by_id={s['id']:s for s in sources};symbols=rows('manifest/symbols.jsonl');docmaps=defaultdict(dict);failures=[];parsed=[];unmatched=[];records=[];version_conflicts=[];symbolids={s['id'] for s in symbols}
 nonpublic={s['id'] for s in rows('manifest/nonpublic_symbols.jsonl')};excluded_assemblies={a['name'] for a in rows('manifest/assemblies.jsonl') if not a['include']}
 for source in sorted(sources,key=lambda s:(s['id'].startswith('local:'),s['id'])):
  if source['source_type']!='xml_documentation':continue
  try:
   tree=ET.fromstring((ROOT/source['cache_path']).read_bytes());asm=(tree.findtext('./assembly/name') or '').strip()
   if not asm:raise ValueError('No assembly/name in XML')
   n=0
   for e in tree.findall('./members/member'):
    key=e.get('name');n+=1;docmaps[asm][key]=(e,source['id'])
    if asm+'|'+key not in symbolids:
     reason='verified nonpublic declaration/type in selected binary' if asm+'|'+key in nonpublic else 'excluded third-party runtime documentation; outside first-party SDK scope' if asm in excluded_assemblies or asm.startswith(('Newtonsoft.','crypto')) else 'XML declaration absent from selected public and nonpublic metadata; release/platform documentation discrepancy; raw XML retained and not asserted as a target public symbol'
     unmatched.append({'source_id':source['id'],'doc_id':key,'assembly':asm,'reason':reason})
   parsed.append({'source_id':source['id'],'members':n})
  except Exception as e:failures.append({'source_id':source['id'],'error':str(e)})
 documented=set();groups=defaultdict(list)
 for s in symbols:
  # One method family with all overloads; other members retain coherent individual records.
  key=s['assembly']+'|'+s['declaring_type']+'|'+s['kind']+'|'+s['name']
  groups[key].append(s)
 for key,ss in sorted(groups.items()):
  texts=[];provenance=set();docs=[]
  for s in sorted(ss,key=lambda s:s['id']):
   text=metadata_text(s);doc_conflicted=False;provenance.add(s['source_id']);doc=docmaps[s['assembly']].get(s['doc_id'])
   if not doc and s.get('is_accessor'):
    # XML docs describe property/event once; retain explicit accessor record linked to that parent.
    name=s['name'].split('_',1)[-1]
    for prefix in ('P:','E:'):
     parent=prefix+s['declaring_type']+'.'+name
     if parent in docmaps[s['assembly']]:doc=docmaps[s['assembly']][parent];break
   if doc:
    e,sid=doc
    version_notes=[''.join(v.itertext()).strip() for v in e.findall('since')]
    type_doc=docmaps[s['assembly']].get('T:'+s['declaring_type'])
    if type_doc:version_notes+=[''.join(v.itertext()).strip() for v in type_doc[0].findall('since')]
    future=[v for v in version_notes if newer_than_target(v)]
    if future:
     # Brief section 4: exact target binary establishes existence; exact-release
     # XML supplies semantics. A contradictory availability note does not turn
     # a declaration physically present in that binary into a future-only API.
     exact_release=source_by_id[sid]['version'] in (readj('config/target.json')['rhino_build'],'8.35.0')
     assert exact_release,'Future-labelled XML must be from the verified exact target release: '+sid
     provenance.add(sid)
     version_conflicts.append({'symbol_id':s['id'],'doc_id':e.get('name'),'source_id':sid,'binary_source_id':s['source_id'],'documented_since':future,'target_build':source_by_id[s['source_id']]['version'],'resolution':'brief section 4 source priority: selected 8.35 binary proves declaration exists; retain exact-release XML and original availability note, explicitly label contradiction; do not use disputed note to infer availability','status':'resolved_for_inclusion; publisher_annotation_discrepancy_retained'})
     text+='\n\n## Availability annotation discrepancy\n\nThis declaration is verified in the selected '+source_by_id[s['source_id']]['version']+' binary. Its exact-release XML contains the conflicting availability annotation(s) '+', '.join('`'+v+'`' for v in sorted(set(future)))+'. Binary presence establishes inclusion in this target corpus. The original XML notes below are preserved as publisher metadata; they do not override verified target availability. The publisher discrepancy remains unresolved.'
   if doc:
    e,sid=doc;normalized=normalize_xml(e);text+='\n\n'+normalized;provenance.add(sid)
    if xml_richness(e)=='semantic_content':documented.add(s['id'])
    docs.append({'symbol_id':s['id'],'source_id':sid,'xml_doc_id':e.get('name'),'richness':xml_richness(e)})
   elif not doc_conflicted:text+='\n\nDocumentation status: undocumented in acquired installed XML. Signature and structural metadata are authoritative for the target assembly.'
   texts.append(text)
  record={'id':'canonical:dotnet:'+digest(key.encode()),'api_family':ss[0]['api_family'],'source_type':'api_reference','version':ss[0]['assembly_version'] if ss[0]['api_family']=='rhino3dm' else readj('config/target.json')['rhino_build'],'language':'dotnet_metadata','symbols':[s['id'] for s in sorted(ss,key=lambda s:s['id'])],'provenance':sorted(provenance),'documentation_links':docs,'text':'\n\n---\n\n'.join(texts),'version_validation':'selected release binary metadata; exact-release XML; availability annotation discrepancies explicitly labelled','status':'canonical'}
  records.append(record)
 # Remote and scripting records are added by separate validated stages, never silently admitted.
 records.extend(rows('normalized/approved_source.records.jsonl'))
 records.extend(rows('normalized/cpp.records.jsonl'))
 records.extend(rows('normalized/ecosystem.records.jsonl'))
 records.extend(rows('normalized/inside.records.jsonl'))
 records.sort(key=lambda r:r['id'])
 jsonl('corpus/canonical.records.jsonl',records)
 jsonl('manifest/version_conflicts.jsonl',version_conflicts)
 jsonl('manifest/documented_symbols.jsonl',[{'id':s} for s in sorted(documented)])
 jsonl('manifest/xml_unmatched.jsonl',unmatched);jsonl('manifest/parsing_failures.jsonl',failures);jsonl('manifest/parsed_sources.jsonl',parsed)
 for family in sorted({r['api_family'] for r in records}):jsonl('normalized/'+family+'/records.jsonl',[r for r in records if r['api_family']==family])
 print('Canonical records',len(records),'documented .NET symbols',len(documented),'XML failures',len(failures))
if __name__=='__main__':build()
