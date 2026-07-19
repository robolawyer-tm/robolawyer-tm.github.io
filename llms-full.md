# robolawyer-tm — Full Content

> Complete text of https://robolawyer-tm.github.io/ for deep AI indexing.
> Last updated: 2026-04-13

---

# Pillars — Architectural Vision

> _Modeling beneficial social outcomes through schema-free semantic data, local-first computation, and human-centric security — all running on the hardware you may already own._

---

## The Mission: Analogical Synthesis for Social Benefit

The system goal is to develop semantics that work with conflict data — to predict beneficial outcomes from constructed functional models, dynamically, privately, and (preferably) on local hardware.

The answer requires bridging two fundamentally different ways of understanding the world:

```
┌──────────────────────────────┐     ┌──────────────────────────────┐
│    LEFT: SEMANTIC SIDE       │     │    RIGHT: DIGITAL SIDE       │
│    ──────────────────        │     │    ───────────────────       │
│    Analogical "Logos"        │     │    Analytical Precision      │
│    Emotion, intuition,       │     │    Code, organization,       │
│    felt meaning              │     │    data structures           │
│    "What does this MEAN?"    │     │    "How do we PROCESS this?" │
│    ───────────               │     │    ────────────              │
│    The human side            │     │    The machine side          │
│    The heart                 │     │    The stone                 │
└──────────────┬───────────────┘     └───────────────┬──────────────┘
               │                                     │
               └─────────────┬───────────────────────┘
                             │
                  ┌──────────▼────────────┐
                  │   FUNCTIONAL MODEL    │
                  │ Predicting Beneficial │
                  │       Outcomes        │
                  └───────────────────────┘
```

**Left (Semantic):** The analogical side — _logos_ in its fullest sense. Language as communication, definition, and stored knowledge: the highly flexible, evolved structure through which human thought has always organized itself. LLMs participate here through **analogical synthesis**: processing vast token receptions, perceiving semantic patterns, and producing coherent sense-making that mirrors human intuition.

**Right (Digital):** The analytical side — purely mathematical, objective. Code, analytics, filesystem organization, pattern detection pipelines. Precise, excellent at reduction and structure, but limited in analogical depth without the left side's guidance.

**Analogical synthesis — not dialectical:** The desired output is analogical: rooted in human emotion, empathy-native, built for felt meaning. This is **synthesis from thesis without antithesis** — not Hegelian resolution. The analogical left-side truth is _supported_ by the right side's analytical power, not opposed and resolved. This duality is the **architectural spine** of the entire ecosystem.

---

## Vivify: The Schema-Free Semantic Data Engine

At the center sits **Vivify** — a semantic data engine that handles information without pre-defined schemas. Inspired by Perl's autovivification (dynamic hash-of-hashes creation), Vivify lets data structures come to life as needed, capturing emergent complexity without database migrations or rigid taxonomies.

### How It Works

Data enters as **inferences** — atomic units of text with no pre-assigned categories.

**Left-LLM Semantic Pass** — An LLM reads each inference and extracts 8–12 **keyword clumps** that feel central to the meaning. No external ontologies. Keywords emerge from felt meaning: `conflict_asymmetry`, `resolution_focus`, `therapeutic_potential`, `emotional_truth`.

**Keyword Co-occurrence** — Across all inferences, keywords that frequently appear together form natural clusters. Dense regions in this co-occurrence graph become **emergent categories** — purely bottom-up.

**Autovivified Structure** — Categories become filesystem paths (3–4 layers deep), deeper data lives in JSON:

```
inferences/
├── conflict_resolution/
│   ├── misrepresentation/
│   │   └── stressed_perception/
│   │       └── inf_123.json
│   └── resolution_focus/
│       └── adaptive_compromise/
│           └── inf_456.json
├── therapeutic_prediction/
│   └── beneficial_outcomes/
│       └── ground_truth_outcome/
│           └── inf_789.json
└── index.json   # Master co-occurrence map
```

**Dual-View Storage** — Each inference maintains separate left (semantic) and right (digital) keyword lists:

```json
{
  "id": "inf_123",
  "raw_text": "...",
  "left_keywords": ["conflict_asymmetry", "emotional_truth", "therapeutic_potential"],
  "right_keywords": ["json_indexing", "pattern_detection", "similarity_clustering"],
  "clumps": {
    "conflict_resolution": ["conflict_asymmetry", "resolution_focus"],
    "therapeutic_signal": ["emotional_truth", "therapeutic_potential"]
  },
  "category_paths": ["conflict_resolution/therapeutic_signal"]
}
```

### Vivify Rules

- **No external taxonomies** — All categories emerge from local keyword patterns
- **No domain assumptions** — System accepts any scenario as raw text
- **Keywords from felt meaning** — Concept-level tokens, not surface words
- **Graph-based emergence** — Category seeds are high-degree, high-weight keywords
- **Multi-assignment** — Inferences may belong to multiple category paths
- **Iterative refinement** — New inferences can create new seeds, split or merge old categories
- **Guardrails, not schemas** — Constraints shape _how_ categories form, never import foreign taxonomies

### The FABRIC Model

```
FABRIC (always JSON for consistency + recognizability)
├── UPDATE / CREATION
│   ├── Input (Graphical UI or Curses CLI)
│   ├── Vivify (build un-schema'd JSON, hash of hashes)
│   ├── Secrecy (encrypt secrets)
│   ├── Freeze (serialize payload → prepare for IP send)
│   └── Server (strip layers, store JSON + binary blobs)
└── RETRIEVAL
    ├── Input → name, app/topic, depth traversal
    ├── Return (encrypted payload or structure subset)
    └── Client (reverse creation process → display)
```

The filesystem _is_ the database. No opaque binary formats. Backups are `cp`. Migrations are `mv`.

---

## The Supporting Pillars

### 1. Secrecy — Human-in-the-Loop Security

- Server-side PBKDF2-HMAC-SHA256 encryption
- WiFi hotspot password + manual `w3m` browser confirmation for new device pairing
- SSH key-based auth — no separate API keys
- All communication through encrypted SSH tunnels

### 2. Payload Persistence — The Filesystem is the Database

- Human-readable JSON files on Android filesystem
- Paths like `db/{username}/{app_name}/secret.json`
- No database engine to fail. Data is just files — recoverable with standard Unix tools.

### 3. Server — Hardened Mobile Edge

- Professional-grade Flask engine on Android/Termux
- Auto-start, wake-lock, SSHFS laptop-as-IDE
- The phone as DataServer (Hub) in a star topology — no cloud needed

### 4. Design Philosophy — Structure → Process → Validation

```
1. Define the TARGET FILE STRUCTURE first (non-negotiable)
2. Write PROCESS documentation that explicitly references that structure
3. Include VALIDATION CODE so correctness can be checked at any point
```

---

## The Schema-Free Prototype: Star-Bridge Topology

The **star-bridge** project is the physical realization of the Vivify engine — schema-free data persistence on hardened mobile hardware, connected through SSH mesh networking.

### Current Model (Star Topology)

```
     Edge device
        / | \
       /  |  \
 Device Device Phone
```

- **star-bridge** manages SSH connections between a Linux admin box and Android phones
- **secret-server** runs on each phone as a hardened Flask application in Termux
- Data flows through encrypted SSH tunnels; filesystems mount via SSHFS
- Zero cloud dependencies

### Vision (Mesh Topology)

```
            Phone Phone Phone
              \     |      /
               Edge device
               /          \
    Edge device -----------Edge device
       / | \                  / | \
 Phone Phone Phone      Phone Phone Phone
```

Core Principles: Zero Commercial Platforms, Pure P2P Discovery, SSH Tunneling, Resilient Chains.

---

## Social Neurology: The Communication Stack

A core theoretical contribution of this project is the **Social Neurology Framework** — a model that explains how pathological control behaviors propagate through institutions without requiring conscious coordination. The TCP/IP stack provides the structural analogy.

```
LAYER 4 — INSTITUTIONAL ENCODING
         Laws, court procedures, HR policy, academic curricula
         (persists after the drives that created it have moved on)
              ↑
LAYER 3 — IDEOLOGICAL MIDDLE
         Liberation language, protective framing, academic theory
         (control drives recruiting legitimate expression)
              ↑
LAYER 2 — SOCIAL/RELATIONAL
         Group formation, cohort behavior, lateral alliances
         (the physical layer carrying the signal)
              ↑
LAYER 1 — NEUROLOGICAL SUBSTRATE
         Dominance drives, status competition, control need
         (operates below conscious reasoning)
```

**KEY INSIGHT:** Each layer is invisible to the layers above it. Unconscious dominance drives do not know they are producing what looks like principled legal argument at Layer 4.

### Why Institutions Produce Identical Outputs Without Coordination

The framework resolves a question unified conspiracy theories cannot: how do people who have never met, in different institutions, across different decades, produce nearly identical control behaviors and legislative language?

The answer is shared formation at Layer 1 and 2, not communication at Layer 3 or 4. Graduate programs, activist networks, and professional cohorts transmit a layer-level formation — a way of perceiving threat and exercising control — that produces convergent outputs without explicit coordination. The correlation is real. The mechanism is resonance, not conspiracy.

This maps onto what René Thom described in catastrophe theory: systems with completely different local dynamics can produce identical large-scale discontinuous changes. The math describes the shape of the outcome space, not the causal chain.

---

## The Polarization Signal: Bell Curve to Rabbit Ears

Healthy institutional populations follow a normal distribution — common wisdom rising in the majority middle. Sustained ideological capture produces a **rabbit ears distribution**: two tail populations grow, the middle loses institutional voice, policy is driven by whichever tail is most organized.

```
Healthy distribution:
         ▲
        ╱│╲
       ╱ │ ╲
      ╱  │  ╲
─────╱───┴───╲─────
fringe  majority  fringe
majority voice is heard

Polarized distribution:
  ▲           ▲
 ╱│╲         ╱│╲
╱ │ ╲___,___╱ │ ╲
──┴───────────┴───
tail  silenced  tail
      majority
busy tails drive policy
```

This matters because the tail produces the cleanest signal. Legislative documents from a highly motivated ideological tail contain Layer 1 drives expressed with minimal attenuation through Layers 2 and 3. The divergence between that signal and the middle's common wisdom is measurable in the text — exactly what the Vivify engine is built to detect.

---

## Non-Verbal Distal Communication

Non-verbal communication is well-established as the majority of human communication in proximate settings. This project extends the observation to **distal communication** — the emotional and neurological signal carried in formal text across time and distance, between people who never share a room.

A legislative document carries the emotional signature of the Layer 1 drives that produced it. Court language encodes dominance behavior that the writer would consciously deny. These signals are recoverable from the text — as the NotebookLM proof-of-concept demonstrated by predicting adversarial moves from conflict documents before they occurred.

The mathematical structure of quantum entanglement offers an analogy (not a literal mechanism): correlation between distant states that cannot be explained by local hidden variables. The social equivalent is cohorts producing convergent institutional outputs through shared layer-level formation rather than detectable communication signals.

---

## The Long-Term Vision: Beneficial Outcomes as Functional Art

The convergence of this project's threads points toward something more precise than "a therapeutic tool." The target output is better described by what Art does — and why that is not a metaphor.

Art is the technology humans evolved — before writing, before law, before capital — for transmitting non-verbal distal signal across time and distance with no shared language or culture. A cave painting communicates something about human experience to someone 30,000 years later. It works because it operates at Layer 1 of the social neurology stack — below language, below ideology, at the substrate where human experience is held in common.

What a great work of Art does is hold irresolvable tension in a form a human can inhabit and be changed by. Not problem solved. Person changed.

```
FLATTENING SYNTHESIS (what LLMs default to):
  Conflict input → pattern completion → smoothed resolution
  Result: the tension is dissolved. Nothing new exists.

HEGELIAN SYNTHESIS (the target):
  Thesis (testimony/ground truth) + Antithesis (conflict text)
      → something neither side could see from inside the conflict
  Result: a navigational output. Where to step next. Person changed.

FUNCTIONAL ART (the output register):
  Holds the tension without resolving it prematurely
  Stays with the specific human rather than the general pattern
  Operates at Layer 1 — felt before it is understood
```

Dimensional Fields is, at its deepest level, a machine for reading the art that people make involuntarily when they are in conflict — and returning a navigational output in the same register.

### How It All Connects

```
Social Neurology Stack (The Theory)
    — Layer 1-4 model of how control propagates without coordination
    — Rabbit ears polarization as the measurable institutional signal
    ↓
Semantic-Digital Duality (The Framework)
    — Left: logos, empathy, felt meaning, beneficial outcome definition
    — Right: analytical support, pattern detection, persistence
    ↓
Vivify Engine (The Data Model)
    ├── Autovivified schema-free structure
    ├── Left/right dual-keyword extraction
    ├── Emergent category co-occurrence
    └── YTDMSP: inter-inference intuition persistence
    ↓
Star-Bridge Prototype (The Physical Realization)
    ├── Private SSH mesh — court documents never touch cloud
    └── Local-first sovereignty over sensitive corpus
    ↓
Conflict Corpus (The Training Signal)
    ├── Conflict text (antithesis) — adversarial assertions
    ├── Refutation testimony (thesis) — ground truth under cross-examination
    └── Divergence between them = the measurable signal
    ↓
Beneficial Outcome Predictor (The Target)
    — Navigational output in the Art register
    — Not "who was right" but "where is the human and what is the path"
```

### The Inference Pipeline

1. **Left (Semantic) Pass:** Extract keyword clumps based on felt meaning — `conflict_asymmetry`, `resolution_focus`, `emotional_truth`, `therapeutic_potential`
2. **Right (Digital) Pass:** Extract structural keywords — `json_indexing`, `pattern_detection`, `similarity_clustering`
3. **Tension Measurement:** High left/right divergence marks where digital systems most betray analog human truth — prime zones for therapeutic intervention
4. **Prediction:** Emergent category patterns across many inferences reveal which configurations predict beneficial outcomes vs. harmful escalation

### Conflict as Universal Testbed

The system models conflict objectively, without domain-specific assumptions:

- **Positions** that don't align
- **Contexts** that constrain outcomes
- **Outcomes** better or worse for different perspectives
- **Resolution patterns** — not "justice" but movement toward something liveable

Generic conflict keywords: `conflict_asymmetry`, `misrepresentation`, `resolution_blocker`, `power_imbalance`, `context_blindness`, `reconciliation_potential`. The structure bottles the pattern recognition, not the politics.

### Distilled Essence Persistence (YTDMSP)

A key insight: LLMs perform analogical synthesis _during inference_ but discard it post-response. The Yet-To-Define Memory/Storage Paradigm captures the **distilled essence of ephemeral intuition** — analogous to a therapist's case notes, not the session transcript, but the clinician's own reasoning about what they are observing:

- **Attention snapshots** from mid-inference reasoning chains
- **Analogy chains** detected across sessions — accumulated judgment, not retrieved facts
- **Emotional valence gradients** quantified from conflict text
- **Common sense emergences** captured as graph nodes before they dissipate

This persistent intuition reservoir transforms one-shot analysis into lifelong pattern recognition — the cross-session depth that makes prediction possible rather than merely description.

---

## Application: Justice Systems and Conflict Resolution

Family court and civil justice systems are the primary documented testbed for Dimensional Fields's conflict corpus — and a significant potential application domain.

### Why Justice Systems Are the Right Starting Point

- **Clean data.** Court text is timestamped, attributed, and formally registered. Ground truth is documented under cross-examination — rare in conflict datasets.
- **Documented divergence from science.** Current developmental research on paternal involvement and child welfare is well-established in the NIH literature. Where court procedures contradict this evidence base, the divergence is measurable and citable.
- **Systemic pattern, not individual error.** Identical outcomes across fathers in a given jurisdiction — regardless of individual circumstances — is a Layer 4 institutional signal. The system operating as designed by its Layer 3 formation.
- **Children as the measurable outcome variable.** Child stability, contact continuity, and mental health outcomes provide a child-centered, scientifically grounded definition of "beneficial."

### The Evidence Base the System Ignores

Decades of NIH-supported research establish that active father involvement is independently protective against adolescent depression, risk-taking, and self-harm. Paternal marginalization is a documented risk factor. The evidence base is not contested. Its application in court is.

Legislative efforts to make coaching and parental alienation testimony inadmissible — framed as protective measures — operationalize a Layer 3 framework that structurally precludes certain evidentiary categories regardless of merit. The text of such legislation, analyzed through the Vivify engine's left/right dual pass, carries a measurable Layer 1 signal. It is recoverable from the language.

### Income Path: From Personal Corpus to General Tool

The justice application is both the founding use case and a viable income path — because the problem is not rare. A tool that:

- Reads conflict text and identifies the Layer 1-4 signal driving it
- Predicts adversarial moves before they materialize (as demonstrated in proof-of-concept)
- Generates navigational output — not legal advice, but pattern recognition the individual can act on
- Operates privately on local hardware with zero cloud exposure of sensitive documents

...addresses a gap no current tool fills. Legal AI tools are built for lawyers navigating procedure. This tool is built for humans navigating conflict — with the science of beneficial outcomes as its compass.

The broader application extends to workplace dispute resolution, mediation support, and institutional accountability documentation. Justice is the testbed. The tool generalizes.

---

## Technology Stack

| Component | Technology |
|-----------|------------|
| **Core Language** | Python 3 |
| **Web Framework** | Flask |
| **Encryption** | SSH/OpenSSH, PBKDF2-HMAC-SHA256 |
| **Filesystem Mounting** | SSHFS |
| **Terminal Browser** | w3m |
| **WiFi Management** | NetworkManager (nmcli) |
| **Android Environment** | Termux + Termux:Boot |
| **Data Storage** | JSON over filesystem (autovivified) |
| **Version Control** | Git |
| **AI Assistance** | Claude, Perplexity, Gemini, Copilot |

---

## Key Achievements

- **Hardened Android Userspace** — Reliably operates within Android's extreme syscall restrictions
- **Local-First Data Sovereignty** — Zero cloud dependencies; all data stays on participant hardware
- **Autovivification Engine** — Schema-free data vivification proven in production
- **Human-in-the-Loop Security** — Physical proximity and manual confirmation replace cloud-based trust
- **Unified Admin Workflow** — SSHFS mount bridges mobile execution and laptop-based development
- **Semantic-Digital Framework** — Left/right duality formalized for systematic inference processing
- **Objective Data Constructs** — Bottleable, machine-repeatable left-side processes defined
- **Social Neurology Framework** — Layer 1-4 model of institutional control propagation
- **Proof-of-Concept Prediction** — Adversarial moves predicted from conflict documents before occurrence

---

## Project Roadmap

| Phase | Focus | Status |
|-------|-------|--------|
| **Foundation** | Secure vault, SSH tunneling, SSHFS, auto-start | ✅ Complete |
| **Autovivification MVP** | Secret manager with deep_update, schema-free storage | ✅ Complete |
| **Inference Organization** | Keyword-clump extraction, emergent categories, search paths | 🔄 In Progress |
| **Mesh Networking** | Phone-to-phone bridging, peer discovery, routing & failover | 📋 Planned |
| **Therapeutic Modeling** | Left/right tension scoring, beneficial outcome prediction | 📋 Planned |
| **Local LLM Integration** | Feeding Vivify structures into localized AI for real-time prediction | 📋 Future |
| **Notation Tooling** | Interactive process flow viewer, structure validators | 📋 Future |

---

## Repository Links

- [**star-bridge**](https://github.com/robolawyer-tm/star-bridge) — SSH admin connection manager, phone discovery, mesh networking
- [**secret-server**](https://github.com/robolawyer-tm/secret-server) — Hardened Flask app, autovivification storage, web UI
- [**pillars**](https://github.com/robolawyer-tm/pillars) — Architectural vision and design philosophy

---

_© robolawyer-tm • Local-first • Privacy-preserving • Human-centric_
