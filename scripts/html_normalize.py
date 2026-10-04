from html.parser import HTMLParser
import re
class SemanticHTML(HTMLParser):
 def __init__(self):super().__init__(convert_charrefs=True);self.out=[];self.skip=0;self.links=[]
 def handle_starttag(self,tag,attrs):
  a=dict(attrs)
  if tag in ('style','script'):self.skip+=1;return
  if self.skip:return
  if tag=='a':self.out.append('[');self.links.append(a.get('href',''))
  elif tag=='img':self.out.append('[Image: '+a.get('alt','')+']('+a.get('src','')+')')
  elif tag in ('code','kbd'):self.out.append('`')
  elif tag=='pre':self.out.append('\n```\n')
  elif tag in ('b','strong'):self.out.append('**')
  elif tag in ('i','em'):self.out.append('*')
  elif tag in ('td','th'):self.out.append(' | ')
  elif tag in ('p','div','tr','br','section','li','h1','h2','h3','h4'):self.out.append('\n')
  if 'aria-label' in a and tag=='svg':self.out.append('\nIllustration: '+a['aria-label']+'\n')
 def handle_endtag(self,tag):
  if tag in ('style','script'):self.skip=max(0,self.skip-1);return
  if self.skip:return
  if tag=='a' and self.links:self.out.append(']('+self.links.pop()+')')
  elif tag in ('code','kbd'):self.out.append('`')
  elif tag=='pre':self.out.append('\n```\n')
  elif tag in ('b','strong'):self.out.append('**')
  elif tag in ('i','em'):self.out.append('*')
  elif tag in ('p','div','tr','section','li','h1','h2','h3','h4'):self.out.append('\n')
 def handle_data(self,data):
  if not self.skip:self.out.append(data)
def clean_html(text):
 # Protect fenced code and inline code from interpreting generic types or literal markup.
 parts=re.split(r'(```[^\n]*\n.*?```|`[^`\n]+`)',text,flags=re.S)
 for i,p in enumerate(parts):
  if i%2:continue
  parser=SemanticHTML();parser.feed(p);parts[i]=''.join(parser.out)
 return ''.join(parts)
