from common import *
from collections import defaultdict
import re

def run():
 records=rows('corpus/canonical.records.jsonl');kept=[];hashes={};removed=[];near=defaultdict(list)
 for r in records:
  # Only byte-identical semantic documents; preserve all source contexts and represented symbols.
  h=digest(r['text'].encode());key=(r['api_family'],r['language'],r['version'],h)
  if key in hashes:
   first=hashes[key];first['provenance']=sorted(set(first['provenance']+r['provenance']));first['symbols']=sorted(set(first['symbols']+r['symbols']));first.setdefault('collapsed_record_ids',[]).append(r['id']);removed.append({'kept_id':first['id'],'removed_id':r['id'],'text_sha256':h,'characters_removed':len(r['text']),'reason':'exact text and same family/language/version'})
  else:hashes[key]=r;kept.append(r)
  # Transparent near-duplicate candidate analysis: whitespace/case-normalized equality only;
  # never delete because of this index.
  nh=digest(re.sub(r'\s+',' ',r['text']).strip().casefold().encode());near[(r['api_family'],nh)].append(r['id'])
 jsonl('manifest/exact_duplicate_records.jsonl',removed);jsonl('manifest/near_duplicate_groups.jsonl',[{'family':k[0],'normalized_sha256':k[1],'record_ids':v,'policy':'whitespace/case equality; retained'} for k,v in sorted(near.items()) if len(v)>1])
 jsonl('corpus/canonical.records.jsonl',kept)
 jsonwrite('reports/deduplication.json',{'records_before':len(records),'records_after':len(kept),'exact_records_removed':len(removed),'characters_removed':sum(r['characters_removed'] for r in removed),'near_duplicate_groups':sum(len(v)>1 for v in near.values()),'near_records_removed':0,'exact_tokens_removed':0 if not removed else None,'near_algorithm':'SHA256 of casefolded whitespace-collapsed full document; intentionally conservative, not a semantic similarity score','source_file_exact_duplicates':len(rows('manifest/sources.jsonl'))-len({s['sha256'] for s in rows('manifest/sources.jsonl')})})
 print('Exact removed',len(removed),'remaining',len(kept))
if __name__=='__main__':run()
