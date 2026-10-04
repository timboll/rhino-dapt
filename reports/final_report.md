# Corpus-preparation report

**Status: corpus artifacts complete and ready for review; Git write capability restored after corpus preparation. No training has started.**

## Included

Target **Rhino 8 SR35, macOS build 8.35.26251.13002**; matching native SDK and openNURBS **8.35.26251.13001**. Includes public/protected installed .NET APIs, overloads, attributes/defaults, installed/matching XML, Rhino scripting source, official conceptual guides and samples, native/public openNURBS headers and implementation examples, Eto UI, and discovered first-party SDK support assemblies. No namespace whitelist is used.

10,620 source/evidence entries are cached; **7,401 distinct source files/binaries directly support canonical records**. Every repository file has a disposition. All 322 current RhinoCommon website example filenames map to the pinned Rhino8 samples repository. See the source inventory for exact inclusions/exclusions and the manifests for hashes and provenance.

| Source processing | Count |
|---|---|
| assembly_binaries_inspected | 136 |
| included_assembly_variants | 87 |
| parser_failures | 0 |
| public_header_files_parsed | 755 |
| source_evidence_entries_acquired | 10620 |
| text_candidates_dispositioned | 9571 |
| text_sources_normalized | 6558 |
| xml_documentation_files_parsed | 16 |

| Metric | Result |
|---|---|
| Inventoried symbols | 244,003 |
| Represented symbols | 244,003 |
| Absent inventoried symbols | 0 |
| Matched semantic documentation | 61,800 |
| Canonical records | 149084 |
| Canonical tokens | 52,342,786 |
| Derived records | 110 |
| Derived tokens | 161,816 |
| Total tokens | 52,504,602 |
| Final parsing failures | 0 |
| Automated suite | 26 tests passed |
| Cached canonical rebuild byte-identical | True |

Accepted derived records are deterministic, canonical-source-linked type inheritance/interface relationships, generated only after the canonical completion checkpoint. Assembly identity is used to distinguish identical type names across RhinoCommon and Rhino3dm. Early trial output remains outside production under derived/connective/candidates.records.jsonl. No generated code or mixing weight was introduced.

## Omissions and unresolved issues

- **version_annotation_conflicts** — 94 distinct members in RhinoCommon/Rhino3dm XML are annotated since Rhino 8.36/9.0 despite existing in the selected 8.35 binaries. Including accessor and declaring-type propagation, 264 symbol documentation blocks retain exact-release XML and original notes, with an explicit availability-discrepancy notice. Inclusion is resolved by brief section 4: selected binary presence is authoritative for existence. The publisher annotation itself remains unresolved. See manifest/version_conflicts.jsonl.
- **ecosystem_scope** — Stable Rhino.Inside.Revit 1.35 and CPython 0.8.2 are inventoried and included as separate families; AutoCAD/Civil3D 1.3.5 source declarations are inventoried separately and excluded because its README explicitly labels the project early Alpha testing; exact SR35 RhinoWindows metadata is included. The independently inventoried Rhino.Inside loader 8.0.7-beta and Rhino.Testing 8.0.28-beta are excluded under the no-unapproved-beta rule. Historical RhinoMobile (last repository push 2018) and current Rhino9-only native SDK repository are excluded with cached evidence. Windows COM binary comparison and host runtime/typed binding remain limitations.
- **example_binding** — 1486 dotted-reference candidates and 797 XML references have explicit exceptions, not full typed validation. Known source defects are retained with provenance; representative compiles do not validate every example. Separate Python guide-block checks and their explicit original-source defects are recorded in reports/parsing_failures.md and manifest/guide_code_validation.jsonl.
- **documentation_gaps** — 182203 inventoried declarations lack matched semantic XML/docstrings. Every declaration is represented by metadata or full header/source. Rhino.UI.dll has no separate XML in the installed distribution or matching RhinoCommon/RhinoWindows packages, and no exact type matches in the inspected web API dataset. Selected official guides/examples remain included. See reports/documentation_richness.md for the exact search and attachment evidence.
- **native_parser** — Doxygen plus full-header preservation and Clang umbrella-header check establish a reproducible native inventory; explicit Windows/macOS/Linux-openNURBS macro profiles are inventoried, with zero generic-only declarations after source-coordinate reconciliation; these have not been independently exhaustively compared to a Windows compiler AST.
- **redistribution** — Per-source license/copyright evidence retained; redistribution rights for corpus or eventual trained model have not been approved.

Coverage is 100% of the inventoried target surfaces, reported separately from semantic documentation richness. Included stable host integrations and excluded alpha/beta integrations now have explicit inventory denominators; no current host family is silently deferred. Beta and historical exclusions are version-based, not convenience-based. Host AST coverage is not a claim of runtime or full typed binding.

## Version, duplication and record lengths

The numeric version audit detected 94 distinct future-annotated members in selected release XML; 264 affected symbol documentation blocks (including accessors/type propagation) preserve the exact-release XML and conflicting notes with explicit discrepancy notices. All 94 original annotated members physically exist in the selected 8.35 binaries; source-priority rule 4 resolves their inclusion without admitting a future-only symbol. No Rhino9/GH2 binary/reference set is included in production. AutoCAD/Civil3D source is retained outside production because the publisher labels it alpha. Newer-only guides and sections are excluded. Apart from the explicitly labelled numeric since-version discrepancies, the remaining Rhino9 text-marker hits are reviewed compatibility/maintenance comments, a hypothetical licensing example, a Rhino8 Hops comment naming the internal repository that supplied a UI pattern, or a numbered illustration filename, not added future API records. Every remaining marker context has a SHA-locked review in config/version_context_reviews.json. Live Grasshopper and C++ references identify Rhino9 and remain discovery evidence only. Current RhinoCommon JSON is a single mixed-version dataset; target installed XML has priority.

Exact duplicate records removed: **0**; exact token reduction: **0**. Near-duplicate removals: **0**. Semantic repetition was retained. Lengths: median **195.0**, p90 **367**, p95 **600**, p99 **2542**, maximum **98209** tokens. Large code documents are segmented at declaration/member or encoding-map boundaries, with tested exact reassembly.

## Artifacts and reproducibility

- `corpus/canonical.records.jsonl` — SHA-256 `509f8249721c2fda66432f6e0b8cf5c95219a2f786292decd604e9785fc85d8f`
- `corpus/derived.records.jsonl` — SHA-256 `8cf6c76a9416fec495c5d0b807bb56a45c4509fe7842dd5680b9f60868bf1366`
- `corpus/full.records.jsonl` — SHA-256 `97b2ddd26643936615d87a63fc6fc33cf41547bb8998c8e4e51444c8525eb382`
- `corpus/training_text.jsonl` — SHA-256 `b5620e8af4c76372c3841643fd42f42d8ec6741a595936a2d68258f8e7747dac`

`README.md` and `scripts/rebuild_all.sh` describe offline restoration/rebuild. Cached canonical rebuilding was tested in fresh processes without conversation context. Dependencies, pinned downloads, raw hashes, exceptions and tokenizer compatibility are on disk. No train/validation split, sequence packing, optimizer settings or model training were created.

## Next step

Review the documented publisher annotation discrepancies, explicit version exclusions, documentation richness and validation limitations. After corpus approval, a separate experiment can define reproducible temporary validation splits and a closed-book evaluation recipe. This report does not select training architecture, hyperparameters or mixture weights.
