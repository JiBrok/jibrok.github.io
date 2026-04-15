---
title: "Scripting API: Issues"
seo_title: "Jira Issues API - Search, Create, Update, Transition"
key: jibrok-studio-jira
excerpt: Search, create, update, and transition Jira issues
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - api
  - issues
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.
> **Issues** | [Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira) | [Utilities](/docs/jibrok-studio-jira/scripting-api-utilities) | [Smart Values](/docs/jibrok-studio-jira/scripting-api-smart-values)

## Issues

Work with Jira issues - search, create, update, transition, and more.

### Static methods

| Method | Description | API calls |
|--------|-------------|-----------|
| `Issues.get(key, options?)` | Get issue by key. Returns a RichIssue | 1 |
| `Issues.search(jql, options?)` | Search issues by JQL. Returns SearchResult | 1 |
| `Issues.searchAll(jql, options?)` | Search all matching issues (auto-pagination). Returns SearchResult | 1 (count) + N (pages) |
| `Issues.count(jql)` | Count issues matching JQL | 1 |
| `Issues.create(project, issueType, fields?)` | Create a new issue | 1 (+1 field cache) |
| `Issues.update(key, fields, opts?)` | Update issue fields (opts: notifyUsers) | 1 |
| `Issues.transition(key, status, opts?)` | Transition issue (opts: fields, comment) | 2 |
| `Issues.addComment(key, textOrAdf)` | Add comment to issue | 1 |
| `Issues.link(key1, linkType, key2)` | Link two issues | 1 |
| `Issues.notify(key, options)` | Send email notification about an issue | 1 |

```js
// Get an issue
const issue = Issues.get("TEST-1")
log(issue.summary)
log(issue.status)

// Search issues
const results = Issues.search("project = TEST AND status = Open", {
  maxResults: 10,
  fields: ["summary", "status"],
  includeTotal: true
})
log(`Found: ${results.total}`)
for (const issue of results.issues) {
  log(`${issue.key}: ${issue.summary}`)
}

// Search all (auto-pagination)
const all = Issues.searchAll("project = TEST AND status = Open")
log(`Total: ${all.issues.length}`)

// Count
const count = Issues.count("project = TEST")

// Create an issue
const created = Issues.create("TEST", "Task", {
  summary: "New task",
  description: "Task description"
})
log(created.key)

// Link issues
Issues.link("TEST-1", "Blocks", "TEST-2")
```

### RichIssue properties

**Core properties:**

| Property | Description |
|----------|-------------|
| `key` | Issue key (e.g., `"TEST-1"`) |
| `id` | Issue ID |
| `summary` | Summary text |
| `status` | Status name |
| `statusCategory` | Status category name (e.g., "To Do", "In Progress", "Done") |
| `assignee` | Assignee display name |
| `assigneeId` | Assignee account ID |
| `reporter` | Reporter display name |
| `priority` | Priority name |
| `issueType` | Issue type name |
| `project` | Project key |
| `labels` | Labels array |
| `components` | Components array (names) |
| `fixVersions` | Fix versions array (names) |
| `created` | Created date string |
| `updated` | Updated date string |
| `dueDate` | Due date string (null if not set) |
| `resolutionDate` | Resolution date string (null if unresolved) |
| `description` | Description text |
| `parent` | Parent issue key (null if no parent) |
| `subtasks` | Array of subtask keys |
| `links` | Array of linked issues |
| `resolution` | Resolution name (null if unresolved) |
| `self` | REST API URL for this issue |
| `fields` | Raw fields object |

**Computed properties** (calculated automatically, no API call):

| Property | Type | Description |
|----------|------|-------------|
| `age` | number | Days since creation |
| `staleDays` | number | Days since last update |
| `isOverdue` | boolean | Whether past due date |
| `isAssigned` | boolean | Whether assigned |
| `isResolved` | boolean | Whether in 'done' status category |
| `isInProgress` | boolean | Whether in 'indeterminate' status category |
| `isTodo` | boolean | Whether in 'new' status category |

**Typed wrapper properties:**

| Property | Type | Description |
|----------|------|-------------|
| `assigneeUser` | User/null | Assignee as User wrapper |
| `reporterUser` | User | Reporter as User wrapper |
| `projectObj` | Project | Project as Project wrapper |

### RichIssue methods

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
| `issue.addLabel(label)` | Add a label | 1 |
| `issue.removeLabel(label)` | Remove a label | 1 |
| `issue.field(nameOrId)` | Get a field value by name or ID (with smart resolution) | 0 |
| `issue.delete()` | Delete the issue | 1 |
| `issue.reload()` | Reload issue data from Jira | 1 |
| `issue.clone(overrides?)` | Clone the issue | 1 |
| `issue.notify(options)` | Send email notification | 1 |
| `issue.deleteComment(commentId)` | Delete a comment | 1 |
| `issue.editComment(commentId, textOrAdf)` | Edit a comment | 1 |
| `issue.getFirstComment()` | Get first (oldest) comment | 1 |
| `issue.getLastComment()` | Get last (newest) comment | 1 |
| `issue.takeCommentsFromLatest(n)` | Get n most recent comments | 1 |
| `issue.takeCommentsFromOldest(n)` | Get first n comments | 1 |
| `issue.getWatchers()` | Get all watchers (returns User[]) | 1 |
| `issue.removeWatcher(accountId)` | Remove a watcher | 1 |
| `issue.getWorklogs()` | Get all work logs | 1 |
| `issue.addWorklog(timeSpent, opts?)` | Add work log (opts: started, comment) | 1 |
| `issue.getChangelog(opts?)` | Get change history | 1 |
| `issue.getAttachments()` | Get all attachments | 1 |
| `issue.deleteAttachment(attachmentId)` | Delete an attachment | 1 |
| `issue.getRemoteLinks()` | Get remote (web) links | 1 |
| `issue.addRemoteLink(url, title, opts?)` | Add a remote link | 1 |
| `issue.removeRemoteLink(linkId)` | Remove a remote link | 1 |
| `issue.removeLink(linkId)` | Remove an issue link by ID | 1 |
| `issue.unlink(linkType, targetKey)` | Remove link by type and target issue | 1 |
| `issue.addComponent(name)` | Add component to issue | 1 |
| `issue.removeComponent(name)` | Remove component from issue | 1 |
| `issue.addFixVersion(name)` | Add fix version | 1 |
| `issue.removeFixVersion(name)` | Remove fix version | 1 |
| `issue.getVotes()` | Get vote information | 1 |
| `issue.addVote()` | Vote for issue | 1 |
| `issue.removeVote()` | Remove vote | 1 |
| `issue.listProperties()` | List custom property keys | 1 |
| `issue.getProperty(propKey)` | Get custom property value | 1 |
| `issue.setProperty(propKey, value)` | Set custom property | 1 |
| `issue.deleteProperty(propKey)` | Delete custom property | 1 |
| `issue.isSubTask()` | Check if issue is a subtask | 0 |
| `issue.getCreator()` | Get creator as User wrapper | 0 |
| `issue.getParentObject()` | Get parent as RichIssue | 1 |
| `issue.getSubTaskObjects()` | Get all subtasks as RichIssue[] | N |
| `issue.createSubTask(issueType, fields?)` | Create a subtask | 1 |
| `issue.getCustomFieldValue(nameOrId)` | Get custom field value by name or ID | 0 |

```js
const issue = Issues.get("TEST-1")

// Update fields
issue.update({ summary: "Updated title", priority: { name: "High" } })

// Transition
issue.transition("Done")
issue.transition("In Progress", { comment: "Starting work" })

// Comments
issue.addComment("Plain text comment")
const comments = issue.getComments()

// Assignment
const user = Users.current()
issue.assign(user.accountId)
issue.unassign()

// Clone with overrides
const copy = issue.clone({ summary: "Copy of " + issue.summary })

// Reload fresh data
issue.reload()

// Comments
const last = issue.getLastComment()
issue.editComment(last.id, "Updated comment text")
issue.deleteComment(last.id)

// Worklogs
issue.addWorklog("2h 30m", { comment: "Code review" })
const logs = issue.getWorklogs()

// Attachments and remote links
const attachments = issue.getAttachments()
issue.addRemoteLink("https://example.com", "Design doc")
const remoteLinks = issue.getRemoteLinks()

// Components and versions
issue.addComponent("Backend")
issue.addFixVersion("v2.0")
issue.removeComponent("Frontend")

// Votes
issue.addVote()
const votes = issue.getVotes()

// Custom properties
issue.setProperty("custom.score", 42)
const score = issue.getProperty("custom.score")

// Subtasks
if (!issue.isSubTask()) {
  const sub = issue.createSubTask("Sub-task", { summary: "Implementation" })
  const subs = issue.getSubTaskObjects()
}

// Change history
const changelog = issue.getChangelog()

// Static update/transition (without getting issue first)
Issues.update("TEST-1", { summary: "New title" }, { notifyUsers: false })
Issues.transition("TEST-1", "Done", { comment: "Closing" })
Issues.addComment("TEST-1", "A comment via static method")

// Send email notification
issue.notify({
  subject: "Action required",
  textBody: "Please review this issue",
  to: { assignee: true, watchers: true }
})
```

### Notify options

| Property | Type | Description |
|----------|------|-------------|
| `subject` | string | Email subject (max 255 chars) |
| `textBody` | string | Plain text body (max 32KB) |
| `htmlBody` | string | HTML body (max 32KB) |
| `to.reporter` | boolean | Include reporter |
| `to.assignee` | boolean | Include assignee |
| `to.watchers` | boolean | Include all watchers |
| `to.voters` | boolean | Include all voters |
| `to.users` | string[] | Account IDs (max 50) |
| `to.groups` | string[] | Group names (max 50) |
| `restrict.groups` | string[] | Restrict visibility to groups |
| `restrict.permissions` | string[] | Restrict visibility by permissions |

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
| `results.countBy(key)` | Count issues by property value |
| `results.forEach(fn)` | Execute async function for each issue (returns report) |
| `results.updateAll(fields)` | Update all issues with the same fields (returns report) |
| `results.transitionAll(status, options?)` | Transition all issues (returns report) |

### Search options

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
const results = Issues.search("project = TEST", { maxResults: 50 })

// Iterate
const keys = results.keys
const summaries = results.map(i => i.summary)
const bugs = results.filter(i => i.issueType === "Bug")
const byStatus = results.groupBy("status")

// Pagination
if (results.hasMore) {
  const page2 = results.nextPage()
}
```

### Smart field resolution

Field names in plain objects are automatically resolved to Jira field IDs:

```js
// 'Story Points' -> 'customfield_10016'
Issues.create("PROJ", "Story", { "Story Points": 5, summary: "My story" })
```

This works in `Issues.create()`, `issue.update()`, and other methods that accept field objects.

### Field auto-transform

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
Issues.get("PROJ-1").update({ summary: "New" }).addComment("Updated!")
```

---

### Bulk operation reports

`forEach()`, `updateAll()`, and `transitionAll()` return a report object:

| Property | Description |
|----------|-------------|
| `success` | Number of successfully processed issues |
| `failed` | Number of failed issues |
| `errors` | Array of error details |

```js
const result = Issues.search('project = TEST AND status = Open')

// Update all
const report = result.updateAll({ priority: 'Medium' })
log(`Updated ${report.success}, failed ${report.failed}`)

// Transition all
const report2 = result.transitionAll('In Progress')

// Custom processing
const report3 = result.forEach((issue) => {
  issue.addComment('Batch processed')
})
```

---

## Next steps

- [Scripting API: Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira) - Users, Projects, Fields, Boards, Sprints
- [Scripting API: Configuration & Assets](/docs/jibrok-studio-jira/scripting-api-admin) - Administration namespaces and JSM Assets
- [Scripting API: Utilities](/docs/jibrok-studio-jira/scripting-api-utilities) - Adf, DateUtils, Arrays, Strings, CSV
- [Scripting Examples](/docs/jibrok-studio-jira/scripting-examples) - Practical scripting examples
