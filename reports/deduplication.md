# Deduplication

| Metric | Value |
|---|---|
| characters_removed | 0 |
| exact_records_removed | 0 |
| exact_tokens_removed | 0 |
| near_algorithm | SHA256 of casefolded whitespace-collapsed full document; intentionally conservative, not a semantic similarity score |
| near_duplicate_groups | 141 |
| near_records_removed | 0 |
| records_after | 149084 |
| records_before | 149084 |
| source_file_exact_duplicates | 522 |

Only exact text matches with identical API family, language and version are collapsed; provenance and symbol associations are merged. Near analysis uses whitespace/case-normalized document equality and makes **no deletions**. This is a conservative near-duplicate analysis, not semantic similarity detection.

Repeated API explanations, overloads, accessor descriptions and language variants remain. Exact raw-source duplicates share a SHA-256 cache object. Removing the embedded PNG asset is source classification, not deduplication. All semantic code segments reconstruct the complete original source exactly.
