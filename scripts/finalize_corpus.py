from common import *
import subprocess,re
s=readj('STATE.json');assert s['canonical_complete']
assert digest((ROOT/'corpus/canonical.records.jsonl').read_bytes())==s['canonical_completion']['sha256']
assert re.search(r'Ran \d+ tests.*\n\nOK',(ROOT/'reports/tests.log').read_text(),re.S)
assert not s.get('training_started');assert not (ROOT/'train.jsonl').exists() and not (ROOT/'valid.jsonl').exists()
full=rows('corpus/full.records.jsonl');tokens={r['id']:r for r in rows('manifest/record_tokens.jsonl')};assert len(full)==len(tokens)
assert all(tokens[r['id']]['text_sha256']==digest(r['text'].encode()) for r in full)
subprocess.run(['python3','scripts/check_integrity.py'],check=True,cwd=ROOT)
s.update(corpus_build_complete=True,status=('corpus_preparation_complete' if s.get('git_checkpointing',{}).get('status')=='available' else 'corpus_preparation_complete_with_git_blocker'),phase='review_gate',review_gate_passed=False,training_started=False,updated_at=stamp(),completed=['Exact Rhino8 SR35 environment and tokenizer pinned','Authoritative raw sources cached and hash-verified','All selected public/protected managed/native/scripting/host declarations inventoried','Current host families inventoried; alpha/beta/historical exclusions evidenced','Grasshopper exact XML attachment verified and documentation richness reported separately','Rhino.UI authoritative documentation gap investigated and reported','Clean authoritative-input extraction and downstream corpus rebuild complete','Canonical and symbol inventories independently reproduced from disk','Grounded derived records generated after canonical certification','Full/minimal exports and exact Qwen token statistics regenerated','Final automated suite passed; review reports prepared'],next_actions=['User reviews final corpus/coverage/tokenization and explicit remaining limitations','Restore Git write capability and create an initial checkpoint; prior history cannot be reconstructed','Only after separate authorization, design an experimental validation/evaluation recipe; no training authorized'])
s['failure_history']=[{**f,'status':'resolved' if f.get('action')=='semantic XML attachment' else 'still_blocked'} for f in s.get('failures',[])]
s['failures']=[f for f in s.get('failures',[]) if f.get('action')=='git checkpoint']
if s.get('git_checkpointing',{}).get('status')=='available':
 s['next_actions']=[x for x in s['next_actions'] if not x.startswith('Restore Git')]
jsonwrite('STATE.json',s)
for script in ['source_inventory.py','documentation_audit.py','reports.py']:subprocess.run(['python3','scripts/'+script],check=True,cwd=ROOT)
with (ROOT/'WORKLOG.md').open('a') as f:f.write('\n## '+stamp()+' — review gate\n- Corpus preparation artifacts, final exact tokenizer counts and validation reports complete. Final tests passed after derived/full/minimal exports.\n- Review gate remains unpassed; no model training or permanent split started. See STATE.json for current Git capability status.\n')
print('Stopped at review gate. No training.')
