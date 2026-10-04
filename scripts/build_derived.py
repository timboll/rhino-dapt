"""Grounded structural relationships only; no invented examples or free-form API claims."""
from common import *
from collections import defaultdict

def run():
 if not readj('STATE.json').get('canonical_complete',False):
  # The brief requires canonical completion before derived generation.
  # Keep earlier trial output outside every production export for auditability.
  previous=rows('corpus/derived.records.jsonl')
  if previous:
   content=''.join(__import__('json').dumps(r,sort_keys=True,ensure_ascii=False)+'\n' for r in previous)
   write('derived/connective/checkpoint-'+digest(content.encode())+'.records.jsonl',content)
   jsonl('derived/connective/candidates.records.jsonl',previous)
  jsonl('corpus/derived.records.jsonl',[]);jsonl('derived/connective/records.jsonl',[])
  print('Derived generation deferred: canonical completeness is not certified; production derived corpus is empty')
  return
 cov=readj('manifest/coverage.json');assert cov['total']['symbols_absent']==0;assert cov['parsing_failures']==0
 assert not any(r['status']=='pending' for r in rows('manifest/source_decisions.jsonl')+rows('manifest/ecosystem_decisions.jsonl')+rows('manifest/inside_decisions.jsonl'))
 syms=rows('manifest/symbols.jsonl');types=[s for s in syms if s['kind'] in ('class','interface','struct','enum','delegate')];byname=defaultdict(list)
 for t in types:byname[t['declaring_type']].append(t)
 canonical={sid:r['id'] for r in rows('corpus/canonical.records.jsonl') for sid in r['symbols']};exceptions=[]
 def resolve(name,s):
  definition=name.split('<',1)[0];matches=byname.get(definition,[])
  exact=[t for t in matches if t['assembly']==s['assembly']]
  samefamily=[t for t in matches if t['api_family']==s['api_family']]
  candidates=exact or samefamily or matches
  if len(candidates)==1:return candidates[0]
  if len(candidates)>1:exceptions.append({'symbol_id':s['id'],'referenced_type':name,'reason':'ambiguous assembly identity; no derived relationship emitted'})
  return None
 groups=defaultdict(list)
 for s in types:
  if s['api_family'] not in ('rhinocommon','grasshopper','gh_io','rhino_ui','eto'):continue
  links=[]
  base=s.get('base_type')
  if base:
   t=resolve(base,s)
   if t:links.append(('base type `'+base+'` with definition',t))
  for i in s.get('interfaces',[]):
   t=resolve(i,s)
   if t:links.append(('implemented interface `'+i+'` with definition',t))
  for relationship,t in links:groups[(s['api_family'],s['namespace'])].append((s,relationship,t))
 records=[]
 for (family,namespace),edges in sorted(groups.items()):
  sourceids=set();symbols=set();lines=['# '+namespace+' — documented type relationships','API family: '+family,'Target: '+readj('config/target.json')['rhino_build'],'These relationships are extracted from the target assemblies. Each line identifies a declared base type or implemented interface.']
  for s,relationship,t in sorted(edges,key=lambda e:(e[0]['id'],e[1],e[2]['id'])):
   assert s['id'] in canonical and t['id'] in canonical
   symbols.update([s['id'],t['id']]);sourceids.update([canonical[s['id']],canonical[t['id']]])
   lines.append('- `'+s['declaring_type']+'` declares '+relationship+' `'+t['declaring_type']+'`.')
  key=family+'|'+namespace
  records.append({'id':'derived:relationships:'+digest(key.encode()),'api_family':'derived_connective','underlying_api_family':family,'source_type':'derived_structural_relationships','version':readj('config/target.json')['rhino_build'],'language':'technical_prose','symbols':sorted(symbols),'canonical_source_ids':sorted(sourceids),'provenance':sorted(sourceids),'text':'\n\n'.join(lines),'generation_method':'deterministic assembly metadata relationship template','contains_generated_code':False})
 jsonl('corpus/derived.records.jsonl',records);jsonl('derived/connective/records.jsonl',records)
 jsonl('manifest/derived_relationship_exceptions.jsonl',exceptions)
 print('Derived records',len(records))
if __name__=='__main__':run()
