# Corpus/API coverage

Target: **Rhino 8 SR35 8.35.26251.13002 (macOS)**. Native SDK/openNURBS: **8.35.26251.13001 (Windows SDK release)**.

| Family | Discovered | Semantic documentation matched | Represented | No matched semantic documentation | Absent |
|---|---|---|---|---|---|
| compute | 2283 | 1527 | 2283 | 756 | 0 |
| compute_javascript | 512 | 1 | 512 | 511 | 0 |
| compute_python | 502 | 489 | 502 | 13 | 0 |
| eto | 20151 | 10127 | 20151 | 10024 | 0 |
| gh_io | 853 | 848 | 853 | 5 | 0 |
| grasshopper | 25689 | 10007 | 25689 | 15682 | 0 |
| opennurbs | 21918 | 567 | 21918 | 21351 | 0 |
| other_dotnet | 50229 | 1081 | 50229 | 49148 | 0 |
| rhino3dm | 13794 | 9996 | 13794 | 3798 | 0 |
| rhino_cpp_sdk | 27610 | 3207 | 27610 | 24403 | 0 |
| rhino_inside_python | 2 | 0 | 2 | 2 | 0 |
| rhino_inside_revit | 34270 | 310 | 34270 | 33960 | 0 |
| rhino_ui | 13820 | 0 | 13820 | 13820 | 0 |
| rhino_windows | 1323 | 0 | 1323 | 1323 | 0 |
| rhinocommon | 27585 | 20425 | 27585 | 7160 | 0 |
| rhinoscript_vb | 1359 | 1359 | 1359 | 0 | 0 |
| scripting | 2103 | 1856 | 2103 | 247 | 0 |

**These percentages apply to the inventoried surfaces, not to every independent McNeel product.** .NET inventory includes public/protected members and shipped reference-assembly additions. C++ inventory comes from distributed headers using Doxygen; full comments/source remain intact even where Doxygen does not recognize their prose as documentation. Thus the documentation count is deliberately conservative.

| Metric | Value |
|---|---|
| symbols_absent | 0 |
| symbols_discovered | 244003 |
| symbols_documented | 61800 |
| symbols_represented | 244003 |

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

Grasshopper documentation is verified in the corresponding API record text; XML presence alone is not counted as semantic richness. See `reports/documentation_richness.md` and its per-symbol attachment manifest.

Detailed assembly, namespace, type and member-kind coverage: `manifest/coverage.json`. Every individual symbol is in the symbol manifests; exceptions, including signature-only records, are enumerated in `manifest/coverage_exceptions.jsonl`. Overloads have distinct XML documentation IDs and signatures. C++ enums have separate value entries.

Metadata/XML extraction failures: **0**. Source decisions: {"excluded": 3013, "included": 6558}.

See `reports/source_inventory.md` for additional-family scope gaps. No namespace has been dropped because of perceived usefulness.
