from pathlib import Path
import json, hashlib, os, datetime
ROOT=Path(__file__).resolve().parents[1]
def digest(b): return hashlib.sha256(b).hexdigest()
def readj(p): return json.loads((ROOT/p).read_text())
def rows(p):
 f=ROOT/p
 return [json.loads(x) for x in f.read_text().splitlines()] if f.exists() else []
def write(p,s):
 p=ROOT/p;p.parent.mkdir(parents=True,exist_ok=True); t=p.with_name(p.name+'.tmp');t.write_text(s);os.replace(t,p)
def jsonwrite(p,o): write(p,json.dumps(o,indent=2,sort_keys=True,ensure_ascii=False)+'\n')
def jsonl(p,rs): write(p,''.join(json.dumps(r,sort_keys=True,ensure_ascii=False)+'\n' for r in rs))
def cache(p):
 b=Path(p).read_bytes();h=digest(b); dest=ROOT/'sources/raw'/h
 if not dest.exists(): dest.write_bytes(b)
 elif digest(dest.read_bytes())!=h: raise ValueError('Corrupt cache '+h)
 return h,str(dest.relative_to(ROOT))
def stamp(): return datetime.datetime.now(datetime.timezone.utc).isoformat()
def decode_source(b):
 for encoding in ('utf-8-sig','cp1252','latin1'):
  try:return b.decode(encoding),encoding
  except UnicodeDecodeError:continue
 raise ValueError('No lossless source decoding')
