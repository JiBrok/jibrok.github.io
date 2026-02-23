---
title: Data Storage
key: jibrok-studio-jira
excerpt: Custom Tables for structured data and Message Queues for async processing
category: data-storage
tags:
  - doc
  - cloud
  - tables
  - queues
  - storage
---

* TOC
{:toc}

## Overview

JiBrok Studio for Jira Cloud provides two data storage mechanisms: **Custom Tables** for persistent structured data and **Message Queues** for asynchronous message processing.

---

## Custom Tables

SQL-backed structured storage accessible from both the UI and scripts.

### Creating a Table

1. Navigate to the **Tables** tab
2. Click **Create Table**
3. Enter a table name
4. Define columns with name, type, and required flag

### Column Types

| Type | Description |
|------|-------------|
| **String** | Text values |
| **Number** | Numeric values |
| **Boolean** | True/false values |
| **Date** | Date values |
| **Select** | Dropdown from predefined options |
| **JSON** | Arbitrary JSON data |

### Limits

| Limit | Value |
|-------|-------|
| Max tables | 50 |
| Max columns per table | 30 |
| Max rows per table | 5,000 |
| Max row data size | 100 KB |

### Managing Data in the UI

- **Add Row** — opens a form with fields for each column
- **Edit Row** — click a row to modify values
- **Delete Row** — select rows and delete, or delete individually
- **Search and Sort** — filter rows by column values, sort ascending or descending

### Script API

Access tables from scripts using the `tables` variable:

```js
// Query rows with filtering
const rows = await tables.rows("Users", {
  where: { Status: { $eq: "active" } },
  orderBy: "-Age",
  limit: 10,
  offset: 0
})

// Add a row
await tables.addRow("Users", {
  Name: "Alice",
  Age: 30,
  Status: "active"
})

// Update a row
await tables.updateRow("Users", rowId, { Status: "inactive" })

// Delete a row
await tables.deleteRow("Users", rowId)

// Bulk insert multiple rows
await tables.addRows("Users", [
  { Name: "Bob", Age: 25, Status: "active" },
  { Name: "Carol", Age: 28, Status: "active" }
])

// Delete rows by filter (returns number of deleted rows)
const deleted = await tables.deleteRows("Users", { Status: { $eq: "inactive" } })
log(deleted)  // e.g., 3

// Find a single row
const row = await tables.findRow("Users", { Name: { $eq: "Alice" } })

// Count rows
const total = await tables.count("Users")
const active = await tables.count("Users", { Status: { $eq: "active" } })
```

### Context-Aware Methods (*For)

When a table has a **context** configured (project/issue type restrictions), use `*For` methods. The `issue` parameter can be an issue object or a string key (e.g. `"PROJ-123"`).

| Method | Description |
|--------|-------------|
| `tables.getFor(name, issue)` | Get schema with context check |
| `tables.rowsFor(name, issue, options?)` | Search with context check |
| `tables.findRowFor(name, issue, where)` | Find first with context check |
| `tables.addRowFor(name, issue, data)` | Insert with context check |
| `tables.addRowsFor(name, issue, rows[])` | Bulk insert with context check |
| `tables.updateRowFor(name, issue, rowId, data)` | Update with context check |
| `tables.deleteRowFor(name, issue, rowId)` | Delete with context check |
| `tables.deleteRowsFor(name, issue, where)` | Delete rows with context check |
| `tables.countFor(name, issue, where?)` | Count with context check |

```js
await tables.addRowFor("Logs", "PROJ-123", { Message: "Done" })
await tables.rowsFor("Logs", issue, { where: { Status: "open" } })
```

### Filtering Operators

| Operator | Description |
|----------|-------------|
| `$eq` | Equal |
| `$ne` | Not equal |
| `$gt` | Greater than |
| `$gte` | Greater than or equal |
| `$lt` | Less than |
| `$lte` | Less than or equal |
| `$like` | Pattern match (SQL LIKE) |
| `$in` | In array of values |

---

## Message Queues

Async message processing between scripts and triggers.

### Creating a Queue

1. Navigate to the **Queues** tab
2. Click **Create Queue**
3. Enter a queue name

### Queue Dashboard

The queue list shows:

- Queue name
- Message counts by status (Pending, Processing, Failed)
- Last activity time

### Message States

| State | Description |
|-------|-------------|
| **Pending** | Waiting to be processed |
| **Processing** | Pulled by a consumer, awaiting acknowledgment |
| **Failed** | Rejected by a consumer |

### Limits

| Limit | Value |
|-------|-------|
| Max queues | 50 |
| Max messages per queue | 50,000 |
| Max message payload size | 100 KB |

### Message Browser

View messages filtered by status (Pending, Processing, Failed). Actions include:

| Action | Description |
|--------|-------------|
| **Requeue** | Move failed message back to pending |
| **Delete** | Remove individual message |
| **Purge** | Delete all messages (or by status) |

### Script API

Access queues from scripts using the `queue` variable:

```js
// Push a message (with optional priority — higher = processed first)
await queue.push("tasks", { action: "process", data: "..." }, 5)

// Pull messages for processing
const messages = await queue.pull("tasks", 5)
for (const msg of messages) {
  // process msg.payload
  await queue.ack(msg.id)    // acknowledge success
  // or: await queue.reject(msg.id)  // mark as failed
}

// Consume (pull + auto-ack in one step)
const consumed = await queue.consume("tasks", 5)

// Peek without changing status
const preview = await queue.peek("tasks", 5)

// Requeue failed messages
await queue.requeue(messageId)

// Get queue size and stats
const size = await queue.size("tasks")
const stats = await queue.stats("tasks")
```

---

## When to Use Tables vs Queues

| Use Case | Tables | Queues |
|----------|--------|--------|
| Persistent data storage | Yes | No (messages are consumed) |
| Configuration/lookup data | Yes | No |
| Audit/history records | Yes | No |
| Task processing pipelines | No | Yes |
| Event-driven workflows | No | Yes |
| Cross-script communication | Possible | Designed for this |
| Priority-based ordering | No | Yes |

---

## Next Steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) — Full API reference
- [Limits](/docs/jibrok-studio-jira/limits) — All storage limits
