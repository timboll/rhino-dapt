"""Lossless technical normalization helpers. No prose summarization."""
import re, xml.etree.ElementTree as ET, json

def xml_text(e):
 if e is None:return ''
 if e.tag in ('see','seealso','paramref','typeparamref'):
  label=e.attrib.get('cref') or e.attrib.get('name') or e.attrib.get('href','')
  return '`'+label+'`'+(e.text or '')+''.join(xml_text(c)+(c.tail or '') for c in e)
 if e.tag=='code':return '\n\n```'+e.attrib.get('language','')+'\n'+''.join(e.itertext()).strip('\n')+'\n```\n\n'
 if e.tag=='c':return '`'+''.join(e.itertext())+'`'
 result=e.text or ''
 for c in e:result+=xml_text(c)+(c.tail or '')
 if e.tag in ('para','p','item','description','term','listheader','list'):return '\n'+result.strip()+'\n'
 if e.tag in ('br',):return '\n'
 if e.tag=='inheritdoc':return '\nDocumentation inheritance reference: '+json.dumps(e.attrib,sort_keys=True)+'\n'
 return result

def normalize_xml(e):
 sections=[]
 for c in e:
  title={'summary':'Description','param':'Parameter','typeparam':'Type parameter','returns':'Returns','remarks':'Remarks','exception':'Exception','value':'Value','example':'Official example','since':'Available since','seealso':'Related member','inheritdoc':'Inherited documentation'}.get(c.tag,c.tag)
  if c.attrib:title+=' — '+', '.join(k+'='+v for k,v in c.attrib.items())
  text=xml_text(c)
  if c.tag!='code':
   # Indentation is formatting; code blocks above remain intact.
   text=text.strip()
  sections.append('## '+title+'\n\n'+text)
 return '\n\n'.join(sections)

def version_risks(text):
 return sorted(set(m.group(0) for m in re.finditer(r'(?i)\b(?:Rhino\s*9(?:\.\d+)?|Grasshopper\s*2|GH2|WIP|work.in.progress)\b',text)))

def metadata_text(s):
 lines=['# '+s['doc_id'][2:],'API family: '+s['api_family'],'Assembly: '+s['assembly'],'Assembly version: '+s['assembly_version'],'Assembly variant: '+('net48 reference shipped with target installation' if '/ref/' in s['source_id'] else 'official standalone SDK release' if s['source_id'].startswith('nuget:') else 'installed runtime assembly'),'Namespace: '+s['namespace'],'Declaring type: '+s['declaring_type'],'Kind: '+s['kind'],'## Signature','```text\n'+s['signature']+'\n```']
 for k in ('visibility','base_type','interfaces','generic_parameters','parameters','return_type','return_attributes','type','has_constant','constant','get','set','overrides','custom_attributes'):
  if k in s and s[k] not in ([],None):lines+=['## '+k.replace('_',' ').title(),json.dumps(s[k],ensure_ascii=False,sort_keys=True,indent=2)]
 return '\n\n'.join(lines)

def xml_richness(e):
 """Separate actual explanatory content from presence of XML/availability metadata."""
 prose=[c for c in e if c.tag not in ('since','inheritdoc','seealso','see') and xml_text(c).strip()]
 if prose:return 'semantic_content'
 if e.find('inheritdoc') is not None:return 'inheritance_reference_only'
 if any(xml_text(c).strip() for c in e):return 'reference_or_availability_only'
 return 'empty_xml'
