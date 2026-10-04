"""Lossless semantic segmentation of large code documents.
Boundaries are complete top-level declarations, or complete members of a class/namespace.
No character/token slicing inside a declaration and no fixed training sequence length.
"""
from common import *
import re
TOKEN=re.compile(r'//[^\n]*(?:\n|$)|/\*.*?\*/|R"([^ ()\\\t\r\n]{0,16})\(.*?\)\1"|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|^[ \t]*\#(?:[^\n]*\\\n)*[^\n]*(?:\n|$)|[{};]',re.S|re.M)
def boundaries(code,level=0):
 depth=0;ends=[]
 for m in TOKEN.finditer(code):
  t=m.group()
  if t=='{':depth+=1
  elif t=='}':
   depth-=1
   if depth==level:
    tail=re.match(r'[ \t]*;',code[m.end():]);ends.append(m.end()+(tail.end() if tail else 0))
  elif t==';' and depth==level:ends.append(m.end())
 return sorted(set(ends+[len(code)]))
def csharp_member_boundaries(code):
 # Descend through namespaces/types, never through executable bodies. Comments
 # and strings are lexer tokens, so braces inside them do not affect nesting.
 stack=[];points=[];previous=0
 for m in TOKEN.finditer(code):
  token=m.group()
  if token not in ('{','}',';'):continue
  if token=='{':
   prefix=code[previous:m.start()]
   prefix=re.sub(r'//[^\n]*|/\*.*?\*/','',prefix,flags=re.S)
   container=bool(re.search(r'\b(?:namespace|class|struct|interface)\s+[A-Za-z_]',prefix)) and all(stack)
   stack.append(container)
  elif token=='}':
   if stack:stack.pop()
   if all(stack):points.append(m.end())
  elif all(stack):points.append(m.end())
  previous=m.end()
 return sorted(set(points+[len(code)]))

def semantic_parts(code,soft_limit=60000,language=None):
 points=csharp_member_boundaries(code) if language=='csharp' else boundaries(code);units=[];start=0
 for end in points:
  if end<=start:continue
  unit=code[start:end]
  # Only class/namespace containers can split into member sections; never split a function body.
  opening=unit.find('{');prefix=unit[:opening] if opening>=0 else ''
  if len(unit)>soft_limit and re.search(r'\b(class|struct|namespace|module)\s+[A-Za-z_\x22\x27]',prefix):
   subpoints=boundaries(unit,1);substart=0
   for e in subpoints:
    if e>substart:units.append((start+substart,start+e));substart=e
  elif len(unit)>soft_limit and language=='csharp' and re.search(r'\bstatic\s+readonly\s+Dictionary\s*<\s*string\s*,\s*string\s*>',unit):
   # Generated identifier-to-label catalog: every complete dictionary entry is
   # a semantic mapping. Keep code context/sequence and exact reassembly.
   entries=list(re.finditer(r'(?m)^\s*\{[ \t]*"(?:\\.|[^"\\])*"[ \t]*,[ \t]*"(?:\\.|[^"\\])*"[ \t]*\},?[ \t]*$',unit))
   if len(entries)>300:
    cuts=[0]+[m.end() for m in entries]+[len(unit)]
    units.extend((start+a,start+b) for a,b in zip(cuts,cuts[1:]) if b>a)
   else:units.append((start,end))
  elif len(unit)>soft_limit:
   # Large legacy encoding maps have a natural key: the leading byte of the encoded
   # character. Split only at changes in that key, preserving all rows and function context.
   mapping=list(re.finditer(r'(?m)^[ \t]*(?:case[ \t]+0x([0-9A-Fa-f]+)|\{[ \t]*0x([0-9A-Fa-f]+)[ \t]*,|0x([0-9A-Fa-f]+)<SEP>)',unit))
   if len(mapping)>300:
    cuts=[0];previous=None
    for m in mapping:
     lead=int(m.group(1) or m.group(2) or m.group(3),16)>>8
     if previous is not None and lead!=previous:cuts.append(m.start())
     previous=lead
    cuts.append(len(unit))
    units.extend((start+a,start+b) for a,b in zip(cuts,cuts[1:]) if b>a)
   else:units.append((start,end))
  else:units.append((start,end))
  start=end
 groups=[];a=0;b=0
 for begin,end in units:
  if b>a and end-a>soft_limit:groups.append((a,b));a=begin
  b=end
 if b>a:groups.append((a,b))
 assert ''.join(code[a:b] for a,b in groups)==code
 return groups

def run():
 result=[];manifest=[]
 cpp_types=[s for s in rows('manifest/cpp_symbols.jsonl') if s['kind'] in ('class','struct','namespace','union')]
 for r in rows('corpus/canonical.records.jsonl'):
  if len(r['text'])<180000 or r['language'] not in ('cpp','csharp','typescript'):result.append(r);continue
  match=re.search(r'```(?:cpp|csharp|typescript)\n',r['text']);end=r['text'].rfind('\n```')
  if not match or end<match.end():result.append(r);continue
  code=r['text'][match.end():end];parts=semantic_parts(code,language=r['language'])
  if len(parts)<2:result.append(r);continue
  prefix=r['text'][:match.start()];ids=[]
  parent_namespaces=re.findall(r'(?m)^[ \t]*namespace[ \t]+([A-Za-z_][\w.]*)',code) if r['language']=='csharp' else []
  if r['language']=='typescript':parent_namespaces=re.findall(r'\bdeclare module\s+[\x22\x27]([^\x22\x27]+)',code)
  for i,(a,b) in enumerate(parts):
   line_start=code.count('\n',0,a)+1;line_end=code.count('\n',0,b)+1;context=set(parent_namespaces)
   if r['source_type']=='public_cpp_header':
    for t in cpp_types:
     for sid in r['provenance']:
      loc=t.get('location',{}) if sid==t['source_id'] else t.get('alternate_locations',{}).get(sid,{})
      if loc.get('bodystart') and loc.get('bodyend') and int(loc['bodystart'])<=line_start<=int(loc['bodyend']):context.add(t['qualified_name'])
   context_text=('\nEnclosing declaration/namespace context: '+', '.join('`'+v+'`' for v in sorted(context))+'\n') if context else ''
   child=dict(r);child['declaration_context']=sorted(context);child['id']=r['id']+':section:'+str(i+1);child['parent_id']=r['id'];child['sequence']=i+1;child['sequence_count']=len(parts);child['source_char_range']=[a,b];child['source_line_range']=[code.count('\n',0,a)+1,code.count('\n',0,b)+1];child['parent_code_sha256']=digest(code.encode());child['symbol_scope']='parent_document; declarations distributed across ordered semantic sections';child['text']=prefix+context_text+'\n## Source section '+str(i+1)+' of '+str(len(parts))+'\n\nThis is an ordered declaration/member or encoding-map section of the source file named above. Parent document: '+r['id']+'.\n\n```'+r['language']+'\n'+code[a:b]+'\n```';result.append(child);ids.append(child['id'])
  manifest.append({'parent_id':r['id'],'children':ids,'code_sha256':digest(code.encode()),'code_characters':len(code),'provenance':r['provenance'],'boundaries':'complete declarations/members and generated dictionary entries; oversized legacy encoding tables split by encoded leading-byte group. Exact reassembly verified.'})
 jsonl('corpus/canonical.records.jsonl',sorted(result,key=lambda r:r['id']));jsonl('manifest/segmentation.jsonl',manifest);print('Segmented parents',len(manifest),'canonical records',len(result))
if __name__=='__main__':run()
