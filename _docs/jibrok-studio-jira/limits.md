---
title: Limits & Quotas
seo_title: "Jira Script Limits - Execution, Storage, Quotas"
key: jibrok-studio-jira
excerpt: All system limits for script execution, storage, and configuration
category: reference
tags:
  - doc
  - cloud
  - limits
  - quotas
  - performance
last_modified_at: 2026-03-19
date: 2026-02-23
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Script engine limits

These limits protect Jira performance and prevent runaway scripts. If you hit a limit, optimize your script or split work across multiple runs using [Scenarios](/docs/jibrok-studio-jira/scenarios).

| Limit | Value | Globals Script | Description |
|-------|-------|----------------|-------------|
| Max script complexity | 15,000 (50,000 for most triggers) | 200 | Controls the maximum complexity of a single script (measured in parsed nodes). Default 15,000; Console, Event, Scheduled, Async Event, Automation, Rovo, and Webtrigger override to 50,000. See per-trigger table below. |
| Max execution time | per trigger (see below) | 1,000 ms | Maximum script execution time |
| Max loop iterations | 50,000 (100,000 for scheduled) | 1,000 | Total number of loop iterations |
| Max call depth | 64 | 32 | Maximum nesting/recursion depth of calls |
| Max string size | 1 MB | 100 KB | Total string memory size |
| Max log calls | 200 | 0 | Number of output function calls (log, print) |
| Max collection size (Set/Map) | 10,000 | 10,000 | Maximum collection size |
| Max array size | 50,000 | 50,000 | Maximum array size |
| Max pending promises | per trigger (see below) | 0 | Number of concurrent async operations |
| Max API calls | per trigger (see below) | - | Number of Jira REST API calls per script |
| Max eval calls | 20 | 0 | Number of eval() calls per script |
| Max include depth | 5 | - | Nesting depth of eval-by-id calls |
| Max input size | 256,000 chars (100,000 for Groovy) | 10,240 chars | Maximum number of source code characters parsed by the engine |

> **Note:** The Globals Script column shows reduced limits for the global variables script, which runs before every other script execution.

### Per-trigger limits

Execution time, API calls, and promises vary by trigger type:

| Trigger | Execution | API Calls | Promises | Loop Iterations | Max AST Nodes |
|---------|-----------|-----------|----------|-----------------|---------------|
| Console | 18s | 40 | 50 | 50,000 | 50,000 |
| UIM | 5s | 20 | 20 | 50,000 | 15,000 |
| Scripted Fields | 5s | 20 | 20 | 50,000 | 15,000 |
| Event | 25s | 60 | 50 | 50,000 | 50,000 |
| Scheduled | 55s | 100 | 50 | 100,000 | 50,000 |
| Async Event | 55s | 250 | 50 | 50,000 | 50,000 |
| Automation | 40s | 80 | 50 | 50,000 | 50,000 |
| Rovo | 40s | 80 | 50 | 50,000 | 50,000 |
| Workflow Post Function | 15s | 40 | 30 | 50,000 | 15,000 |
| Workflow Validator | 10s | 20 | 20 | 50,000 | 15,000 |
| Webtrigger | 50s | 100 | 50 | 50,000 | 50,000 |

> **Note:** The Workflow Condition trigger uses the Jira Expressions engine, which is evaluated natively by Jira. It has no sandbox engine limits - execution is managed entirely by Jira.

---

## API limits

Each script has a budget for Jira REST API calls and storage operations. Use JQL bulk searches instead of one-by-one fetches to stay within limits.

| Limit | Value |
|-------|-------|
| Max API calls per script | per trigger (see table above) |
| Max response size per call | 512 KB |
| Max table API calls per script | 50 |
| Max queue API calls per script | 25 |

---

## Script management

These limits apply to scripts stored in the Library.

| Limit | Value |
|-------|-------|
| Max scripts | 1,000 |
| Max script size | 250 KB |
| Max script name | 200 characters |
| Max versions per script | 50 |
| Max script description | 2,000 characters |
| Max version description | 2,000 characters |
| Max run history per script | 10 |
| Max run logs size | 100 KB |
| Max run result size | 50 KB |

---

## Global variables

The global variables script runs before every script execution, so its limits are intentionally strict.

| Limit | Value |
|-------|-------|
| Max global scripts | 1 |
| Max global script size | 10 KB |
| Max variables | 50 |

---

## Triggers and parameters

| Limit | Value |
|-------|-------|
| Max triggers per script | 10 |
| Max trigger config size | 50 KB |
| Singleton types | All types (Scheduled, Event, UIM, Scripted Fields, Async Event, Automation, Rovo, Workflow Post Function, Workflow Validator, Workflow Condition, Webtrigger) |

---

## Organization

Folders and labels help you manage scripts at scale.

| Limit | Value |
|-------|-------|
| Max folders | 200 |
| Max folder name | 50 characters |
| Max folder nesting depth | 10 levels |
| Max folder description | 2,000 characters |
| Max labels | 100 |
| Max label name | 30 characters |
| Max labels per script | 10 |
| Max label description | 2,000 characters |

---

## Custom tables

Tables store structured data accessible from scripts and the UI. If you need more than 5,000 rows, consider archiving old data or splitting across multiple tables.

| Limit | Value |
|-------|-------|
| Max tables | 50 |
| Max table name | 100 characters |
| Max columns per table | 30 |
| Max column name | 50 characters |
| Max rows per table | 5,000 |
| Max row data size | 100 KB |
| Max bulk insert rows | 100 |
| Max filter conditions | 10 |
| Max search result rows | 200 |
| Max select options per column | 50 |
| Max select option length | 100 characters |

---

## Async events

Async events let scripts trigger other scripts. Chain depth and fanout limits prevent infinite recursion.

| Limit | Value |
|-------|-------|
| Max async event calls per script | 10 |
| Max async event calls (chained) | 3 |
| Max payload size | 100 KB |
| Max delay | 900 seconds (15 min) |
| Max chain depth | 1 (allows 2 hops: depth 0 initial + depth 1 triggered) |
| Deduplication window | 5 minutes |
| Async consumer execution time | 55,000 ms |

---

## Webtrigger limits

Rate limits protect against request floods from external systems.

| Limit | Value |
|-------|-------|
| Rate limit | 60 requests per minute |
| Rate limit window | 60 seconds |
| Max tokens per script | 1 |

---

## File generation

Scripts can generate files via `createFile()` (see [Scripting Language](/docs/jibrok-studio-jira/scripting-language#createfile)). Files are returned alongside script output and can be downloaded from the Console.

| Limit | Value |
|-------|-------|
| Max file size per file | 4 MB |
| Max files per execution | 10 |
| Max total file size | 8 MB |

---

## Scenario limits

Scenarios split long-running operations into managed steps. If you need to process more data than one step allows, use `emit()` to pass data between steps.

| Limit | Value | Description |
|-------|-------|-------------|
| Max steps per scenario | 100 | Total `step()` + `loop()` + `batch()` calls |
| Max iterations per step | 1,000 | Maximum `next()` calls in a `loop()` or pages in `batch()` |
| Max step result size | 5 MB | JSON-serialized return value of a single step |
| Max context size | 20 MB | Total JSON size of all completed step results |
| Max step logs size | 512 KB | Console output per step (truncated with warning if exceeded) |
| Batch size | 1-100 | Issues per batch page |
| Batch errors | 100 | Maximum number of error messages stored per batch step |
| Emit items per iteration | 1,000 | Maximum `emit()` calls per step/loop iteration |
| Emit data per iteration | 2 MB | Maximum serialized size of emitted data per iteration |
| Emit total per step | 10 MB | Maximum total emitted data across all iterations of a step |
| getStepData max limit | 10,000 | Maximum items returned in a single `getStepData()` call |
| Runs per script | 20 | Old completed runs are automatically cleaned up |
| Stale step timeout | 10 min | Steps running longer are reset for retry |
| API calls per step | Same as async event trigger | Each step has its own API call budget |

---

## Message queues

Queues handle asynchronous communication between scripts. Use `consume()` for simple pipelines and `pull()`/`ack()` when you need error handling.

| Limit | Value |
|-------|-------|
| Max queues | 50 |
| Max queue name | 100 characters |
| Max messages per queue | 50,000 |
| Max total queue messages | 200,000 |
| Max message payload size | 100 KB |
| Max pull/consume count | 10 |
| Max push batch size | 100 |
| Max queue batch size | 100 |

---

## API restrictions

Whitelist and blacklist profiles control which Jira REST API endpoints scripts can call.

| Limit | Value |
|-------|-------|
| Max custom whitelist profiles | 50 |
| Max whitelist entries per profile | 200 |
| Max custom blacklist profiles | 50 |
| Max blacklist entries per profile | 200 |

---

## Other limits

| Limit | Value |
|-------|-------|
| Max pre-configured users | 20 |
| Max context projects per script | 50 |
| Max context issue types per script | 50 |
| Max UIM field values | 200 |
| Max import JSON size | 5 MB |
| Audit run records | 10,000 (rolling) |
| Scheduled handler timeout | 55 seconds |
| Async consumer timeout | 120 seconds |
| Max log string length | 1,000 characters |

---

## Working within limits

### Hitting execution timeout?

- Add the `fields` parameter to `Issues.search()` and `Issues.get()` to load only the fields you need
- Reduce the number of API calls per script - combine operations where possible
- Move bulk operations to [Scenarios](/docs/jibrok-studio-jira/scenarios) where each step gets its own time budget

### Hitting API call limit?

- Use JQL bulk searches (`Issues.search()`) instead of fetching issues one by one
- Cache data in variables instead of re-fetching the same issue multiple times
- Split work across multiple scheduled runs or use async events to chain scripts

### Hitting string or array size limit?

- Process data in chunks instead of building one large array
- Use [Custom Tables](/docs/jibrok-studio-jira/data-storage) for intermediate storage between script runs
- Filter data server-side with JQL instead of loading everything and filtering in the script

### Hitting loop iteration limit?

- Use `Issues.searchAll()` with pagination instead of manual loops
- In Scenarios, use `batch()` which handles pagination automatically
- Scheduled triggers have a higher loop limit (100,000) - consider switching from event triggers for heavy processing

---

## Next steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language details and sandbox
- [Administration](/docs/jibrok-studio-jira/admin-settings) - Configuring limits and restrictions
- [Scenarios](/docs/jibrok-studio-jira/scenarios) - Multi-step scenarios for bulk operations
- [Webhook Trigger](/docs/jibrok-studio-jira/triggers-webhook) - HTTP webhook trigger details
- [FAQ](/docs/jibrok-studio-jira/faq) - Troubleshooting limit-related issues
