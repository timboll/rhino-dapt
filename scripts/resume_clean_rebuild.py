"""Resume verified clean extraction at downstream stages after orchestration failure."""
from common import *
import subprocess,sys
proof=readj('reports/clean_rebuild_verification.json');assert proof['inventory_byte_identical']
for p,h in proof['rebuilt_inventory_hashes'].items():assert digest((ROOT/p).read_bytes())==h,p
assert (ROOT/'corpus/canonical.records.jsonl').exists()
recipe=(ROOT/'scripts/rebuild_all.sh').read_text();remaining='set -eu\n'+recipe[recipe.index('python3 scripts/segment.py'):]
write('reports/resumed_recipe.sh',remaining)
with (ROOT/'reports/clean_rebuild.log').open('a') as log:
 log.write('\nRESUME: extraction and initial canonical build verified; run remaining frozen commands.\n');log.flush()
 result=subprocess.run(['sh','-c',remaining],cwd=ROOT,stdout=log,stderr=subprocess.STDOUT)
proof['initial_exit_code']=proof['exit_code'];proof['resume_exit_code']=result.returncode;proof['exit_code']=result.returncode;proof['interruption']='Shell recipe edited during execution shifted read position; generated extraction inventories verified identical before resuming. Source extraction was not changed.';proof['resumed_recipe_sha256']=digest(remaining.encode());jsonwrite('reports/clean_rebuild_verification.json',proof);jsonwrite('reports/inventory_rebuild_verification.json',proof)
s=readj('STATE.json');s['phase']='post_clean_rebuild_validation' if result.returncode==0 else 'clean_rebuild_failure';s['updated_at']=stamp();jsonwrite('STATE.json',s)
print(json.dumps(proof));sys.exit(result.returncode)
