---
title: "Analogical vs Dialectical Synthesis: Why the Distinction Matters"
description: "LLMs default to Hegelian resolution — thesis, antithesis, synthesis. That's wrong for social science. Here's why we need synthesis without antithesis."
pubDate: 2025-04-07
tags: ["theory", "llm", "social-science"]
---

There's a failure mode that appears reliably when you ask an LLM to help resolve a conflict scenario. It *synthesises*. Thesis meets antithesis, a middle position emerges, everyone compromises a little. Hegel would approve.

The problem is that this is not how human resolution actually works — or should work.

## The Dialectical Trap

Dialectical synthesis assumes that two opposing positions each contain partial truth, and that the resolution lives somewhere between them. In philosophy, this is a useful framework. In social science, it systematically produces outputs that betray the emotionally grounded party in favour of the analytically articulate one.

Consider a conflict where one party has a genuine grievance — documented, felt, real — and the other party has a sophisticated institutional defense. Dialectical synthesis will find a middle. That middle will feel like fairness. It will not be fairness.

The LLM doesn't intend this. It's an artefact of training: billions of tokens of text that demonstrate compromise as resolution, that reward finding common ground, that pattern-match "conflict" to "balanced outcome."

## What Analogical Synthesis Looks Like

The alternative is synthesis *from the thesis* — not synthesis between thesis and antithesis.

In analogical synthesis, the emotionally grounded position is not *opposed* by the analytical position. The analytical power of the right side of the system *supports* the left-side truth. The resolution is not a compromise — it is a better articulation of what the human truth already was.

```
Dialectical:   Thesis ←→ Antithesis → Synthesis (midpoint)

Analogical:    Thesis ← supported by → Analysis
                         ↓
                   Synthesis (the thesis, clarified)
```

This is not a philosophical preference. It has measurable consequences for the output. When we tested early inference pipelines against conflict scenarios, the dialectical mode consistently produced outputs characterised by false equivalence. The analogical mode produced outputs that named the asymmetry directly.

## Building the Guardrail

The practical implication for Vivify's left-side keyword extraction is that the LLM pass needs explicit instruction to *name the asymmetry*, not resolve it.

Keywords like `conflict_asymmetry`, `power_imbalance`, and `resolution_blocker` are not neutral descriptors. They carry direction. They say: *this is the shape of the problem, not the shape of a compromise.*

The rules that govern keyword extraction are not schemas. But they do embed this directional commitment. When the system asks "what does this inference *mean*?", the answer it seeks is the emotionally grounded truth — supported and clarified by analysis, not dissolved into it.

## Why This Is Hard to Maintain

The pressure toward dialectical synthesis is constant, because it *sounds* balanced. Reviewers trust it. It passes the smell test. It is superficially fair.

The work of keeping analogical synthesis intact is the work of keeping the system honest about what the data actually says — even when the data is uncomfortable, asymmetric, and refuses to resolve neatly.

That's the work. It's the reason the left/right duality is the architectural spine of the system, not a metaphor.
