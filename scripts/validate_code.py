from common import *
import subprocess,tempfile

def run():
 results=[];runtime=Path('/Applications/Rhino 8.app/Contents/Frameworks/RhCore.framework/Versions/A/Resources');csc='/usr/local/share/dotnet/sdk/6.0.202/Roslyn/bincore/csc.dll'
 # Compile an exact official complete sample file against target reference metadata.
 candidates=[s for s in rows('manifest/sources.jsonl') if s.get('archive_path','').endswith(('/SampleCsGetPoint.cs','/SampleCsGetMultiplePoints.cs','/SampleCsCurvePoints.cs','/SampleCsPointCloudPoints.cs'))]
 if not candidates:
  candidates=[s for s in rows('manifest/sources.jsonl') if s.get('archive_path','').endswith('/SampleCsBrepFace.cs')]
 for s in candidates:
  sample=ROOT/'normalized/code_validation'/Path(s['archive_path']).name;sample.parent.mkdir(parents=True,exist_ok=True);sample.write_bytes((ROOT/s['cache_path']).read_bytes())
  refs=list((runtime/'dotnet/arm64/shared/Microsoft.NETCore.App/8.0.14').glob('*.dll'))+[runtime/'RhinoCommon.dll']
  out=sample.with_suffix('.dll');cmd=['dotnet',csc,'-nologo','-target:library','-nostdlib+','-out:'+str(out)]+['-r:'+str(p) for p in refs]+[str(sample)]
  p=subprocess.run(cmd,capture_output=True,text=True);results.append({'source_id':s['id'],'language':'csharp','validation':'compile complete official sample against installed RhinoCommon and bundled .NET 8 reference metadata; no execution','command':cmd,'exit_code':p.returncode,'diagnostics':p.stdout+p.stderr})
 # Clang checks the public openNURBS include surface without linking or running anything.
 base=next((ROOT/'sources/extracted/opennurbs-8').iterdir());source=ROOT/'normalized/code_validation/opennurbs_header_check.cpp';source.parent.mkdir(exist_ok=True);source.write_text('#include "opennurbs.h"\nvoid verify_types(ON_Brep* b, ON_NurbsCurve* c) {(void)b; (void)c;}\n')
 cmd=['clang++','-std=c++17','-fsyntax-only','-I'+str(base),str(source)];p=subprocess.run(cmd,capture_output=True,text=True);results.append({'source_id':'archive:mcneel/opennurbs@eb92af3ba1806b0a34a99aba0d3bda83e3d46083','language':'cpp','validation':'independent compiler check of public openNURBS umbrella header; no link/execution','command':cmd,'exit_code':p.returncode,'diagnostics':p.stdout+p.stderr})
 jsonl('manifest/compilation_results.jsonl',results)
 print([(r['language'],r['exit_code']) for r in results])
if __name__=='__main__':run()
