"""Persist all explicit numeric future-version XML notes, including unmatched members."""
from common import *
from version_policy import newer_than_target
import xml.etree.ElementTree as ET
result=[]
for s in rows('manifest/sources.jsonl'):
 if s['source_type']!='xml_documentation':continue
 root=ET.fromstring((ROOT/s['cache_path']).read_bytes());assembly=(root.findtext('./assembly/name') or '').strip()
 for member in root.findall('./members/member'):
  future=[ ''.join(n.itertext()).strip() for n in member.findall('since') if newer_than_target(''.join(n.itertext()).strip()) ]
  if future:result.append({'source_id':s['id'],'assembly':assembly,'doc_id':member.get('name'),'since':future,'target_build':readj('config/target.json')['rhino_build']})
jsonl('manifest/future_documentation_notes.jsonl',sorted(result,key=lambda r:(r['assembly'],r['doc_id'],r['source_id'])))
print('Distinct future-annotated XML members',len({(r['assembly'],r['doc_id']) for r in result}),'source occurrences',len(result))
