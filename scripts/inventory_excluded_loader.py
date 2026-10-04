"""Discover beta loader API without admitting it into production corpus."""
from common import *
import subprocess
inputs=[s for s in rows('manifest/sources.jsonl') if s['source_type']=='excluded_beta_assembly'];jsonwrite('manifest/excluded_loader_inputs.json',inputs)
subprocess.run(['dotnet','scripts/InventoryDotnet/bin/Debug/net6.0/InventoryDotnet.dll','manifest/excluded_loader_inputs.json','manifest/excluded_loader_symbols.raw.jsonl','manifest/excluded_loader_assemblies.jsonl','manifest/excluded_loader_failures.jsonl','manifest/excluded_loader_nonpublic.jsonl'],check=True,cwd=ROOT)
ss={}
for s in rows('manifest/excluded_loader_symbols.raw.jsonl'):
 if s['id'] in ss:ss[s['id']].setdefault('alternate_sources',[]).append(s['source_id'])
 else:ss[s['id']]=s
for s in ss.values():
 s['api_family']=next(i['api_family'] for i in inputs if i['id']==s['source_id'])
 s['scope_status']='excluded';s['exclusion_reason']='Explicitly prerelease Rhino8 loader or Rhino.Testing package; user has not approved beta APIs for production. Inventory retained to avoid silent deferral.'
jsonl('manifest/excluded_loader_symbols.jsonl',[ss[k] for k in sorted(ss)]);print('Excluded beta loader declarations',len(ss))
