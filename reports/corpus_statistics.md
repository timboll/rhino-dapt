# Exact Qwen tokenization

Tokenizer: **Qwen/Qwen3.8-27B**, commit `1d4bf0f2ff6012fd82039f2fa52739d0dd7c60c0`; tokenizers 0.23.2. Both tokenizer JSON files match the local `gcoli/Qwen3.8-27B-oQ6e-mtp` byte-for-byte. Model weights were not loaded.

Counts apply to raw record text with **no chat template, added special tokens, padding, truncation or packing**. Record boundaries are separate from any future training sequence length.

| Family | Records | Tokens | Proportion | Median | p95 | Maximum |
|---|---|---|---|---|---|---|
| compute | 85 | 466,742 | 0.89% | 2384 | 14639 | 17374 |
| compute_javascript | 17 | 140,180 | 0.27% | 1653 | 24911 | 51742 |
| compute_python | 18 | 115,506 | 0.22% | 2017.0 | 28029 | 32124 |
| derived_connective | 110 | 161,816 | 0.31% | 487.5 | 6289 | 28468 |
| eto | 19178 | 4,277,896 | 8.15% | 202.0 | 372 | 7594 |
| gh_io | 580 | 249,974 | 0.48% | 212.0 | 818 | 22486 |
| grasshopper | 24201 | 5,893,202 | 11.22% | 199 | 437 | 14265 |
| guides | 896 | 1,094,900 | 2.09% | 639.0 | 3762 | 48452 |
| opennurbs | 749 | 8,109,071 | 15.44% | 6864 | 34606 | 55143 |
| other_dotnet | 47471 | 10,893,020 | 20.75% | 195 | 400 | 9405 |
| rhino3dm | 9871 | 2,728,260 | 5.20% | 183 | 592 | 27953 |
| rhino_cpp_sdk | 384 | 1,407,435 | 2.68% | 1690.5 | 15103 | 30787 |
| rhino_inside_python | 2 | 2,431 | 0.00% | 1215.5 | 543 | 1888 |
| rhino_inside_revit | 1224 | 4,579,896 | 8.72% | 1209.0 | 13855 | 98209 |
| rhino_ui | 13724 | 2,535,256 | 4.83% | 167.0 | 253 | 2793 |
| rhino_windows | 1293 | 272,134 | 0.52% | 191 | 361 | 1187 |
| rhinocommon | 25219 | 6,327,995 | 12.05% | 186 | 546 | 27653 |
| rhinoscript_vb | 1320 | 558,182 | 1.06% | 343.5 | 902 | 4721 |
| samples | 2746 | 2,152,832 | 4.10% | 438.5 | 2051 | 51643 |
| scripting | 106 | 537,874 | 1.02% | 969.0 | 14063 | 40223 |

| Representation | Records | Tokens |
|---|---|---|
| canonical | 149084 | 52,342,786 |
| derived | 110 | 161,816 |
| Total | 149194 | 52,504,602 |

| Length statistic | Tokens |
|---|---|
| mean | 351.9216724533158 |
| median | 195.0 |
| p90 | 367 |
| p95 | 600 |
| p99 | 2542 |
| max | 98209 |

| Length bin (tokens) | Records |
|---|---|
| 1-256 | 114278 |
| 1025-2048 | 1984 |
| 16385-32768 | 206 |
| 2049-4096 | 790 |
| 257-512 | 25660 |
| 32769-65536 | 58 |
| 4097-8192 | 379 |
| 513-1024 | 5449 |
| 65537-1000000000 | 11 |
| 8193-16384 | 379 |

Per-record counts: `manifest/record_tokens.jsonl`. Machine-readable family distributions: `reports/corpus_statistics.json`.
