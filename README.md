# RhinoSDK DAPT corpus preparation

Authoritative specification: [docs/DAPT_CORPUS_BUILD_BRIEF.md](docs/DAPT_CORPUS_BUILD_BRIEF.md).

**Do not train. The review gate is closed until every completion criterion is verified.**
Read `STATE.json`, `WORKLOG.md`, `reports/final_report.md` (when present), and machine-readable manifests before resuming. Conversation context is not required.

Target: Rhino 8 SR35, macOS build 8.35.26251.13002; corresponding Windows native SDK/openNURBS 8.35.26251.13001. No RhinoBETA or Rhino 9 binaries are included. The live C++ website is Rhino 9 and is discovery evidence only.

## Layers

- `sources/raw/<sha256>`: content-addressed exact source bytes; never edit these.
- `sources/snapshots`: pinned repository archives, native installer, tokenizer, discovery evidence.
- `manifest`: source provenance, symbols, extraction failures, per-file inclusion decisions.
- `normalized`: semantic documents and C++ Doxygen output.
- `corpus`: work-in-progress authoritative records. Presence does not mean review gate passed.
- `reports`: coverage, validation, tokenization and blockers.
- `scripts`: deterministic cached-source pipeline. No training code.

## Resume / rebuild

All commands run at the project root. Do not rerun discovery against a newer Rhino install and silently change the target. `config/target.json` is the target lock.

1. `python3 scripts/check_integrity.py`
2. `python3 scripts/inventory_dotnet.py` — Mono.Cecil inspection; never loads/executes Rhino code.
3. Source registration is already checkpointed. `acquire_sources.py`, `register_packages.py`, `register_ecosystem.py`, and `register_evidence.py` register verified pinned downloads when recreating the source manifest; ordinary offline rebuild does not reacquire or refresh them.
4. `python3 scripts/extract_native_sdk.py` — requires cached MSI streams/CAB extracted by local `tools/7zip/7zz`.
5. `python3 scripts/register_packages.py`
6. `python3 scripts/inventory_cpp.py`
7. `python3 scripts/normalize_sources.py`, rebuild/run `ValidateCSharp` as shown in `rebuild_all.sh`, then `python3 scripts/normalize_ecosystem.py` and `python3 scripts/audit_versions.py`
8. `python3 scripts/build_canonical.py`
9. `python3 scripts/segment.py && python3 scripts/deduplicate.py`
10. `python3 scripts/validate_symbols.py && python3 scripts/validate_coverage.py && python3 scripts/validate_ecosystem.py`
11. `python3 scripts/build_derived.py && python3 scripts/export_corpus.py` — derived generation remains gated on `STATE.json.canonical_complete`; the empty production derived file is intentional until that is certified.
12. `scripts/tokenize.sh`
13. `python3 -m unittest discover -s tests -v`
14. `python3 scripts/check_rebuild.py`
15. `python3 scripts/source_inventory.py && python3 scripts/reports.py`

For a complete offline rebuild from existing immutable cache and manifests, run `scripts/rebuild_all.sh`. This restores extracted archives first. Keep the raw cache: mutable website URLs cannot guarantee identical bytes in a later download. Python 3.14 is used for orchestration; tokenization uses the separate Python 3.11 oMLX environment. `requirements.txt` pins its tokenizer package for a replacement environment. Tool and .NET SDK availability must be reproduced on another machine. Native Windows SDK binaries are only extracted, never installed or executed.

The full semantic source pipeline uses `config/source_reviews.json`, including reviewed historical WIP mentions. Do not remove those exceptions or treat every WIP string as a future API. All 322 current web example names reconcile to pinned Rhino8 sample files in `manifest/web_example_reconciliation.jsonl`.

No declaration is silently removed for length: `manifest/segmentation.jsonl` records ordered fragments and hashes, and tests reconstruct each complete source. Standalone ecosystem products and validation limitations are explicitly listed in `reports/final_report.md`; acquired-symbol coverage alone must not close the comprehensive review gate.

.NET 6 SDK is installed. Its package sources are cleared (`NuGet.Config`); build does not fetch packages. Mono.Cecil comes from the installed target Rhino. Doxygen and Clang are installed. Python tokenizers 0.23.2 is available in the installed oMLX runtime; model weights are not loaded for token counts.

Git initialization initially failed under the workspace policy. After the permission settings changed, an approved elevated `git init` succeeded. Git checkpointing is now available; earlier history cannot be reconstructed.

License notices are retained. This is internal corpus preparation; redistribution rights are not deemed approved by acquisition.

Additional SDK locks: Rhino3dm 8.35.0 (`f44a7887955d471ad3e52327a5a410a96aad7957`), Compute 8.x (`aeec0a3fa7d5540b08a30f75f987cc1ae5338874`), stable Compute Python 0.12.2 and JavaScript 0.12.1. Their version numbers and API families are separate from RhinoCommon. The complete published legacy RhinoScript COM reference is included; it does not substitute for exact Windows COM binary verification. TypeScript 5.9.3 is cached solely as a parser, never as corpus text.

Numeric XML conflicts are reproducible with `scripts/audit_versions.py`; `manifest/version_conflicts.jsonl` lists each exact-release XML availability discrepancy. Brief section 4 resolves inclusion using verified binary presence: retain semantic XML and original annotations with explicit discrepancy notices. A future-only declaration absent from selected binaries still cannot enter as a target API. Early derived trials are preserved only in `derived/connective/candidates.records.jsonl`, excluded from every production export.


## Corrective audit and clean rebuild

`reports/documentation_richness.md` separates symbol representation, attached XML, actual explanatory content, inheritance/reference-only XML, empty publisher XML and absent documentation. `documentation_audit.py` verifies the exact normalized XML is inside every corresponding API record; it also compares qualified web type names with a RhinoCommon positive control before concluding that the inspected web dataset does not document Rhino.UI.dll.

Current host scope: stable Rhino.Inside.Revit 1.35.9698.15636 (all declared Rhino8/Revit configurations), CPython wrapper 0.8.2, and exact RhinoWindows SR35 are included. Separately inventoried exclusions: Rhino.Inside loader 8.0.7-beta, Rhino.Testing 8.0.28-beta, and AutoCAD/Civil3D 1.3.5 whose publisher README explicitly labels it early Alpha. Historical RhinoMobile and the current Rhino9-only native SDK repository have explicit version-based exclusions. See source_families.jsonl and the excluded_* inventories.

`python3 scripts/clean_rebuild.py` moves generated artifacts and extracted trees into a dated `checkpoints/` directory, retains authoritative input manifests/raw caches, and invokes the complete offline pipeline. It revokes canonical completion until validation is complete. `reports/clean_rebuild_verification.json` compares independently regenerated inventories with the checkpoint; `reports/rebuild_verification.json` verifies fresh-process canonical normalization. This is a disk checkpoint, not Git history.

The host-source parser uses cached Roslyn 4.14 rather than the SDK6 parser, because official sources use newer C# syntax. Microsoft WindowsDesktop reference metadata is cached solely to decode Windows assembly attributes. `manifest/build_environment.json` records tool versions. Source registration additions are `register_inside.py`, `register_windows_metadata.py`, and `register_roslyn.py`; they do not execute downloaded Rhino or host code. `InventoryHost` and `normalize_inside.py` run before canonical assembly.

No in-Rhino/Windows-host runtime validation is claimed. Git write capability was subsequently restored through command approval.
