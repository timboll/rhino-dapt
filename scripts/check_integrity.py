from common import *
import argparse

def check():
 failures=[];checked={}
 for s in rows('manifest/sources.jsonl'):
  p=ROOT/s['cache_path']
  if not p.exists():failures.append({'source':s['id'],'error':'missing cache'});continue
  h=checked.setdefault(str(p),digest(p.read_bytes()))
  if h!=s['sha256']:failures.append({'source':s['id'],'error':'hash mismatch'})
 result={'source_entries':len(rows('manifest/sources.jsonl')),'distinct_blobs':len(checked),'failures':failures,'brief_matches_root':(ROOT/'docs/DAPT_CORPUS_BUILD_BRIEF.md').read_bytes()==(ROOT/'DAPT_CORPUS_BUILD_BRIEF.md').read_bytes(),'state_present':(ROOT/'STATE.json').exists(),'worklog_present':(ROOT/'WORKLOG.md').exists()}
 jsonwrite('reports/integrity.json',result);print(json.dumps(result));assert not failures
 return result
if __name__=='__main__':check()
