---
layout: page
title: "Cloudflare Architecture"
permalink: /blog/topics/cloudflare-architecture/
---

The production architecture for the vivify pipeline. Not immediate — the Python prototype proves the model first. Cloudflare is the target when the prototype succeeds.

---

**The three-layer runtime.** A Cloudflare Worker is a code module deployed to the edge — fixed logic until the next deploy. But it can call outbound URLs and Cloudflare's own storage at runtime, making data and code independently updatable:

- **Worker module** — orchestration logic, deployed infrequently
- **KV store** — logos schemas, model_map.json, operator configs — updated whenever schemas evolve, no Worker redeploy needed
- **Durable Objects** — the inference store; each vivified inference JSON lands here persistently

**Workers can consult an LLM.** A Worker calls the Anthropic API (or any LLM) via fetch at runtime. The API key lives in Cloudflare's secrets vault, never in code. This is what makes the full pipeline viable at the edge:

```
field data arrives at Worker
  → fetch logos schema from KV
  → call Claude with schema + researcher names as context
  → Claude returns tagged inference JSON
  → write vivified structure to Durable Object
  → return beneficial outcome signal
```

**The logos schema update path.** Since Workers fetch the schema from KV at runtime, schema evolution doesn't require code deploys. The update path: edit logos schema locally → publish\_repos (or push to KV) → Workers see updated schema on next request. The Python prototype, the schema files, and the Worker runtime stay decoupled.

**Three independent update cadences.**
- Worker code — rare, deliberate deploys
- Logos schemas in KV — whenever inference store validates a change
- Inference data in Durable Objects — per request

**Privacy by architecture.** Raw sensitive field data enters the ephemeral Worker isolate. The LLM processes it inside that boundary. Only the abstracted vivified structure exits to the Durable Object. Raw content is gone when the isolate tears down — architecturally enforced, not policy. For conflict data: LLM sees field data, produces tension score and inference tags, sensitive source material never touches persistent storage.

**Animal crossing security extension.** An LLM inside a Worker evaluates whether an interaction pattern matches a behavioral baseline before anything proceeds. Security via pattern recognition against known baseline, not rules. Relevant for the animal crossing use case (safe interaction layer for elders and children).

**The model_map.json pattern carries forward.** Capability-based model routing already works in the Python prototype via `config/model_map.json`. In the Cloudflare architecture, model\_map lives in KV. Swapping models is a KV update, not a code deploy.

---

*Part of the [Dimensional Fields](https://robolawyer-tm.github.io) project.*
<!-- llm: claude-sonnet-4-6 | 2026-05-21 | repos/robolawyer-tm.github.io/blog/topics/cloudflare-architecture.md | created — topic page covering Workers, KV, Durable Objects, LLM consultation, privacy boundary, model routing -->

<!-- llm: claude-fable-5 | 2026-07-19 | robolawyer-tm.github.io/blog/topics/cloudflare-architecture.md | rebrand: Semantic Edge -> Dimensional Fields -->
