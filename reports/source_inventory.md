# Source inventory

Target: Rhino 8 SR35, macOS 8.35.26251.13002; Windows native SDK/openNURBS 8.35.26251.13001.

| Family | Status | Scope / reason |
|---|---|---|
| rhinocommon | included | Full installed RhinoCommon public/protected metadata, exact installed XML; official guides and Rhino 8 samples |
| rhino_ui | included | Full installed Rhino.UI public/protected metadata; no separate installed Rhino.UI XML was distributed, so undocumented members retain structural records |
| grasshopper | included | Full installed Grasshopper 1 metadata/XML, component assemblies, guides and samples |
| gh_io | included | Full installed GH_IO metadata/XML and persistence-related guides/examples |
| scripting | included | Installed py27-rh8 and py39-rh8 source, rhinoscript convenience functions, scriptcontext, ghpythonlib; official scripting guides |
| opennurbs | included | 8.35 public headers, Doxygen inventory, root implementation source and official examples, guides |
| rhino_cpp_sdk | included | Windows SDK 8.35.26251.13001 headers and comments, Doxygen inventory, official guides and samples; newer live 9.0 reference excluded |
| eto | included | Actual installed Eto 2.11 public/protected API and supporting Eto UI assemblies, matching NuGet XML and Rhino Eto guides |
| other_dotnet | included | Discovered installed first-party SDK/support assemblies, including NodeInCode, GH_Util, GhPython, Rhino.Runtime.Code, RhinoCode*, Ed.*, McNeel.Python39.Runtime, PanelingTools, KangarooSolver, Galapagos, Yak and license clients; no namespace whitelist |
| guides | included | Official English technical guides/reference content; future-only pages excluded, mixed passages explicitly filtered; older official .NET8 revision supplies Rhino8 migration guide |
| samples | included | Pinned official Rhino8 source examples in all acquired supported languages; complete source files plus guide attachments |
| rhinoscript_vb | included | Official conceptual guides plus 1320 legacy COM reference pages and 1359 signatures. TOC and linked-page closure acquired. Exact Rhino8 Windows COM binary/type-library comparison remains a validation limitation on macOS |
| rhino3dm | included | Standalone release 8.35.0: complete public/protected .NET assembly metadata/XML, Python stub declarations and semantic RST reference, TypeScript declarations/JSDoc and public binding source; distinct from installed RhinoCommon |
| compute | included | Pinned official 8.x server/Hops source and C# clients; stable Python 0.12.2 and JavaScript 0.12.1 clients plus references. AST declaration inventories and endpoint-name validation. Client version numbers are independent of Rhino build; no live server execution |
| rhino_inside_revit | included | Stable 1.35.9698.15636 source and English technical guides/component catalog; 11 Revit configurations (2017-2027) explicitly preprocessed for Rhino8, public/protected Roslyn inventory. Windows/Revit binary binding and execution not performed |
| rhino_inside_python | included | Stable CPython wrapper 0.8.2 source/API and Rhino8 loading documentation. Explicit Rhino9 material and non-Rhino8 bundled binaries excluded. Windows runtime not executed |
| rhino_inside_loader | excluded | Full NuGet 8.0.7-beta public/protected declaration inventory and pinned Rhino8 source cached separately; all published Rhino8 loader packages are explicitly beta. Brief forbids unapproved beta APIs in production. This exclusion does not remove installed Rhino.Runtime.InProcess APIs or stable host wrappers |
| rhino_inside_autocad | excluded | Complete 1.3.5 AutoCAD/Civil3D public/protected source inventory produced for net48/net8/net10 profiles, but publisher README explicitly says early Alpha testing. This authoritative lifecycle statement overrides GitHub prerelease=false; preview host APIs remain outside production |
| rhino_testing | excluded | All published Rhino8 Rhino.Testing packages are beta; latest 8.0.28-beta public/protected metadata inventoried separately. No beta testing API enters production and no test-host execution performed |
| native_sdk_current_repo | excluded | Current mcneel/rhino_sdk_cpp main explicitly requires Rhino9; README and branch evidence cached. Exact Rhino8 SR35 official native SDK headers already included comprehensively |
| rhino_windows | included | Exact SR35 Windows package 8.35.26251.13001, full RhinoWindows public/protected metadata plus Eto.Wpf; Microsoft WPF references cached only for attribute decoding, not ingested as RhinoSDK |
| yak | included | Installed first-party public metadata and official package-manager guides; no credentials or user package state collected |
| zoo | included | Installed SDK-support metadata, official licensing documentation and examples |
| rhino_mobile | excluded | Historical Xamarin mobile toolkit repository last pushed 2018-04-16; no current Rhino8 release established. Its official historical samples remain labelled; current cross-platform 3dm API is independently inventoried Rhino3dm 8.35. Excludes separate obsolete mobile toolkit, not a Rhino8 namespace |
| grasshopper2 | excluded | Explicitly outside Rhino8/GH1 production scope |
| rhino9_wip | excluded | Rhino9-only documentation, live C++9 website, and RhinoBETA installation excluded |
| third_party_runtime | excluded | General .NET framework, BouncyCastle, NuGet internals, rendering engine dependencies and unrelated UI history are not canonical RhinoSDK families; installation and archives remain inventoried |

See sources.jsonl for per-file hashes, provenance and retrieval dates; repository_files.jsonl for every archive file and source_decisions.jsonl for explicit normalization decisions. English is the primary guide source; translation trees remain in cached archives. Binary examples/models remain in the raw archives as sample dependencies.

Host families are explicitly inventoried; only the prerelease loader and historical mobile toolkit are excluded for the stated version reasons. Exact Windows COM binary and native compiler ABI validation remain limitations. No missing semantic documentation is disguised as documented coverage.
