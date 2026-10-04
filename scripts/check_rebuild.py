"""Rebuild normalized canonical records from cached sources and compare exact byte hashes."""
from common import *
import subprocess,sys
paths=['normalized/approved_source.records.jsonl','normalized/ecosystem.records.jsonl','normalized/inside.records.jsonl','corpus/canonical.records.jsonl','manifest/source_decisions.jsonl','manifest/documented_symbols.jsonl']
before={p:digest((ROOT/p).read_bytes()) for p in paths}
for script in ['normalize_sources.py','normalize_ecosystem.py','normalize_inside.py','build_canonical.py','segment.py','deduplicate.py']:
 subprocess.run([sys.executable,str(ROOT/'scripts'/script)],check=True,cwd=ROOT)
after={p:digest((ROOT/p).read_bytes()) for p in paths}
result={'before':before,'after':after,'byte_identical':before==after,'method':'fresh Python processes, cached source inputs; no conversation or network','scope':'canonical normalization/rebuild and source decisions; metadata and Doxygen reproducibility verified separately'}
jsonwrite('reports/rebuild_verification.json',result);print(json.dumps(result));assert before==after
