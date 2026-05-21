---
layout: page
title: "Operators: Theory to Code to LLM"
permalink: /blog/topics/operators/
---

A researcher's theoretical insight is the analog side. A Python function implementing it is the digital side. The operator is the bridge. The LLM keeps it alive.

---

**What an operator is.** The vivify pipeline has two kinds of operators. Pipeline operators — vivify.py, right\_pass.py, tension\_score.py, categorize.py — transform data as it moves through FABRIC. Semantic operators — status quo, omission, reframing, inversion, temporal displacement, category collapse — describe patterns the pipeline detects in field data. The two levels are distinct: pipeline operators run the pipeline; semantic operators are what the pipeline finds.

**The theory-to-code bridge.** Each semantic operator encodes a researcher's theoretical insight as a callable function. Grice's cooperative maxims → `grice_operator.py`, which detects when maxims are violated in field data. Douglas's grid/group → `douglas_operator.py`, scoring field data on those axes. The status quo pattern from DNA exoneration cases → `status_quo_operator.py`. The researcher's analogical insight becomes a digital computational process. The operator is the translation layer.

**Why `_src` fields are operational, not bibliographic.** The researcher names in `logos_combined_v01.json` — `_src: ["grice", "douglas", "searle"]` — are not just citations. They are query seeds for LLM consultation at inference time. A Cloudflare Worker sends those names as context anchors when calling the LLM. The LLM doesn't just apply Grice's four maxims as coded — it brings everything it knows about Grice, neo-Gricean extensions, relevance theory, politeness theory, critiques — because that's all in training.

**Two parallel update paths.**

- **Code path** — operator functions, schema versions, KV updates — deliberate, manual, controlled
- **Theory path** — researcher names sent as LLM context every inference run — automatic, living, no schema update needed as scholarship develops

A coded `grice_operator.py` applies a fixed 1975 version of the theory. An LLM consulted with "Grice" as context applies a living version. The logos JSON holds the structure; the LLM holds the theoretical depth. The inference store validates: it tests whether theoretically-informed output holds up across cases.

**Why functional JSON specifically.** The functional schema describes what communication *does* — exactly where pragmatics, speech act theory, and grid/group analysis operate. The LLM's associative strength works on meaning, not geometry. Researcher names belong in the functional side because theory is about meaning.

**The `operators: []` slot as routing table.** In `logos_social_v01.json`, each social layer carries `operators: []`. This becomes a routing table: at `society`, status\_quo\_operator and sovereign\_authority\_operator run. At `intimate`, grice\_cooperative and resonance operators run. The logos schema drives which theoretical lenses the pipeline applies at each social scale.

**The autovivification connection.** The null defaults and `_inferences: []` arrays in the logos schemas are already doing what ES6 Proxy does: the path exists before the data does. The schema defines access structure; the inference store fills it by touching it. The `_relationship.generative_questions` block in `logos_combined_v01` are get traps waiting to be accessed — the inference store vivifies them by answering them. A future `_resolved` field per generative question would make the transition from open to answered auditable.

---

*Part of the [Semantic Edge](https://robolawyer-tm.github.io) project.*
<!-- llm: claude-sonnet-4-6 | 2026-05-21 | repos/robolawyer-tm.github.io/blog/topics/operators.md | created — topic page covering pipeline vs semantic operators, theory-code-LLM bridge, _src as query seeds -->
