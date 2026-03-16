---
title: "Scripting API: Tables"
key: jibrok-studio-jira
excerpt: Custom Tables API - CRUD operations, filtering, sorting, and context-aware methods
category: administration
tags:
  - doc
  - cloud
  - scripting
  - api
  - tables
  - storage
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.

The `tables` variable provides access to Custom Tables from scripts. All methods are async and use column **names** (not internal IDs).

---

## Methods

| Method | Description |
|--------|-------------|
| `tables.get(name)` | Get table schema (id, name, columns) |
| `tables.rows(name, options?)` | Search/list rows with filter, sort, pagination |
| `tables.findRow(name, where)` | Find first row matching filter |
| `tables.addRow(name, data)` | Insert a single row |
| `tables.addRows(name, rows[])` | Bulk insert rows |
| `tables.updateRow(name, rowId, data)` | Update a row by ID |
| `tables.deleteRow(name, rowId)` | Delete a row by ID |
| `tables.deleteRows(name, where)` | Delete rows matching filter |
| `tables.count(name, where?)` | Count rows (optionally filtered) |
| `tables.upsert(name, where, data)` | Insert or update row (returns `_action: 'created'\|'updated'`) |

---

## Filter operators

Used in `where` clauses. A plain value implies `$eq`.

| Operator | Description | Example |
|----------|-------------|---------|
| `$eq` | Equal (default) | `{ Name: "Alice" }` |
| `$ne` | Not equal | `{ Status: { $ne: "closed" } }` |
| `$gt` | Greater than | `{ Age: { $gt: 18 } }` |
| `$gte` | Greater than or equal | `{ Age: { $gte: 18 } }` |
| `$lt` | Less than | `{ Age: { $lt: 65 } }` |
| `$lte` | Less than or equal | `{ Score: { $lte: 100 } }` |
| `$like` | SQL LIKE pattern | `{ Name: { $like: "%alice%" } }` |
| `$in` | In array | `{ Status: { $in: ["active", "pending"] } }` |

---

## Sort syntax

The `orderBy` option accepts a column name. Prefix with `-` for descending.

```js
tables.rows("Users", { orderBy: "Name" })      // ascending
tables.rows("Users", { orderBy: "-Age" })       // descending
tables.rows("Users", { orderBy: "-updatedAt" }) // built-in field
```

---

## Examples

```js
// Get table schema
const schema = tables.get("Users")
log(schema.columns)  // [{ id, name, type }, ...]

// Add a single row
const row = tables.addRow("Users", { Name: "Alice", Age: 30, Status: "active" })
log(row.id)

// Bulk insert
const rows = tables.addRows("Users", [
  { Name: "Bob", Age: 25 },
  { Name: "Eve", Age: 35 },
])

// Search with filter and sort
const result = tables.rows("Users", {
  where: { Age: { $gte: 18 }, Status: "active" },
  orderBy: "-Age",
  limit: 10,
  offset: 0,
})
log(result.rows)   // [{ id, data: { Name, Age, Status }, createdAt, updatedAt }]
log(result.total)  // total matching count

// Find first matching row
const user = tables.findRow("Users", { Name: "Alice" })

// Count rows
const total = tables.count("Users")
const active = tables.count("Users", { Status: "active" })

// Update a row
tables.updateRow("Users", row.id, { Status: "inactive" })

// Delete by filter
const deleted = tables.deleteRows("Users", { Status: "inactive" })
log(deleted)  // number of deleted rows

// Delete by ID
tables.deleteRow("Users", row.id)

// Upsert - insert or update
const upserted = tables.upsert("Users",
  { Name: "Alice" },                          // where (find)
  { Name: "Alice", Age: 31, Status: "active" } // data (set)
)
log(upserted._action)  // "created" or "updated"
```

---

## Context-aware methods (*For)

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
tables.addRowFor("Logs", "PROJ-123", { Message: "Done" })
tables.rowsFor("Logs", issue, { where: { Status: "open" } })
```

---

## Limits

See [Limits](/docs/jibrok-studio-jira/limits) for table API limits including call counts, bulk insert sizes, and search result limits.

---

## Next steps

- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Managing tables in the UI
- [Scripting API: Queues](/docs/jibrok-studio-jira/scripting-api-queues) - Message queue operations
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - API overview
- [Limits](/docs/jibrok-studio-jira/limits) - Table size limits
