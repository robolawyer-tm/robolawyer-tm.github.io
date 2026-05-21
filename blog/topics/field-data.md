---
layout: page
title: "Field Data & the Inference Store"
permalink: /blog/topics/field-data/
---

Field data is the raw input. The inference store is what the pipeline builds from it. Neither term is accidental — both do user-facing work that "corpus" and "dataset" cannot.

---

**Field data.** Raw text collected from specific social fields — legal, family, medical, workplace, community — in real-world conditions. Unsanitized, uncontrolled, from actual situations. Not surveys collected *about* people by organizations with interests. Data *from* the field, where the people experiencing the situation already are.

When people in difficult situations encounter the term, they recognize it immediately: "that's the actual family interaction data," "that's the testimony that got ignored," "that's what's actually happening here." This creates ownership at the input level before anyone understands how the pipeline works. It signals what the project is not: not institutional records, not sanitized outputs, not data that has already been through the processing that failed the person.

**Fields.** The huge subcategories of connected world issues — legal field, family field, medical field, educational field. Each has its own internal logic, power dynamics, and actors (Bourdieu's social fields). Each field generates its own field data with its own baseline confidence characteristics. The pipeline's operators and logos coordinates remain universal across all fields; the field data is what varies.

**The inference store.** What the pipeline builds from field data: processed, structured, autovivified JSON. Not a corpus (wrong connotations — implies representative statistical sample, NLP conventions). Not a dataset (implies fixed, collected). The inference store is a store of reasoned positions — each inference a structured claim about what the field data means, tagged with logos coordinates and tension scores.

The inference store is also the selection environment for the schema. As it grows, weak schema structure gets displaced. Validated structure earns its place. The store is both output and quality control.

**The pipeline named end to end:**

```
field data (input)
  → vivify pipeline
  → inference store (output)
```

**Baseline confidence.** Each field has different baseline characteristics: legal field data from DNA exoneration cases has high baseline confidence (physical evidence, not testimony). Family court data has its own baseline. The divergence operators run against that baseline — the gap between what the baseline shows and what the institutional record says.

**The prototype dataset.** A court case with testimony: a baseline established by the user, significant deviation from that baseline on record from the other party. Described as "an unusually pure dataset of impurity" — maximally structured conflict, sworn, documented, with clear parties and positions. Legal domain as training ground because it is the most documented form of human conflict; the model generalizes from there to all social conflict. The goal is social science that anyone can use — not a legal product.

---

*Part of the [Semantic Edge](https://robolawyer-tm.github.io) project.*
<!-- llm: claude-sonnet-4-6 | 2026-05-21 | repos/robolawyer-tm.github.io/blog/topics/field-data.md | created — topic page covering field data naming, inference store, fields, baseline confidence, prototype dataset -->
