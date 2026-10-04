"""Additional versioned SDK declarations and complete official COM reference."""
from common import *
from html.parser import HTMLParser
from html_normalize import clean_html
from normalize import version_risks
import re,ast,subprocess

class ReferenceHTML(HTMLParser):
 def __init__(self):super().__init__(convert_charrefs=True);self.out=[];self.body=False;self.skip=0;self.code=False;self.links=[];self.title=False;self.title_text=[]
 def handle_starttag(self,t,a):
  a=dict(a)
  if t=='body':self.body=True
  if not self.body:return
  if t in ('script','style'):self.skip+=1;return
  if self.skip:return
  if t in ('h1','h2','h3','h4'):self.out.append('\n\n'+'#'*int(t[1])+' ')
  elif t=='p':
   self.code=a.get('class','').lower().startswith('code');self.out.append('\n```vbscript\n' if self.code else '\n')
  elif t in ('td','th'):self.out.append(' | ')
  elif t in ('br','tr','li','div'):self.out.append('\n')
  elif t=='a':self.links.append(a.get('href',''));self.out.append('[')
  elif t=='img':self.out.append('[Illustration: '+a.get('alt','')+']('+a.get('src','')+')')
  if t=='h1':self.title=True
 def handle_endtag(self,t):
  if not self.body:return
  if t in ('script','style'):self.skip=max(0,self.skip-1);return
  if self.skip:return
  if t=='a' and self.links:self.out.append(']('+self.links.pop()+')')
  elif t=='p':self.out.append('\n```\n' if self.code else '\n');self.code=False
  elif t in ('h1','h2','h3','h4','tr'):self.out.append('\n')
  if t=='h1':self.title=False
 def handle_data(self,d):
  if self.body and not self.skip:
   self.out.append(d)
   if self.title:self.title_text.append(d)

def run():
 sources=rows('manifest/sources.jsonl');records=[];decisions=[];symbols=[];failures=[];tsinputs=[]
 for s in sources:
  if s['source_type'] not in ('ecosystem_file','rhinoscript_reference'):continue
  content,enc=decode_source((ROOT/s['cache_path']).read_bytes());family=s['api_family'];rel=s.get('archive_path',s.get('reference_path'));ext=Path(rel).suffix.lower();reason='';status='included';lang='technical_prose';ids=[]
  if s['source_type']=='rhinoscript_reference':
   p=ReferenceHTML();p.feed(content);text=''.join(p.out).replace('\xa0',' ');title=''.join(p.title_text).strip()
   section=re.search(r'(?s)### Syntax\s*(.*?)(?=\n###|\Z)',text)
   signatures=re.findall(r'```vbscript\n(.*?)\n```',section[1],re.S) if section else []
   for i,signature in enumerate(signatures):
    sid='rhinoscript_vb|'+rel+'|'+str(i);ids.append(sid);symbols.append({'id':sid,'api_family':family,'name':title,'namespace':rel.split('/')[0],'kind':'COM method or property signature','source_id':s['id'],'signature':signature,'documented':True,'reference_version':s['version'],'target_validation':'legacy official reference; Windows COM binary validation unavailable on this macOS target'})
   text=re.sub(r'\n```\s*\n```vbscript\n','\n',text)
   text='API family: RhinoScript VBScript / COM (Windows). These Rhino.* names are not RhinoCommon .NET methods.\nReference version: '+s['version']+'\n\n'+text.strip()
  else:
   selected=False
   if family=='rhino3dm':
    selected=rel in ('README.md','src/rhino3dm/__init__.pyi','src/js/rhino3dm.d.ts') or rel.startswith(('docs/python/','docs/javascript/','docs/dotnet/','src/bindings/')) and '/api/' not in rel and ext in ('.md','.py','.js','.ts','.h','.cpp','.cs') or rel.startswith('docs/python/api/_sources/') and rel.endswith('.rst.txt')
    reason='managed shared implementation may include conditional RhinoCommon-only APIs; released assembly/XML and Python/JS declarations inventoried separately. Generated API HTML mirrors retained Python reStructuredText/TypeScript JSDoc. Search scripts, site assets, build/test assets, preview release history and third-party dependencies remain raw'
   elif family=='compute':
    selected=rel.startswith('src/') and ext in ('.cs','.py') or rel=='README.md'
    reason='build/package metadata or media retained in pinned archive'
   elif family=='compute_python':selected=(rel.startswith('compute_rhino3d/') and ext=='.py') or rel=='README.md';reason='packaging metadata retained in archive'
   elif family=='compute_javascript':selected=rel=='compute.rhino3d.js' or rel=='README.md' or rel.startswith('docs/') and ext=='.rst';reason='packaging metadata retained in archive'
   if not selected:status='excluded';text=''
   else:
    lang={'.py':'python','.pyi':'python','.js':'javascript','.ts':'typescript','.cs':'csharp','.h':'cpp','.cpp':'cpp'}.get(ext,'technical_prose')
    text='# '+rel+'\n\nAPI family: '+family+'\nRelease: '+s['version']+'\n\n'+(content if lang=='technical_prose' else '```'+lang+'\n'+content+'\n```');reason='pinned official released declarations/source or Rhino8 service branch'
    if ext in ('.py','.pyi'):
     try:
      tree=ast.parse(content)
      def walk(body,parents):
       for n in body:
        if isinstance(n,(ast.ClassDef,ast.FunctionDef,ast.AsyncFunctionDef)):
         name='.'.join(parents+[n.name]);sid='sourceapi|'+s['id']+'|'+name+'|'+str(n.lineno);ids.append(sid)
         symbols.append({'id':sid,'api_family':family,'source_id':s['id'],'name':n.name,'qualified_name':name,'namespace':rel,'kind':type(n).__name__,'line':n.lineno,'end_line':n.end_lineno,'signature':ast.get_source_segment(content,n).splitlines()[0],'documented':bool(ast.get_docstring(n)),'inventory_method':'Python AST, separate overload lines retained'})
         if isinstance(n,ast.ClassDef):walk(n.body,parents+[n.name])
        elif isinstance(n,(ast.Assign,ast.AnnAssign)):
         targets=n.targets if isinstance(n,ast.Assign) else [n.target]
         for target in targets:
          if isinstance(target,ast.Name):
           sid='sourceapi|'+s['id']+'|'+'.'.join(parents+[target.id])+'|'+str(n.lineno);ids.append(sid);symbols.append({'id':sid,'api_family':family,'source_id':s['id'],'name':target.id,'namespace':rel,'kind':'field','line':n.lineno,'signature':ast.get_source_segment(content,n),'documented':False})
      walk(tree.body,[])
     except SyntaxError as e:failures.append({'source_id':s['id'],'error':str(e)});status='pending';reason='Python grammar failure'
    if rel.endswith('.d.ts') or family=='compute_javascript' and rel=='compute.rhino3d.js':tsinputs.append(s)
  risks=version_risks(text)
  # Historical library-development "WIP" wording is not an API version; numeric future products remain quarantined.
  if any(re.search(r'(?i)Rhino\s*9|Grasshopper\s*2|GH2',x) for x in risks):
   if family=='compute' and rel=='src/hops/IconPanel.cs':reason='Rhino8 branch implementation; comment identifies the historical source of a UI painting pattern in a differently named internal repository, not a required Rhino9 API'
   else:status='pending';reason='explicit future-version marker requires source-specific review'
  decisions.append({'source_id':s['id'],'family':family,'path':rel,'status':status,'reason':reason,'version_risks':risks})
  if status=='included':records.append({'id':'canonical:ecosystem:'+digest(s['id'].encode()),'api_family':family,'source_type':'com_reference' if s['source_type']=='rhinoscript_reference' else 'source_code' if lang!='technical_prose' else 'guide','version':s['version'],'language':lang,'source_encoding':enc,'symbols':ids,'provenance':[s['id']],'text':text,'status':'canonical','version_validation':'separate versioned SDK source; not an installed RhinoCommon declaration'})
 jsonwrite('manifest/typescript_inputs.json',tsinputs)
 subprocess.run(['node','scripts/inventory_typescript.cjs','manifest/typescript_inputs.json','manifest/typescript_symbols.jsonl'],cwd=ROOT,check=True)
 more=rows('manifest/typescript_symbols.jsonl')+rows('manifest/compute_csharp_symbols.jsonl');symbols.extend(more)
 for r in records:r['symbols']+=sorted(s['id'] for s in more if s['source_id'] in r['provenance'])
 admitted={p for r in records for p in r['provenance']};symbols=[s for s in symbols if s['source_id'] in admitted]
 jsonl('normalized/ecosystem.records.jsonl',sorted(records,key=lambda r:r['id']));jsonl('manifest/ecosystem_symbols.jsonl',sorted(symbols,key=lambda s:s['id']));jsonl('manifest/ecosystem_decisions.jsonl',decisions);jsonl('manifest/ecosystem_parsing_failures.jsonl',failures)
 from collections import Counter
 print('Additional ecosystem records',len(records),'symbols',len(symbols),'decisions',dict(Counter(d['status'] for d in decisions)))
if __name__=='__main__':run()
