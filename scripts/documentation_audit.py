from common import *
from collections import defaultdict,Counter
import xml.etree.ElementTree as ET,zipfile
from normalize import normalize_xml

def run():
 sources={s['id']:s for s in rows('manifest/sources.jsonl')};symbols=rows('manifest/symbols.jsonl');byid={s['id']:s for s in symbols};counts=defaultdict(Counter);xml={};links=[]
 for s in symbols:counts[s['assembly']]['structural_symbols']+=1
 for r in rows('corpus/canonical.records.jsonl'):
  for link in r.get('documentation_links',[]):
   sid=link['source_id']
   if sid not in xml:xml[sid]={e.get('name'):e for e in ET.fromstring((ROOT/sources[sid]['cache_path']).read_bytes()).findall('./members/member')}
   text=normalize_xml(xml[sid][link['xml_doc_id']]);assert text in r['text'],link
   a=byid[link['symbol_id']]['assembly'];counts[a]['xml_attached']+=1;counts[a][link['richness']]+=1;links.append({**link,'record_id':r['id'],'normalized_xml_sha256':digest(text.encode()),'exact_normalized_text_attached':True})
 for a,c in counts.items():c['no_xml_attached']=c['structural_symbols']-c['xml_attached']
 jsonwrite('reports/documentation_richness.json',{a:dict(c) for a,c in sorted(counts.items())});jsonl('manifest/documentation_attachment_audit.jsonl',links)
 ui={s['declaring_type'] for s in symbols if s['assembly']=='Rhino.UI' and s['kind'] in ('class','struct','interface','enum','delegate')};web=readj('sources/snapshots/rhinocommon-api_info.json');webnames={x.get('namespace','')+'.'+x['name'] for x in web if x.get('dataType')!='namespace'};matched=sorted(ui&webnames)
 control={s['declaring_type'] for s in symbols if s['assembly']=='RhinoCommon' and s['kind'] in ('class','struct','interface','enum','delegate')}
 assert len(control&webnames)>1000,'Web comparison must use qualified names and match known RhinoCommon types'
 packages={}
 for name in ['rhinocommon.8.35.26251.13001.nupkg','rhinowindows.8.35.26251.13001.nupkg']:
  with zipfile.ZipFile(ROOT/'sources/snapshots'/name) as z:packages[name]=[n for n in z.namelist() if n.endswith(('.dll','.xml'))]
 installed=[s['source_location'] for s in sources.values() if s['id'].startswith('local:') and 'rhino.ui' in s['source_location'].lower()]
 guide_evidence=[]
 for r in rows('corpus/canonical.records.jsonl'):
  if r['source_type'] in ('guide','source_code','sample') and any(term in r['text'] for term in ['Rhino.UI.dll','Rhino.UI.EtoExtensions','Rhino.UI.Controls']):guide_evidence.append({'record_id':r['id'],'provenance':r['provenance']})
 audit={'target':'8.35.26251.13002','installed_ui_sources':installed,'official_package_contents':packages,'website_api_entry_count':len(web),'rhino_ui_types_in_target':len(ui),'rhino_ui_exact_type_matches_in_web_dataset':matched,'control_rhinocommon_type_matches':len(control&webnames),'guide_and_example_records':guide_evidence,'conclusion':'No separate Rhino.UI XML reference located in inspected exact installed distribution or matching official NuGet packages; cached public RhinoCommon web type dataset has no exact Rhino.UI.dll type matches. Official guides/examples provide selected UI usage, not a complete member reference. This is evidence of the inspected sources, not a claim that unpublished or unsearched McNeel material cannot exist.'}
 jsonwrite('reports/rhino_ui_documentation_audit.json',audit)
 lines=['# Documentation richness and attachment audit','', 'Structural representation and semantic documentation are separate measurements. Every XML link below was verified by locating its exact normalized XML text inside the corresponding canonical API record. Empty XML, inheritance-only links, and availability/reference-only metadata are not counted as explanatory documentation.','', '| Assembly | Structural symbols | XML attached | Explanatory content | Inheritance only | Reference/version only | Empty XML | No XML |','|---|---:|---:|---:|---:|---:|---:|---:|']
 for a,c in sorted(counts.items()):lines.append('| '+a+' | '+' | '.join(str(c[k]) for k in ['structural_symbols','xml_attached','semantic_content','inheritance_reference_only','reference_or_availability_only','empty_xml','no_xml_attached'])+' |')
 lines+=['','Grasshopper attachment was repaired for padded assembly names and nested generic documentation IDs. The regression suite verifies both core sentinels and every linked normalized XML block. Per-symbol evidence: `manifest/documentation_attachment_audit.jsonl`.','','## Rhino.UI investigation','',audit['conclusion'],'','The `Rhino.UI` namespace in RhinoCommon is not the separate `Rhino.UI.dll` assembly. Full target assembly metadata is retained even where semantic reference documentation is absent. '+str(len(guide_evidence))+' canonical guide/example records provide selected UI usage. Exact inspected package file lists, installed source paths, web comparison and guide record IDs: `reports/rhino_ui_documentation_audit.json`.','', 'Authoritative discovery entry points: [RhinoCommon components](https://developer.rhino3d.com/guides/rhinocommon/what-is-rhinocommon/), [official NuGet guidance](https://developer.rhino3d.com/guides/rhinocommon/using-nuget/), [published UI namespace](https://developer.rhino3d.com/api/rhinocommon/rhino.ui?version=8.x). Matching RhinoCommon and RhinoWindows packages supply no Rhino.UI XML. Current web material remains discovery evidence, not a replacement for target-version XML.','','Unmatched XML is classified against public and nonpublic binary metadata in `manifest/xml_unmatched.jsonl`; ten Eto package declarations are absent from selected installed metadata and are not invented as target APIs.']
 write('reports/documentation_richness.md','\n'.join(lines)+'\n');print('Verified attached XML blocks',len(links),'Grasshopper',dict(counts['Grasshopper']))
if __name__=='__main__':run()
