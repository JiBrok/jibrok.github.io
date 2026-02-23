---
title: Scripted Custom Fields
key: jibrok-studio-jira
excerpt: Computed custom fields whose values are calculated by scripts
category: extensions
tags:
  - doc
  - cloud
  - scripted-fields
  - custom-fields
---

* TOC
{:toc}

## Overview

Scripted Fields are read-only computed custom fields whose values are calculated by scripts on issue create and update. Four field types are available.

---

## Field Types

| Type | Script returns | Example use case |
|------|----------------|------------------|
| **Scripted Text Field** | String | Concatenated fields, formatted status |
| **Scripted Number Field** | Number | Computed scores, subtask point totals |
| **Scripted Date Field** | Date string (ISO format) | Business day calculations, SLA dates |
| **Scripted DateTime Field** | DateTime string (ISO format) | Timestamp calculations, deadline tracking |

---

## Setup

### 1. Create the Custom Field

1. In Jira, go to **Settings > Issues > Custom Fields**
2. Create a new field of type **Scripted Text Field**, **Scripted Number Field**, **Scripted Date Field**, or **Scripted DateTime Field**
3. Assign the field to the appropriate screens

### 2. Link a Script

In the script's **Config** tab, add a trigger of the appropriate type (`customFieldText`, `customFieldNumber`, `customFieldDate`, or `customFieldDatetime`) and select the custom field to associate with.

---

## How It Works

- Scripts run automatically on **issue create** and **issue update**
- The script receives `issue` (RichIssue object) and `issueKey` (string)
- The return value becomes the field value
- If the script errors, the field shows empty (fail-safe)
- Scripts always run as **Application** (not current user)

### Context Restrictions

Scripted fields can be restricted to specific projects and issue types, limiting which issues have the field computed.

---

## Examples

### Scripted Text Field - Priority + Status

```js
return `${issue.priority} - ${issue.status}`
```

### Scripted Number Field - Days Since Creation

```js
return issue.age
```

### Scripted Number Field - Sum Subtask Story Points

```js
let subtasks = await Issues.search(`parent = ${issueKey}`, {
  fields: ['customfield_10016']  // Story Points
})

let total = 0
for (let sub of subtasks.issues) {
  total += sub.fields.customfield_10016 || 0
}

return total
```

### Scripted Date Field - Due Date + Business Days

```js
const due = DateUtils.addBusinessDays(issue.created, 14)
return DateUtils.format(due, 'YYYY-MM-DD')
```

### Scripted DateTime Field - Last Comment Timestamp

```js
const comments = await issue.getComments()
if (comments.length > 0) {
  return comments[comments.length - 1].created
}
return null
```

---

## Next Steps

- [Triggers](/docs/jibrok-studio-jira/triggers) - Scripted field trigger configuration
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language and API reference
- [Limits](/docs/jibrok-studio-jira/limits) - Execution limits
