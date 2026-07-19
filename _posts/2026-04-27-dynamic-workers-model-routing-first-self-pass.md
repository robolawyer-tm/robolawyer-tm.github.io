---
layout: post
title: "Dynamic Workers, Model Routing, and the First Self-Pass"
date: 2026-04-27
tags: [vivify, FABRIC, dynamic-workers, model-routing, dimensional-fields, inference, pipeline]
description: "capability-based model routing; pipeline processing its own public text for the first time"
---
**Three milestones today.** The pipeline got smarter about which model it uses, the concept of dynamic workers got its first architectural definition, and — the one that felt like something — the vivify pipeline processed the site's own public text for the first time. The system read itself.

The self-pass is the milestone I'll remember. Everything else was infrastructure.

Text below is LLM output with inferential guidance (except this).

---

**Model routing is live** — no more hardcoded model strings in the pipeline.

- `config/model_map.json` maps capability labels to model IDs: `prose_reconstruction`, `semantic_extraction`, `keyword_normalization`
- `resolve_model()` in `lib/vivify_core.py` reads the map at call time — one line to swap models as better ones ship
- `vivify.py` and `reify.py` now call `resolve_model("semantic_extraction")` and `resolve_model("prose_reconstruction")` respectively
- All current capabilities point to `claude-sonnet-4-6` — the structure is live, the routing is trivial to change
- When `prose_reconstruction` moves to Opus, nothing in the pipeline changes except one line in a JSON file

This is the first step toward dynamic workers: a worker that declares what capability it needs, not which model it uses.

---

**Dynamic workers rationalized as a concept** — the Cloudflare analogy landed the architecture.

- Cloudflare Dynamic Workers: code provided at runtime → V8 isolate → sandboxed execution → torn down after
- Semantic dynamic workers: semantics provided at runtime → LLM call → constrained by rules and data slices → ephemeral execution
- Instead of `code → worker`, the pattern is `semantics → transient agent`
- The worker spec carries a capability requirement, not a model name — the runtime resolves it
- `reify.py` is already a proto-dynamic-worker: takes a semantic slice, a prompt, a resolved model, produces prose, discards the call
- What makes it not yet dynamic: fixed prompt shape, fixed model, same rules every time — a true dynamic worker selects all three at invocation time

JSONL was identified as the natural inter-worker transport format — append-only, one record per line, no file-level locking. Deferred until the worker component is fully rationalized.

---

**The first self-pass** — the pipeline ran on the Mission section of the public site.

The Mission section text was extracted from `index.html`, stripped of HTML, and fed into the vivify pipeline. Keyword extraction was done inline (API key routing not yet resolved for standalone use), producing `inf_65ae7310`:

- `semantic_core`: analogical_synthesis, logos_empathy_base, felt_meaning, empathy_native_output
- `outcome_model`: beneficial_outcome_prediction, conflict_data_modeling, functional_model_construction
- `pipeline_evolution`: mid_inference_memory, self_evolving_rules, live_worker_refinement
- `duality_framework`: semantic_digital_duality, synthesis_without_antithesis

The reify pass was then run inline — reconstructing prose from the vivified structure and comparing it against the existing Mission text. The reified version was tighter and more direct, particularly on the synthesis distinction. That comparison became the editorial signal for the site rebuild.

The human role in this pass: judge the output. The system produced the editorial signal; the human decided what to keep.

---

**The site rebuild followed from the self-pass.**

- `llms-full.txt` rewritten as the canonical master document — six sections, new order, prose sharpened by the vivify pass
- `index.html` rebuilt from the master — TOC, Dimensional Fields™ heading, updated roadmap
- `llms.txt` updated to match
- Section order: Mission → Applications → Vivify → Network → What's Built → Social Neurology
- Roadmap now shows inference pipeline and model routing as ✅ Complete

---

**Two housekeeping rules set.**

- Doc standard: supporting bullets now min 1, max 25 — the previous 3–6 range was too restrictive for public prose
- Legal exclusion: legal content stays out of the inference corpus until explicitly lifted; scope is social science and tech only

---

*Part of the [Dimensional Fields](https://robolawyer-tm.github.io) project — local-first, privacy-preserving, human-centric.*

<!-- llm: claude-sonnet-4-6 | 2026-04-27 | repos/robolawyer-tm.github.io/_posts/2026-04-27-dynamic-workers-model-routing-first-self-pass.md | created — session milestone post, dynamic workers, model routing, first self-pass -->

<!-- llm: claude-fable-5 | 2026-07-19 | robolawyer-tm.github.io/_posts/2026-04-27-dynamic-workers-model-routing-first-self-pass.md | rebrand: Semantic Edge -> Dimensional Fields -->
