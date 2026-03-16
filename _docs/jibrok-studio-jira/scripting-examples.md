---
title: Scripting Examples
key: jibrok-studio-jira
excerpt: Practical recipes - bulk operations, reporting, field sync, table CRUD, queue patterns, automation
category: administration
tags:
  - doc
  - cloud
  - scripting
  - examples
  - recipes
  - patterns
---

* TOC
{:toc}

Practical recipes and patterns for common automation tasks. All examples can be pasted directly into the Console. Replace `PROJ-123` with your own issue keys.

---

## Bulk operations

### Update all issues in a project

```js
const result = Issues.search('project = PROJ AND status = Open')
const report = result.updateAll({ priority: 'Medium' })

return `Updated ${report.success} issues, ${report.failed} failed`
```

### Add a comment to multiple issues

```js
const keys = ['PROJ-1', 'PROJ-2', 'PROJ-3']

for (const key of keys) {
  Issues.get(key).addComment('Reviewed and approved.')
  log(`Commented on ${key}`)
}

return `Commented on ${keys.length} issues`
```

### Transition issues by JQL

Move issues matching a query to a target status.

```js
const result = Issues.search('project = PROJ AND status = "To Do" AND created < -30d')
const report = result.transitionAll('In Progress')

return `Transitioned ${report.success}/${report.success + report.failed}`
```

### Bulk assign issues

```js
const user = Users.current()
const result = Issues.search('project = PROJ AND assignee is EMPTY AND status = Open')
const report = result.forEach((issue) => {
  issue.assign(user.accountId)
})

return `Assigned ${report.success} issues to ${user.displayName}`
```

### Scenario batch operations (large scale)

For processing thousands of issues, use `batch()` in [scenarios](/docs/jibrok-studio-jira/scenarios). Each page of results runs as a separate invocation with automatic pagination, progress tracking, and error handling.

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

**Batch with config object:**

```js
batch('export', {
  jql: 'project = PROJ',
  fields: ['summary', 'status', 'priority'],
  batchSize: 50,
  maxIssues: 10000,
  continueOnError: true,
}, (issue) => {
  log(issue.key + ': ' + issue.summary)
})
```

---

## Reporting

### Issue count by status

```js
const result = Issues.search('project = PROJ')
const counts = result.countBy('status')

log('Issue counts by status:')
for (let [status, count] of Object.entries(counts)) {
  log(`  ${status}: ${count}`)
}

return counts
```

### Overdue issues report

```js
const result = Issues.search(
  'project = PROJ AND duedate < now() AND status != Done'
)
const overdue = result.filter(issue => issue.isOverdue)

log(`Found ${overdue.length} overdue issues:`)
for (const issue of overdue) {
  log(`  ${issue.key}: ${issue.summary} (due: ${issue.dueDate})`)
}

return { count: overdue.length }
```

### Assignee workload

```js
const result = Issues.search('project = PROJ AND status != Done')
const workload = result.countBy('assignee')

const sorted = Object.entries(workload).sort((a, b) => b[1] - a[1])

log('Workload:')
for (const [name, count] of sorted) {
  log(`  ${name}: ${count} issues`)
}

return Object.fromEntries(sorted)
```

### Created vs resolved trend

```js
const created = Issues.search('project = PROJ AND created >= -7d', { includeTotal: true })
const resolved = Issues.search('project = PROJ AND resolved >= -7d', { includeTotal: true })

return {
  period: 'Last 7 days',
  created: created.total,
  resolved: resolved.total,
  net: created.total - resolved.total
}
```

### Component coverage

```js
const project = Projects.get('PROJ')
const components = project.getComponents()

let results = []
for (const comp of components) {
  const issues = Issues.search(
    `project = PROJ AND component = "${comp.name}"`,
    { includeTotal: true }
  )
  results.push({ name: comp.name, count: issues.total })
}

results.sort((a, b) => b.count - a.count)
return results
```

---

## Field sync

### Sync labels from parent to subtasks

```js
const parent = Issues.get('PROJ-100')
const subtasks = Issues.search(`parent = ${parent.key}`)

const report = subtasks.forEach((sub) => {
  sub.update({ labels: parent.labels })
  log(`Synced labels to ${sub.key}`)
})

return `Synced labels to ${report.success} subtasks`
```

### Copy priority from epic to stories

```js
const epic = Issues.get('PROJ-50')
const stories = Issues.search(`"Epic Link" = ${epic.key}`)

let updated = 0
for (const story of stories.issues) {
  if (story.priority !== epic.priority) {
    story.update({ priority: epic.priority })
    updated++
  }
}

return `Updated priority on ${updated}/${stories.issues.length} stories`
```

### Sync custom field across project

```js
const source = Issues.get('PROJ-100')
const value = source.field('Story Points')

const targets = Issues.search(
  'project = PROJ AND "Epic Link" = PROJ-100 AND "Story Points" is EMPTY'
)
const report = targets.forEach((target) => {
  target.update({ 'Story Points': value })
})

return `Synced Story Points to ${report.success} issues`
```

---

## Table operations

### Basic CRUD

```js
// Add a row
tables.addRow('inventory', {
  name: 'Widget A',
  quantity: 100,
  category: 'hardware'
})

// Find and update
let row = tables.findRow('inventory', { name: 'Widget A' })
if (row) {
  tables.updateRow('inventory', row.id, {
    quantity: row.data.quantity - 10
  })
}

// Delete by condition
let deleted = tables.deleteRows('inventory', { quantity: 0 })
return `Deleted ${deleted} empty rows`
```

### Upsert pattern

```js
const upserted = tables.upsert('inventory',
  { name: 'Widget A' },
  { name: 'Widget A', quantity: 100, category: 'hardware' }
)
log(upserted._action)  // "created" or "updated"
```

### Sync Jira data to a table

```js
const issues = Issues.search(
  'project = PROJ AND status = Done AND resolved >= -7d',
  { fields: ['summary', 'assignee', 'resolved'] }
)

let data = issues.map(i => ({
  issueKey: i.key,
  summary: i.summary,
  assignee: i.assignee || 'None',
  resolved: i.created
}))

tables.addRows('resolved-report', data)
return `Exported ${data.length} issues to table`
```

### Count and statistics

```js
let total = tables.count('inventory')
let lowStock = tables.count('inventory', { quantity: { $lt: 10 } })
let outOfStock = tables.count('inventory', { quantity: 0 })

return { total, lowStock, outOfStock, healthy: total - lowStock }
```

---

## Queue patterns

### Basic producer/consumer

**Producer (pushes messages):**

```js
let issues = Issues.search('project = PROJ AND status = "To Do" AND created >= -1d')

for (let issue of issues.issues) {
  queue.push('pending-review', {
    issueKey: issue.key,
    summary: issue.summary,
  })
}

return `Queued ${issues.issues.length} issues for review`
```

**Consumer (processes messages):**

```js
let messages = queue.pull('pending-review', 5)

for (let msg of messages) {
  try {
    Issues.get(msg.payload.issueKey).addComment('Auto-reviewed by script')
    queue.ack(msg.id)
  } catch (e) {
    queue.reject(msg.id)
  }
}

return `Processed ${messages.length} messages`
```

### Priority queue

```js
// Push with different priorities (higher = processed first)
queue.push('notifications', { type: 'critical', text: 'Server down' }, 10)
queue.push('notifications', { type: 'warning', text: 'High memory' }, 5)
queue.push('notifications', { type: 'info', text: 'Deploy complete' }, 1)

// Pull returns highest priority first
let msgs = queue.pull('notifications', 3)
for (let msg of msgs) {
  log(`[${msg.payload.type}] ${msg.payload.text}`)
}
```

### Consume pattern (one-shot processing)

```js
let messages = queue.consume('email-queue', 5)

for (let msg of messages) {
  log(`Sending email to ${msg.payload.to}: ${msg.payload.subject}`)
  // Messages are already removed from the queue
}

return `Consumed ${messages.length} messages`
```

### Queue size monitoring

```js
let queues = ['work-queue', 'email-queue', 'notification-queue']
let report = []

for (let name of queues) {
  let stats = queue.stats(name)
  report.push({ name, ...stats })
  if (stats.failed > 0) {
    warn(`Queue "${name}" has ${stats.failed} failed messages`)
  }
}

return report
```

---

## Automation recipes

### Scheduled: daily stale issue reminder

```js
const result = Issues.search(
  'project = PROJ AND status != Done AND updated < -14d'
)
const report = result.forEach((issue) => {
  issue.addComment('This issue has not been updated in 14 days. Please review.')
})

return `Reminded ${report.success} stale issues`
```

### Scheduled: weekly status report to table

```js
let open = Issues.search('project = PROJ AND status != Done', { includeTotal: true })
let created = Issues.search('project = PROJ AND created >= -7d', { includeTotal: true })
let resolved = Issues.search('project = PROJ AND resolved >= -7d', { includeTotal: true })

tables.addRow('weekly-stats', {
  date: Date.create().jiraDate(),
  open: open.total,
  created: created.total,
  resolved: resolved.total
})

return { open: open.total, created: created.total, resolved: resolved.total }
```

### Event: auto-assign based on component

```js
// Triggers on issue_created
let assignments = {
  'Frontend': '5a1234567890abcdef',
  'Backend': '5b1234567890abcdef',
  'DevOps': '5c1234567890abcdef'
}

let components = issue.components || []
if (components.length > 0) {
  let accountId = assignments[components[0]]
  if (accountId) {
    issue.assign(accountId)
    log(`Assigned ${issue.key} to ${components[0]} owner`)
  }
}
```

### UIM: Make Field Required Based on Priority

```js
if (uimData.callbackType === 'onInit' || uimData.changedFieldId === 'priority') {
  let priority = uimData.fieldValues?.priority?.value
  if (priority === 'Highest' || priority === 'High') {
    uim.setRequired('duedate', true)
    uim.setDescription('duedate', 'Due date is required for high priority issues')
  } else {
    uim.setRequired('duedate', false)
    uim.setDescription('duedate', '')
  }
}
```

### UIM: Show/Hide Fields Dynamically

```js
if (uimData.callbackType === 'onInit' || uimData.changedFieldId === 'issuetype') {
  let type = uimData.fieldValues?.issuetype?.value
  if (type === 'Bug') {
    uim.setVisible('environment', true)
    uim.setVisible('customfield_10100', true)  // Steps to reproduce
  } else {
    uim.setVisible('environment', false)
    uim.setVisible('customfield_10100', false)
  }
}
```

### Scripted field: calculate days since created

```js
let created = Date.parse(issue.created)
let days = Math.floor((Date.now() - created) / (1000 * 60 * 60 * 24))
return `${days} days`
```

### Scripted field: sum subtask story points

```js
const subtasks = Issues.search(`parent = ${issue.key}`)

let total = 0
for (const sub of subtasks.issues) {
  let sp = sub.field('Story Points')
  total += sp || 0
}

return total
```

---

## Next steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language reference
- [Scripting API: Issues](/docs/jibrok-studio-jira/scripting-api-issues) - Issue API
- [Scripting API: Tables](/docs/jibrok-studio-jira/scripting-api-tables) - Tables API
- [Scripting API: Queues](/docs/jibrok-studio-jira/scripting-api-queues) - Queue API
- [Scenarios](/docs/jibrok-studio-jira/scenarios) - Multi-step processing
- [Triggers](/docs/jibrok-studio-jira/triggers) - Trigger configuration
