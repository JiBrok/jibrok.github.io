---
title: Limits & Quotas
key: jibrok-studio-jira
excerpt: All system limits for script execution, storage, and configuration
category: administration
tags:
  - doc
  - cloud
  - limits
  - quotas
  - performance
---

* TOC
{:toc}

## Script Execution

| Limit | Value | Globals Script |
|-------|-------|----------------|
| Max execution time | per trigger (see below) | 1,000 ms |
| Max loop iterations | 50,000 (100,000 for scheduled) | 1,000 |
| Max call depth | 64 | 32 |
| Max string size | 1 MB | 100 KB |
| Max log calls | 200 | 0 |
| Max collection size (Set/Map) | 10,000 | 10,000 |
| Max array size | 50,000 | 50,000 |
| Max pending promises | per trigger (see below) | 0 |
| Max API calls | per trigger (see below) | - |
| Max eval calls | 20 | 0 |
| Max include depth | 5 | - |
| Max input size | 100,000 chars | 100,000 chars |

> **Note:** The Globals Script column shows reduced limits for the global variables script, which runs before every other script execution.

### Per-Trigger Limits

Execution time, API calls, and promises vary by trigger type:

| Trigger | Execution | API Calls | Promises | Loop Iterations |
|---------|-----------|-----------|----------|-----------------|
| Console | 18s | 40 | 50 | 50,000 |
| UIM | 5s | 20 | 20 | 50,000 |
| Scripted Fields | 5s | 20 | 20 | 50,000 |
| Event | 25s | 60 | 50 | 50,000 |
| Scheduled | 55s | 100 | 50 | 100,000 |
| Async Event | 55s | 100 | 50 | 50,000 |
| Automation | 40s | 80 | 50 | 50,000 |
| Rovo | 40s | 80 | 50 | 50,000 |
| Workflow Post Function | 15s | 40 | 30 | 50,000 |
| Workflow Validator | 10s | 20 | 20 | 50,000 |

> **Note:** The Workflow Condition trigger uses the Jira Expressions engine, which is evaluated natively by Jira. It has no sandbox engine limits - execution is managed entirely by Jira.

---

## API Limits

| Limit | Value |
|-------|-------|
| Max API calls per script | per trigger (see table above) |
| Max response size per call | 512 KB |
| Max table API calls per script | 50 |
| Max queue API calls per script | 25 |

---

## Script Management

| Limit | Value |
|-------|-------|
| Max scripts | 1,000 |
| Max script size | 50 KB |
| Max script name | 200 characters |
| Max versions per script | 50 |
| Max script description | 2,000 characters |
| Max version description | 2,000 characters |
| Max run history per script | 10 |
| Max run logs size | 100 KB |
| Max run result size | 50 KB |

---

## Global Variables

| Limit | Value |
|-------|-------|
| Max global scripts | 1 |
| Max global script size | 10 KB |
| Max variables | 50 |

---

## Triggers and Parameters

| Limit | Value |
|-------|-------|
| Max triggers per script | 10 |
| Max trigger config size | 10 KB |
| Singleton types | All types (Scheduled, Event, UIM, Scripted Fields, Async Event, Automation, Rovo, Workflow Post Function, Workflow Validator, Workflow Condition) |

---

## Organization

| Limit | Value |
|-------|-------|
| Max folders | 200 |
| Max folder nesting depth | 10 levels |
| Max folder description | 2,000 characters |
| Max labels | 100 |
| Max labels per script | 10 |
| Max label description | 2,000 characters |

---

## Custom Tables

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

## Async Events

| Limit | Value |
|-------|-------|
| Max async event calls per script | 10 |
| Max payload size | 100 KB |
| Max delay | 900 seconds (15 min) |
| Max chain depth | 1 (allows 2 hops: depth 0, 1) |
| Deduplication window | 5 minutes |

---

## Message Queues

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

## API Restrictions

| Limit | Value |
|-------|-------|
| Max custom whitelist profiles | 50 |
| Max whitelist entries per profile | 200 |
| Max custom blacklist profiles | 50 |
| Max blacklist entries per profile | 200 |

---

## Other Limits

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

## Engine Internals

| Limit | Value |
|-------|-------|
| Max regex pattern length | 200 characters |
| Max template literal depth | 32 |
| Max format pattern length | 500 characters |

---

## Next Steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language details and sandbox
- [Administration](/docs/jibrok-studio-jira/admin-settings) - Configuring limits and restrictions
- [FAQ](/docs/jibrok-studio-jira/faq) - Troubleshooting limit-related issues
