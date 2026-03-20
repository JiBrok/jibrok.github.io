---
title: Async Events
seo_title: "Async Event Triggers - Chain Scripts in Jira"
key: jibrok-studio-jira
excerpt: Trigger scripts asynchronously from other scripts with optional delay and payload
category: core-features
tags:
  - doc
  - cloud
  - triggers
  - events
last_modified_at: 2026-03-19
date: 2026-02-23
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Async events

Trigger scripts asynchronously. One per script (singleton).

Async events are triggered from scripts using `asyncEvent.push(scriptId, payload?, options?)` or `asyncEvent.pushSelf(payload?, options?)`. The target script must have an enabled async event trigger - otherwise events are discarded.

### Event variable

The `event` variable in the target script contains:

| Property | Type | Description |
|----------|------|-------------|
| `event.payload` | object | Data passed by the sender (empty object if not provided) |
| `event.source` | string | `"script"` |
| `event.pushedBy` | string | Account ID of the sender |
| `event.pushedAt` | number | Timestamp in milliseconds |
| `event.scriptId` | string | UUID of the current script |
| `event.issueKey` | string/null | Issue key (e.g. `"PROJ-123"`) or `null` |
| `event.depth` | number | Current chain depth (0 = initial trigger, max 2). See [Limits](/docs/jibrok-studio-jira/limits#async-events) |
| `event.chainId` | string | UUID identifying the event chain (for tracing) |

> **Automatic context:** When `issueKey` is provided via options, the runtime variables `issue` and `issueKey` are set automatically in the target script.

### Options

| Option | Type | Description |
|--------|------|-------------|
| `issueKey` | string | Issue key in `PROJ-123` format, passed as context to the target script |
| `delayInSeconds` | number | Delay before processing (0-900, max 15 minutes) |

### Return value

Both `push()` and `pushSelf()` return `{ jobId: string }`.

### Limits

See [Limits](/docs/jibrok-studio-jira/limits) for async event limits including call counts, payload size, delay, and chain depth.

**Fanout reduction:** To prevent cascading script chains from growing out of control, scripts triggered by async events have a lower limit on how many async events they can push (3 instead of 10).

### Example

**Sender script** - pushes an event to a target script:

```js
// Push with payload and issue context
asyncEvent.push(
  "550e8400-e29b-41d4-a716-446655440000",
  { action: "process", itemId: 42 },
  { issueKey: "PROJ-123", delayInSeconds: 60 }
)
```

**Target script** (must have an async event trigger enabled):

```js
log("Received from:", event.pushedBy)
log("Depth:", event.depth, "Chain:", event.chainId)

if (event.payload.action === "process") {
  // issueKey was passed in options, so issue is auto-loaded
  log("Processing:", issueKey, "-", issue.fields.summary)
}
```

See the [Async Event API](/docs/jibrok-studio-jira/scripting-api#asyncevent) for the full scripting reference.

---

## See also

- [Triggers Overview](/docs/jibrok-studio-jira/triggers) - All trigger types at a glance
- [Scheduled Triggers](/docs/jibrok-studio-jira/triggers-scheduled) - Run scripts on a schedule
- [Event Triggers](/docs/jibrok-studio-jira/triggers-events) - React to Jira events
