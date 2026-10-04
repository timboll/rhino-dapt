import unittest,json,sys,re,hashlib
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]/'scripts'))
from common import *
from normalize_sources import guide
from normalize import normalize_xml,version_risks
import xml.etree.ElementTree as ET
class CorpusTests(unittest.TestCase):
 @classmethod
 def setUpClass(cls):
  cls.records=rows('corpus/canonical.records.jsonl');cls.derived=rows('corpus/derived.records.jsonl');cls.symbols=rows('manifest/symbols.jsonl')+rows('manifest/cpp_symbols.jsonl')+rows('manifest/python_symbols.jsonl')+rows('manifest/ecosystem_symbols.jsonl')+rows('manifest/inside_symbols.jsonl');cls.byid={s['id']:s for s in cls.symbols};cls.sources={s['id']:s for s in rows('manifest/sources.jsonl')}
 def test_no_empty_text_or_duplicate_ids(self):
  ids=set()
  for r in self.records+self.derived:
   self.assertTrue(r['text'].strip());self.assertNotIn(r['id'],ids);ids.add(r['id'])
 def test_all_jsonl_valid(self):
  for folder in ('manifest','corpus'):
   for p in (ROOT/folder).glob('*.jsonl'):
    with p.open() as f:
     for line in f:self.assertIsInstance(json.loads(line),dict,str(p))
 def test_provenance_and_symbols(self):
  for r in self.records:
   self.assertTrue(r['provenance'])
   for s in r['provenance']:self.assertIn(s,self.sources)
   for s in r['symbols']:self.assertIn(s,self.byid)
 def test_no_unexplained_exact_duplicates(self):
  seen=set()
  for r in self.records:
   key=(r['api_family'],r['language'],r['version'],digest(r['text'].encode()))
   self.assertNotIn(key,seen);seen.add(key)
 def test_stable_managed_ids(self):
  for s in rows('manifest/symbols.jsonl'):self.assertEqual(s['id'],s['assembly']+'|'+s['doc_id'])
 def test_stable_api_record_ids(self):
  for r in self.records:
   if r['source_type']!='api_reference':continue
   s=self.byid[r['symbols'][0]];key=s['assembly']+'|'+s['declaring_type']+'|'+s['kind']+'|'+s['name']
   self.assertEqual(r['id'],'canonical:dotnet:'+digest(key.encode()))
 def test_signatures_not_dropped(self):
  for r in self.records:
   if r['source_type']!='api_reference':continue
   for sid in r['symbols']:self.assertIn(self.byid[sid]['signature'],r['text'])
 def test_entire_public_header_retained(self):
  from collections import defaultdict
  groups=defaultdict(list)
  for r in self.records:
   if r['source_type']=='public_cpp_header':groups[r.get('parent_id',r['id'])].append(r)
  for parent,rs in groups.items():
   rs.sort(key=lambda r:r.get('sequence',0))
   if 'parent_id' in rs[0]:
    code=''.join(r['text'].split('```cpp\n',1)[1].rsplit('\n```',1)[0] for r in rs)
    self.assertEqual(digest(code.encode()),rs[0]['parent_code_sha256'])
    for sid in rs[0]['provenance']:self.assertEqual(decode_source((ROOT/self.sources[sid]['cache_path']).read_bytes())[0],code)
   else:
    for sid in rs[0]['provenance']:self.assertIn(decode_source((ROOT/self.sources[sid]['cache_path']).read_bytes())[0],rs[0]['text'])
 def test_all_semantic_segments_reassemble(self):
  byid={r['id']:r for r in self.records}
  for m in rows('manifest/segmentation.jsonl'):
   code=''
   for child in m['children']:
    r=byid[child];code+=r['text'].split('```'+r['language']+'\n',1)[1].rsplit('\n```',1)[0]
   self.assertEqual(digest(code.encode()),m['code_sha256'])
 def test_semantic_xml_sections(self):
  e=ET.fromstring('<member name="M:X"><summary>Summary <see cref="T:Y"/></summary><param name="a">Input</param><returns>Output</returns><remarks>Keep this</remarks><exception cref="T:E">Failure</exception><code>x &lt; y</code></member>')
  text=normalize_xml(e)
  for v in ['Summary','T:Y','name=a','Input','Returns','Output','Keep this','T:E','Failure','x < y']:self.assertIn(v,text)
 def test_version_filters(self):
  from version_policy import newer_than_target
  self.assertTrue(newer_than_target("8.36"));self.assertTrue(newer_than_target("9.0"));self.assertFalse(newer_than_target("8.35"));self.assertFalse(newer_than_target("8.9"))
  meta,text,changes,risks=guide('+++\ntitle="test"\n+++\n## Rhino 9\nFutureOnly()\n## Rhino 8\nTargetOnly()\n')
  self.assertNotIn('FutureOnly',text);self.assertIn('TargetOnly',text);self.assertTrue(changes)
  self.assertTrue(version_risks('Rhino 9 GH2 Grasshopper 2'))
  for r in self.records:
   if r['source_type']=='api_reference':
    for v in re.findall(r'## Available since\s+([0-9.]+)',r['text']):
     if newer_than_target(v):
      self.assertIn('## Availability annotation discrepancy',r['text'])
      conflicts={c['symbol_id'] for c in rows('manifest/version_conflicts.jsonl')}
      self.assertTrue(set(r['symbols'])&conflicts)
      self.assertTrue(all(s in self.byid for s in r['symbols']))
 def test_no_known_future_sources(self):
  sources={s for r in self.records for s in r['provenance']}
  for d in rows('manifest/source_decisions.jsonl'):
   if d['status']=='excluded' and ('Grasshopper 2' in d['reason'] or 'explicit version since >8' in d['reason'] or 'Rhino 9 release' in d['reason']):self.assertNotIn(d['source_id'],sources)
  for s in rows('manifest/symbols.jsonl'):
   self.assertNotIn('RhinoBETA',self.sources[s['source_id']]['source_location'])
 def test_sentinels(self):
  managed={s['doc_id'] for s in rows('manifest/symbols.jsonl')}
  for s in ['T:Rhino.Geometry.Brep','T:Rhino.Geometry.SubD','T:Rhino.Display.DisplayPipeline','T:Rhino.RhinoDoc','T:Grasshopper.Kernel.GH_Component','T:Grasshopper.Kernel.Types.IGH_Goo','T:Grasshopper.Kernel.Data.GH_Path','T:GH_IO.Serialization.GH_Archive','T:Eto.Forms.Form']:self.assertIn(s,managed)
  names={s['name'] for s in rows('manifest/cpp_symbols.jsonl')}
  for n in ['ON_Brep','ON_NurbsCurve','CRhinoDoc','CRhinoCommand']:self.assertIn(n,names)
  self.assertIn('AddPoint',{s['name'] for s in rows('manifest/python_symbols.jsonl')+rows('manifest/ecosystem_symbols.jsonl')+rows('manifest/inside_symbols.jsonl')})
 def test_core_semantic_documentation_attached(self):
  documented={s['id'] for s in rows('manifest/documented_symbols.jsonl')}
  for sid in ['Grasshopper|T:Grasshopper.Kernel.GH_Component','GH_IO|T:GH_IO.Serialization.GH_Archive','RhinoCommon|T:Rhino.Geometry.Brep']:
   self.assertIn(sid,documented)
  self.assertGreater(sum(s.startswith('Grasshopper|') for s in documented),8000)
  self.assertIn('Grasshopper|M:Grasshopper.DataTree`1.#ctor(Grasshopper.DataTree{`0},Grasshopper.DataTree{`0}.DuplicateT)',documented)
  self.assertIn('Grasshopper|M:Grasshopper.Kernel.Data.GH_Structure`1.DuplicateCast``1(Grasshopper.Kernel.Data.GH_Structure{`0}.ConversionDelegate{`0,``0})',documented)
 def test_complete_discovered_symbol_representation(self):
  represented={s for r in self.records for s in r['symbols']}
  self.assertEqual(set(self.byid)-represented,set())
 def test_derived_grounding(self):
  if not readj('STATE.json').get('canonical_complete',False):self.assertEqual(self.derived,[])
  canonical={r['id']:r for r in self.records}
  for r in self.derived:
   self.assertTrue(r['canonical_source_ids']);grounded=set()
   for sid in r['canonical_source_ids']:self.assertIn(sid,canonical);grounded.update(canonical[sid]['symbols'])
   self.assertTrue(set(r['symbols'])<=grounded);self.assertFalse(r['contains_generated_code'])
 def test_tokenizer_coverage(self):
  tokenrows=rows('manifest/record_tokens.jsonl');self.assertEqual({r['id'] for r in self.records+self.derived},{r['id'] for r in tokenrows})
  self.assertTrue(all(r['tokens']>0 for r in tokenrows))
  hashes={r['id']:digest(r['text'].encode()) for r in self.records+self.derived}
  self.assertTrue(all(r['text_sha256']==hashes[r['id']] for r in tokenrows))
  manifest=readj('manifest/tokenizer.json');self.assertTrue(all(r['byte_identical'] for r in manifest['compatibility']))
 def test_training_export(self):
  rich=rows('corpus/full.records.jsonl');minimal=rows('corpus/training_text.jsonl')
  self.assertEqual(len(rich),len(minimal))
  for r,t in zip(rich,minimal):self.assertEqual(t,{'text':r['text']})
 def test_additional_api_families(self):
  extra=rows('manifest/ecosystem_symbols.jsonl')
  for family in ('rhinoscript_vb','rhino3dm','compute','compute_python','compute_javascript'):
   self.assertGreater(sum(s['api_family']==family for s in extra),100)
  circle=[s for s in extra if s['api_family']=='rhinoscript_vb' and s['name']=='AddCircle']
  self.assertEqual(len(circle),2);self.assertNotEqual(circle[0]['signature'],circle[1]['signature'])
  ts=rows('manifest/typescript_symbols.jsonl')
  self.assertTrue(any(s['kind']=='MethodDeclaration' for s in ts));self.assertTrue(any(s['kind']=='PropertyDeclaration' for s in ts))
  self.assertIn('Rhino3dm|T:Rhino.Geometry.Brep',self.byid)
 def test_ecosystem_presentation_noise_excluded(self):
  for r in self.records:
   for sid in r['provenance']:
    self.assertFalse(sid.endswith(('api/searchindex.js','api/assets/search.js')))
  self.assertTrue(any('docs/python/api/_sources/Arc.rst.txt' in p for r in self.records for p in r['provenance']))
 def test_compute_clients_compile(self):
  results=rows('manifest/ecosystem_compilation_results.jsonl');self.assertEqual(len(results),2)
  self.assertTrue(all(r['exit_code']==0 for r in results))
 def test_actual_xml_text_attached(self):
  from normalize import normalize_xml
  cache={}
  for r in self.records:
   for link in r.get('documentation_links',[]):
    sid=link['source_id']
    if sid not in cache:cache[sid]={e.get('name'):e for e in ET.fromstring((ROOT/self.sources[sid]['cache_path']).read_bytes()).findall('./members/member')}
    expected=normalize_xml(cache[sid][link['xml_doc_id']])
    self.assertIn(expected,r['text'],link['symbol_id'])
 def test_host_and_windows_inventory(self):
  self.assertTrue(any(s.get('assembly')=='RhinoWindows' for s in self.symbols))
  self.assertGreater(len(rows('manifest/inside_symbols.jsonl')),30000)
  self.assertEqual(rows('manifest/inside_parsing_failures.jsonl'),[])
  self.assertFalse(any(d['status']=='pending' for d in rows('manifest/inside_decisions.jsonl')))
  self.assertTrue(all('RHINO_9' not in p['defines'] for p in (json.loads(l) for l in (ROOT/'manifest/inside_csharp_profiles.jsonl').open())))
  self.assertFalse(any(self.sources[p]['source_type']=='excluded_beta_assembly' for r in self.records for p in r['provenance']))
 def test_host_schema_profiles_match_project(self):
  for s in rows('manifest/inside_symbols.jsonl'):
   match=re.search(r'/DB/Schemas/(\d{4})/',s['source_id'])
   if match:self.assertEqual(s['profiles'],['Rhino8-Revit'+match[1]])
 def test_csharp_semantic_member_boundaries(self):
  from segment import semantic_parts
  code='namespace X { public class Y { '+''.join('public string P'+str(i)+' => "'+('x'*100)+'";\n' for i in range(1000))+'void Method() { string a="{ }"; } } }'
  parts=semantic_parts(code,language='csharp')
  self.assertGreater(len(parts),1)
  self.assertEqual(''.join(code[a:b] for a,b in parts),code)
  self.assertTrue(any('void Method() { string a="{ }"; }' in code[a:b] for a,b in parts))
 def test_native_platform_reconciliation(self):
  audit=readj('reports/cpp_platform_audit.json');self.assertEqual(audit['generic_only'],0)
  self.assertGreater(audit['counts']['windows_x64'],48000)
if __name__=='__main__':unittest.main()
