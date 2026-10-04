"""Syntax-check explicitly labelled Python guide blocks; never execute examples."""
from common import *
import ast,re,textwrap,subprocess,collections,warnings
results=[];inputs=[];directory=ROOT/'normalized/guide_code_validation';directory.mkdir(parents=True,exist_ok=True)
for r in rows('corpus/canonical.records.jsonl'):
 if r['source_type'] not in ('guide','api_reference'):continue
 for i,m in enumerate(re.finditer(r'```([^\n]*)\n(.*?)\n```',r['text'],re.S)):
  language=m[1].strip().lower()
  if language not in ('python','python2','python3','py'):continue
  code=textwrap.dedent(m[2]);rid='guideblock:'+r['id']+':'+str(i);h=digest(code.encode());p=directory/(h+'.py');p.write_text(code)
  error=None
  try:
   with warnings.catch_warnings():warnings.simplefilter('ignore');ast.parse(code)
  except SyntaxError as e:error=str(e)
  results.append({'id':rid,'record_id':r['id'],'provenance':r['provenance'],'block_index':i,'language_label':language,'code_sha256':h,'python3_status':'passed' if error is None else 'failed_or_python2_or_partial_snippet','python3_error':error,'validation':'syntax only; indentation dedented for standalone check; incomplete/teaching snippets may fail; official corpus text unchanged'})
  inputs.append({'id':rid,'source_type':'python_source','cache_path':str(p.relative_to(ROOT))})
jsonl('manifest/guide_code_inputs.jsonl',inputs)
subprocess.run(['dotnet','scripts/ValidatePython2/bin/Debug/net6.0/ValidatePython2.dll','manifest/guide_code_inputs.jsonl','manifest/guide_code_python2_results.jsonl'],check=True,cwd=ROOT)
py2={r['source_id']:r for r in rows('manifest/guide_code_python2_results.jsonl')}
for r in results:r['python2_status']=py2[r['id']]['status'];r['python2_error']=py2[r['id']]['error'];r['both_grammars_failed']=r['python3_status']!='passed' and r['python2_status']!='passed'
jsonl('manifest/guide_code_validation.jsonl',results);summary={'blocks':len(results),'python3_passed':sum(r['python3_status']=='passed' for r in results),'python2_passed':sum(r['python2_status']=='passed' for r in results),'both_grammars_failed':sum(r['both_grammars_failed'] for r in results),'execution':'none','interpretation':'Failures include partial snippets and actual source defects, not automatically bad target API usage; exact record/block locations retained.'};jsonwrite('reports/guide_code_validation.json',summary);print(json.dumps(summary))
