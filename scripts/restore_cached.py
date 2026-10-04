"""Restore tools and extracted source trees from verified immutable caches. No network."""
from common import *
import shutil,subprocess,tarfile
sources=rows('manifest/sources.jsonl')
for d in readj('config/downloads.json'):
 p=ROOT/d['path'];raw=ROOT/'sources/raw'/d['sha256']
 assert raw.exists() and digest(raw.read_bytes())==d['sha256'],str(raw)
 if not p.exists():p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(raw,p)
 else:assert digest(p.read_bytes())==d['sha256'],str(p)
for name,target in [('opennurbs-8.tar.gz','sources/extracted/opennurbs-8'),('guides.tar.gz','sources/extracted/guides'),('samples-8.tar.gz','sources/extracted/samples-8'),('7z2603-mac.tar.xz','tools/7zip'),('typescript-5.9.3.tgz','tools/typescript')]:
 p=ROOT/target;p.mkdir(parents=True,exist_ok=True)
 with tarfile.open(ROOT/'sources/snapshots'/name) as tf:tf.extractall(p,filter='data')
for s in sources:
 if s['source_location'].endswith('/Mono.Cecil.dll'):
  p=ROOT/'tools/managed/Mono.Cecil.dll';p.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(ROOT/s['cache_path'],p)
 if s['source_type']=='metadata_dependency':
  p=ROOT/'sources/assembly_resolution'/Path(s['source_location']).name;p.parent.mkdir(exist_ok=True);shutil.copyfile(ROOT/s['cache_path'],p)
seven=str(ROOT/'tools/7zip/7zz');msi=str(ROOT/'sources/snapshots/rh835sdk_8.35.26251.13001.msi')
with (ROOT/'reports/native_restore.log').open('w') as log:
 subprocess.run([seven,'x','-y','-osources/extracted/native_sdk',msi],check=True,stdout=log,cwd=ROOT)
 subprocess.run([seven,'x','-tCompound','-y','-osources/extracted/msi_tables',msi,'!File','!_StringData','!_StringPool','!_Columns','!Directory','!Component'],check=True,stdout=log,cwd=ROOT)
print('Cached archives, metadata dependencies and native SDK restored; no network used')

# Exact cached Roslyn parser assemblies; no network restore.
subprocess.run(['python3','scripts/register_roslyn.py'],check=True,cwd=ROOT)
