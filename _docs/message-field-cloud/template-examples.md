---
title: Dynamic Template Examples
key: message-field-cloud
excerpt: "Ready-to-use template examples for messages and JQL queries. Copy and paste into your configurations."
category: templates-customization
tags: [doc, cloud, template-examples, dynamic-templates, jql, variables, ready-to-use]
---

{:.no_toc}
* TOC
{:toc}

## Quick Reference

Copy and paste these templates into your configuration description field or JQL query.

{% raw %}

## Basic Messages

### Simple Issue Information

```
**Issue**: {{ issue.key }}
**Summary**: {{ issue.fields.summary }}
**Status**: {{ issue.fields.status.name }}
**Priority**: {{ issue.fields.priority.name }}
```

### Conditional Message

```
{% if issue.fields.priority.name == "Highest" %}
⚠️ **CRITICAL PRIORITY** - This issue requires immediate attention
{% elif issue.fields.priority.name == "High" %}
⚡ **HIGH PRIORITY** - Please review as soon as possible
{% else %}
Standard priority - process in normal queue
{% endif %}
```

### Assignee Check

```
{% if issue.fields.assignee %}
Assigned to: **{{ issue.fields.assignee.displayName }}**
{% else %}
⚠️ This issue is **unassigned**
{% endif %}
```

### Current User Context

```
{% if issue.fields.assignee.accountId == currentUser.accountId %}
✅ This issue is assigned to **you**!
{% elif issue.fields.reporter.accountId == currentUser.accountId %}
📝 You reported this issue
{% else %}
Viewing issue by {{ issue.fields.assignee | default("Unassigned") }}
{% endif %}
```

## Status and Progress

### Status Message

```
{% switch issue.fields.status.name %}
  {% case "To Do" %}
    🔵 Not started yet
  {% case "In Progress", "In Development" %}
    🟡 Work in progress
  {% case "In Review" %}
    🟣 Awaiting review
  {% case "Done", "Closed" %}
    ✅ Completed
  {% default %}
    ⚪ Status: {{ issue.fields.status.name }}
{% endswitch %}
```

### Progress Indicator

```
{% if linkedIssues | length > 0 %}
{% set completed = 0 %}
{% set total = linkedIssues | length %}
{% for linked in linkedIssues %}
  {% if linked.fields.status.statusCategory.key == "done" %}
    {% set completed = completed + 1 %}
  {% endif %}
{% endfor %}

**Progress**: {{ completed }}/{{ total }} issues completed ({{ (completed / total * 100) | round }}%)

{% if completed == total %}
✅ All linked issues are complete!
{% elif completed > 0 %}
⏳ {{ total - completed }} issues remaining
{% else %}
🔵 No issues completed yet
{% endif %}
{% endif %}
```

### Time Tracking

```
{% if issue.fields.timetracking %}
  {% set originalEstimate = issue.fields.timetracking.originalEstimateSeconds %}
  {% set timeSpent = issue.fields.timetracking.timeSpentSeconds %}
  {% set remaining = issue.fields.timetracking.remainingEstimateSeconds %}

  **Original Estimate**: {{ originalEstimate / 3600 }} hours
  **Time Spent**: {{ timeSpent / 3600 }} hours
  **Remaining**: {{ remaining / 3600 }} hours

  {% if timeSpent > originalEstimate %}
    ⚠️ Over budget by {{ (timeSpent - originalEstimate) / 3600 }} hours
  {% endif %}
{% else %}
  No time tracking data available
{% endif %}
```

## Linked Issues

### Count by Status

```
{% if linkedIssues | length > 0 %}
### Linked Issues Summary

{% set statusCounts = {} %}
{% for issue in linkedIssues %}
  {% set statusName = issue.fields.status.name %}
  {% set currentCount = statusCounts[statusName] | default(0) %}
  {% set statusCounts[statusName] = currentCount + 1 %}
{% endfor %}

{% for status, count in statusCounts %}
- **{{ status }}**: {{ count }} issue{{ count != 1 ? "s" : "" }}
{% endfor %}

**Total**: {{ linkedIssues | length }} linked issue{{ linkedIssues | length != 1 ? "s" : "" }}
{% else %}
No linked issues found
{% endif %}
```

### Blockers Warning

```
{% if linkedIssues | length > 0 %}
{% set blockers = [] %}
{% for issue in linkedIssues %}
  {% if issue.fields.status.statusCategory.key != "done" %}
    {% set blockers = blockers.concat([issue]) %}
  {% endif %}
{% endfor %}

{% if blockers | length > 0 %}
⛔ **{{ blockers | length }} Active Blocker{{ blockers | length != 1 ? "s" : "" }}**

{% for blocker in blockers %}
- [{{ blocker.key }}] {{ blocker.fields.summary }}
  - Status: {{ blocker.fields.status.name }}
  - Priority: {{ blocker.fields.priority.name }}
{% endfor %}
{% else %}
✅ All blockers resolved!
{% endif %}
{% endif %}
```

### Priority Distribution

```
{% if linkedIssues | length > 0 %}
{% set highest = 0 %}
{% set high = 0 %}
{% set medium = 0 %}
{% set low = 0 %}

{% for issue in linkedIssues %}
  {% switch issue.fields.priority.name %}
    {% case "Highest" %}
      {% set highest = highest + 1 %}
    {% case "High" %}
      {% set high = high + 1 %}
    {% case "Medium" %}
      {% set medium = medium + 1 %}
    {% case "Low", "Lowest" %}
      {% set low = low + 1 %}
  {% endswitch %}
{% endfor %}

**Priority Distribution**:
- 🔴 Highest: {{ highest }}
- 🟠 High: {{ high }}
- 🟡 Medium: {{ medium }}
- 🟢 Low: {{ low }}
{% endif %}
```

## Date and Time

### Due Date Warning

```
{% if issue.fields.duedate %}
  {% set now = context.now %}
  {% set dueDate = issue.fields.duedate %}
  {% set daysDiff = (dueDate - now) / 86400000 %}

  **Due Date**: {{ dueDate | date("YYYY-MM-DD") }}

  {% if daysDiff < 0 %}
    ⚠️ **OVERDUE** by {{ -daysDiff | round }} day{{ -daysDiff | round != 1 ? "s" : "" }}!
  {% elif daysDiff < 1 %}
    🔥 **DUE TODAY**!
  {% elif daysDiff < 3 %}
    ⏰ Due in {{ daysDiff | round }} day{{ daysDiff | round != 1 ? "s" : "" }}
  {% else %}
    📅 Due in {{ daysDiff | round }} days
  {% endif %}
{% else %}
  No due date set
{% endif %}
```

### Age of Issue

```
{% set created = issue.fields.created %}
{% set now = context.now %}
{% set ageDays = (now - created) / 86400000 %}

**Issue Age**: {{ ageDays | round }} day{{ ageDays | round != 1 ? "s" : "" }}

{% if ageDays > 30 %}
⚠️ This issue has been open for over a month
{% elif ageDays > 7 %}
This issue has been open for over a week
{% endif %}
```

### Recent Activity

```
{% set updated = issue.fields.updated %}
{% set now = context.now %}
{% set hoursSince = (now - updated) / 3600000 %}

{% if hoursSince < 1 %}
🔥 Updated less than an hour ago
{% elif hoursSince < 24 %}
Updated {{ hoursSince | round }} hour{{ hoursSince | round != 1 ? "s" : "" }} ago
{% elif hoursSince < 168 %}
Updated {{ (hoursSince / 24) | round }} day{{ (hoursSince / 24) | round != 1 ? "s" : "" }} ago
{% else %}
⚠️ No updates in over a week
{% endif %}
```

## Custom Fields

### Select Field

```
{% set customField = issue.fields.customfield_10001 %}
{% if customField %}
  **Team**: {{ customField.value }}
{% else %}
  ⚠️ No team assigned
{% endif %}
```

### Multi-Select Field

```
{% set components = issue.fields.components %}
{% if components | length > 0 %}
  **Components**:
  {% for component in components %}
    - {{ component.name }}
  {% endfor %}
{% else %}
  No components selected
{% endif %}
```

### User Picker

```
{% set reviewer = issue.fields.customfield_10002 %}
{% if reviewer %}
  **Reviewer**: {{ reviewer.displayName }} ({{ reviewer.emailAddress }})
{% else %}
  ⚠️ No reviewer assigned
{% endif %}
```

### Number Field

```
{% set storyPoints = issue.fields.customfield_10003 %}
{% if storyPoints %}
  **Story Points**: {{ storyPoints }}
  {% if storyPoints > 8 %}
    ⚠️ Consider breaking down this large story
  {% endif %}
{% else %}
  Story points not estimated
{% endif %}
```

## JQL Templates

### Issues in Same Epic

```jql
"Epic Link" = {{ issue.key }} AND status != Done ORDER BY priority DESC, created ASC
```

### Same Project and Type

```jql
project = {{ issue.fields.project.id }}
AND type = {{ issue.fields.issuetype.id }}
AND key != {{ issue.key }}
```

### Same Components

```jql
{% if issue.fields.components | length > 0 %}
component in (
  {% for comp in issue.fields.components %}
    "{{ comp.name }}"{% if not loop.last %},{% endif %}
  {% endfor %}
)
AND key != {{ issue.key }}
{% else %}
key = "NONE"
{% endif %}
```

### Assigned to Current User

```jql
assignee = {{ currentUser.accountId }}
AND status in ("To Do", "In Progress")
ORDER BY priority DESC
```

### Issues Blocking This One

```jql
issue in linkedIssues({{ issue.key }}, "is blocked by")
AND status != Done
```

### Same Fix Version

```jql
{% if issue.fields.fixVersions | length > 0 %}
fixVersion in (
  {% for version in issue.fields.fixVersions %}
    {{ version.id }}{% if not loop.last %},{% endif %}
  {% endfor %}
)
AND type = Bug
AND status != Closed
{% else %}
key = "NONE"
{% endif %}
```

### High Priority in Same Sprint

```jql
{% if issue.fields.customfield_10020 %}
"Sprint" = {{ issue.fields.customfield_10020.id }}
AND priority in (Highest, High)
AND status not in (Done, Closed)
{% else %}
key = "NONE"
{% endif %}
```

## Advanced Examples

### Epic Progress Dashboard

```
{% if linkedIssues | length > 0 %}
## Epic Progress: {{ issue.fields.summary }}

{% set total = linkedIssues | length %}
{% set done = 0 %}
{% set inProgress = 0 %}
{% set todo = 0 %}
{% set points = 0 %}
{% set donePoints = 0 %}

{% for issue in linkedIssues %}
  {% set status = issue.fields.status.statusCategory.key %}
  {% if status == "done" %}
    {% set done = done + 1 %}
    {% if issue.fields.customfield_10003 %}
      {% set donePoints = donePoints + issue.fields.customfield_10003 %}
    {% endif %}
  {% elif status == "indeterminate" %}
    {% set inProgress = inProgress + 1 %}
  {% else %}
    {% set todo = todo + 1 %}
  {% endif %}

  {% if issue.fields.customfield_10003 %}
    {% set points = points + issue.fields.customfield_10003 %}
  {% endif %}
{% endfor %}

**Status Breakdown**:
- ✅ Done: {{ done }} ({{ (done / total * 100) | round }}%)
- 🟡 In Progress: {{ inProgress }} ({{ (inProgress / total * 100) | round }}%)
- 🔵 To Do: {{ todo }} ({{ (todo / total * 100) | round }}%)

{% if points > 0 %}
**Story Points**: {{ donePoints }}/{{ points }} completed ({{ (donePoints / points * 100) | round }}%)
{% endif %}

**Progress Bar**:
{% set progress = (done / total * 20) | round %}
[{% for i in range(0, progress) %}█{% endfor %}{% for i in range(progress, 20) %}░{% endfor %}] {{ (done / total * 100) | round }}%
{% endif %}
```

### SLA Warning

```
{% set priority = issue.fields.priority.name %}
{% set created = issue.fields.created %}
{% set now = context.now %}
{% set ageHours = (now - created) / 3600000 %}

{% set slaHours = 0 %}
{% switch priority %}
  {% case "Highest" %}
    {% set slaHours = 4 %}
  {% case "High" %}
    {% set slaHours = 24 %}
  {% case "Medium" %}
    {% set slaHours = 72 %}
  {% default %}
    {% set slaHours = 168 %}
{% endswitch %}

{% if ageHours > slaHours %}
🔴 **SLA BREACH** - {{ ((ageHours - slaHours) / 24) | round }}d over SLA
{% elif ageHours > slaHours * 0.8 %}
🟠 **SLA WARNING** - {{ ((slaHours - ageHours) / 24) | round }}d remaining
{% else %}
🟢 Within SLA - {{ ((slaHours - ageHours) / 24) | round }}d remaining
{% endif %}
```

### Missing Information Checklist

```
### Pre-flight Checklist

{% set issues = [] %}

{% if not issue.fields.description or issue.fields.description == "" %}
  {% set issues = issues.concat(["No description provided"]) %}
{% endif %}

{% if not issue.fields.assignee %}
  {% set issues = issues.concat(["No assignee"]) %}
{% endif %}

{% if not issue.fields.priority %}
  {% set issues = issues.concat(["No priority set"]) %}
{% endif %}

{% if not issue.fields.labels or issue.fields.labels | length == 0 %}
  {% set issues = issues.concat(["No labels"]) %}
{% endif %}

{% if not issue.fields.components or issue.fields.components | length == 0 %}
  {% set issues = issues.concat(["No components"]) %}
{% endif %}

{% if issues | length > 0 %}
⚠️ **Please address the following**:
{% for issue in issues %}
- {{ issue }}
{% endfor %}
{% else %}
✅ All required information is complete!
{% endif %}
```

### Team Workload

```
{% if linkedIssues | length > 0 %}
### Team Workload Distribution

{% set assignees = {} %}
{% for issue in linkedIssues %}
  {% if issue.fields.assignee %}
    {% set name = issue.fields.assignee.displayName %}
    {% set current = assignees[name] | default(0) %}
    {% set assignees[name] = current + 1 %}
  {% endif %}
{% endfor %}

{% for assignee, count in assignees %}
- **{{ assignee }}**: {{ count }} issue{{ count != 1 ? "s" : "" }}
{% endfor %}

{% set unassigned = linkedIssues | length - (assignees | values | sum) %}
{% if unassigned > 0 %}
- **Unassigned**: {{ unassigned }} issue{{ unassigned != 1 ? "s" : "" }}
{% endif %}
{% endif %}
```

## HTML Formatting

### Styled Message

```html
<div style="padding: 10px; border-left: 4px solid #0052CC;">
  <h3 style="margin-top: 0;">{{ issue.fields.summary }}</h3>
  <p><strong>Priority:</strong> {{ issue.fields.priority.name }}</p>
  <p><strong>Status:</strong> {{ issue.fields.status.name }}</p>
</div>
```

### Table of Linked Issues

```html
<table>
  <thead>
    <tr>
      <th>Key</th>
      <th>Summary</th>
      <th>Status</th>
      <th>Assignee</th>
    </tr>
  </thead>
  <tbody>
    {% for issue in linkedIssues %}
    <tr>
      <td>{{ issue.key }}</td>
      <td>{{ issue.fields.summary }}</td>
      <td>{{ issue.fields.status.name }}</td>
      <td>{{ issue.fields.assignee | default("Unassigned") }}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>
```

## Markdown Formatting

### Formatted Message

```markdown
## {{ issue.fields.summary }}

**Project**: {{ issue.fields.project.name }}
**Type**: {{ issue.fields.issuetype.name }}
**Status**: {{ issue.fields.status.name }}
**Priority**: {{ issue.fields.priority.name }}

{% if issue.fields.assignee %}
**Assigned to**: {{ issue.fields.assignee.displayName }}
{% endif %}

---

### Description
{{ issue.fields.description | truncate(200) }}

{% if linkedIssues | length > 0 %}
### Related Issues
{% for linked in linkedIssues %}
- [{{ linked.key }}] {{ linked.fields.summary }}
{% endfor %}
{% endif %}
```

## Next Steps

- [Dynamic Templates Guide](/docs/message-field-cloud/dynamic-templates/) - Learn template syntax
- [Configuration Guide](/docs/message-field-cloud/configuration/) - Set up panels

{% endraw %}
