from common import *
from collections import defaultdict,Counter

def run():
 conflicts={r['symbol_id']:r for r in rows('manifest/version_conflicts.jsonl')}
 symbols=rows('manifest/symbols.jsonl')+rows('manifest/cpp_symbols.jsonl')+rows('manifest/python_symbols.jsonl')+rows('manifest/ecosystem_symbols.jsonl')+rows('manifest/inside_symbols.jsonl');represented=set();documented={s['id'] for s in rows('manifest/documented_symbols.jsonl')};documents=defaultdict(set);records=Counter()
 for r in rows('corpus/canonical.records.jsonl'):
  represented.update(r['symbols']);documents[r['api_family']].update(r['provenance']);records[r['api_family']]+=1
 for s in symbols:
  if s.get('documented') or s.get('documentation_xml','').replace('<briefdescription>','').strip() and 'documentation_xml' in s:
   # Doxygen element shells are not documentation.
   import xml.etree.ElementTree as ET
   if s.get('documented') or ''.join(ET.fromstring('<root>'+s['documentation_xml']+'</root>').itertext()).strip():documented.add(s['id'])
 levels={level:defaultdict(lambda:Counter(discovered=0,documented=0,represented=0,missing_documentation=0,absent=0)) for level in ['family','assembly','namespace','type','kind']};exceptions=[]
 for s in symbols:
  present=s['id'] in represented;doc=s['id'] in documented
  values={'family':s['api_family'],'assembly':s.get('assembly',s['api_family']),'namespace':s.get('namespace',s.get('module',s['api_family'])),'type':s.get('assembly','')+'|'+s.get('declaring_type',s.get('qualified_name',s.get('module',''))),'kind':s['kind']}
  for lev,key in values.items():
   c=levels[lev][key];c['discovered']+=1;c['documented']+=doc;c['represented']+=present;c['missing_documentation']+=not doc;c['absent']+=not present
  if not present or not doc:exceptions.append({'symbol_id':s['id'],'source_id':s['source_id'],'represented':present,'documented':doc,'reason':('symbol absent from canonical corpus; requires repair' if not present else 'publisher availability annotation conflicts with verified target binary; exact-release semantics retained where matched; see version_conflicts.jsonl' if s['id'] in conflicts else 'no separate semantic XML/docstring matched; metadata or full authoritative header/source retained. Header comments and separate guides may document the declaration without recognized linkage.')})
 coverage={'levels':{lev:{k:dict(v) for k,v in sorted(groups.items())} for lev,groups in levels.items()},'total':{'symbols_discovered':len(symbols),'symbols_documented':sum(s['id'] in documented for s in symbols),'symbols_represented':sum(s['id'] in represented for s in symbols),'symbols_absent':sum(s['id'] not in represented for s in symbols)},'source_records':dict(sorted(records.items())),'canonical_source_ids':{k:len(v) for k,v in sorted(documents.items())},'source_acquired':len(rows('manifest/sources.jsonl')),'source_decisions':dict(Counter(r['status'] for r in rows('manifest/source_decisions.jsonl')+rows('manifest/ecosystem_decisions.jsonl')+rows('manifest/inside_decisions.jsonl'))),'parsing_failures':len(rows('manifest/parsing_failures.jsonl'))+len(rows('manifest/source_parsing_failures.jsonl'))+len(rows('manifest/cpp_parsing_failures.jsonl'))+len(rows('manifest/metadata_failures.jsonl'))+len(rows('manifest/ecosystem_parsing_failures.jsonl'))+len(rows('manifest/inside_parsing_failures.jsonl')),'scope_note':'Coverage denominator is acquired installed .NET metadata, public/protected Doxygen header inventory, and Python AST declarations. Doxygen macro/platform completeness and source discovery require separate audit; signature coverage is not semantic documentation coverage.'}
 coverage['source_processing']={'source_evidence_entries_acquired':len(rows('manifest/sources.jsonl')),'text_candidates_dispositioned':len(rows('manifest/source_decisions.jsonl'))+len(rows('manifest/ecosystem_decisions.jsonl'))+len(rows('manifest/inside_decisions.jsonl')),'text_sources_normalized':sum(d['status']=='included' for d in rows('manifest/source_decisions.jsonl')+rows('manifest/ecosystem_decisions.jsonl')+rows('manifest/inside_decisions.jsonl')),'assembly_binaries_inspected':len(rows('manifest/assemblies.jsonl')),'included_assembly_variants':sum(a['include'] for a in rows('manifest/assemblies.jsonl')),'xml_documentation_files_parsed':len(rows('manifest/parsed_sources.jsonl')),'public_header_files_parsed':len(rows('normalized/cpp.records.jsonl')),'parser_failures':coverage['parsing_failures']}
 jsonwrite('manifest/coverage.json',coverage);jsonl('manifest/coverage_exceptions.jsonl',exceptions);print(json.dumps(coverage['total']))
if __name__=='__main__':run()
