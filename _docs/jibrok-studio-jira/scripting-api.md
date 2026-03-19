---
title: Scripting API
key: jibrok-studio-jira
excerpt: Complete API reference - Jira namespaces, domain APIs, and utilities
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - api
  - reference
---

* TOC
{:toc}

## Which API should I use?

| What you need | API | Page |
|---|---|---|
| Search, create, update, or transition issues | `Issues` | [Issues](/docs/jibrok-studio-jira/scripting-api-issues) |
| Work with users, projects, fields, components, versions | `Users`, `Projects`, `Fields`, `Components`, `Versions` | [Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira) |
| Manage boards and sprints | `Boards`, `Sprints` | [Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira) |
| Access admin objects (workflows, screens, schemes, roles) or JSM Assets | `Admin`, `Assets` | [Configuration & Assets](/docs/jibrok-studio-jira/scripting-api-admin) |
| Store structured data | `tables` | [Tables](/docs/jibrok-studio-jira/scripting-api-tables) |
| Process messages asynchronously | `queue` | [Queues](/docs/jibrok-studio-jira/scripting-api-queues) |
| Trigger scripts from other scripts | `asyncEvent` | [Async Events](/docs/jibrok-studio-jira/scripting-api-async-event) |
| Customize issue forms at runtime | `uim` | [UI Modifications](/docs/jibrok-studio-jira/scripting-api-uim) |
| Build rich text (ADF), work with dates, arrays, strings, CSV | `Adf`, `DateUtils`, `Arrays`, `Strings`, `CSV`, `Validator` | [Utilities](/docs/jibrok-studio-jira/scripting-api-utilities) |
| Use smart value methods on strings, arrays, dates | `.capitalize()`, `.groupBy()`, `.plusDays()` | [Smart Value Methods](/docs/jibrok-studio-jira/scripting-api-smart-values) |
| Call a Jira REST endpoint not covered above | `requestJira()` | This page (below) |

---

## Jira API

### requestJira(path, options)

Low-level Jira REST API call. Use this for endpoints not covered by the high-level namespaces.

```js
// GET request
const res = requestJira('/rest/api/3/myself')
log(res.body.displayName)

// POST request
const res = requestJira('/rest/api/3/issue', {
  method: 'POST',
  body: { fields: { project: { key: 'PROJ' }, summary: 'Test', issuetype: { name: 'Task' } } }
})

// Error handling
const res = requestJira(`/rest/api/3/issue/${issueKey}`)
if (!res.ok) {
  log(`Error: ${res.status}`)
}
```

The `requestJira()` function returns an object with `ok` (boolean), `status` (number), and `body` (parsed JSON or text) properties.

---

## Script context variables

Variables available in scripts depending on context:

| Variable | Available when | Description |
|----------|---------------|-------------|
| `issueKey` | Issue key provided | The issue key string |
| `issue` | Issue context loaded | Issue data object |
| `context` | Always | Execution context metadata |
| `event` | Event/async/workflow post function/workflow validator triggers | Event payload |
| `webhook` | Webtrigger | Webhook request data (method, path, headers, body, query, rawBody) |
| `event.transition` | Workflow post function/workflow validator trigger | Transition details (`from_status`, `to_status`, `transitionName`) |
| `event.modifiedFields` | Workflow validator trigger | Fields modified during the transition |
| `uim` | UIM triggers | UI modification methods |
| `uimData` | UIM triggers | Form field values and callback info |
| `currentUser` | Always | Current user info |
| Global vars | When defined | Variables from the global script |

---

## Domain APIs

### tables

See [Data Storage](/docs/jibrok-studio-jira/data-storage) for full details.

| Method | Description |
|--------|-------------|
| `tables.get(tableName)` | Get table schema |
| `tables.rows(tableName, options?)` | Query rows with filtering and sorting |
| `tables.addRow(tableName, data)` | Add a single row |
| `tables.addRows(tableName, dataArray)` | Bulk insert multiple rows |
| `tables.updateRow(tableName, rowId, data)` | Update a row |
| `tables.deleteRow(tableName, rowId)` | Delete a single row |
| `tables.deleteRows(tableName, where)` | Delete rows matching filter (returns count) |
| `tables.findRow(tableName, where)` | Find first row matching filter |
| `tables.count(tableName, where?)` | Count rows (optionally filtered) |

### queue

See [Data Storage](/docs/jibrok-studio-jira/data-storage) for full details.

| Method | Description |
|--------|-------------|
| `queue.push(queueName, payload, priority?)` | Push a message |
| `queue.pull(queueName, count?)` | Pull messages for processing |
| `queue.consume(queueName, count?)` | Pull + auto-acknowledge |
| `queue.peek(queueName, count?)` | Preview without changing state |
| `queue.ack(messageId)` | Acknowledge a processed message |
| `queue.reject(messageId)` | Mark message as failed |
| `queue.requeue(messageId)` | Move failed message back to pending |
| `queue.size(queueName)` | Get pending message count |
| `queue.stats(queueName)` | Get full queue statistics |

### asyncEvent

| Method | Description |
|--------|-------------|
| `asyncEvent.push(scriptId, payload?, options?)` | Trigger another script asynchronously |
| `asyncEvent.pushSelf(payload?, options?)` | Trigger the current script asynchronously |

```js
// Trigger another script
asyncEvent.push("550e8400-e29b-41d4-a716-446655440000", {
  action: "process",
  issueKey: "TEST-1"
})

// Trigger self with delay
asyncEvent.pushSelf({ step: 2 }, { delayInSeconds: 60 })
```

---

## Scenarios API

Scenarios split long-running scripts into managed steps. Each step runs as a separate Forge event, avoiding execution timeouts for bulk operations. See [Scenarios](/docs/jibrok-studio-jira/scenarios) for the full guide.

### Step functions

| Function | Description |
|----------|-------------|
| `step(name, fn)` | One-time step. `fn` receives `(ctx)`, return value stored in `ctx[name]` |
| `loop(name, fn, initialState)` | Repeatable step. `fn` receives `(state, ctx)`. Call `next(newState)` to repeat, or return to finish |
| `batch(name, config, fn)` | Process issues in pages. `config` is JQL string or config object. `fn` receives `(issue, ctx)` |

### Batch config properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `jql` | string | - | JQL query (one of jql/keys/source required) |
| `keys` | string[] | - | Array of issue keys |
| `source` | function | - | `(ctx) => keys[]` - dynamic source |
| `fields` | string[] | all | Fields to load per issue |
| `expand` | string[] | none | Expand options |
| `batchSize` | number | 100 | Issues per page (max 100) |
| `maxIssues` | number | unlimited | Stop after this many |
| `continueOnError` | boolean | true | Continue on failure |

### Data transfer functions

| Function | Description |
|----------|-------------|
| `emit(value)` | Save a value to the step's data buffer (call multiple times) |
| `getStepData(stepName, opts?)` | Read emitted data from a previous step. Returns `{ items, total }` |
| `progress(data)` | Report custom progress data visible in the UI |
| `next(newState)` | Continue a `loop()` with updated state (only inside `loop()`) |

### Example

```js
step('count', () => {
  return { total: Issues.count('project = PROJ') }
})

batch('cleanup', 'project = PROJ AND updated < -180d', (issue) => {
  issue.transition('Done')
})

step('report', (ctx) => {
  log(`Done: ${ctx.cleanup.processed}/${ctx.count.total}, ${ctx.cleanup.failed} errors`)
})
```

---

## API reference pages

Detailed reference for each API area:

- **[Issues](/docs/jibrok-studio-jira/scripting-api-issues)** - Search, create, update, transition issues. RichIssue properties and methods, SearchResult, Smart Field Resolution, ChainablePromise.
- **[Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira)** - Users, Projects, Fields, Components, Versions, Boards, Sprints, Links. User and Project wrapper objects.
- **[Configuration & Assets](/docs/jibrok-studio-jira/scripting-api-admin)** - Administration namespaces (workflows, screens, schemes, roles) and JSM Assets (CMDB).
- **[Async Events](/docs/jibrok-studio-jira/scripting-api-async-event)** - asyncEvent.push and asyncEvent.pushSelf for triggering scripts asynchronously.
- **[Tables](/docs/jibrok-studio-jira/scripting-api-tables)** - Custom Tables API - CRUD, filtering, sorting, upsert, context-aware methods.
- **[Queues](/docs/jibrok-studio-jira/scripting-api-queues)** - Message Queue API - push, pull, consume, acknowledge, priority, statistics.
- **[UI Modifications](/docs/jibrok-studio-jira/scripting-api-uim)** - UIM API for modifying form fields on issue create and transition screens.
- **[Utilities](/docs/jibrok-studio-jira/scripting-api-utilities)** - Adf (builder + reader), DateUtils, Arrays, Strings, CSV, Validator.
- **[Smart Value Methods](/docs/jibrok-studio-jira/scripting-api-smart-values)** - String (28 methods), Array (9 methods), Date instance methods (arithmetic, navigation, formatting, comparison), Groovy date types.

---

## Next steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and sandbox details
- [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) - Built-in interactive reference with examples
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
- [Scenarios](/docs/jibrok-studio-jira/scenarios) - Multi-step scenarios for bulk operations
- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Tables and queues usage
- [Limits](/docs/jibrok-studio-jira/limits) - All execution and storage limits
