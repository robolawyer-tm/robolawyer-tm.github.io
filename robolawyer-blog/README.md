# robolawyer-tm — Pillars Site + Blog

Astro static site matching the design of the hand-crafted `index.html`.

## Structure

```
src/
├── styles/global.css          ← all design tokens + base styles
├── layouts/
│   ├── BaseLayout.astro       ← nav, fonts, footer shell
│   └── PostLayout.astro       ← individual post wrapper
├── components/
│   └── PostCard.astro         ← blog listing card (uses .pillar-card)
├── pages/
│   ├── blog/index.astro       ← /blog listing
│   └── blog/[slug].astro      ← /blog/post-slug
├── content/
│   └── blog/                  ← add .md files here
└── pages/rss.xml.js           ← RSS feed at /rss.xml

public/
├── robots.txt                 ← AI-welcoming crawler policy
└── llms.txt                   ← AI site map (update as you add posts)
```

## Writing a Post

Create `src/content/blog/my-post-title.md`:

```markdown
---
title: "My Post Title"
description: "One sentence summary for listings and AI."
pubDate: 2025-04-15
tags: ["vivify", "local-first"]
---

Your markdown content here...
```

The post appears automatically at `/blog/my-post-title`.

## Local Dev

```bash
npm install
npm run dev
```

## Deploy

Push to `main`. The GitHub Action builds and deploys automatically.

**One-time setup**: In your GitHub repo → Settings → Pages → Source → select
**GitHub Actions**.

## After Adding Posts

Update `public/llms.txt` to include new posts in the Blog section.
