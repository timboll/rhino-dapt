"""Read MSI File table's column-major string references; never guess names from content."""
from common import *
import struct,shutil,subprocess
base=ROOT/'sources/extracted/msi_tables';pool=(base/'!_StringPool').read_bytes();data=(base/'!_StringData').read_bytes()
strings=[''];offset=0
for i in range(4,len(pool),4):
 length,refs=struct.unpack_from('<HH',pool,i)
 strings.append(data[offset:offset+length].decode('cp1252'));offset+=length
assert offset==len(data),(offset,len(data))
table=(base/'!File').read_bytes();assert len(table)%20==0;n=len(table)//20
out=ROOT/'sources/extracted/native_headers';out.mkdir(exist_ok=True);mapping=[]
for i in range(n):
 key=strings[struct.unpack_from('<H',table,2*i)[0]];name=strings[struct.unpack_from('<H',table,4*n+2*i)[0]].split('|')[-1]
 original=ROOT/'sources/extracted/native_sdk'/key
 assert original.exists(),key
 assert Path(name).name==name,name
 target=out/name
 if target.exists() and target.read_bytes()!=original.read_bytes():raise ValueError('Name collision '+name)
 shutil.copyfile(original,target)
 mapping.append({'msi_file_key':key,'filename':name,'sha256':digest(original.read_bytes())})
jsonl('manifest/native_msi_files.jsonl',mapping)
print('Mapped',len(mapping),'MSI files;',sum(Path(x['filename']).suffix.lower() in ('.h','.hpp') for x in mapping),'headers')
