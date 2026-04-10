---
title: "Why the Filesystem Is the Database"
description: "On the radical simplicity of using JSON files on a local filesystem instead of a database engine — and what we gain from that choice."
pubDate: 2025-04-01
tags: ["vivify", "local-first", "architecture"]
---

The first question anyone asks when they see Vivify is: *why not just use SQLite?*

It's a fair question. SQLite is excellent, battle-tested, and ships everywhere. But it misses something fundamental about what this system is trying to do.

## The Audit Problem

When you store data in SQLite — or any database engine — you introduce an intermediary. Your data is no longer *your data* in the plain sense. It lives inside a binary format that requires a specific tool to read. You can't `cat` it. You can't `grep` it. You can't recover a single record with `cp`.

With Vivify, every inference is a JSON file at a readable path:

```
inferences/
└── conflict_resolution/
    └── misrepresentation/
        └── inf_123.json
```

Any text editor opens it. Any Unix tool processes it. The structure *is* the index.

## Autovivification as Philosophy

Perl programmers will recognise the term. In Perl, accessing a nested hash key that doesn't exist *creates* it — the structure vivifies itself on demand. No `CREATE TABLE`. No migrations. No schema negotiation.

This turns out to be exactly right for social science data. You don't know in advance what categories will emerge from a conflict corpus. You can't pre-define the taxonomy. The categories need to *grow* from the data — and the filesystem, being a tree, is the most natural representation of that growth.

```json
{
  "id": "inf_123",
  "left_keywords": ["conflict_asymmetry", "emotional_truth"],
  "right_keywords": ["json_indexing", "pattern_detection"],
  "category_paths": ["conflict_resolution/misrepresentation"]
}
```

## What We Give Up

Nothing is free. The filesystem-as-database trades:

- **Query language** — no `SELECT WHERE`. Navigation is path traversal + `index.json` lookups.
- **Transactions** — file writes are not atomic across multiple files. The system is designed around this: each inference is one file, one write.
- **Scale** — at millions of records this gets slow. But we're building a therapeutic modeling tool for human-scale situations, not a web crawler.

## What We Gain

- **Sovereignty** — the data belongs to whoever holds the hardware. No cloud, no vendor lock-in, no API to revoke access.
- **Transparency** — every researcher on the project can audit every stored inference with zero tooling.
- **Resilience** — backups are `rsync`. Recovery is `cp`. Migration is `mv`.
- **Portability** — the entire database fits on an Android phone running Termux.

> "The filesystem *is* the database. No opaque binary formats. Users can audit their data with any text editor."

That sentence in the architecture document isn't a compromise. It's a design goal — one that shapes everything downstream.
