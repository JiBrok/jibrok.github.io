---
title: Scripting API
key: jibrok-studio-jira
excerpt: Complete API reference - Jira namespaces, domain APIs, and utilities
category: administration
tags:
  - doc
  - cloud
  - scripting
  - api
  - reference
---

* TOC
{:toc}

## Jira API

### requestJira(path, options)

Low-level Jira REST API call. Use this for endpoints not covered by the high-level namespaces.

```js
// GET request
const res = await requestJira('/rest/api/3/myself')
log(res.body.displayName)

// POST request
const res = await requestJira('/rest/api/3/issue', {
  method: 'POST',
  body: { fields: { project: { key: 'PROJ' }, summary: 'Test', issuetype: { name: 'Task' } } }
})

// Error handling
const res = await requestJira(`/rest/api/3/issue/${issueKey}`)
if (!res.ok) {
  log(`Error: ${res.status}`)
}
```

---

## Issues

Work with Jira issues - search, create, update, transition, and more.

### Static Methods

| Method | Description | API calls |
|--------|-------------|-----------|
| `Issues.get(key, options?)` | Get issue by key. Returns a RichIssue | 1 |
| `Issues.search(jql, options?)` | Search issues by JQL. Returns SearchResult | 1 |
| `Issues.searchAll(jql, options?)` | Search all matching issues (auto-pagination). Returns SearchResult | 1 (count) + N (pages) |
| `Issues.count(jql)` | Count issues matching JQL | 1 |
| `Issues.create(project, issueType, fields?)` | Create a new issue | 1 (+1 field cache) |
| `Issues.link(key1, linkType, key2)` | Link two issues | 1 |

```js
// Get an issue
const issue = await Issues.get("TEST-1")
log(issue.summary)
log(issue.status)

// Search issues
const results = await Issues.search("project = TEST AND status = Open", {
  maxResults: 10,
  fields: ["summary", "status"],
  includeTotal: true
})
log(`Found: ${results.total}`)
for (const issue of results.issues) {
  log(`${issue.key}: ${issue.summary}`)
}

// Search all (auto-pagination)
const all = await Issues.searchAll("project = TEST AND status = Open")
log(`Total: ${all.issues.length}`)

// Count
const count = await Issues.count("project = TEST")

// Create an issue
const created = await Issues.create("TEST", "Task", {
  summary: "New task",
  description: "Task description"
})
log(created.key)

// Link issues
await Issues.link("TEST-1", "Blocks", "TEST-2")
```

### RichIssue Properties

| Property | Description |
|----------|-------------|
| `key` | Issue key (e.g., `"TEST-1"`) |
| `id` | Issue ID |
| `summary` | Summary text |
| `status` | Status name |
| `assignee` | Assignee display name |
| `assigneeId` | Assignee account ID |
| `reporter` | Reporter display name |
| `priority` | Priority name |
| `issueType` | Issue type name |
| `project` | Project key |
| `labels` | Labels array |
| `components` | Components array |
| `created` | Created date string |
| `updated` | Updated date string |
| `description` | Description text |
| `fields` | Raw fields object |
| `age` | Days since creation |
| `staleDays` | Days since last update |
| `isOverdue` | Whether past due date |
| `isAssigned` | Whether assigned |
| `isResolved` | Whether in resolved status |

### RichIssue Methods

| Method | Description | API calls |
|--------|-------------|-----------|
| `issue.update(fields)` | Update issue fields | 1 |
| `issue.transition(nameOrStatus, options?)` | Transition to a status | 2 |
| `issue.addComment(textOrAdf)` | Add a comment (plain text or ADF) | 1 |
| `issue.getComments()` | Get all comments | 1 |
| `issue.getTransitions()` | Get available transitions | 1 |
| `issue.assign(accountId)` | Assign to a user | 1 |
| `issue.unassign()` | Remove assignee | 1 |
| `issue.addWatcher(accountId)` | Add a watcher | 1 |
| `issue.link(linkType, targetKey)` | Link to another issue | 1 |
| `issue.delete()` | Delete the issue | 1 |
| `issue.reload()` | Reload issue data from Jira | 1 |
| `issue.clone(overrides?)` | Clone the issue | 1 |

```js
const issue = await Issues.get("TEST-1")

// Update fields
await issue.update({ summary: "Updated title", priority: { name: "High" } })

// Transition
await issue.transition("Done")
await issue.transition("In Progress", { comment: "Starting work" })

// Comments
await issue.addComment("Plain text comment")
const comments = await issue.getComments()

// Assignment
const user = await Users.current()
await issue.assign(user.accountId)
await issue.unassign()

// Clone with overrides
const copy = await issue.clone({ summary: "Copy of " + issue.summary })

// Reload fresh data
await issue.reload()
```

### SearchResult

| Property / Method | Description |
|-------------------|-------------|
| `results.issues` | Array of RichIssue objects |
| `results.keys` | Array of issue keys |
| `results.total` | Total matching count (requires `includeTotal: true`, +1 API call) |
| `results.hasMore` | Whether more pages exist |
| `results.nextPageToken` | Token for next page |
| `results.nextPage()` | Fetch next page |
| `results.map(fn)` | Map over issues |
| `results.filter(fn)` | Filter issues |
| `results.groupBy(key)` | Group issues by property |

### Search Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `fields` | `string[]` | all | Fields to return |
| `maxResults` | `number` | 50 | Issues per page (max 100) |
| `nextPageToken` | `string` | - | Token for next page |
| `expand` | `string[]` | - | Expand options |
| `includeTotal` | `boolean` | `false` | Include total count (+1 API call) |

### searchAll Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `fields` | `string[]` | all | Fields to return |
| `maxResults` | `number` | 100 | Issues per page (max 100) |
| `maxPages` | `number` | 10 | Max pages to load |
| `expand` | `string[]` | - | Expand options |

```js
const results = await Issues.search("project = TEST", { maxResults: 50 })

// Iterate
const keys = results.keys
const summaries = results.map(i => i.summary)
const bugs = results.filter(i => i.issueType === "Bug")
const byStatus = results.groupBy("status")

// Pagination
if (results.hasMore) {
  const page2 = await results.nextPage()
}
```

### Smart Field Resolution

Field names in plain objects are automatically resolved to Jira field IDs:

```js
// 'Story Points' -> 'customfield_10016'
await Issues.create("PROJ", "Story", { "Story Points": 5, summary: "My story" })
```

This works in `Issues.create()`, `issue.update()`, and other methods that accept field objects.

### Field Auto-Transform

Common fields are automatically transformed to Jira API format:

| Input | Transformation |
|-------|---------------|
| `priority: 'High'` | `priority: { name: 'High' }` |
| `assignee: 'accountId'` | `assignee: { accountId: '...' }` |
| `description: 'text'` | `description: { type: 'doc', ... }` (ADF) |
| `labels: 'single'` | `labels: ['single']` |
| `components: 'Backend'` | `components: [{ name: 'Backend' }]` |

### ChainablePromise

`Issues.get()` returns a chainable promise - methods can be chained before `await`:

```js
await Issues.get("PROJ-1").update({ summary: "New" }).addComment("Updated!")
```

---

## Users

Look up and search for Jira users.

| Method | Description |
|--------|-------------|
| `Users.current()` | Get the current user |
| `Users.get(accountId)` | Get user by account ID |
| `Users.find(query)` | Search users by name/email |
| `Users.findAssignable(project, query?)` | Find users assignable to a project |

```js
const me = await Users.current()
log(me.displayName)

const user = await Users.get("5b10ac8d82e05b22cc7d4ef5")
log(user.emailAddress)

const devs = await Users.find("john")
const assignable = await Users.findAssignable("PROJ", "alice")
```

---

## Projects

Access Jira project data.

| Method | Description |
|--------|-------------|
| `Projects.get(key)` | Get project by key. Returns RichProject |
| `Projects.list()` | List all accessible projects |

### RichProject Methods

| Method | Description |
|--------|-------------|
| `project.getComponents()` | Get project components |
| `project.getVersions()` | Get project versions |
| `project.getStatuses()` | Get project statuses |
| `project.getRoles()` | Get project roles |

```js
const project = await Projects.get("PROJ")
log(project.name)

const components = await project.getComponents()
const versions = await project.getVersions()

const projects = await Projects.list()
for (const p of projects) {
  log(p.key + ": " + p.name)
}
```

---

## Fields

Work with Jira field metadata.

| Method | Description |
|--------|-------------|
| `Fields.list()` | Get all fields |
| `Fields.get(nameOrId)` | Get field by name or ID |
| `Fields.id(name)` | Resolve field name to its ID |

```js
const fields = await Fields.list()

const priority = await Fields.get("Priority")
log(priority.id)

// Resolve custom field name to ID
const fieldId = await Fields.id("Story Points")
log(fieldId)  // e.g., "customfield_10016"
```

---

## Components

CRUD operations on project components.

| Method | Description |
|--------|-------------|
| `Components.get(id)` | Get component by ID |
| `Components.create(projectKey, name, fields?)` | Create a component |
| `Components.update(id, fields)` | Update a component |
| `Components.delete(id)` | Delete a component |

```js
const comp = await Components.create("PROJ", "Backend", {
  description: "Backend services"
})

await Components.update(comp.id, { description: "Updated" })

const fetched = await Components.get(comp.id)
log(fetched.name)

await Components.delete(comp.id)
```

---

## Versions

Manage project versions (releases).

| Method | Description |
|--------|-------------|
| `Versions.get(id)` | Get version by ID |
| `Versions.create(projectId, name, fields?)` | Create a version |
| `Versions.update(id, fields)` | Update a version |
| `Versions.release(id)` | Release a version |

```js
const version = await Versions.create("10001", "v2.0", {
  description: "Major release"
})

await Versions.update(version.id, { description: "Updated" })

await Versions.release(version.id)
```

---

## Boards

Access Jira Software boards.

| Method | Description |
|--------|-------------|
| `Boards.get(boardId)` | Get board by ID |
| `Boards.list(options?)` | List boards |
| `Boards.getSprints(boardId, state?)` | Get sprints for a board |
| `Boards.getIssues(boardId, options?)` | Get issues on a board |

```js
const boards = await Boards.list({ projectKeyOrId: "PROJ" })
const board = await Boards.get(1)

// Get active sprints
const sprints = await Boards.getSprints(1, "active")
for (const s of sprints) {
  log(s.name + ": " + s.state)
}

// Get board issues
const issues = await Boards.getIssues(1, { maxResults: 20 })
```

---

## Sprints

Work with Jira Software sprints.

| Method | Description |
|--------|-------------|
| `Sprints.get(sprintId)` | Get sprint by ID |
| `Sprints.getIssues(sprintId, options?)` | Get issues in a sprint |
| `Sprints.moveIssues(sprintId, issueKeys)` | Move issues to a sprint |

```js
const sprint = await Sprints.get(10)
log(sprint.name)

const issues = await Sprints.getIssues(10)

// Move issues to sprint
await Sprints.moveIssues(10, ["TEST-1", "TEST-2", "TEST-3"])
```

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
await asyncEvent.push("550e8400-e29b-41d4-a716-446655440000", {
  action: "process",
  issueKey: "TEST-1"
})

// Trigger self with delay
await asyncEvent.pushSelf({ step: 2 }, { delayInSeconds: 60 })
```

---

## Utilities

### Adf

Build Atlassian Document Format documents for rich text comments and descriptions.

**Document & Block Nodes:**

| Method | Description |
|--------|-------------|
| `Adf.doc(...blocks)` | Create a document |
| `Adf.paragraph(...content)` | Paragraph block |
| `Adf.heading(level, ...content)` | Heading (level 1-6) |
| `Adf.bulletList(...items)` | Unordered list |
| `Adf.orderedList(...items)` | Ordered list |
| `Adf.listItem(...content)` | List item |
| `Adf.codeBlock(text, language?)` | Code block |
| `Adf.blockquote(...content)` | Blockquote |
| `Adf.rule()` | Horizontal rule |
| `Adf.panel(type, ...content)` | Panel (info, note, warning, success, error) |

**Table Nodes:**

| Method | Description |
|--------|-------------|
| `Adf.table(...rows)` | Table |
| `Adf.tableRow(...cells)` | Table row |
| `Adf.tableHeader(...content)` | Table header cell |
| `Adf.tableCell(...content)` | Table cell |

**Inline Formatting:**

| Method | Description |
|--------|-------------|
| `Adf.text(content)` | Plain text node |
| `Adf.bold(text)` | Bold text |
| `Adf.italic(text)` | Italic text |
| `Adf.code(text)` | Inline code |
| `Adf.strike(text)` | Strikethrough text |
| `Adf.link(text, href)` | Hyperlink |
| `Adf.mention(accountId)` | User mention |
| `Adf.status(text, color)` | Status lozenge (neutral, purple, blue, red, yellow, green) |
| `Adf.emoji(shortName)` | Emoji |
| `Adf.fromText(plainText)` | Convert plain text to ADF document |

```js
// Build a formatted comment
const doc = Adf.doc(
  Adf.heading(2, "Report"),
  Adf.paragraph("Hello ", Adf.bold("world"), "!"),
  Adf.bulletList(
    Adf.listItem("Item 1"),
    Adf.listItem("Item 2")
  ),
  Adf.table(
    Adf.tableRow(Adf.tableHeader("Name"), Adf.tableHeader("Status")),
    Adf.tableRow(Adf.tableCell("Task A"), Adf.tableCell(Adf.status("Done", "green")))
  )
)

await issue.addComment(doc)
```

### DateUtils

Date arithmetic and formatting utilities.

| Method | Description |
|--------|-------------|
| `DateUtils.diff(date1, date2)` | Difference in milliseconds |
| `DateUtils.diffDays(date1, date2)` | Difference in days |
| `DateUtils.businessDays(date1, date2)` | Business days between dates |
| `DateUtils.addDays(date, n)` | Add days to a date |
| `DateUtils.addBusinessDays(date, n)` | Add business days to a date |
| `DateUtils.isWithinRange(date, start, end)` | Check if date is within range |
| `DateUtils.isWeekend(date)` | Check if date is a weekend |
| `DateUtils.startOfDay(date)` | Start of day (00:00:00) |
| `DateUtils.endOfDay(date)` | End of day (23:59:59) |
| `DateUtils.format(date, pattern)` | Format date (YYYY, MM, DD, HH, mm, ss) |
| `DateUtils.parse(value)` | Parse string to Date |

**Constants:** `DateUtils.DAY_MS`, `DateUtils.HOUR_MS`, `DateUtils.MINUTE_MS`

```js
const now = new Date()
const due = DateUtils.addDays(now, 14)
log(DateUtils.format(due, "YYYY-MM-DD"))

const days = DateUtils.diffDays(issue.created, now)
const bdays = DateUtils.businessDays(issue.created, now)

const deadline = DateUtils.addBusinessDays(now, 5)
```

### Arrays

Array manipulation utilities.

| Method | Description |
|--------|-------------|
| `Arrays.sortBy(array, key)` | Sort by property or function |
| `Arrays.keyBy(array, key)` | Index by property (object lookup) |
| `Arrays.groupBy(array, key)` | Group by property |
| `Arrays.unique(array)` | Remove duplicates |
| `Arrays.uniqueBy(array, key)` | Remove duplicates by property |
| `Arrays.sum(array, key?)` | Sum values |
| `Arrays.avg(array, key?)` | Average values |
| `Arrays.min(array, key?)` | Minimum value |
| `Arrays.max(array, key?)` | Maximum value |
| `Arrays.pluck(array, key)` | Extract property values |
| `Arrays.chunk(array, size)` | Split into chunks |
| `Arrays.partition(array, predicate)` | Split by condition into two arrays |
| `Arrays.countBy(array, key)` | Count by property |
| `Arrays.flatten(array)` | Flatten nested arrays |
| `Arrays.intersection(arr1, arr2)` | Common elements |
| `Arrays.difference(arr1, arr2)` | Elements in arr1 not in arr2 |

```js
const issues = results.issues

const sorted = Arrays.sortBy(issues, "priority")
const byStatus = Arrays.groupBy(issues, "status")
const keys = Arrays.pluck(issues, "key")
const totalPoints = Arrays.sum(issues, "storyPoints")
const [bugs, others] = Arrays.partition(issues, i => i.issueType === "Bug")
const batches = Arrays.chunk(keys, 10)
```

### Strings

String transformation utilities.

| Method | Description |
|--------|-------------|
| `Strings.capitalize(string)` | Capitalize first letter |
| `Strings.truncate(string, maxLen, suffix?)` | Truncate with suffix |
| `Strings.isBlank(string)` | Check if blank/empty |
| `Strings.padStart(string, len, char?)` | Pad from start |
| `Strings.padEnd(string, len, char?)` | Pad from end |
| `Strings.words(string)` | Split into words |
| `Strings.camelCase(string)` | Convert to camelCase |
| `Strings.kebabCase(string)` | Convert to kebab-case |
| `Strings.snakeCase(string)` | Convert to snake_case |

```js
log(Strings.capitalize("hello"))       // "Hello"
log(Strings.truncate("Long text", 6))  // "Lon..."
log(Strings.camelCase("my variable"))  // "myVariable"
log(Strings.kebabCase("myVariable"))   // "my-variable"
```

### CSV

Parse and generate CSV data.

| Method | Description |
|--------|-------------|
| `CSV.parse(text, options?)` | Parse CSV text to array of objects |
| `CSV.stringify(data, options?)` | Convert array of objects to CSV text |

Options: `{ separator: "," }` (default comma)

```js
// Parse CSV
const data = CSV.parse("name,age\nAlice,30\nBob,25")
// => [{name: "Alice", age: "30"}, {name: "Bob", age: "25"}]

// Generate CSV
const csv = CSV.stringify([
  { name: "Alice", age: 30 },
  { name: "Bob", age: 25 }
])
// => "name,age\nAlice,30\nBob,25"
```

### Validator

Value validation utilities.

| Method | Description |
|--------|-------------|
| `Validator.isEmail(value)` | Check if valid email |
| `Validator.isUrl(value)` | Check if valid URL |
| `Validator.isJiraKey(value)` | Check if valid Jira issue key (e.g., `PROJ-123`) |
| `Validator.isAccountId(value)` | Check if valid Atlassian account ID |

```js
log(Validator.isEmail("user@example.com"))  // true
log(Validator.isUrl("https://jira.com"))    // true
log(Validator.isJiraKey("TEST-123"))        // true
log(Validator.isAccountId("5b10ac8d82e05b22cc7d4ef5"))  // true
```

---

## Script Context Variables

Variables available in scripts depending on context:

| Variable | Available when | Description |
|----------|---------------|-------------|
| `issueKey` | Issue key provided | The issue key string |
| `issue` | Issue context loaded | Issue data object |
| `context` | Always | Execution context metadata |
| `event` | Event/scheduled/async triggers | Event payload |
| `uim` | UIM triggers | UI modification methods |
| `uimData` | UIM triggers | Form field values and callback info |
| `currentUser` | Always | Current user info |
| Global vars | When defined | Variables from the global script |

---

## Next Steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and sandbox details
- [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) - Built-in interactive reference with examples
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Tables and queues usage
- [Limits](/docs/jibrok-studio-jira/limits) - All execution and storage limits
