# Parsing and example validation

Final metadata/XML/normalization parser failures: **0**. Native legacy-encoded comments are losslessly transcoded for Doxygen; original bytes and encoding remain cached.

Python syntax checks: {"passed": 521, "failed_or_python2": 133}. Failures include valid Python 2 syntax, deliberately failing teaching examples and real source defects; they are not all bad Rhino API usage. The installed Python 3 `AnnotateCurveForm.py` has unexpected indentation at line 122. Its exact source and explicit exception are retained.

IronPython2 syntax compilation: {"passed": 633, "failed": 21}. Code was compiled for syntax, never executed. Three source files fail both Python grammars: ex_addnurbscircle.py and the py27/py39 copies of AnnotateCurveForm.py.

C# syntax checks (Roslyn 4.14): {"passed": 2881, "failed": 2}. The two regular-C# parse failures are a ScriptEditor library with `#r` and a partial Compute generator header template that is excluded from canonical text; these require their respective preprocessing contexts. Four complete unmodified official C# examples compiled against target RhinoCommon/.NET8 metadata. Both full Compute C# clients also compiled against Rhino3dm 8.35/.NET8 metadata; 970 of 972 remote endpoint strings match target member names (the remaining two are the same Python-evaluation server helper). Overload encodings are not fully bound. Clang successfully syntax-checked the public openNURBS umbrella header. Native Windows plug-in examples were not compiled on macOS; no Windows toolchain is installed. No examples were executed in Rhino or external Windows hosts. Host source preprocessing/declaration validation uses Roslyn 4.14 and declared Rhino8/Revit or AutoCAD framework configurations; source changes for inactive branches are logged.

Static dotted-reference candidates: **1486**. These include VBScript `Rhino.*` calls, filenames, generic spellings, chained properties, external Compute/rhino3dm APIs and actual stale references. They are enumerated in `manifest/reference_exceptions.jsonl`; the analysis is **not full typed binding**. XML cref exceptions: **797**, separately enumerated. Invalid declared record symbols/provenance: **0**.

## Python guide-code blocks

660 explicitly labelled Python blocks were syntax-checked without execution: 588 parse as Python3, 599 as Python2, and 42 fail both standalone grammar checks. These include incomplete teaching snippets, shell commands labelled Python, indentation fragments and genuine publisher defects. The Rhino.Inside.Revit getting-started example contains the invalid original line `import RhinoInside API`. Original source remains unchanged. Exact record/block IDs, source provenance, code hashes and both diagnostics are in `manifest/guide_code_validation.jsonl`.
