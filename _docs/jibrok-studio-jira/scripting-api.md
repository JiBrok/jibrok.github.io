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

## Links

Get information about issue link types.

| Method | Description |
|--------|-------------|
| `Links.types()` | Get all issue link types (id, name, inward, outward) |

```js
const linkTypes = await Links.types()
for (const lt of linkTypes) {
  log(`${lt.name}: ${lt.inward} / ${lt.outward}`)
}
// Example output:
// Blocks: is blocked by / blocks
// Duplicate: is duplicated by / duplicates
// Relates: relates to / relates to
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

**Reader Functions:**

| Method | Description |
|--------|-------------|
| `Adf.toText(adf)` | Extract plain text from ADF document |
| `Adf.extractLinks(adf)` | Extract all link URLs from ADF |
| `Adf.extractMentions(adf)` | Extract all mention account IDs from ADF |
| `Adf.contains(adf, text)` | Check if ADF contains text (case-insensitive) |

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

// Reader functions
const issue = await Issues.get("PROJ-1")
const text = Adf.toText(issue.fields.description)
const links = Adf.extractLinks(issue.fields.description)
const mentions = Adf.extractMentions(issue.fields.description)
const hasKeyword = Adf.contains(issue.fields.description, "urgent")
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

### String Smart Value Methods (28)

Automation-compatible instance methods callable on any string. All methods returning strings are chainable.

**Text manipulation:**

| Method | Description |
|--------|-------------|
| `s.capitalize()` | First letter uppercase, rest unchanged |
| `s.abbreviate(maxLen)` | Shorten with "..." suffix (maxLen >= 4) |
| `s.left(n)` | First n characters |
| `s.right(n)` | Last n characters |
| `s.remove(sub)` | Remove all occurrences of sub |
| `s.reverse()` | Reverse string (unicode-safe) |

**Substring extraction:**

| Method | Description |
|--------|-------------|
| `s.substringBefore(sep)` | Text before first occurrence of sep |
| `s.substringAfter(sep)` | Text after first occurrence of sep |
| `s.substringBetween(open, close?)` | Text between delimiters (null if not found) |

**Checks:**

| Method | Description |
|--------|-------------|
| `s.isEmpty()` | True if length is 0 |
| `s.isNotEmpty()` | True if length > 0 |
| `s.isBlank()` | True if empty or whitespace only |
| `s.isNotBlank()` | True if contains non-whitespace |
| `s.equalsIgnoreCase(other)` | Case-insensitive comparison |
| `s.isAlpha()` | Only letters (a-zA-Z), non-empty |
| `s.isAlphanumeric()` | Only letters and digits, non-empty |
| `s.isNumeric()` | Only digits (0-9), non-empty |

**Conversion:**

| Method | Description |
|--------|-------------|
| `s.asNumber()` | Convert to number, null if invalid |

**Encoding:**

| Method | Description |
|--------|-------------|
| `s.htmlEncode()` | Escape `& < > " '` as HTML entities |
| `s.jsonEncode()` | Escape for JSON embedding |
| `s.xmlEncode()` | Escape as XML entities |
| `s.urlEncode()` | URL-encode (encodeURIComponent) |
| `s.quote()` | Escape regex special characters |

**Case conversion:**

| Method | Description |
|--------|-------------|
| `s.camelCase()` | "hello world" -> "helloWorld" |
| `s.kebabCase()` | "helloWorld" -> "hello-world" |
| `s.snakeCase()` | "helloWorld" -> "hello_world" |
| `s.words()` | Split into array of words (camelCase-aware) |
| `s.lines()` | Split by newline into array |

```js
log("hello world".capitalize())     // "Hello world"
log("hello world".abbreviate(8))    // "hello..."
log("user@example.com".substringBefore("@"))  // "user"
log("  ".isBlank())                 // true
log("42".asNumber())                // 42
log("<b>A</b>".htmlEncode())        // "&lt;b&gt;A&lt;/b&gt;"
log("helloWorld".kebabCase())       // "hello-world"
```

### Array Smart Value Methods (9)

Automation-compatible aggregation and access methods on arrays.

| Method | Returns | Description |
|--------|---------|-------------|
| `a.first()` | any/null | First element, null if empty |
| `a.last()` | any/null | Last element, null if empty |
| `a.size()` | number | Number of elements |
| `a.isEmpty()` | boolean | True if empty |
| `a.distinct()` | array | Unique elements (preserves order) |
| `a.sum()` | number | Sum of numeric elements (skips non-numeric) |
| `a.average()` | number | Average of numeric elements |
| `a.min()` | number/null | Minimum numeric value |
| `a.max()` | number/null | Maximum numeric value |

```js
log([10, 20, 30].first())          // 10
log([10, 20, 30].last())           // 30
log([1, 2, 2, 3, 1].distinct())   // [1, 2, 3]
log([10, 20, 30].sum())            // 60
log([10, 20, 30].average())        // 20
log([5, 2, 8, 1].min())           // 1
```

### Date Instance Methods

All Date objects support these instance methods for arithmetic, navigation, formatting, and comparison.

**Arithmetic:**

| Method | Description |
|--------|-------------|
| `d.plusDays(n)` | Add n days |
| `d.minusDays(n)` | Subtract n days |
| `d.plusHours(n)` | Add n hours |
| `d.plusWeeks(n)` | Add n weeks |
| `d.plusMonths(n)` | Add n months |
| `d.plusYears(n)` | Add n years |

**Withers:**

| Method | Description |
|--------|-------------|
| `d.withDayOfMonth(day)` | Set day of month |
| `d.withMonth(month)` | Set month (1-12) |
| `d.withYear(year)` | Set year |

**Navigation:**

| Method | Description |
|--------|-------------|
| `d.startOfDay()` | Midnight (00:00:00) |
| `d.endOfDay()` | End of day (23:59:59.999) |
| `d.startOfMonth()` | First day of month |
| `d.endOfMonth()` | Last day of month |
| `d.startOfYear()` | January 1st |
| `d.endOfYear()` | December 31st |

**Day-of-week navigation:**

| Method | Description |
|--------|-------------|
| `d.withNextDayOfWeek(day)` | Next given weekday (min +1 day) |
| `d.firstOfTheMonth(day)` | First given weekday in month |
| `d.lastOfTheMonth(day)` | Last given weekday in month |

Day names: `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday` (or short: `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`).

**Business days:**

| Method | Description |
|--------|-------------|
| `d.isBusinessDay()` | True if Mon-Fri |
| `d.toBusinessDay()` | Move weekend to next Monday |
| `d.toBusinessDayBackwards()` | Move weekend to previous Friday |
| `d.plusBusinessDays(n)` | Add n business days |
| `d.minusBusinessDays(n)` | Subtract n business days |
| `d.firstBusinessDayOfMonth()` | First business day (Mon-Fri) of the month |
| `d.lastBusinessDayOfMonth()` | Last business day (Mon-Fri) of the month |

**Format presets:**

| Method | Example Output |
|--------|---------------|
| `d.jiraDate()` | `2024-06-15` |
| `d.jiraDateTime()` | `2024-06-15T14:30:45.123Z` |
| `d.shortDate()` | `6/15/24` |
| `d.mediumDate()` | `Jun 15, 2024` |
| `d.longDate()` | `June 15, 2024` |
| `d.fullDate()` | `Saturday, June 15, 2024` |
| `d.shortTime()` | `2:30 PM` |
| `d.mediumTime()` | `2:30:45 PM` |
| `d.shortDateTime()` | `6/15/24 2:30 PM` |
| `d.mediumDateTime()` | `Jun 15, 2024 2:30:45 PM` |
| `d.longDateTime()` | `June 15, 2024 2:30:45 PM UTC` |
| `d.fullDateTime()` | `Saturday, June 15, 2024 2:30:45 PM UTC` |

**Custom format tokens** for `d.format(pattern)`:

| Token | Output | Example |
|-------|--------|---------|
| `yyyy` | 4-digit year | `2024` |
| `yy` | 2-digit year | `24` |
| `MMMM` | Full month name | `June` |
| `MMM` | Short month name | `Jun` |
| `MM` | Month (zero-padded) | `06` |
| `M` | Month | `6` |
| `dd` | Day (zero-padded) | `05` |
| `d` | Day | `5` |
| `EEEE` | Full weekday name | `Saturday` |
| `EEE` | Short weekday name | `Sat` |
| `HH` | Hour 24h (zero-padded) | `14` |
| `H` | Hour 24h | `14` |
| `hh` | Hour 12h (zero-padded) | `02` |
| `h` | Hour 12h | `2` |
| `mm` | Minutes (zero-padded) | `30` |
| `m` | Minutes | `30` |
| `ss` | Seconds (zero-padded) | `05` |
| `s` | Seconds | `5` |
| `SSS` | Milliseconds | `123` |
| `a` | AM/PM | `PM` |

```js
let d = Date.create("2024-06-15T14:30:05.123Z")
log(d.format("yyyy-MM-dd"))           // "2024-06-15"
log(d.format("dd/MM/yyyy HH:mm"))     // "15/06/2024 14:30"
log(d.format("EEEE, MMMM d, yyyy"))   // "Saturday, June 15, 2024"
log(d.format("h:mm a"))               // "2:30 PM"
```

**Timezones:**

| Method | Description |
|--------|-------------|
| `d.setTimeZone(tz)` | Set display timezone (does not shift timestamp) |
| `d.convertToTimeZone(tz)` | Convert to timezone (shifts timestamp) |

**Comparison:**

| Method | Description |
|--------|-------------|
| `d.isAfter(other)` | True if after other date |
| `d.isBefore(other)` | True if before other date |
| `d.isEqual(other)` | True if same time |
| `d.compareTo(other)` | Returns -1, 0, or 1 |
| `d.diff(other)` | Difference in milliseconds |

**String-to-Date conversion:**

| Method | Description |
|--------|-------------|
| `"2024-06-15".toDate()` | Parse ISO date string to Date |

```js
let d = Date.create("2024-06-15T14:30:00Z")

// Arithmetic
log(d.plusDays(7).jiraDate())           // "2024-06-22"
log(d.plusMonths(1).jiraDate())         // "2024-07-15"
log(d.plusBusinessDays(5).jiraDate())   // "2024-06-24"

// Navigation
log(d.startOfMonth().jiraDate())       // "2024-06-01"
log(d.endOfMonth().jiraDate())         // "2024-06-30"
log(d.withNextDayOfWeek("monday").jiraDate())  // "2024-06-17"

// Formatting
log(d.mediumDate())                    // "Jun 15, 2024"
log(d.setTimeZone("America/New_York").format("HH:mm"))  // "10:30"

// Comparison
log(d.isAfter(d.minusDays(1)))         // true
log(d.diff(d.plusDays(1)))             // -86400000
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

## User Wrapper

`Users.current()` and `Users.get(accountId)` return User wrapper objects with typed properties. Also accessible via `issue.assigneeUser` and `issue.reporterUser` on RichIssue objects.

| Property | Description |
|----------|-------------|
| `displayName` | User display name |
| `accountId` | Atlassian account ID |
| `emailAddress` | User email address |
| `avatarUrl` | Avatar URL (48x48) |
| `active` | Is account active |
| `timeZone` | User timezone |
| `locale` | User locale |

| Method | Description |
|--------|-------------|
| `toString()` | Returns displayName or accountId |
| `toJSON()` | Plain object representation |
| `equals(other)` | Compare by accountId |

```js
const user = await Users.current()
log(user.displayName)
log(user.timeZone)

const issue = await Issues.get("TEST-1")
log(issue.assigneeUser?.displayName)
log(issue.reporterUser?.equals(user))
```

---

## Project Wrapper

`Projects.get(key)` returns a Project wrapper with typed properties and async methods. Also accessible via `issue.projectObj` on RichIssue objects.

| Property | Description |
|----------|-------------|
| `key` | Project key |
| `name` | Project name |
| `id` | Project ID |
| `projectTypeKey` | Project type (software, etc.) |
| `description` | Project description |
| `lead` | Project lead (User wrapper or null) |
| `url` | Project URL |

| Method | Description |
|--------|-------------|
| `getComponents()` | Get project components |
| `getVersions()` | Get project versions |
| `getStatuses()` | Get project statuses |
| `getRoles()` | Get project roles |
| `toString()` | Returns project key |
| `equals(other)` | Compare by key |

```js
const proj = await Projects.get("PROJ")
log(proj.name)
log(proj.lead?.displayName)
const comps = await proj.getComponents()

// Access from issue
const issue = await Issues.get("TEST-1")
log(issue.projectObj?.name)
```

---

## Script Context Variables

Variables available in scripts depending on context:

| Variable | Available when | Description |
|----------|---------------|-------------|
| `issueKey` | Issue key provided | The issue key string |
| `issue` | Issue context loaded | Issue data object |
| `context` | Always | Execution context metadata |
| `event` | Event/async/workflow post function/workflow validator triggers | Event payload |
| `event.transition` | Workflow post function/workflow validator trigger | Transition details (`from_status`, `to_status`, `transitionName`) |
| `event.modifiedFields` | Workflow validator trigger | Fields modified during the transition |
| `uim` | UIM triggers | UI modification methods |
| `uimData` | UIM triggers | Form field values and callback info |
| `currentUser` | Always | Current user info |
| Global vars | When defined | Variables from the global script |

---

## Groovy Date Types

When using the Groovy engine, `LocalDate` and `LocalDateTime` have additional methods matching the Date wrapper API:

### LocalDate Methods

| Method | Return | Description |
|--------|--------|-------------|
| `toDate()` | DateWrapper | Convert to DateWrapper |
| `compareTo(other)` | number | -1, 0, or 1 |
| `jiraDate()` | string | "2024-06-15" |
| `shortDate()` | string | "6/15/24" |
| `mediumDate()` | string | "Jun 15, 2024" |
| `longDate()` | string | "June 15, 2024" |
| `fullDate()` | string | "Saturday, June 15, 2024" |
| `isBusinessDay()` | boolean | Mon-Fri? |
| `toBusinessDay()` | DateWrapper | Weekend -> Monday |
| `plusBusinessDays(n)` | DateWrapper | Add business days |
| `minusBusinessDays(n)` | DateWrapper | Subtract business days |
| `startOfMonth()` | DateWrapper | First day of month |
| `endOfMonth()` | DateWrapper | Last day of month |
| `startOfYear()` | DateWrapper | January 1st |
| `endOfYear()` | DateWrapper | December 31st |
| `withNextDayOfWeek(day)` | DateWrapper | Next given weekday |

### LocalDateTime Additional Methods

All LocalDate methods above, plus:

| Method | Return | Description |
|--------|--------|-------------|
| `jiraDateTime()` | string | ISO format |
| `shortTime()` | string | "2:30 PM" |
| `shortDateTime()` | string | "6/15/24 2:30 PM" |
| `mediumTime()` | string | "2:30:45 PM" |
| `mediumDateTime()` | string | "Jun 15, 2024 2:30:45 PM" |
| `longDateTime()` | string | "June 15, 2024 2:30:45 PM" |
| `fullDateTime()` | string | "Saturday, June 15, 2024 2:30:45 PM" |
| `startOfDay()` | DateWrapper | Midnight |
| `endOfDay()` | DateWrapper | 23:59:59.999 |

```groovy
def date = LocalDate.of(2024, 6, 15)
println date.mediumDate()       // => Jun 15, 2024
println date.isBusinessDay()    // => false (Saturday)

def dt = LocalDateTime.of(2024, 6, 15, 14, 30, 45)
println dt.shortTime()          // => 2:30 PM
println dt.startOfDay().jiraDate()  // => 2024-06-15
```

---

## Next Steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and sandbox details
- [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) - Built-in interactive reference with examples
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Tables and queues usage
- [Limits](/docs/jibrok-studio-jira/limits) - All execution and storage limits
