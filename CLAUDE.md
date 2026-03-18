# CLAUDE.md — JiBrok Documentation & Marketing Site

## Project Overview

Jekyll-based documentation and marketing site for JiBrok's Atlassian Marketplace apps.
- **URL**: https://jibrok.com
- **Marketplace**: https://marketplace.atlassian.com/vendors/1216083/jibrok
- **Current focus**: JiBrok Studio for Jira Cloud (flagship product)

## Documentation Conventions

### Front Matter
```yaml
---
title: Page Title
key: product-key          # jibrok-studio-jira, tis-cloud, timer-cloud, etc.
excerpt: One-line description for SEO and listings
category: getting-started  # getting-started, configuration, reference, guides
tags:
  - doc
  - cloud
---
```

### Page Structure
- `* TOC {:toc}` immediately after front matter for auto table of contents
- `---` horizontal rules between major sections
- Tables for settings, API parameters, feature comparisons
- Code blocks with language hints (e.g., ```javascript)
- Images: `<img src="/uploads/{product-key}/filename.png" alt="description" loading="lazy">`

### Navigation
- Defined in `_data/navigation_docs.yml`
- Grouped by product key, then by section title
- Each section lists doc paths relative to `_docs/`

### File Paths
- Docs: `_docs/{product-key}/page-name.md`
- Images: `/uploads/{product-key}/`
- Navigation: `_data/navigation_docs.yml`
- Layouts: `_layouts/`
- Includes: `_includes/`

## Product Keys

| Product | Key | Status |
|---------|-----|--------|
| JiBrok Studio for Jira Cloud | `jibrok-studio-jira` | Active, primary focus |
| Message Field for Jira Cloud | `message-field-cloud` | Active |
| Time in status for Jira Cloud | `tis-cloud` | Active |
| Timer field / SLA for Jira Cloud | `timer-cloud` | Active |
| Stopwatch for Jira Cloud | `stopwatch-cloud` | Active |
| Calculated fields (JBCF) for Jira Cloud | `jbcf-cloud` | Active |
| Display Linked Issues | `linked-issues-cloud` | Active |
| Fields panel for JSM | `jsm-fields-panel-cloud` | Active |
| Message Field (DC/Server) | `message-field` | Legacy |
| Time in Status (DC/Server) | `time-in-status` | Legacy |
| Switch to User (DC/Server) | `su` | Legacy |
| Calculated fields (DC/Server) | `calculated-custom-fields` | Legacy |

## Terminology

- **Forge** — Atlassian's serverless app platform (JiBrok Studio is Forge-native)
- **JSM** — Jira Service Management
- **DC** — Data Center (Atlassian Server/DC deployment)
- **TIS** — Time in Status
- **JBCF** — JiBrok Calculated Fields
- **Rovo** — Atlassian's AI agent platform

## Writing Style

- Second person ("you"), present tense, active voice
- Technical precision — use correct Jira/Atlassian terminology
- Concise — one concept per section, no filler
- Benefit-driven headlines — lead with what users accomplish

## Available Agents

Custom agents in `.claude/agents/` for specialized tasks:

| Agent | Use When |
|-------|----------|
| `seo-specialist` | SEO audits, keyword research, technical SEO, content optimization |
| `content-creator` | Blog posts, marketing copy, content calendars, brand storytelling |
| `technical-writer` | Documentation pages, API references, tutorials, doc structure |
| `ux-architect` | Page layouts, CSS systems, information architecture, responsive design |
| `brand-guardian` | Brand consistency, visual identity, voice guidelines, naming conventions |
| `trend-researcher` | Market analysis, competitive intelligence, Atlassian ecosystem trends |
| `linkedin-creator` | LinkedIn posts, thought leadership, profile optimization, engagement strategy |
| `growth-hacker` | Growth experiments, conversion optimization, Marketplace growth, funnel analysis |
