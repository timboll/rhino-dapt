"""Render technical Jekyll references without executing downloaded templates."""
import re,json
from common import ROOT
BASE='https://www.rhino3d.com/inside/revit'
def render(text,sources):
 components=json.loads((ROOT/sources['docs/_data/components.json']['cache_path']).read_text())
 config=(ROOT/sources['docs/_config.yml']['cache_path']).read_text();values={};stack=[]
 for line in config.splitlines():
  m=re.match(r'^( *)([A-Za-z_][\w]*):\s*(.*?)\s*$',line)
  if not m:continue
  indent=len(m[1]);key=m[2];value=m[3]
  while stack and stack[-1][0]>=indent:stack.pop()
  path='.'.join([x[1] for x in stack]+[key])
  if not value:stack.append((indent,key))
  else:values['site.'+path]=value.split(' #')[0].strip('"\'')
 values['site.baseurl']=BASE
 def variable(m):
  val=m[1].strip();parts=[x.strip() for x in val.split('|')];base=values.get(parts[0],parts[0].strip('"\''))
  for f in parts[1:]:
   if f.startswith('prepend:'):base=values.get(f.split(':',1)[1].strip(),'')+base
  return base
 text=re.sub(r'{{(.*?)}}',variable,text)
 def include(m):
  template=m[1];args=m[2];kv={k:v for k,q,v in re.findall(r'(\w+)\s*=\s*([\'\"])(.*?)\2',args)}
  if template=='ltr/comp.html':
   matches=[c for c in components if kv.get('uuid','!') in c['uuid']]
   if len(matches)!=1:return '[Component reference '+kv.get('uuid','')+']'
   c=matches[0];return '**'+c['title']+'**'+(': '+c['desc'] if 'extended=true' in args else '')+(' (since '+c['since']+')' if c.get('since') else '')+(' (removed '+c['until']+')' if c.get('until') else '')
  if 'youtube' in template or 'vimeo' in template:return '[Official video: '+('https://youtu.be/' if 'youtube' in template else 'https://vimeo.com/')+kv.get('id','')+']'
  if template in ('api_type.html','rir_api_type.html','rir_api_root.html'):return '`'+(' / '.join(kv.values()) or 'RhinoInside.Revit')+'`'
  if template in ('ltr/comp_table.html','ltr/button_table.html'):return '[Complete component/button reference retained in associated authoritative component catalog]'
  # Quoted reference, keyboard, link and download parameters contain technical
  # content. Captured note bodies remain at their original positions.
  return ('['+template.replace('ltr/','').replace('.html','').replace('_',' ') + ': '+ '; '.join(k+'='+v for k,v in kv.items())+']') if kv else ''
 text=re.sub(r'{%\s*include\s+(\S+)\s*(.*?)%}',include,text,flags=re.S)
 text=re.sub(r'{%\s*highlight\s+(\w+)\s*%}',lambda m:'```'+m[1]+'\n',text);text=re.sub(r'{%\s*endhighlight\s*%}','\n```',text)
 text=re.sub(r'{%\s*link\s+_en/1.0/([^%]+?)\s*%}',lambda m:'/1.0/'+m[1].removesuffix('.md'),text)
 text=re.sub(r'{%\s*(?:capture|endcapture|assign|if|endif|else|elsif|for|endfor)\b[^%]*%}','',text)
 text=re.sub(r'<!--.*?-->','',text,flags=re.S)
 return text
