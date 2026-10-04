"""Preserve outputs, then rebuild from pinned source manifests and immutable inputs."""
from common import *
import shutil,subprocess,sys
checkpoint=ROOT/'checkpoints'/('before-clean-rebuild-'+datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%SZ'));checkpoint.mkdir(parents=True)
inputs={'sources.jsonl','target_environment.json','installation_files.jsonl','repository_files.jsonl','ecosystem_repository_files.jsonl','inside_repository_files.jsonl','web_example_reconciliation.jsonl'}
baseline={p:digest((ROOT/p).read_bytes()) for p in ['manifest/symbols.jsonl','manifest/cpp_symbols.jsonl','manifest/python_symbols.jsonl','manifest/ecosystem_symbols.jsonl','manifest/inside_symbols.jsonl','manifest/excluded_host_symbols.jsonl'] if (ROOT/p).exists()}
jsonwrite(str(checkpoint.relative_to(ROOT)/'inventory_baseline.json'),baseline)
for folder in ['normalized','corpus','reports']:
 p=ROOT/folder
 if p.exists():shutil.move(str(p),str(checkpoint/folder))
 p.mkdir()
(checkpoint/'manifest').mkdir()
for p in (ROOT/'manifest').iterdir():
 if p.is_file() and p.name not in inputs:shutil.move(str(p),str(checkpoint/'manifest'/p.name))
# Remove extracted source/tool intermediates so archived bytes, not old trees,
# determine the rebuild. These are preserved in the checkpoint as well.
for folder in ['sources/extracted','sources/assembly_resolution']:
 p=ROOT/folder
 if p.exists():
  q=checkpoint/folder;q.parent.mkdir(parents=True,exist_ok=True);shutil.move(str(p),str(q))
 p.mkdir(parents=True,exist_ok=True)
s=readj('STATE.json');s.update(phase='clean_authoritative_input_rebuild',canonical_complete=False,corpus_build_complete=False,clean_rebuild_checkpoint=str(checkpoint.relative_to(ROOT)),updated_at=stamp());jsonwrite('STATE.json',s)
with (ROOT/'WORKLOG.md').open('a') as f:f.write('\n## '+stamp()+' — clean rebuild\n- Preserved all generated normalized/corpus/report artifacts and generated manifests in '+str(checkpoint.relative_to(ROOT))+'. Retained only authoritative source/discovery input manifests. Extracted SDK/source trees and assembly-resolution staging also moved aside.\n- Full offline extraction, normalization, validation, exports and exact tokenizer counts will regenerate from immutable cached inputs. Prior canonical completion remains revoked.\n')
recipe=(ROOT/'scripts/rebuild_all.sh').read_text()
write(str(checkpoint.relative_to(ROOT)/'executed_recipe.sh'),recipe)
with (ROOT/'reports/clean_rebuild.log').open('w') as log:
 result=subprocess.run(['sh','-c',recipe.replace('cd "$(dirname "$0")/.."','cd '+__import__('shlex').quote(str(ROOT)))],cwd=ROOT,stdout=log,stderr=subprocess.STDOUT)
after={p:digest((ROOT/p).read_bytes()) if (ROOT/p).exists() else None for p in baseline}
audit={'checkpoint':str(checkpoint.relative_to(ROOT)),'input_source_manifest_sha256':digest((ROOT/'manifest/sources.jsonl').read_bytes()),'exit_code':result.returncode,'previous_inventory_hashes':baseline,'rebuilt_inventory_hashes':after,'inventory_byte_identical':baseline==after,'method':'Generated corpus/normalized/report/manifests and extracted trees moved aside; offline rebuild from raw cache, locked acquisition/discovery manifests and scripts; no conversation context'}
jsonwrite('reports/clean_rebuild_verification.json',audit);jsonwrite('reports/inventory_rebuild_verification.json',audit)
s=readj('STATE.json');s['phase']='post_clean_rebuild_validation' if result.returncode==0 else 'clean_rebuild_failure';s['updated_at']=stamp();jsonwrite('STATE.json',s)
print(json.dumps(audit));sys.exit(result.returncode)
