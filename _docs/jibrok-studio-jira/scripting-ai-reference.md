---
title: "AI Scripting Reference"
seo_title: "JiBrok Studio Scripting API - Complete Reference for AI"
key: jibrok-studio-jira
excerpt: Complete scripting API reference in one page - optimized for use with ChatGPT, Claude, and other AI assistants
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - api
  - ai
  - reference
last_modified_at: 2026-04-01
date: 2026-04-01
seo:
  date_modified: 2026-04-01
---

Use this page to help AI assistants (ChatGPT, Claude, Copilot, etc.) generate correct scripts for JiBrok Studio.

## Quick start

1. Open [llms-full.txt](/llms-full.txt) (complete API reference, ~420 lines)
2. Copy the full text
3. Paste it into your AI assistant as context
4. Ask it to write a script for your task

**Example prompt:**

> Using the JiBrok Studio API reference above, write a script that finds all issues in project PROJ that are overdue, adds a comment "Please update or close this issue", and transitions them to "In Review" status.

---

## What's included

The [llms-full.txt](/llms-full.txt) reference covers:

| Section | Description |
|---------|-------------|
| Sandbox constraints | What's different from standard JS (no fetch, no DOM, auto-await, etc.) |
| Issues API | Search, create, update, transition. 40+ RichIssue methods |
| Jira Entities | Users, Projects, Fields, Components, Versions, Boards, Sprints, Links, Epics, Groups, Filters |
| Configuration & Assets | Workflows, Screens, Schemes, Roles, JSM Assets/CMDB |
| Utilities | Adf builder, DateUtils, Arrays, Strings, CSV, Validator |
| Tables & Queues | Custom data storage CRUD, message queue lifecycle |
| Async Events & UIM | Script-to-script triggering, form field modification |
| Type Methods | All whitelisted String (58), Array (48), Date (40+), Set, Map methods |
| Differences from JS | Division by zero, `in` operator, parseInt radix, and more |
| Common Patterns | Bulk operations, reporting, field sync, table/queue patterns |

---

## For AI tool developers

JiBrok Studio supports the [llms.txt standard](https://llmstxt.org/):

- `/llms.txt` - Brief description with links to documentation pages
- `/llms-full.txt` - Complete API reference in one file

AI tools can fetch these files automatically to provide context-aware script generation.

---

## Next steps

- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full interactive API reference
- [Scripting Examples](/docs/jibrok-studio-jira/scripting-examples) - Practical recipes and patterns
- [Script Console](/docs/jibrok-studio-jira/script-console) - Interactive editor and execution
