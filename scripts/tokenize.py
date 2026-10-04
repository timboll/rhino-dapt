"""Exact tokenizer counts only; does not import a model or start training."""
from common import *
import importlib.metadata, statistics,collections,sys

def tokenize():
 from tokenizers import Tokenizer
 deployment=Path(readj('config/target.json')['deployment_model']);upstream=ROOT/'sources/snapshots/upstream-tokenizer.json'
 checks=[]
 for name in ('tokenizer.json','tokenizer_config.json'):
  local=deployment/name;remote=ROOT/'sources/snapshots'/('upstream-'+name)
  if local.exists():
   assert local.read_bytes()==remote.read_bytes(),'Tokenizer compatibility mismatch: '+name
   h,c=cache(local)
  else:
   previous=next(x for x in readj('manifest/tokenizer.json')['compatibility'] if x['name']==name)
   cached=ROOT/previous['cache_path'];assert cached.read_bytes()==remote.read_bytes();h,c=previous['sha256'],previous['cache_path']
  checks.append({'name':name,'local_path':str(local),'upstream_path':str(remote.relative_to(ROOT)),'sha256':h,'cache_path':c,'byte_identical':True})
 tokenizer=Tokenizer.from_file(str(upstream));tokenizer.no_truncation();tokenizer.no_padding()
 config=readj('sources/snapshots/upstream-model.json')
 jsonwrite('manifest/tokenizer.json',{'upstream_model':'Qwen/Qwen3.8-27B','upstream_commit':config['sha'],'deployment_model':str(deployment),'compatibility':checks,'tokenizers_version':importlib.metadata.version('tokenizers'),'add_special_tokens':False,'chat_template_applied':False,'padding':False,'truncation':False,'sequence_packing':False,'count_definition':'raw text tokens, no per-record BOS/EOS; eventual trainer separators are separate'})
 previous_counts={r['id']:r for r in rows('manifest/record_tokens.jsonl')}
 byfamily=collections.defaultdict(list);bykind=collections.defaultdict(list);out=ROOT/'manifest/record_tokens.jsonl';tmp=out.with_suffix('.tmp');all_lengths=[]
 with tmp.open('w') as w:
  for kind,path in [('canonical','corpus/canonical.records.jsonl'),('derived','corpus/derived.records.jsonl')]:
   if not (ROOT/path).exists():continue
   with (ROOT/path).open() as f:
    for i,line in enumerate(f):
     r=json.loads(line);text_hash=digest(r['text'].encode());old=previous_counts.get(r['id']);n=old['tokens'] if old and old['text_sha256']==text_hash else len(tokenizer.encode(r['text'],add_special_tokens=False).ids);assert n>0
     row={'id':r['id'],'api_family':r['api_family'],'corpus':kind,'tokens':n,'text_sha256':digest(r['text'].encode())};w.write(json.dumps(row,sort_keys=True)+'\n')
     byfamily[r['api_family']].append(n);bykind[kind].append(n);all_lengths.append(n)
     if i%1000==0:w.flush()
 os.replace(tmp,out)
 def describe(ns):
  ns=sorted(ns)
  if not ns:return {'records':0,'tokens':0}
  def percentile(q):return ns[min(len(ns)-1,int((len(ns)-1)*q))]
  return {'records':len(ns),'tokens':sum(ns),'mean':statistics.mean(ns),'median':statistics.median(ns),'p90':percentile(.90),'p95':percentile(.95),'p99':percentile(.99),'max':max(ns),'histogram':{str(lo)+'-'+str(hi):sum(lo<=v<=hi for v in ns) for lo,hi in [(1,256),(257,512),(513,1024),(1025,2048),(2049,4096),(4097,8192),(8193,16384),(16385,32768),(32769,65536),(65537,10**9)]}}
 stats={'by_family':{k:describe(v) for k,v in sorted(byfamily.items())},'by_corpus':{k:describe(v) for k,v in sorted(bykind.items())},'total':describe(all_lengths),'percentile_method':'floor index in sorted lengths, q*(n-1)','tokenizer_manifest':'manifest/tokenizer.json'}
 for s in stats['by_family'].values():s['proportion']=s['tokens']/stats['total']['tokens']
 jsonwrite('reports/corpus_statistics.json',stats)
 dedup=readj('reports/deduplication.json');counts={r['id']:r['tokens'] for r in rows('manifest/record_tokens.jsonl')};dedup['exact_tokens_removed']=sum(counts[r['kept_id']] for r in rows('manifest/exact_duplicate_records.jsonl'));jsonwrite('reports/deduplication.json',dedup)
 print(json.dumps(stats['total']))
if __name__=='__main__':tokenize()
