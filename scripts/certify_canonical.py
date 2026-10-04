"""Certify canonical artifacts only after independent checks; never starts training."""
from common import *
import re
cov=readj('manifest/coverage.json');clean=readj('reports/clean_rebuild_verification.json');rebuild=readj('reports/rebuild_verification.json')
assert clean['exit_code']==0 and clean['inventory_byte_identical'],clean
assert rebuild['byte_identical'],rebuild
assert cov['total']['symbols_absent']==0 and cov['parsing_failures']==0,cov['total']
assert readj('reports/symbol_validation.json')['invalid_record_symbols_or_provenance']==0
assert readj('reports/symbol_validation.json')['unreviewed_version_contexts']==0
assert not any(d['status']=='pending' for name in ['source_decisions','ecosystem_decisions','inside_decisions'] for d in rows('manifest/'+name+'.jsonl'))
assert rows('manifest/inside_parsing_failures.jsonl')==[]
assert rows('manifest/excluded_loader_failures.jsonl')==[]
assert readj('reports/documentation_richness.json')['Grasshopper']['semantic_content']>8000
assert readj('reports/cpp_platform_audit.json')['generic_only']==0
assert re.search(r'Ran \d+ tests.*\n\nOK', (ROOT/'reports/tests.log').read_text(),re.S)
assert not any(f['status']=='deferred' for f in rows('manifest/source_families.jsonl'))
canonical=ROOT/'corpus/canonical.records.jsonl';h=digest(canonical.read_bytes());assert rebuild['after']['corpus/canonical.records.jsonl']==h
s=readj('STATE.json');old=s.get('canonical_completion')
if old and old.get('revoked'):s.setdefault('canonical_completion_history',[]).append(old)
s.update(canonical_complete=True,corpus_build_complete=False,phase='derived_and_final_validation',canonical_completion={'timestamp':stamp(),'sha256':h,'records':sum(1 for _ in canonical.open()),'symbols':cov['total'],'basis':'clean authoritative-input rebuild; all inventoried target declarations represented; stable hosts included; alpha/beta/historical exclusions separately inventoried and justified; exact XML attachment verified; tests and canonical/inventory reproducibility passed'},updated_at=stamp(),next_actions=['Generate separately grounded derived records','Regenerate full/minimal exports and exact token statistics','Validate final artifacts and reports; stop for user review without training'])
jsonwrite('STATE.json',s)
with (ROOT/'WORKLOG.md').open('a') as f:f.write('\n## '+stamp()+' — canonical recertification\n- Clean authoritative-input extraction matched all six inventory baselines byte-for-byte. Shell orchestration interruption was repaired by resuming from verified canonical output with frozen commands; no source/extraction work discarded.\n- Zero missing inventoried declarations, zero parser failures/pending source decisions; every normalized XML attachment verified in its API record, with semantic richness measured separately. Fresh-process canonical rebuild and regression suite passed. Canonical SHA: '+h+'.\n- Canonical now certified before derived generation. See STATE.json for Git capability status; no training or permanent split.\n')
print(json.dumps(s['canonical_completion']))
