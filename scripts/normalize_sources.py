from common import *
from normalize import version_risks
import ast,re,tomllib,html
from html_normalize import clean_html
from collections import defaultdict

def guide(text, path=""):

 meta={};changes=[]
 if text.startswith('+++'):
  _,front,text=text.split('+++',2)
  meta=tomllib.loads(front)
 # Remove complete future-version callouts before presentation wrappers are stripped.
 text=re.sub(r'{{<\s*call-out[^}]*Rhino 9[^}]*>}}.*?{{<\s*/call-out\s*>}}','',text,flags=re.S)
 # Explicit source sentence boundaries: preserve Rhino 8 text verbatim.
 if path.endswith('cpp/your-first-plugin-windows/index.md'):
  text=re.sub(r' Rhino 9 plugins require[^\n]+','',text)
 if path.endswith('rhinopython/python-3-in-rhino/index.md'):
  text=re.sub(r'<svg.*?</svg>','',text,flags=re.S)
  text='\n'.join(l for l in text.splitlines() if 'Grasshopper 2' not in l)
 if path.endswith('general/rhino-ui-system/_index.md'):
  text=re.sub(r'{{<\s*call-out[^}]*>}}\s*This section describes the Rhino 8 UI system.*?{{<\s*/call-out\s*>}}','',text,flags=re.S)
  text=re.sub(r'{{<\s*rui-hierarchy\s*>}}', '[RUI hierarchy illustration](https://developer.rhino3d.com/guides/general/rhino-ui-system/)',text)
 # Remove only explicitly version-labelled sections above target; preserve older-version context.
 lines=text.splitlines(keepends=True);out=[];skip=None;fence=False
 for line in lines:
  if line.lstrip().startswith('```'):fence=not fence
  heading=re.match(r'^(#{1,6})\s+(.*)',line) if not fence else None
  if heading:
   depth=len(heading[1])
   if skip is not None and depth<=skip:skip=None
   if re.search(r'(?i)\b(?:Rhino\s*9|Grasshopper\s*2|GH2)\b',heading[2]):skip=depth;changes.append({'removed_section':heading[2],'reason':'future-version section'})
  if skip is None:out.append(line)
 text=''.join(out)
 if path.endswith(('guides/_index.md','scripting/_index.md')):text='\n'.join(l for l in text.splitlines() if not re.search(r'Rhino 9|Grasshopper 2',l))
 # Render known Hugo presentation wrappers while retaining their meaningful contents.
 text=re.sub(r'{{<\s*download-script\s+"([^"]+)"\s+"([^"]+)"\s*>}}',r'[Download official script: \2](https://developer.rhino3d.com/files/\1)',text)
 text=re.sub(r'{{<\s*(?:image|figure)\s+([^}]+)>}}',lambda m:'\n[Illustration: '+m[1].strip()+']\n',text)
 text=re.sub(r'{{<\s*call-out\s+([^}]+)>}}',lambda m:'\n'+m[1].strip()+'\n',text)
 text=re.sub(r'{{[<%]\s*/?(?:mathjax|row|column|div|align|center|call-out|card-gallery|presenter-mode)(?:\s+[^}]*?)?\s*[>%]}}','',text)
 text=re.sub(r'{{[<%]\s*(?:awesome|dev-topic-list|comingsoon-label|new-label|recommended-label)(?:\s+[^}]*?)?\s*[>%]}}','',text)
 text=re.sub(r'{{<\s*latest-rhino-version\s*>}}','8',text)
 text=re.sub(r'{{<\s*(vimeo|youtube)\s+([^}]+)>}}',lambda m:'[Official video reference: '+m[1]+' '+m[2].strip()+']',text)
 text=re.sub(r'{{<\s*alt-version\s+"([^"]+)"\s+"([^"]+)"\s*>}}',r'[\2](\1)',text)
 text=re.sub(r'{{<\s*mailto.*?>}}(.*?){{</\s*mailto\s*>}}',r'\1',text,flags=re.S)
 text=re.sub(r'{{<\s*relref\s+"([^"]+)"\s*>}}',r'\1',text)
 # Anything dynamic or unknown remains pending rather than silently changing its technical meaning.
 text=clean_html(text)
 risks=version_risks(text)
 if re.search(r'{{[<%]',text):risks.append('unresolved Hugo shortcode')
 return meta,text.strip(),changes,risks

def run():
 sources=rows('manifest/sources.jsonl');reviews=readj('config/source_reviews.json');approved=[];decisions=[];py_symbols=[];failures=[]
 for s in sources:
  st=s['source_type'];family=s.get('api_family');rel=s.get('archive_path','');ext=Path(rel).suffix.lower()
  if st not in ('repository_file','python_source'):continue
  content,encoding=decode_source((ROOT/s['cache_path']).read_bytes());language='text';changes=[];risks=[];symbol_ids=[];meta={};decision='included';reason=''
  if st=='python_source':
   family='scripting';language='python2' if 'py27-rh8' in s['id'] else 'python3';rel=s['id'].split(':',1)[1]
   # Local runtime package revision is recorded explicitly; syntax inventory never executes source.
   try:
    tree=ast.parse(content)
    module=rel.replace('/','.')[:-3]
    for node in ast.walk(tree):
     if isinstance(node,(ast.FunctionDef,ast.AsyncFunctionDef,ast.ClassDef)):
      sid='python|'+module+':'+str(node.lineno)+':'+node.name;symbol_ids.append(sid)
      py_symbols.append({'id':sid,'api_family':'scripting','name':node.name,'kind':'class' if isinstance(node,ast.ClassDef) else 'function','module':module,'source_id':s['id'],'line':node.lineno,'end_line':node.end_lineno,'signature':ast.get_source_segment(content,node).splitlines()[0],'documented':bool(ast.get_docstring(node))})
   except SyntaxError as e:
    if language=='python3':risks.append('Python 3 syntax error: '+str(e))
    else:meta['syntax_validation']='Python 2 source; Python 3 AST incompatible: '+str(e)
   text='# '+rel+'\n\nAPI family: Rhino scripting convenience/context libraries\nLanguage: '+language+'\n\n```python\n'+content+'\n```'
  elif family=='guides' and ext in ('.cs','.py','.cpp','.h','.vb','.js'):
   family='samples';language={'.cs':'csharp','.py':'python','.cpp':'cpp','.h':'cpp','.vb':'vbnet','.js':'javascript'}[ext]
   text='# Official developer-guide source: '+rel+'\n\nAPI context: Rhino / Grasshopper scripting guide attachment\n\n```'+language+'\n'+content+'\n```';risks=version_risks(content)
  elif family=='guides':
   if not rel.startswith(('content/en/guides/','content/en/samples/','content/en/api/')) or ext!='.md':
    decision='excluded';reason='site metadata, non-guide content, or asset; retained in archive';text=''
   elif '/grasshopper2/' in rel:
    decision='excluded';reason='Grasshopper 2 is outside Rhino 8 / GH1 production target';text=''
   else:
    try:meta,text,changes,risks=guide(content,rel)
    except Exception as e:decision='pending';reason='frontmatter/markup parse: '+str(e);text='';failures.append({'source_id':s['id'],'error':reason})
    since=meta.get('included_in',{}).get('since',0)
    if isinstance(since,(int,float)) and since>8:decision='excluded';reason='explicit version since >8'
    if not text and decision=='included':decision='excluded';reason='empty guide/index placeholder, no technical content'
    title=meta.get('title') or rel
    context=rel.split('/')[3] if rel.startswith('content/en/guides/') else 'rhino3dm' if rel.endswith('rhino3dm.md') else 'developer guides'
    context={'rhinoscript':'RhinoScript VBScript / COM (Windows), not RhinoCommon','rhinopython':'Rhino Python and rhinoscriptsyntax convenience API','grasshopper':'Grasshopper 1 .NET SDK','rhinocommon':'RhinoCommon .NET','cpp':'native Rhino C++ SDK','opennurbs':'openNURBS C++','eto':'Eto UI in Rhino'}.get(context,context)
    text='# '+title+'\n\nAPI context: '+context+'\n\n'+text if text else ''
    language='technical_prose'
  elif family=='samples':
   language={'.cs':'csharp','.py':'python','.cpp':'cpp','.h':'cpp','.vb':'vbnet','.js':'javascript','.ts':'typescript','.md':'technical_prose','.xaml':'xml'}.get(ext,'text')
   if ext not in ('.cs','.py','.cpp','.h','.vb','.js','.ts','.md','.xaml'):
    decision='excluded';reason='build/dependency metadata retained as provenance, not standalone training document';text=''
   elif any(x in Path(rel).parts for x in ('packages','node_modules','obj','bin')) or re.search(r'(?i)(jquery|three\.min|\.designer\.cs$)',rel):
    decision='excluded';reason='vendored/generated dependency or generated UI resource code; retain archive';text=''
   elif re.fullmatch(r"\s*(?:let|const|var)\s+\w+\s*=\s*['\"]data:image/[^;]+;base64,[A-Za-z0-9+/=]+['\"];?\s*",content):
    decision='excluded';reason='embedded image asset, not API or example logic; exact PNG data retained in archive';text=''
   else:
    text='# Official Rhino 8 sample: '+rel+'\n\nSource family: '+Path(rel).parts[0]+'\nLanguage: '+language+'\n\n'+(content if ext=='.md' else '```'+language+'\n'+content+'\n```');risks=version_risks(content)
  elif family=='opennurbs':
   # All public root source and official examples; dependencies are separately inventoried.
   parts=Path(rel).parts
   if len(parts)==1 and ext in ('.cpp','.c') or parts[0].startswith('example_') and ext in ('.cpp','.h','.md','.txt') or rel in ('README.md','examples.h','examples_linking_pragmas.h'):
    language='cpp' if ext in ('.cpp','.c','.h') else 'technical_prose';text='# openNURBS 8.35: '+rel+'\n\nAPI family: openNURBS C++\nSource role: implementation/example (not a RhinoCommon signature)\n\n'+('```cpp\n'+content+'\n```' if language=='cpp' else content)
   else:decision='excluded';reason='public headers represented by dedicated header pipeline; third-party dependency/build metadata retained in archive';text=''
  else:continue
  if risks and decision=='included':decision='pending';reason='requires exact version/markup review: '+', '.join(risks)
  if s['id'] in reviews:
   review=reviews[s['id']];decision=review['status'];reason=review['reason'];meta['source_review']=review
  if decision=='included':
   approved.append({'id':'canonical:source:'+digest(s['id'].encode()),'api_family':family,'source_type':'guide' if family=='guides' else 'sample' if family=='samples' else 'source_code','version':s['version'],'language':language,'source_encoding':encoding,'symbols':symbol_ids,'provenance':[s['id']],'source_metadata':meta,'transformations':changes,'text':text,'version_validation':'installed Rhino 8 runtime source' if st=='python_source' else 'pinned Rhino 8 branch' if family in ('samples','opennurbs') else 'official source; since metadata <=8 and explicit future-version sections removed; deeper API usage validation pending','status':'canonical'})
  decisions.append({'source_id':s['id'],'family':family,'path':rel,'status':decision,'reason':reason,'transformations':changes,'version_risks':risks})
 jsonl('normalized/approved_source.records.jsonl',sorted(approved,key=lambda x:x['id']));jsonl('manifest/source_decisions.jsonl',decisions);jsonl('manifest/python_symbols.jsonl',py_symbols);jsonl('manifest/source_parsing_failures.jsonl',failures)
 from collections import Counter
 print('Source decisions',Counter(x['status'] for x in decisions),'approved',len(approved),'Python symbols',len(py_symbols))
if __name__=='__main__':run()
