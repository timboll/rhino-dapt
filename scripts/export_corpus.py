from common import *
def run():
 records=rows('corpus/canonical.records.jsonl')+rows('corpus/derived.records.jsonl');records.sort(key=lambda r:r['id'])
 assert len({r['id'] for r in records})==len(records)
 jsonl('corpus/full.records.jsonl',records);jsonl('corpus/training_text.jsonl',[{'text':r['text']} for r in records])
 print('Exported records',len(records))
if __name__=='__main__':run()
