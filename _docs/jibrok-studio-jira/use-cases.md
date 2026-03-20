---
title: Use Cases
key: jibrok-studio-jira
excerpt: Practical scripting examples for common Jira automation scenarios
category: examples
tags:
  - doc
  - cloud
  - examples
  - use-cases
  - automation
seo_title: Jira Scripting Use Cases and Examples
last_modified_at: 2026-03-19
date: 2026-02-23
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Bulk update

Mass-update issue fields by JQL query.

**Features used:** Issues.searchAll, issue.update

```js
const issues = Issues.searchAll("project = PROJ AND status = Open AND priority = Low")

for (const issue of issues.issues) {
  issue.update({ priority: { name: "Medium" } })
  log(`Updated ${issue.key}`)
}

return `Updated ${issues.issues.length} issues`
```

---

## Auto-assignment

Automatically assign issues when created, based on component or issue type.

**Features used:** Event trigger (issue_created), Issues.get, issue.assign, Users.findAssignable

```js
// Trigger: Event - issue_created
const issue = Issues.get(issueKey)

const assignmentRules = {
  "Backend": "5b10ac8d82e05b22cc7d4ef5",
  "Frontend": "5b10ac8d82e05b22cc7d4ef6",
}

for (const comp of issue.components) {
  const accountId = assignmentRules[comp.name]
  if (accountId) {
    issue.assign(accountId)
    log(`Assigned ${issue.key} to ${comp.name} lead`)
    break
  }
}
```

---

## SLA monitoring

Scheduled script to find overdue issues and notify via comments.

**Features used:** Scheduled trigger, Issues.searchAll, issue.addComment, DateUtils

```js
// Trigger: Scheduled - Daily
const overdue = Issues.searchAll(
  "project = PROJ AND status != Done AND duedate < now()"
)

for (const issue of overdue.issues) {
  const days = DateUtils.diffDays(issue.fields.duedate, new Date())
  issue.addComment(`This issue is ${days} days overdue. Please review.`)
  log(`Notified: ${issue.key} (${days} days overdue)`)
}

return `Found ${overdue.issues.length} overdue issues`
```

---

## Custom dashboard data

Collect project statistics into a custom table for reporting.

**Features used:** Scheduled trigger, Issues.count, tables

```js
// Trigger: Scheduled - Daily
const projects = ["PROJ", "DEV", "OPS"]

for (const proj of projects) {
  const open = Issues.count(`project = ${proj} AND status != Done`)
  const bugs = Issues.count(`project = ${proj} AND issuetype = Bug AND status != Done`)
  const created = Issues.count(`project = ${proj} AND created >= -7d`)

  tables.addRow("daily_stats", {
    project: proj,
    date: DateUtils.format(new Date(), "YYYY-MM-DD"),
    open_issues: open,
    open_bugs: bugs,
    created_7d: created
  })
}
```

---

## Field sync

Sync a field value from parent to all subtasks when updated.

**Features used:** Event trigger (issue_updated), Issues.get, Issues.search, issue.update

```js
// Trigger: Event - issue_updated
const parent = Issues.get(issueKey)
const subtasks = Issues.search(`parent = ${issueKey}`, {
  fields: ["priority"]
})

for (const sub of subtasks.issues) {
  if (sub.priority !== parent.priority) {
    sub.update({ priority: { name: parent.priority } })
    log(`Synced priority to ${sub.key}`)
  }
}
```

---

## Dynamic forms (UIM)

Show/hide fields based on issue type and set defaults on creation.

**Features used:** UIM trigger, uim.setVisible, uim.setValue, uim.setRequired

```js
// Trigger: UIM (onInit + onChange)
if (uimData.callbackType === 'onInit' || uimData.changedFieldId === 'issuetype') {
  const type = uimData.fieldValues?.issuetype?.value

  if (type === 'Bug') {
    uim.setVisible('environment', true)
    uim.setRequired('environment', true)
    uim.setVisible('customfield_10100', true)  // Steps to reproduce
  } else {
    uim.setVisible('environment', false)
    uim.setRequired('environment', false)
    uim.setVisible('customfield_10100', false)
  }
}

// Auto-fill defaults on create
if (uimData.callbackType === 'onInit' && uimData.viewType === 'GIC') {
  const due = DateUtils.addDays(new Date(), 14)
  uim.setValue('duedate', DateUtils.format(due, 'YYYY-MM-DD'))
}
```

---

## Async workflow

Chain processing steps using async events and queues.

**Features used:** asyncEvent, queue, Issues.get

```js
// Script 1: Trigger async processing chain
const issues = Issues.searchAll("project = PROJ AND labels = needs-review")

for (const issue of issues.issues) {
  queue.push("review-queue", {
    issueKey: issue.key,
    priority: issue.priority
  })
}

log(`Queued ${issues.issues.length} issues for review`)
```

```js
// Script 2: Process the queue (Scheduled trigger)
const messages = queue.consume("review-queue", 10)

for (const msg of messages) {
  const issue = Issues.get(msg.payload.issueKey)
  issue.addComment("Automated review: checked by scheduled job")
  issue.update({ labels: [...issue.labels.filter(l => l !== "needs-review"), "reviewed"] })
  log(`Reviewed: ${msg.payload.issueKey}`)
}
```

---

## Sprint automation

Automatically move unfinished issues to the next sprint when a sprint closes.

**Features used:** Event trigger (sprint_closed), Boards.getSprints, Sprints.getIssues, Sprints.moveIssues

```js
// Trigger: Event - sprint_closed
const boardId = event.sprint.boardId

// Find the next active/future sprint
const sprints = Boards.getSprints(boardId, "active")
if (sprints.length === 0) {
  return "No active sprint to move issues to"
}

const nextSprint = sprints[0]

// Get incomplete issues from closed sprint
const closedSprintId = event.sprint.id
const issues = Sprints.getIssues(closedSprintId, {
  jql: "status != Done"
})

const keys = issues.issues.map(i => i.key)
if (keys.length > 0) {
  Sprints.moveIssues(nextSprint.id, keys)
  log(`Moved ${keys.length} issues to ${nextSprint.name}`)
}

return `Moved ${keys.length} unfinished issues`
```

---

## Issue cloning

Clone issues with modifications - useful for recurring tasks.

**Features used:** Issues.get, issue.clone

```js
// Clone a template issue with new values
const template = Issues.get("PROJ-100")

const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
const month = months[new Date().getMonth()]

const clone = template.clone({
  summary: `Monthly Report - ${month}`,
  description: `Monthly report for ${month}. Based on template ${template.key}.`
})

log(`Created ${clone.key} from template ${template.key}`)
return clone.key
```

---

## Data export

Export Jira data to a custom table for reporting or integration.

**Features used:** Scheduled trigger, Issues.searchAll, tables, CSV, DateUtils

```js
// Trigger: Scheduled - Weekly
const issues = Issues.searchAll(
  "project = PROJ AND resolved >= -7d",
  { fields: ["summary", "status", "assignee", "resolutiondate", "priority"] }
)

// Save to custom table
for (const issue of issues.issues) {
  tables.addRow("weekly_resolved", {
    key: issue.key,
    summary: issue.summary,
    assignee: issue.assignee ?? "Unassigned",
    priority: issue.priority,
    resolved: issue.fields.resolutiondate,
    week: DateUtils.format(new Date(), "YYYY-MM-DD")
  })
}

// Also generate CSV summary
const csv = CSV.stringify(issues.issues.map(i => ({
  Key: i.key,
  Summary: i.summary,
  Assignee: i.assignee ?? "Unassigned",
  Priority: i.priority
})))

log(csv)
return `Exported ${issues.issues.length} resolved issues`
```

---

## Workflow validator

Validate that required fields are set before a workflow transition completes.

**Features used:** Workflow Validator trigger, Issues.get, event.transition, event.modifiedFields

```js
// Trigger: Workflow Validator
const issue = Issues.get(issueKey)

// Only validate when transitioning to "Done"
if (event.transition.to_status === "Done") {
  // Check required fields
  if (!issue.fields.fixVersions || issue.fields.fixVersions.length === 0) {
    return { valid: false, errorMessage: "Fix Version is required before closing" }
  }

  if (!issue.fields.resolution) {
    return { valid: false, errorMessage: "Resolution must be set" }
  }
}

return { valid: true }
```

---

## Workflow post function

Automatically perform actions after a workflow transition.

**Features used:** Workflow Post Function trigger, Issues.get, issue.update, issue.addComment, event.transition

```js
// Trigger: Workflow Post Function
const issue = Issues.get(issueKey)

// When issue moves to "In Progress", auto-assign to current user
if (event.transition.to_status === "In Progress" && !issue.isAssigned) {
  issue.assign(currentUser.accountId)
  issue.addComment(`Auto-assigned to ${currentUser.displayName} on transition start`)
  log(`Assigned ${issue.key} to ${currentUser.displayName}`)
}

// When issue moves to "Done", set resolution date label
if (event.transition.to_status === "Done") {
  const today = DateUtils.format(new Date(), "YYYY-MM-DD")
  issue.update({
    labels: [...issue.labels, `resolved-${today}`]
  })
}
```

---

## Webhook handler

Process incoming HTTP requests from external systems.

**Features used:** Webtrigger, webhook context variables, Issues.get, issue.addComment

```js
// Trigger: Webtrigger (POST)
log("Received:", webhook.method, webhook.path)

if (webhook.body && webhook.body.issueKey) {
  const issue = Issues.get(webhook.body.issueKey)
  const source = webhook.headers["x-source"] ?? "unknown"

  issue.addComment(`External notification from ${source}: ${webhook.body.message ?? "no message"}`)
  log(`Processed webhook for ${issue.key}`)

  return { status: "ok", issue: issue.key }
}

return { status: "error", message: "issueKey is required in request body" }
```

---

## Bulk scenario

Process thousands of issues using scenarios with automatic pagination and error handling.

**Features used:** Scenarios (step, batch), Issues.count, issue.transition

```js
step('count', () => {
  return { total: Issues.count('project = PROJ') }
})

batch('cleanup', {
  jql: 'project = PROJ AND updated < -180d',
  fields: ['summary', 'status'],
  batchSize: 50,
  continueOnError: true,
}, (issue) => {
  issue.transition('Done')
})

step('report', (ctx) => {
  log(`Done: ${ctx.cleanup.processed}/${ctx.count.total}`)
  log(`Failed: ${ctx.cleanup.failed}`)
  if (ctx.cleanup.errors.length > 0) {
    log('Errors: ' + ctx.cleanup.errors.join(', '))
  }
})
```

Run as a scenario from the Console - each batch page executes as a separate Forge event, allowing processing of thousands of issues without timeouts. See [Scenarios](/docs/jibrok-studio-jira/scenarios) for the full guide.

---

## Next steps

- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and features
- [Triggers](/docs/jibrok-studio-jira/triggers) - Trigger configuration
- [Scenarios](/docs/jibrok-studio-jira/scenarios) - Multi-step scenarios for bulk operations
- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Tables and queues
