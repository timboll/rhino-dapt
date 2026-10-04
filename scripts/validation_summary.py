from common import *
py3={r['source_id']:r for r in rows('manifest/python_validation.jsonl')};py2={r['source_id']:r for r in rows('manifest/python2_validation.jsonl')}
jsonl('manifest/python_both_grammars_failed.jsonl',[{'source_id':sid,'python3':r,'python2':py2[sid]} for sid,r in py3.items() if r['status']!='passed' and sid in py2 and py2[sid]['status']!='passed'])
