# Objective

Build a **comprehensive, reproducible, version-controlled DAPT corpus for Rhino 8 development**, suitable for continued causal-language-model pretraining of Qwen3.8-27B.

The goal is to teach the model the complete practical **RhinoSDK ecosystem** as knowledge, not to create a retrieval database and not yet to teach agent behavior.

This is **self-supervised continued pretraining data**: coherent technical text, API documentation, signatures, examples, source-derived explanations, and related code. Do **not** convert the corpus into user/assistant instruction-response examples.

Do not rely on any previous RAG repository or assume its source collection was complete. Discover, acquire, inventory, normalize, and validate the authoritative source material independently.

**Hard stop:** do not start DAPT training. Finish the corpus, validation, tokenization, and reports first, then stop for review.

---

# 1. Non-negotiable principles

1. **Comprehensive means comprehensive.**
   - Do not decide that obscure APIs, namespaces, classes, methods, overloads, events, enums, rendering APIs, display APIs, serialization APIs, etc. are unimportant.
   - If they are part of the target public RhinoSDK ecosystem, retain them.

2. **Clean presentation noise, not technical information.**
   - Remove navigation, breadcrumbs, search widgets, HTML/CSS/JS, repeated site furniture, boilerplate footers, etc.
   - Do not summarize away API detail.

3. **Preserve exact API distinctions.**
   - Keep overloads.
   - Keep parameters and return values.
   - Keep inheritance.
   - Keep remarks, exceptions, obsolete/deprecation/version notes, examples, generic constraints, events, delegates, enums and enum values where documented.

4. **Version-lock the corpus.**
   - Target Rhino 8.
   - Determine the exact locally installed Rhino 8 build before extraction and record it in the corpus manifest.
   - Do not silently incorporate Rhino 9, WIP, preview, beta, or future-version APIs.
   - Current web documentation may expose newer APIs. Filter/validate against the Rhino 8 target.

5. **Local installed assemblies are an important authority for symbol existence.**
   - Use reflection/inspection of the target Rhino installation where possible to establish what public .NET API actually exists.
   - Use official documentation to supply semantic documentation for those symbols.

6. **Everything must be traceable.**
   - Every canonical training record must retain provenance back to its source document/file/API symbol.

7. **Everything must be reproducible and resumable.**
   - No important state may exist only in Codex context.
   - Scripts, manifests, hashes, state files and reports must allow another session to reproduce or resume the build.

---

# 2. Establish the target environment first

Before collecting documentation:

1. Locate the installed Rhino 8 application.
2. Record:
   - Rhino version/build/service release;
   - platform;
   - relevant installed assembly versions;
   - file hashes where practical.
3. Locate the installed copies, if available, of:
   - `RhinoCommon.dll`
   - `Rhino.UI.dll`
   - `Grasshopper.dll`
   - `GH_IO.dll`
   - Eto assemblies used by Rhino
   - associated XML documentation files
   - scripting libraries such as `rhinoscriptsyntax`
   - any other SDK-supporting assemblies or documentation distributed with Rhino 8.

Write this to something like:

`manifest/target_environment.json`

Do not assume this list is exhaustive. Inspect the installation and official Rhino 8 developer documentation for additional first-party SDK components that belong in the ecosystem.

---

# 3. Source scope

Build an explicit source inventory covering at minimum the following source families.

## A. RhinoCommon / .NET Rhino SDK

Comprehensively acquire and represent the public Rhino 8 API exposed through:

- `RhinoCommon.dll`
- `Rhino.UI.dll`
- related first-party Rhino .NET SDK assemblies discovered during inspection.

Include the full documented namespace/type/member hierarchy.

This includes, without limitation, geometry, document/object management, input, display, rendering, file IO, UI integration, plug-in infrastructure, commands, events, tables, annotations, transforms, intersections, meshing, SubD, NURBS, object attributes, materials, views, etc.

Do not make a hand-curated namespace whitelist.

## B. Grasshopper SDK

Comprehensively include the Rhino 8-era Grasshopper 1 developer API exposed through at least:

- `Grasshopper.dll`
- `GH_IO.dll`

Include all documented public namespaces/types/members, including less frequently used areas such as UI, attributes, document lifecycle, data trees, persistence, component infrastructure, parameters, goo/types, previews, serialization, solver behavior, etc.

Distinguish Grasshopper API symbols clearly from RhinoCommon symbols.

Do not mix Grasshopper 2 preview APIs into the Rhino 8 / Grasshopper 1 corpus unless they are placed into a separately identified source family that is **not included in the production DAPT corpus by default**.

## C. Rhino scripting environment

Include first-party documentation/source for:

- Rhino Python 3 scripting;
- Python.NET interaction with RhinoCommon;
- Rhino Python 2/IronPython material where still relevant to Rhino 8;
- `rhinoscriptsyntax`;
- `scriptcontext`;
- Rhino ScriptEditor behavior relevant to API usage;
- Grasshopper Python scripting where it teaches actual Rhino/Grasshopper development behavior.

Treat `rhinoscriptsyntax` as a distinct convenience API over RhinoCommon rather than conflating its function names with RhinoCommon methods.

## D. Official RhinoCommon / Grasshopper guides

Acquire the complete relevant Rhino 8 developer-guide corpus, including:

- RhinoCommon guides;
- Grasshopper developer guides;
- Grasshopper data-tree documentation;
- Python scripting guides;
- C# scripting guides;
- geometry/NURBS/math explanations;
- plug-in development;
- component development;
- events/document lifecycle;
- UI guidance;
- file IO;
- serialization;
- multi-threading/task-capable components;
- custom attributes;
- other official developer material applicable to the target.

Do not discard conceptual guides merely because the same symbols appear in API reference pages. These guides supply relationships and usage patterns that the API reference often does not.

## E. Official developer samples

Acquire all relevant first-party Rhino 8-compatible developer samples, including C# and Python examples where supplied.

Preserve:

- complete code;
- language;
- dependencies;
- accompanying explanation;
- relevant API references;
- provenance.

Where the same example exists in multiple languages, retain all useful versions.

## F. openNURBS

Include the **public openNURBS SDK** relevant to the Rhino 8 generation:

- official public C++ API documentation;
- public headers;
- meaningful API comments;
- public source where appropriate and legally/source-wise available;
- official openNURBS developer guides;
- official examples.

This is not just a source of code snippets. It teaches underlying Rhino geometry concepts and the native model/file representation.

Keep openNURBS names (`ON_*`) clearly identified as C++/openNURBS so the model does not confuse them with RhinoCommon .NET names.

## G. Native Rhino C++ SDK

Inventory the official Rhino 8 native C++ SDK documentation as a distinct source family.

Include public developer API material relevant to understanding the broader RhinoSDK, but tag it strongly as:

`api_family = rhino_cpp_sdk`

The model must be able to distinguish:

- RhinoCommon .NET;
- Grasshopper .NET;
- openNURBS C++;
- Rhino native C++;
- rhinoscriptsyntax/Python.

Do not allow similar concepts in these APIs to collapse into one ambiguous record.

## H. Eto / UI support

Include the Eto API material actually relevant to Rhino plug-in/UI development.

Do not ingest the entire unrelated history of the wider .NET UI ecosystem. The goal is sufficient comprehensive knowledge for Eto as used in Rhino development.

## I. Other first-party Rhino 8 SDK material

Actively search the installed SDK and official McNeel developer resources for relevant first-party material missed by the categories above.

Document every additional source family discovered and whether it is:

- included;
- excluded;
- deferred;

with a reason.

Do not silently omit it.

---

# 4. Source priority

Prefer sources in this order when reconciling conflicts:

1. Exact target Rhino 8 installed binaries/API surface for symbol existence.
2. Exact-version first-party API documentation/XML documentation.
3. Official Rhino 8 developer documentation.
4. Official McNeel source repositories and examples.
5. Official source code/comments where appropriate.

Do not use community forum posts, Stack Overflow, random GitHub repositories, blogs, AI-generated explanations, or unofficial tutorials in the **canonical authoritative corpus**.

Those could potentially become another dataset later. They are not part of this task.

---

# 5. Repository structure

Create a standalone project with approximately this structure:

```text
rhinosdk-dapt/
├── README.md
├── STATE.json
├── WORKLOG.md
│
├── config/
│   └── target.json
│
├── manifest/
│   ├── target_environment.json
│   ├── sources.jsonl
│   ├── assemblies.jsonl
│   ├── symbols.jsonl
│   ├── licenses.jsonl
│   └── coverage.json
│
├── sources/
│   ├── raw/
│   └── snapshots/
│
├── normalized/
│   ├── rhinocommon/
│   ├── grasshopper/
│   ├── gh_io/
│   ├── scripting/
│   ├── opennurbs/
│   ├── rhino_cpp/
│   ├── eto/
│   ├── guides/
│   └── samples/
│
├── derived/
│   └── connective/
│
├── corpus/
│   ├── canonical.records.jsonl
│   ├── derived.records.jsonl
│   ├── full.records.jsonl
│   └── training_text.jsonl
│
├── scripts/
│   ├── discover_sources.*
│   ├── inventory_dotnet.*
│   ├── inventory_cpp.*
│   ├── acquire_sources.*
│   ├── normalize.*
│   ├── build_canonical.*
│   ├── build_derived.*
│   ├── validate_coverage.*
│   ├── validate_symbols.*
│   ├── deduplicate.*
│   └── tokenize.*
│
├── reports/
│   ├── source_inventory.md
│   ├── coverage.md
│   ├── parsing_failures.md
│   ├── deduplication.md
│   ├── corpus_statistics.md
│   └── final_report.md
│
└── tests/
```

Exact implementation language/layout may vary, but preserve these conceptual layers.

---

# 6. Build a machine-readable symbol inventory before building the corpus

For .NET assemblies, enumerate the target public API using reflection or another reliable metadata-inspection method.

Capture, where applicable:

- assembly;
- namespace;
- fully qualified type;
- type kind;
- base type;
- implemented interfaces;
- generic parameters;
- constructors;
- methods;
- overload signatures;
- properties;
- indexers;
- fields/constants;
- events;
- delegates;
- enums and enum members;
- visibility;
- obsolete/deprecation metadata.

Assign stable IDs.

For C++/openNURBS, build the analogous inventory from authoritative API indexes/headers/Doxygen metadata.

The inventory is the basis for determining whether the corpus is **actually complete**.

Do not define completeness as “all downloaded HTML pages parsed successfully.”

Define it in terms of source coverage and API-symbol coverage.

---

# 7. Canonical normalization

Transform official source material into clean semantic documents.

A canonical API document should resemble:

```text
# Rhino.Geometry.Brep.CreateFromLoft

API family: RhinoCommon
Assembly: RhinoCommon.dll
Namespace: Rhino.Geometry
Declaring type: Rhino.Geometry.Brep
Member: CreateFromLoft
Kind: static method

## Signature
...

## Description
...

## Parameters

### curves
...

### start
...

## Returns
...

## Remarks
...

## Exceptions
...

## Version / obsolete information
...

## Related members
...

## Official examples
...
```

This format is illustrative, not mandatory.

Important requirements:

- preserve exact symbol spelling;
- preserve overload distinctions;
- preserve type names;
- preserve parameter ordering;
- preserve default values;
- preserve meaningful documentation;
- normalize formatting consistently;
- preserve code as code;
- identify source language;
- identify API family.

For conceptual guide material, retain its natural instructional structure instead of forcing it into API-reference formatting.

---

# 8. Semantic segmentation, not RAG chunking

Do **not** use arbitrary fixed-size retrieval chunks.

DAPT records should be coherent documents.

Good boundaries include:

- one modest API type;
- one large type broken into logically grouped member sections;
- one method plus its overload family;
- one guide chapter;
- one complete example with explanation;
- one conceptual topic.

Avoid:

- beginning halfway through a method description;
- cutting an example from the API it demonstrates;
- mixing unrelated symbols merely to reach a token target.

If a document exceeds a reasonable model-training record length, split it semantically and preserve parent/sequence metadata.

Do not impose final training sequence length at this stage. Corpus records and eventual packed training sequences are separate concerns.

---

# 9. Deduplication policy

Remove **presentation duplication**, not useful semantic repetition.

Safe candidates for removal/collapse include:

- repeated navigation;
- breadcrumbs;
- identical copyright/footer material;
- repeated table headers;
- automatically repeated inherited-member listings where they add no new information;
- exact duplicate source files;
- exact duplicate examples.

Do not deduplicate merely because two passages explain the same API differently.

Multiple meaningful explanations of the same concept are useful DAPT exposure.

Report:

- exact duplicate count;
- near-duplicate analysis;
- what transformations were applied;
- token reduction caused by deduplication.

No opaque heuristic deletion.

---

# 10. Derived/connective corpus

Only after the canonical authoritative corpus is complete, generate a **separate derived corpus** designed to make relationships explicit.

Useful topics include:

- Rhino geometry inheritance hierarchy;
- Brep topology relationships;
- curves versus NurbsCurve;
- Surface/Brep/BrepFace relationships;
- document geometry versus detached geometry;
- `RhinoDoc` and document tables;
- RhinoObject versus GeometryBase;
- object attributes/layers/materials;
- tolerance semantics;
- intersections;
- transformations;
- meshing;
- SubD;
- display pipeline;
- Rhino event/document lifecycle;
- Grasshopper document/component lifecycle;
- `IGH_Goo`;
- parameters and volatile/persistent data;
- `GH_Structure<T>` and `GH_Path`;
- Grasshopper solution/expiration behavior;
- previews and attributes;
- GH_IO serialization;
- rhinoscriptsyntax ↔ RhinoCommon mappings;
- Rhino Python 3 ↔ .NET interaction;
- RhinoCommon ↔ openNURBS conceptual correspondences;
- RhinoCommon versus native Rhino C++ SDK boundaries.

Derived material must obey these rules:

1. Every technical claim must be grounded in canonical source records.
2. Every generated record must list its canonical source IDs.
3. Do not invent API symbols.
4. Validate every referenced symbol against the inventory.
5. Compile or execute generated code examples where reasonably possible.
6. If validation fails, fix or discard the derived record.
7. Keep this material separate so its eventual training weight can be controlled.

Do not decide yet what percentage of training tokens should be canonical versus derived.

---

# 11. Code validation

Where practical, automatically validate examples.

For C#:

- resolve references against target Rhino 8 assemblies;
- syntax-check/compile examples where they can be compiled outside Rhino;
- distinguish compile failures caused by missing Rhino runtime context from genuine bad API usage.

For Python:

- syntax-check;
- statically validate Rhino/Grasshopper symbol references against the inventory where possible;
- run safe examples inside Rhino only if an execution harness is already available and execution is appropriate.

For C++:

- perform symbol/header validation;
- compile representative material where feasible.

Do not modify official examples merely to make them pass without recording the change.

---

# 12. Coverage validation

Produce an explicit coverage report by:

- source family;
- assembly/library;
- namespace;
- type;
- member;
- overload where practicable.

At minimum report:

```text
symbols discovered
symbols documented
symbols represented in canonical corpus
symbols missing documentation
symbols absent from corpus
source documents acquired
source documents parsed
source documents failed
```

Any missing public symbol/source must appear in an exceptions list with a reason.

Goal:

**Zero unexplained omissions.**

An undocumented public symbol may have only signature/structural information available. Include that rather than silently losing it, and mark it as undocumented.

---

# 13. Prevent version contamination

This is critical.

Automate checks for:

- Rhino 9-only APIs;
- WIP-only APIs;
- Grasshopper 2 APIs;
- symbols newer than the target Rhino 8 build;
- obsolete documentation describing APIs no longer present;
- examples referencing unavailable members.

Records from another version may remain in raw source storage for provenance, but they must not enter the production Rhino 8 DAPT corpus unless explicitly approved.

Include version metadata on records whenever available.

---

# 14. Provenance and licensing

Maintain a machine-readable source/license manifest.

For every source family record:

- owner/publisher;
- source location;
- retrieval date;
- version;
- source hash;
- license/copyright information where available;
- whether redistribution rights have been reviewed.

Do not assume that permission to access documentation means permission to redistribute the resulting corpus or trained model.

This project is preparing internal training material. Preserve enough provenance to permit a separate distribution/licensing review later.

---

# 15. Persistence and resumability

Treat persistence as an engineering requirement.

Maintain:

- `STATE.json` containing current phase, completed work, failures and next actions;
- `WORKLOG.md` containing concise human-readable progress;
- deterministic manifests;
- hashes for raw source files;
- idempotent scripts;
- checkpointed intermediate output.

Flush outputs regularly rather than accumulating important work only in memory.

At least at every major phase transition:

1. write/update state;
2. run integrity checks;
3. commit scripts/manifests/reports to git if the workspace is a git repository;
4. verify that the next session could resume from disk alone.

During large acquisitions/parses, checkpoint periodically rather than waiting until the entire source family finishes.

If Codex context is compacted/restarted, first read `STATE.json`, `WORKLOG.md`, and the latest reports before continuing.

Do not rely on conversational memory for project state.

---

# 16. Tokenize with the actual target tokenizer

After the corpus is complete:

1. Obtain the tokenizer corresponding to the Qwen3.8-27B base used by the oQ6e deployment model.
2. Verify tokenizer compatibility between the upstream base and local quantized model.
3. Tokenize/count the complete corpus.

Report token counts for:

- RhinoCommon API;
- Rhino.UI;
- Grasshopper;
- GH_IO;
- Rhino scripting/rhinoscriptsyntax;
- guides;
- samples;
- openNURBS;
- Rhino native C++ SDK;
- Eto;
- other source families;
- derived/connective material;
- entire corpus.

Also report:

- number of records;
- mean/median record token length;
- p90/p95/p99;
- maximum;
- histogram/distribution of record lengths;
- source-family proportions;
- canonical versus derived totals.

Do not train anything yet.

---

# 17. Produce two corpus representations

Maintain a rich internal representation such as:

```json
{
  "id": "...",
  "api_family": "rhinocommon",
  "source_type": "api_reference",
  "version": "...",
  "symbols": ["Rhino.Geometry.Brep.CreateFromLoft"],
  "provenance": ["..."],
  "text": "..."
}
```

Then produce a minimal training export:

```json
{"text":"..."}
```

Do not throw away the rich metadata merely because the training loader only needs `text`.

---

# 18. Do not create `train.jsonl` / `valid.jsonl` prematurely

First create the authoritative corpus:

```text
canonical.records.jsonl
derived.records.jsonl
full.records.jsonl
training_text.jsonl
```

Do not permanently withhold part of the RhinoSDK from the master corpus.

Train/validation splits are an experimental concern and will be generated reproducibly later from the complete corpus.

The final production DAPT model should eventually be able to see the comprehensive target SDK.

---

# 19. Explicitly out of scope for this phase

Do **not** yet:

- launch DAPT;
- fine-tune Qwen;
- create SFT conversation examples;
- create user/assistant question-answer datasets;
- perform RL/RLVR;
- create MCP behavior demonstrations;
- optimize tool-call behavior;
- tune agent prompts;
- decide which APIs are “most useful” and omit the rest;
- use RAG retrieval chunks as training units merely because they already exist;
- perform aggressive summarization;
- use unofficial community content;
- migrate the target to Rhino 9.

---

# 20. Tests

Add automated tests for at least:

- deterministic record IDs;
- no empty training text;
- no malformed JSONL;
- no exact duplicate IDs;
- no unexplained duplicate records;
- every canonical API record maps to valid provenance;
- every referenced API symbol exists in the target inventory or has an explicit exception;
- version filters work;
- no known Rhino 9/GH2 source contamination;
- normalization does not drop signatures;
- tokenizer can tokenize every record;
- corpus rebuilds deterministically from cached sources.

Where practical, test known sentinel symbols from each major source family to ensure the extraction pipeline has not silently failed.

---

# 21. Completion criteria

Do not declare this task complete until all of the following exist:

- target Rhino 8 environment/version manifest;
- complete source inventory;
- complete assembly/API symbol inventory;
- immutable/cached raw source set;
- reproducible source acquisition scripts;
- normalized canonical documents;
- canonical DAPT corpus;
- separately stored derived/connective corpus;
- provenance data;
- license/source manifest;
- deduplication report;
- API coverage report;
- parsing-failure report;
- version-contamination check;
- exact Qwen tokenizer counts;
- record-length/source-family statistics;
- automated validation tests;
- `STATE.json` showing the corpus-build phase complete;
- final human-readable report.

The final report should answer, plainly:

1. What exactly is included?
2. What exactly is not included, and why?
3. Which Rhino 8 build does this corpus target?
4. How many authoritative source documents were processed?
5. How many API symbols were discovered?
6. How many are represented in the corpus?
7. What omissions/failures remain?
8. How much exact/near duplication was removed?
9. How many Qwen tokens are in each source family?
10. How many canonical tokens exist?
11. How many derived/connective tokens exist?
12. What are the record-length distributions?
13. Is there any detected Rhino 9/GH2 contamination?
14. Can the complete corpus be rebuilt from the repository/scripts?
15. Are there any licensing/provenance issues that should be reviewed before model/corpus distribution?

---

# 22. Final stopping point

When all corpus-generation and validation work is complete:

**STOP. Do not start training.**

Present:

- `reports/final_report.md`
- `reports/coverage.md`
- `reports/corpus_statistics.md`
- unresolved issues, if any;
- paths to the final corpus files;
- recommended next step for constructing an experimental DAPT train/validation recipe.

The next project phase will separately determine:

- temporary train/validation strategy;
- LoRA/QLoRA architecture;
- rank/target modules;
- learning rate;
- sequence packing;
- number of corpus passes;
- checkpoint schedule;
- closed-book evaluation methodology;
- local M5 Max training workflow.

Do not make those training decisions during corpus preparation unless needed to keep the corpus format compatible with the intended trainer.

The corpus itself should be a durable, model-agnostic RhinoSDK knowledge asset that can be rebuilt and reused for future base models.
