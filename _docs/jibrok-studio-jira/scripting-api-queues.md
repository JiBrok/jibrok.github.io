---
title: "Scripting API: Queues"
key: jibrok-studio-jira
excerpt: Message Queue API - push, pull, consume, acknowledge, and queue statistics
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - api
  - queues
  - messaging
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.

The `queue` variable provides access to Message Queues from scripts. All methods are async.

---

## Methods

| Method | Description |
|--------|-------------|
| `queue.push(name, payload, priority?)` | Push a message to the queue |
| `queue.pull(name, count?)` | Pull messages (marks as processing) |
| `queue.consume(name, count?)` | Consume messages (deletes immediately) |
| `queue.peek(name, count?)` | Peek at messages without changing status |
| `queue.ack(messageId)` | Acknowledge (delete) a processing message |
| `queue.reject(messageId)` | Mark a message as failed |
| `queue.requeue(messageId)` | Return a message to pending |
| `queue.size(name)` | Get total message count |
| `queue.stats(name)` | Get queue statistics (pending/processing/failed/total) |

---

## Message lifecycle

```
push() -> [Pending] -> pull() -> [Processing] -> ack()    -> [Deleted]
                                               -> reject() -> [Failed]
                                               -> requeue() -> [Pending]

push() -> [Pending] -> consume() -> [Deleted] (auto-ack)
```

---

## Examples

```js
// Push a message
const msg = queue.push("notifications", { type: "email", to: "user@example.com" })
log(msg.id)

// Push with priority (higher = processed first)
queue.push("tasks", { action: "process" }, 10)

// Pull and process
const messages = queue.pull("tasks", 5)
for (const m of messages) {
  log(m.payload)
  queue.ack(m.id)
}

// Consume (pull + auto-ack)
const consumed = queue.consume("events", 3)

// Peek without changing status
const peeked = queue.peek("tasks", 5)

// Get stats
const stats = queue.stats("tasks")
log(stats.pending, stats.processing, stats.failed)
```

---

## Context-aware methods (*For)

When a queue has a **context** configured (project/issue type restrictions), use `*For` methods. The `issue` parameter can be an issue object or a string key.

| Method | Description |
|--------|-------------|
| `queue.pushFor(name, issue, payload, priority?)` | Push with context check |
| `queue.pullFor(name, issue, count?)` | Pull with context check |
| `queue.consumeFor(name, issue, count?)` | Consume with context check |
| `queue.peekFor(name, issue, count?)` | Peek with context check |
| `queue.sizeFor(name, issue)` | Size with context check |
| `queue.statsFor(name, issue)` | Stats with context check |
| `queue.ackFor(messageId, issue)` | Ack with context check |
| `queue.rejectFor(messageId, issue)` | Reject with context check |
| `queue.requeueFor(messageId, issue)` | Requeue with context check |

```js
queue.pushFor("project-queue", "PROJ-123", { data: "test" })
queue.pushFor("project-queue", issue, { data: "test" })
```

---

## Limits

See [Limits](/docs/jibrok-studio-jira/limits) for queue API limits including call counts and pull/consume sizes.

---

## Next steps

- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Managing queues in the UI
- [Scripting API: Tables](/docs/jibrok-studio-jira/scripting-api-tables) - Custom table operations
- [Scripting Examples](/docs/jibrok-studio-jira/scripting-examples) - Queue patterns and recipes
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - API overview
