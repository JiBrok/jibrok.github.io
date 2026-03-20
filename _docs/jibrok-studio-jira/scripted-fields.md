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
seo_title: Scripted Custom Fields for Jira Cloud
last_modified_at: 2026-03-19
date: 2026-02-23
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Overview

Scripted Fields are read-only computed custom fields whose values are calculated by scripts on issue create and update. Five field types are available.

---

## Field types

| Type | Script returns | Example use case |
|------|----------------|------------------|
| **Scripted Text Field** | String | Concatenated fields, formatted status |
| **Scripted Number Field** | Number | Computed scores, subtask point totals |
| **Scripted Date Field** | Date string (ISO format) | Business day calculations, SLA dates |
| **Scripted DateTime Field** | DateTime string (ISO format) | Timestamp calculations, deadline tracking |
| **Scripted Paragraph Field** | ADF object (Atlassian Document Format) | Rich text content, formatted descriptions |

---

## Setup

### 1. Create the custom field

1. In Jira, go to **Settings > Issues > Custom Fields**
2. Create a new field of type **Scripted Text Field**, **Scripted Number Field**, **Scripted Date Field**, **Scripted DateTime Field**, or **Scripted Paragraph Field**
3. Assign the field to the appropriate screens

### 2. Link a script

In the script's **Config** tab, add a trigger of the appropriate type (Text Field, Number Field, Date Field, DateTime Field, or Paragraph Field) and select the custom field to associate with.

---

## How it works

- Scripts run automatically on **issue create** and **issue update**
- The script receives `issue` (RichIssue object) and `issueKey` (string)
- The return value becomes the field value
- If the script errors, the field shows empty (fail-safe)
- Scripts always run as **Application** (not current user)

### Context restrictions

Scripted fields can be restricted to specific projects and issue types, limiting which issues have the field computed.

---

## Examples

### Scripted text field - priority + status

```js
return `${issue.priority} - ${issue.status}`
```

### Scripted number field - days since creation

```js
return issue.age
```

### Scripted number field - sum subtask story points

```js
let subtasks = Issues.search(`parent = ${issueKey}`, {
  fields: ['customfield_10016']  // Story Points
})

let total = 0
for (let sub of subtasks.issues) {
  total += sub.fields.customfield_10016 || 0
}

return total
```

### Scripted date field - due date + business days

```js
const due = DateUtils.addBusinessDays(issue.created, 14)
return DateUtils.format(due, 'YYYY-MM-DD')
```

### Scripted datetime field - last comment timestamp

```js
const comments = issue.getComments()
if (comments.length > 0) {
  return comments[comments.length - 1].created
}
return null
```

### Scripted paragraph field - rich text summary

```js
return Adf.doc(
  Adf.paragraph(
    Adf.text(`Priority: ${issue.priority} | Status: ${issue.status}`)
  )
)
```

---

## Next steps

- [Triggers](/docs/jibrok-studio-jira/triggers) - Scripted field trigger configuration
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language and API reference
- [Limits](/docs/jibrok-studio-jira/limits) - Execution limits
