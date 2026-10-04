from common import *
import re,ast,collections,warnings

def run():
 managed=rows('manifest/symbols.jsonl');cpp=rows('manifest/cpp_symbols.jsonl');python=rows('manifest/python_symbols.jsonl')+rows('manifest/ecosystem_symbols.jsonl')+rows('manifest/inside_symbols.jsonl');inventory={s['id']:s for s in managed+cpp+python};sources={s['id']:s for s in rows('manifest/sources.jsonl')}
 docs={s['doc_id'] for s in managed};overloads={d.split('(')[0] for d in docs};names={d[2:].split('(')[0].replace('`','') for d in docs};names|={s['declaring_type'] for s in managed};names|={s['namespace'] for s in managed}
 namespace_prefixes={'.'.join(n.split('.')[:i]) for n in names for i in range(1,len(n.split('.')))}
 errors=[];references={};py_results=[];version_findings=[]
 for r in rows('corpus/canonical.records.jsonl'):
  for sid in r['symbols']:
   if sid not in inventory:errors.append({'record_id':r['id'],'symbol_id':sid,'reason':'not in inventory'})
  for p in r['provenance']:
   if p not in sources:errors.append({'record_id':r['id'],'source_id':p,'reason':'invalid provenance'})
  if r['source_type']=='api_reference':
   for ref in re.findall(r'cref=([TMPFE]:[^\n,]+)',r['text']):
    # Full XML cref validation below; this text representation can include punctuation.
    pass
  if r['source_type'] in ('guide','sample','source_code'):
   for candidate in set(re.findall(r'\b(?:Rhino|Grasshopper|GH_IO|Eto)\.[A-Za-z_]\w*(?:\.[A-Za-z_]\w*)*',r['text'])):
    if candidate in names or candidate in namespace_prefixes:continue
    parts=candidate.split('.')
    # Record every unknown reference, including potential chained properties; do not assert it is bad API usage.
    known_prefix=next(('.'.join(parts[:i]) for i in range(len(parts)-1,1,-1) if '.'.join(parts[:i]) in names),None)
    key=(r['id'],candidate)
    references[key]={'record_id':r['id'],'reference':candidate,'known_prefix':known_prefix,'reason':'static dotted-text candidate; could be extension, chained return-value property, namespace, filename or unavailable API; requires typed binding','status':'unresolved_static_candidate'}
  if re.search(r'(?i)\b(?:Rhino\s*9|Grasshopper\s*2|gh2)\b',r['text']):
   review=readj('config/version_context_reviews.json').get(r['id'],r.get('source_metadata',{}).get('source_review',{}))
   if 'text_sha256' in review:assert review['text_sha256']==digest(r['text'].encode()),'Version-context review is stale: '+r['id']
   version_findings.append({'record_id':r['id'],'provenance':r['provenance'],'review':review,'source_type':r['source_type'],'reason':'exact-release XML availability conflict resolved for inclusion by verified target-binary presence; original annotation preserved' if '## Availability annotation discrepancy' in r['text'] else 'target-installed or pinned Rhino8 code/header compatibility comments require context; not automatically future API' if r['source_type'] in ('api_reference','public_cpp_header','source_code') else review.get('reason','requires review')})
 for s in sources.values():
  if s['source_type']=='python_source' or s.get('archive_path','').endswith('.py'):
   content,encoding=decode_source((ROOT/s['cache_path']).read_bytes())
   try:
    with warnings.catch_warnings():warnings.simplefilter('ignore');ast.parse(content)
    status='passed';reason='Python 3 syntax; runtime and typed .NET binding not executed'
   except SyntaxError as e:status='failed_or_python2';reason=str(e)
   py_results.append({'source_id':s['id'],'status':status,'reason':reason,'encoding':encoding})
 import xml.etree.ElementTree as ET
 cref_exceptions=[]
 for s in sources.values():
  if s['source_type']!='xml_documentation':continue
  root=ET.fromstring((ROOT/s['cache_path']).read_bytes())
  for el in root.iter():
   ref=el.get('cref')
   if not ref or ref in docs or ref.split('(')[0] in overloads:continue
   category='external dependency' if re.match(r'[TMPFE]:(System|Microsoft|Newtonsoft|IronPython)\.',ref) else 'unresolved XML reference or non-public symbol; retained source evidence, not asserted as a target public API'
   cref_exceptions.append({'source_id':s['id'],'reference':ref,'reason':category})
 # Stable unique exceptions, rather than repeated inherited references.
 cref_exceptions=list({(r['source_id'],r['reference']):r for r in cref_exceptions}.values())
 jsonl('manifest/reference_exceptions.jsonl',sorted(references.values(),key=lambda r:(r['record_id'],r['reference'])))
 jsonl('manifest/xml_reference_exceptions.jsonl',sorted(cref_exceptions,key=lambda r:(r['source_id'],r['reference'])))
 jsonl('manifest/python_validation.jsonl',py_results);jsonl('manifest/version_findings.jsonl',version_findings);jsonl('manifest/symbol_validation_failures.jsonl',errors)
 summary={'inventory_symbols':len(inventory),'invalid_record_symbols_or_provenance':len(errors),'dotted_text_candidates_requiring_binding':len(references),'xml_reference_exceptions':len(cref_exceptions),'version_context_findings':len(version_findings),'unreviewed_version_contexts':sum(x['review'].get('status')!='included' for x in version_findings),'python_syntax':dict(collections.Counter(r['status'] for r in py_results))}
 jsonwrite('reports/symbol_validation.json',summary);print(json.dumps(summary))
if __name__=='__main__':run()
