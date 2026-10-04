from common import *
import subprocess, xml.etree.ElementTree as ET, re

def run():
 sources={s['id']:s for s in rows('manifest/sources.jsonl')};out=[];cpp=[];reports=[]
 roots=[('opennurbs',next((ROOT/'sources/extracted/opennurbs-8').iterdir())),('rhino_cpp_sdk',ROOT/'sources/extracted/native_headers')]
 for family,base in roots:
  outdir=ROOT/'normalized'/family/'doxygen';outdir.mkdir(parents=True,exist_ok=True)
  headers=[];mapping={}
  for f in sorted(base.iterdir()):
   if f.suffix.lower() not in ('.h','.hpp'):continue
   # Native MSI includes openNURBS headers too. Keep native snapshot as version authority,
   # but identify ON headers as openNURBS rather than mislabeling the API.
   actual='opennurbs' if 'opennurbs' in f.name.lower() else family
   if family=='opennurbs' and not f.name.startswith(('opennurbs','examples')):continue
   h,c=cache(f);sid=family+':header:'+f.name
   sources.setdefault(sid,{'id':sid,'source_location':str(f.relative_to(ROOT)),'upstream_location':'https://files.mcneel.com/dujour/exe/202609/rh835sdk_8.35.26251.13001.msi' if family=='rhino_cpp_sdk' else 'https://github.com/mcneel/opennurbs/tree/eb92af3ba1806b0a34a99aba0d3bda83e3d46083','cache_path':c,'sha256':h,'retrieved_at':stamp(),'version':'8.35.26251.13001','owner':'Robert McNeel & Associates','source_type':'cpp_header','api_family':actual,'redistribution_reviewed':False})
   stage=outdir/'utf8_headers'/f.name;stage.parent.mkdir(exist_ok=True);stage.write_text(decode_source(f.read_bytes())[0],encoding='utf-8');mapping[str(stage)]=sid;mapping[f.name]=sid;headers.append(stage)
  profiles=[('generic_audit',''),('windows_x64','ON_RUNTIME_WIN=1 _WIN32=1 _WIN64=1 _MSC_VER=1930 RHINO_SDK_MFC=1'),('macos_arm64','ON_RUNTIME_APPLE=1 __APPLE__=1 __MACH__=1 __arm64__=1 __aarch64__=1 __clang__=1')]
  if family=='opennurbs':profiles.append(('linux_x64_opennurbs','ON_RUNTIME_LINUX=1 __linux__=1 __x86_64__=1'))
  for profile,definitions in profiles:
   profiledir=outdir/profile;profiledir.mkdir(exist_ok=True)
   config='\n'.join(['PROJECT_NAME = "'+family+' Rhino 8 SR35"','OUTPUT_DIRECTORY = "'+str(profiledir)+'"','INCLUDE_PATH = "'+str(outdir/'utf8_headers')+'"','INPUT = '+' '.join('"'+str(f)+'"' for f in headers),'FILE_PATTERNS = *.h *.hpp','EXTRACT_ALL = YES','EXTRACT_PRIVATE = NO','EXTRACT_STATIC = YES','EXTRACT_LOCAL_CLASSES = NO','HIDE_UNDOC_MEMBERS = NO','HIDE_UNDOC_CLASSES = NO','ENABLE_PREPROCESSING = YES','MACRO_EXPANSION = YES','EXPAND_ONLY_PREDEF = YES','PREDEFINED = ON_DECL= ON_CLASS= RHINO_SDK_CLASS= RHINO_SDK_FUNCTION= RHINO_SDK_DATA= RHRDK_SDK= RHRDK_SDK_CLASS= RHINO_SDK_TEMPLATE= ON_DEPRECATED(x)= RHINO_DEPRECATED(x)= '+definitions,'GENERATE_HTML = NO','GENERATE_LATEX = NO','GENERATE_XML = YES','XML_PROGRAMLISTING = YES','JAVADOC_AUTOBRIEF = YES','JAVADOC_BANNER = YES','QUIET = YES','WARN_IF_UNDOCUMENTED = NO','WARN_LOGFILE = "'+str(profiledir/'warnings.log')+'"'])+'\n'
   cp=outdir/(profile+'.Doxyfile');cp.write_text(config)
   subprocess.run(['doxygen',str(cp)],check=True,cwd=ROOT)
   for f in sorted((profiledir/'xml').glob('*.xml')):
    if f.name=='index.xml':continue
    try:tree=ET.parse(f)
    except ET.ParseError as e:reports.append({'family':family,'path':str(f),'error':str(e)});continue
    for d in tree.findall('compounddef'):
     if d.get('kind') not in ('class','struct','union','namespace','file') or d.get('prot')=='private':continue
     loc=d.find('location');file=loc.get('file') if loc is not None else '';sid=mapping.get(file) or mapping.get(Path(file).name)
     if not sid:continue
     if d.get('kind')!='file':
      name=d.findtext('compoundname');symbol={'id':family+'|'+d.get('id'),'api_family':sources[sid]['api_family'],'name':name,'qualified_name':name,'kind':d.get('kind'),'source_id':sid,'location':dict(loc.attrib),'visibility':d.get('prot'),'base_types':[{'name':x.text,**x.attrib} for x in d.findall('basecompoundref')],'doxygen_id':d.get('id'),'profiles':[profile]};cpp.append(symbol)
     for m in d.findall('sectiondef/memberdef'):
      if m.get('prot')=='private':continue
      ml=m.find('location');mf=ml.get('file',file) if ml is not None else file;msid=mapping.get(mf) or mapping.get(Path(mf).name) or sid
      name=m.findtext('qualifiedname') or m.findtext('definition') or m.findtext('name');signature=(m.findtext('definition') or m.findtext('name') or '')+''.join(m.find('argsstring').itertext()) if m.find('argsstring') is not None else name
      symbol={'id':family+'|'+m.get('id'),'api_family':sources[msid]['api_family'],'name':m.findtext('name'),'qualified_name':name,'kind':m.get('kind'),'signature':signature,'source_id':msid,'location':dict(ml.attrib) if ml is not None else {},'visibility':m.get('prot'),'profiles':[profile],'parameters':[ET.tostring(p,encoding='unicode') for p in m.findall('param')],'enum_values':[{'name':v.findtext('name'),'initializer':v.findtext('initializer'),'id':family+'|'+v.get('id')} for v in m.findall('enumvalue')],'documentation_xml':''.join(ET.tostring(m.find(k),encoding='unicode') for k in ('briefdescription','detaileddescription') if m.find(k) is not None)};cpp.append(symbol)
  jsonl('manifest/sources.jsonl',[sources[k] for k in sorted(sources)])
 # Deduplicate Doxygen group/file re-emission by stable reference ID.
 expanded=[]
 for s in cpp:
  s['id']=s['api_family']+'|'+s['id'].split('|',1)[1]
  if 'file' in s.get('location',{}):s['location']['file']=Path(s['location']['file']).name
  expanded.append(s)
  for v in s.get('enum_values',[]):
   vid=s['api_family']+'|'+v['id'].split('|',1)[1];v['id']=vid
   expanded.append({'id':vid,'api_family':s['api_family'],'name':v['name'],'qualified_name':s['qualified_name']+'::'+v['name'],'kind':'enum_value','signature':v['name']+(' = '+v['initializer'] if v['initializer'] else ''),'source_id':s['source_id'],'location':s['location'],'visibility':s['visibility'],'parent_id':s['id'],'profiles':s['profiles']})
 # Anonymous Doxygen identifiers vary with preprocessing even for the same
 # exact declaration. Reconcile only identical source coordinates/signatures.
 aliases={};coordinates={}
 for s in expanded:
  loc=s.get('location',{})
  key=(s['api_family'],loc.get('file'),loc.get('line'),s['kind'],s.get('qualified_name'),s.get('signature'),s.get('visibility'))
  if key in coordinates:aliases[s['id']]=coordinates[key]
  else:coordinates[key]=s['id']
 for s in expanded:
  s['id']=aliases.get(s['id'],s['id'])
  if 'parent_id' in s:s['parent_id']=aliases.get(s['parent_id'],s['parent_id'])
  for v in s.get('enum_values',[]):v['id']=aliases.get(v['id'],v['id'])
 jsonwrite('manifest/cpp_profile_id_aliases.json',aliases)
 unique={}
 for s in expanded:
  if s['id'] in unique:
   old=unique[s['id']];old['profiles']=sorted(set(old['profiles']+s['profiles']))
   if old['source_id']!=s['source_id']:
    old['alternate_sources']=sorted(set(old.get('alternate_sources',[])+[s['source_id']]));old.setdefault('alternate_locations',{})[s['source_id']]=s.get('location',{})
   differences={k:s.get(k) for k in ('signature','base_types','parameters','visibility','documentation_xml') if s.get(k)!=old.get(k)}
   if differences:
    variant={'profiles':s['profiles'],'source_id':s['source_id'],'differences':differences}
    if variant not in old.setdefault('profile_variants',[]):old['profile_variants'].append(variant)
  else:unique[s['id']]=s
 cpp=[unique[k] for k in sorted(unique)]
 for s in cpp:s['profile_status']='generic-only; platform availability requires review' if s['profiles']==['generic_audit'] else 'observed in explicit supported platform preprocessing profile'
 jsonwrite('reports/cpp_platform_audit.json',{'profiles':['generic_audit','windows_x64','macos_arm64','linux_x64_opennurbs'],'counts':{p:sum(p in s['profiles'] for s in cpp) for p in ['generic_audit','windows_x64','macos_arm64','linux_x64_opennurbs']},'generic_only':sum(s['profiles']==['generic_audit'] for s in cpp),'method':'Doxygen with explicit platform macros and staged include paths; complete shipped headers retained; this is not a native compiler ABI proof'})
 jsonl('manifest/cpp_symbols.jsonl',cpp);jsonl('manifest/cpp_parsing_failures.jsonl',reports)
 bysource={}
 for s in cpp:
  for source_id in [s['source_id']]+s.get('alternate_sources',[]):bysource.setdefault(source_id,[]).append(s['id'])
 for sid,s in sorted(sources.items()):
  if s['source_type']!='cpp_header':continue
  content,encoding=decode_source((ROOT/s['cache_path']).read_bytes())
  out.append({'id':'canonical:cpp_header:'+digest(sid.encode()),'api_family':s['api_family'],'source_type':'public_cpp_header','version':s['version'],'language':'cpp','source_encoding':encoding,'symbols':sorted(bysource.get(sid,[])),'provenance':[sid],'text':'# '+sid.split(':header:')[1]+'\n\nAPI family: '+s['api_family']+'\nVersion: '+s['version']+'\n\n```cpp\n'+content+'\n```','version_validation':'Rhino 8.35 SDK release header snapshot','status':'canonical'})
 jsonl('normalized/cpp.records.jsonl',out)
 print('C++ symbols',len(cpp),'header records',len(out),'failures',len(reports))
if __name__=='__main__':run()
