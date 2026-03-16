---
title: "Scripting API: Async Events"
key: jibrok-studio-jira
excerpt: Trigger scripts asynchronously via asyncEvent.push and asyncEvent.pushSelf
category: administration
tags:
  - doc
  - cloud
  - scripting
  - api
  - async
  - events
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.

The `asyncEvent` variable allows scripts to trigger other scripts asynchronously via Forge Queue. All methods are async.

---

## Methods

| Method | Description |
|--------|-------------|
| `asyncEvent.push(scriptId, payload?, options?)` | Push an event to another script |
| `asyncEvent.pushSelf(payload?, options?)` | Push an event to the current script |

---

## Parameters

### asyncEvent.push(scriptId, payload?, options?)

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `scriptId` | string | Yes | UUID of the target script |
| `payload` | object | No | JSON-serializable object (max 100KB) |
| `options` | object | No | See options below |

### asyncEvent.pushSelf(payload?, options?)

Same as `push()` but targets the current script. Not available in Console - requires a saved script.

### Options

| Option | Type | Description |
|--------|------|-------------|
| `issueKey` | string | Issue key in `PROJ-123` format, passed as context |
| `delayInSeconds` | number | Delay before processing (0-900, max 15 minutes) |

### Return value

Both methods return `{ jobId: string }`.

---

## event Variable

When a script runs via an async event trigger, the `event` variable contains:

| Property | Type | Description |
|----------|------|-------------|
| `event.payload` | object | Data passed by the sender (empty object if not provided) |
| `event.source` | string | `"script"` |
| `event.pushedBy` | string | Account ID of the sender |
| `event.pushedAt` | number | Timestamp in milliseconds |
| `event.scriptId` | string | UUID of the current script |
| `event.issueKey` | string/null | Issue key or `null` |
| `event.depth` | number | Current chain depth (0 = initial trigger) |
| `event.chainId` | string | UUID identifying the event chain (for tracing) |

---

## Examples

```js
// Push event to another script
const result = asyncEvent.push(
  "550e8400-e29b-41d4-a716-446655440000",
  {action: "process", itemId: 42}
)
log(result.jobId)

// Push with delay and issue context
asyncEvent.push(
  "550e8400-e29b-41d4-a716-446655440000",
  {action: "cleanup"},
  {issueKey: "PROJ-123", delayInSeconds: 60}
)

// Re-trigger current script (e.g. multi-step processing)
asyncEvent.pushSelf({step: 2, batch: nextBatch})

// Re-trigger with delay (polling pattern)
asyncEvent.pushSelf(
  {retryCount: (event.payload.retryCount || 0) + 1},
  {delayInSeconds: 300}  // retry in 5 minutes
)
```

### Target script example

```js
// This script has an asyncEvent trigger enabled
log("Source:", event.source)
log("Payload:", event.payload)

if (event.issueKey) {
  const issue = Issues.get(event.issueKey)
  log("Processing issue:", issue.summary)
}

// Chain to next step
if (event.payload.step < 3) {
  asyncEvent.pushSelf({
    step: event.payload.step + 1,
    data: event.payload.data,
  })
}
```

---

## Setup

1. Save a script in the Library
2. Go to **Config** tab - **Triggers**
3. **Add Trigger** - select **Async Event**
4. Optionally add a description
5. **Save** the script

The async event trigger must be enabled for the script to receive events. Events sent to scripts without an enabled trigger are discarded.

---

## Limits

See [Limits](/docs/jibrok-studio-jira/limits) for async event limits including call counts, payload size, delay, and chain depth.

---

## Notes

- Async events are globally controlled via the `async_event` toggle in [Administration](/docs/jibrok-studio-jira/admin-settings)
- Script execution errors are not retried (only infrastructure errors trigger retries)
- The trigger is a singleton - one async event trigger per script
- Payload must be a plain JSON object (no arrays)
- `pushSelf` is not available in Console execution
- Chain depth protection: events are tracked with a `depth` counter that increments on each hop. Scripts exceeding the max chain depth cannot push further events. The `chainId` is shared across the chain for tracing
- Fanout reduction: chained executions have reduced push call limits

---

## Next steps

- [Async Trigger](/docs/jibrok-studio-jira/triggers-async) - Trigger configuration
- [Scripting API: Queues](/docs/jibrok-studio-jira/scripting-api-queues) - Message Queue operations
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - API overview
