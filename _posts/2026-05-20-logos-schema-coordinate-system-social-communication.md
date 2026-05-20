---
layout: post
title: "The Logos Schema: A Coordinate System for Social Communication"
date: 2026-05-20
tags: [logos, signify, schema, social-structure, speech-acts, JSON, Dunbar]
---
**Today we built the first sparse coordinate system for social communication: the logos schema.** Not a taxonomy, not a framework borrowed from another discipline — coordinates. Seven dimensions. All null until an inference lands. The schema is designed to be deformed by the data, not the other way around.

Text below is LLM output with inferential guidance (except this).

---

**Why this scale.**

The zone between an individual and nearby society — family, friends, local community — is where the most genuine communication happens. Below this, it becomes individual psychology. Above it, language has already been through the institutional processing that sanitizes it: laws, journalism, organizational records are the outputs of that process, not the thing itself.

The most JSON-compatible frameworks for this pre-institutional scale turn out to be the ones that treat language as action rather than content: Speech Act Theory (Austin, Searle), Grice's Cooperative Maxims, and Mary Douglas's grid/group structural axes. These are abstract enough to describe communication without specifying what is communicated. Small taxonomies that compose into complexity rather than baking complexity in from the start.

---

**What the schema covers: `signify`**

The first component is called `signify (functional communication)` — the explicit, verbal, intentional layer of social communication. Its seed schema (`logos_schema_v01.json`) has seven coordinate axes:

- **act_type** — what the utterance does: assertive, directive, commissive, expressive, or declaration (from speech act theory)
- **transmission** — how it moves: broadcast, leak, or archive
- **resonance** — the emotional field it creates: harmony, friction, or illusion
- **authority** — what power it draws on: sovereign, tribal, or occult
- **utility** — what it's functionally for: instruction, narrative, or currency
- **cooperative** — whether Grice's maxims are honored, violated, or suspended; violation generates implicature — meaning beyond the words
- **social_field** — Douglas grid/group as two 0.0–1.0 axes: degree of rule constraint and degree of group identity

The gap between *honored* and *violated* in the cooperative dimension is where the divergence operators will eventually live — meaning generated in the space between what is said and what is meant.

---

**What the schema explicitly does not cover.**

Most communication is silent. Bodily state, emotional field, unintentional affective transmission — the vibe that operates below speech and drives local social environments without anyone intending it. The `signify` schema cannot address this. A separate social neurology component (already partially in development in pillars) is meant to house it.

The gap between what `signify` captures (explicit) and what social neurology operates (implicit) is exactly where the most significant social signals live. The tension layer measures that gap.

---

**The social container model.**

A second schema (`logos_social_v01.json`) layers the signify dimensions inside a Dunbar group-size structure — the empirically established thresholds at which social bond type and communication pattern shift: 1 (self), 5 (intimate), 15 (sympathy group), 150 (village), 500 (culture), and 1500 (society), with religion sitting outside the size hierarchy entirely.

Each layer carries pre-filled signify coordinates as hypotheses — concrete predictions about what communication looks like at that scale. At the culture threshold (500), cooperative status flips from *honored* to *violated* and resonance becomes *illusion*: this is where the status quo operator begins to operate structurally. At society (1500), transmission is *archive*, authority is *sovereign*, and resonance is *friction* — the pre-institutional communication described by the signify dimensions has been fully processed into its institutional form.

Each layer also carries:
- `tension` as a derived field (computed from signify × social_neurology, not primary input)
- `operators: []` — a structured slot ready to receive operator references as the pipeline develops
- `_inferences: []` — evidence accumulates here as the inference store grows, making the deformation process auditable

---

**The status of these schemas.**

Both files carry `_meta.status: "hypothesis — designed to be deformed by the inference store"`. The thin sourcing (Benedict at culture, Machin's affective_field values) is intentional. Evolution is the quality control mechanism — weak structure gets selected out as the inference store grows. The schema is the genome; real inferences are the selection pressure.

The files are live at [wholesystemsmodel.org](https://wholesystemsmodel.org/repos/pillars/logos/).

---

*Part of the [Semantic Edge](https://robolawyer-tm.github.io) project — local-first, privacy-preserving, human-centric.*

<!-- llm: claude-sonnet-4-6 | 2026-05-20 | repos/robolawyer-tm.github.io/_posts/2026-05-20-logos-schema-coordinate-system-social-communication.md | created — logos schema post: signify component, seven dimensions, Dunbar social container, tension as derived -->
