---
title: Use Cases
key: jibrok-studio-jira
excerpt: Practical scripting examples for common Jira automation scenarios
category: administration
tags:
  - doc
  - cloud
  - examples
  - use-cases
  - automation
---

* TOC
{:toc}

## Bulk Update

Mass-update issue fields by JQL query.

**Features used:** Issues.searchAll, issue.update

```js
const issues = await Issues.searchAll("project = PROJ AND status = Open AND priority = Low")

for (const issue of issues.issues) {
  await issue.update({ priority: { name: "Medium" } })
  log(`Updated ${issue.key}`)
}

return `Updated ${issues.issues.length} issues`
```

---

## Auto-Assignment

Automatically assign issues when created, based on component or issue type.

**Features used:** Event trigger (issue_created), Issues.get, issue.assign, Users.findAssignable

```js
// Trigger: Event - issue_created
const issue = await Issues.get(issueKey)

const assignmentRules = {
  "Backend": "5b10ac8d82e05b22cc7d4ef5",
  "Frontend": "5b10ac8d82e05b22cc7d4ef6",
}

for (const comp of issue.components) {
  const accountId = assignmentRules[comp.name]
  if (accountId) {
    await issue.assign(accountId)
    log(`Assigned ${issue.key} to ${comp.name} lead`)
    break
  }
}
```

---

## SLA Monitoring

Scheduled script to find overdue issues and notify via comments.

**Features used:** Scheduled trigger, Issues.searchAll, issue.addComment, DateUtils

```js
// Trigger: Scheduled - Daily
const overdue = await Issues.searchAll(
  "project = PROJ AND status != Done AND duedate < now()"
)

for (const issue of overdue.issues) {
  const days = DateUtils.diffDays(issue.fields.duedate, new Date())
  await issue.addComment(`This issue is ${days} days overdue. Please review.`)
  log(`Notified: ${issue.key} (${days} days overdue)`)
}

return `Found ${overdue.issues.length} overdue issues`
```

---

## Custom Dashboard Data

Collect project statistics into a custom table for reporting.

**Features used:** Scheduled trigger, Issues.count, tables

```js
// Trigger: Scheduled - Daily
const projects = ["PROJ", "DEV", "OPS"]

for (const proj of projects) {
  const open = await Issues.count(`project = ${proj} AND status != Done`)
  const bugs = await Issues.count(`project = ${proj} AND issuetype = Bug AND status != Done`)
  const created = await Issues.count(`project = ${proj} AND created >= -7d`)

  await tables.addRow("daily_stats", {
    project: proj,
    date: DateUtils.format(new Date(), "YYYY-MM-DD"),
    open_issues: open,
    open_bugs: bugs,
    created_7d: created
  })
}
```

---

## Field Sync

Sync a field value from parent to all subtasks when updated.

**Features used:** Event trigger (issue_updated), Issues.get, Issues.search, issue.update

```js
// Trigger: Event - issue_updated
const parent = await Issues.get(issueKey)
const subtasks = await Issues.search(`parent = ${issueKey}`, {
  fields: ["priority"]
})

for (const sub of subtasks.issues) {
  if (sub.priority !== parent.priority) {
    await sub.update({ priority: { name: parent.priority } })
    log(`Synced priority to ${sub.key}`)
  }
}
```

---

## Dynamic Forms (UIM)

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

## Async Workflow

Chain processing steps using async events and queues.

**Features used:** asyncEvent, queue, Issues.get

```js
// Script 1: Trigger async processing chain
const issues = await Issues.searchAll("project = PROJ AND labels = needs-review")

for (const issue of issues.issues) {
  await queue.push("review-queue", {
    issueKey: issue.key,
    priority: issue.priority
  })
}

log(`Queued ${issues.issues.length} issues for review`)
```

```js
// Script 2: Process the queue (Scheduled trigger)
const messages = await queue.consume("review-queue", 10)

for (const msg of messages) {
  const issue = await Issues.get(msg.payload.issueKey)
  await issue.addComment("Automated review: checked by scheduled job")
  await issue.update({ labels: [...issue.labels.filter(l => l !== "needs-review"), "reviewed"] })
  log(`Reviewed: ${msg.payload.issueKey}`)
}
```

---

## Sprint Automation

Automatically move unfinished issues to the next sprint when a sprint closes.

**Features used:** Event trigger (sprint_closed), Boards.getSprints, Sprints.getIssues, Sprints.moveIssues

```js
// Trigger: Event - sprint_closed
const boardId = event.boardId

// Find the next active/future sprint
const sprints = await Boards.getSprints(boardId, "active")
if (sprints.length === 0) {
  return "No active sprint to move issues to"
}

const nextSprint = sprints[0]

// Get incomplete issues from closed sprint
const closedSprintId = event.sprintId
const issues = await Sprints.getIssues(closedSprintId, {
  jql: "status != Done"
})

const keys = issues.issues.map(i => i.key)
if (keys.length > 0) {
  await Sprints.moveIssues(nextSprint.id, keys)
  log(`Moved ${keys.length} issues to ${nextSprint.name}`)
}

return `Moved ${keys.length} unfinished issues`
```

---

## Issue Cloning

Clone issues with modifications - useful for recurring tasks.

**Features used:** Issues.get, issue.clone

```js
// Clone a template issue with new values
const template = await Issues.get("PROJ-100")

const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
const month = months[new Date().getMonth()]

const clone = await template.clone({
  summary: `Monthly Report - ${month}`,
  description: `Monthly report for ${month}. Based on template ${template.key}.`
})

log(`Created ${clone.key} from template ${template.key}`)
return clone.key
```

---

## Data Export

Export Jira data to a custom table for reporting or integration.

**Features used:** Scheduled trigger, Issues.searchAll, tables, CSV, DateUtils

```js
// Trigger: Scheduled - Weekly
const issues = await Issues.searchAll(
  "project = PROJ AND resolved >= -7d",
  { fields: ["summary", "status", "assignee", "resolutiondate", "priority"] }
)

// Save to custom table
for (const issue of issues.issues) {
  await tables.addRow("weekly_resolved", {
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

## Next Steps

- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and features
- [Triggers](/docs/jibrok-studio-jira/triggers) - Trigger configuration
- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Tables and queues
