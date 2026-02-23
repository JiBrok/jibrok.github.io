---
title: Async Events
key: jibrok-studio-jira
category: core-features
tags:
  - doc
  - cloud
  - triggers
  - events
---

* TOC
{:toc}

## Async Events

Trigger scripts asynchronously via Forge Queue. One per script (singleton).

Async events are triggered from scripts using `asyncEvent.push(scriptId, payload?, options?)` or `asyncEvent.pushSelf(payload?, options?)`. The target script must have an enabled async event trigger - otherwise events are discarded.

### Event Variable

The `event` variable in the target script contains:

| Property | Type | Description |
|----------|------|-------------|
| `event.payload` | object | Data passed by the sender (empty object if not provided) |
| `event.source` | string | `"script"` |
| `event.pushedBy` | string | Account ID of the sender |
| `event.pushedAt` | number | Timestamp in milliseconds |
| `event.scriptId` | string | UUID of the current script |
| `event.issueKey` | string/null | Issue key (e.g. `"PROJ-123"`) or `null` |
| `event.depth` | number | Current chain depth (0 = initial trigger) |
| `event.chainId` | string | UUID identifying the event chain (for tracing) |

> **Automatic context:** When `issueKey` is provided via options, the runtime variables `issue` and `issueKey` are set automatically in the target script.

### Options

| Option | Type | Description |
|--------|------|-------------|
| `issueKey` | string | Issue key in `PROJ-123` format, passed as context to the target script |
| `delayInSeconds` | number | Delay before processing (0-900, max 15 minutes) |

### Limits

| Limit | Value |
|-------|-------|
| Max `push`/`pushSelf` calls per execution | 10 |
| Max payload size | 100KB |
| Max delay | 900 seconds (15 minutes) |
| Max chain depth | 1 (allows 2 hops: depth 0, 1) |

### Example

**Sender script** - pushes an event to a target script:

```js
// Push with payload and issue context
await asyncEvent.push(
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

## See Also

- [Triggers Overview](/docs/jibrok-studio-jira/triggers) — All trigger types at a glance
- [Scheduled Triggers](/docs/jibrok-studio-jira/triggers-scheduled) — Run scripts on a schedule
- [Event Triggers](/docs/jibrok-studio-jira/triggers-events) — React to Jira events
