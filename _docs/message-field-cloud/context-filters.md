---
title: Context Filters
key: message-field-cloud
excerpt: Control when and where panels appear based on projects, issue types, and conditions
category: configuration
tags:
  - doc
  - cloud
  - filters
  - visibility
  - jql
---

* TOC
{:toc}

Context filters control **when** your panel appears. A panel shows only when **all** filter conditions are met.

![Context Settings Tab](/uploads/message-field-cloud/configuration/panel%20settings%20context.png)

## How Filters Work

### Filter Evaluation

When a user views an issue, all enabled filters are evaluated. A panel shows only when **all** filter conditions pass. If any check fails, the panel is hidden.

### Filter Logic

| Between filters | Logic |
|-----------------|-------|
| Projects AND Issue Types AND Display JQL AND User Fields | **AND** |

| Within a filter | Logic |
|-----------------|-------|
| Multiple Projects | **OR** (any selected project) |
| Multiple Issue Types | **OR** (any selected type) |
| Multiple Request Types | **OR** (any selected type) |
| Multiple User Fields | **OR** (user in any selected field) |

---

## Filter Overview

| Filter | Purpose | Empty = |
|--------|---------|---------|
| **Projects** | Limit to specific projects | All projects |
| **Issue Types** | Limit to specific types | All types |
| **Request Types** | Limit to JSM request types | All request types |
| **Display JQL** | Dynamic condition | Always match |
| **User Fields** | Show only to users in specific fields | All users |

Leave all filters empty to show the panel for **all** issues to **all** users.

---

## Project Filter

Show panel only in selected projects.

### Configuration

1. Open **Context** tab
2. Find **Show only in projects**
3. Select one or more projects
4. Leave empty for all projects

### Example

Select "Marketing" and "Sales" projects → Panel appears only on issues from these projects.

---

## Issue Type Filter

Show panel only for selected issue types.

### Configuration

1. Open **Context** tab
2. Find **Show only for issue types**
3. Select types (Bug, Story, Epic, etc.)
4. Leave empty for all types

### Example

Select "Epic" → Panel appears only on Epic issues.

---

## Request Type Filter (JSM)

For JSM Portal modules, filter by request types.

### Configuration

1. Select a JSM Portal module
2. Find **Show only for request types**
3. Select request types from your service desks

### Example

Select "IT Help" and "Hardware Request" → Panel appears only for these request types in the customer portal.

> **Note:** This filter only applies to JSM Portal modules (Portal Panel, Footer, Subheader).

---

## Display JQL Condition

Dynamic filter using JQL. Panel shows only when the **current issue** matches this query.

### How It Works

The system runs the JQL query with the current issue and checks if it returns a match. This is evaluated for each issue view.

### Basic Examples

```jql
priority in (Highest, High)
```

```jql
status = "In Progress"
```

```jql
labels = "important"
```

### With Template Variables

{% raw %}
```jql
assignee = {{ currentUser.accountId }}
```
{% endraw %}

Shows panel only when current user is the assignee.

{% raw %}
```jql
reporter = {{ currentUser.accountId }}
```
{% endraw %}

Shows panel only to the issue reporter.

{% raw %}
```jql
project = {{ issue.fields.project.key }} AND type = Bug AND status != Done
```
{% endraw %}

Complex condition using issue context.

### Combined Conditions

```jql
priority = High AND status != Done
```

```jql
duedate < now() AND status != Done
```

```jql
(priority = Highest OR labels = "urgent") AND status != Done
```

---

## User Field Visibility

Show panel only when the **current viewing user** is found in specific user-type fields.

### How It Works

This filter checks if the user currently viewing the issue is listed in any of the selected fields. If yes, the panel is shown. If no, the panel is hidden.

**Important:** This is about WHO is viewing, not about the issue data itself.

### Configuration

1. Open **Context** tab
2. Find **Select fields that should contain the current user**
3. Select user fields (Assignee, Reporter, Watchers, custom user fields)

### Supported Field Types

- **Assignee** - Single user
- **Reporter** - Single user
- **Watchers** - Multi-user (checks if viewer is watching)
- **Custom User Picker** - Single user custom fields
- **Custom Multi-User Picker** - Multi-user custom fields

### Single Field Example

Select "Assignee":
- User Alice views issue assigned to Alice → **Panel shows**
- User Bob views issue assigned to Alice → **Panel hidden**

### Multiple Fields (OR Logic)

Select "Assignee" AND "Reporter":
- User Alice (assignee) views → **Panel shows**
- User Bob (reporter) views → **Panel shows**
- User Charlie (neither) views → **Panel hidden**

### Use Cases

| Scenario | User Fields |
|----------|-------------|
| Show to assignee only | Assignee |
| Show to assignee or reporter | Assignee, Reporter |
| Show to watchers | Watchers |
| Show to team lead (custom field) | customfield_10050 |

---

## Combining Filters

All filters work together with AND logic between different filter types.

### Example: High-Priority Blockers for Developers

| Filter | Value |
|--------|-------|
| Projects | Development |
| Issue Types | Bug, Story |
| Display JQL | `priority = High` |

Result: Panel shows only on high-priority Bugs and Stories in the Development project.

### Example: Personal Dashboard

| Filter | Value |
|--------|-------|
| Projects | (all) |
| Issue Types | (all) |
| User Fields | Assignee |
| Display JQL | `status != Done` |

Result: Panel shows only on open issues assigned to the current viewing user.

### Example: Reporter Information

| Filter | Value |
|--------|-------|
| User Fields | Reporter |

Result: Panel shows only when the person who reported the issue is viewing it.

### Example: Overdue Warning

| Filter | Value |
|--------|-------|
| Display JQL | `duedate < now() AND status != Done` |

Result: Panel shows on any overdue issue, to any user.

### Example: JSM Agent View

| Filter | Value |
|--------|-------|
| Display Module | Issue Panel |
| Projects | Support |
| Issue Types | Service Request |
| User Fields | Assignee |

Result: Panel shows only to the assigned agent on Service Request issues in Support project.

---

## Common JQL Patterns

### By Status

```jql
status = "To Do"
status in ("In Progress", "In Review")
status != Done
statusCategory = "In Progress"
```

### By Priority

```jql
priority = Highest
priority in (High, Highest)
priority != Low
```

### By Dates

```jql
duedate < now()
duedate <= endOfDay()
created >= -7d
updated >= -1d
created >= startOfMonth()
```

### By Labels

```jql
labels = "needs-review"
labels in ("urgent", "escalated")
labels is EMPTY
```

### By Components

```jql
component = "Backend"
component in ("API", "Database")
component is EMPTY
```

### By Custom Fields

```jql
"Team" = "Engineering"
cf[10001] = "Value"
"Story Points" > 5
```

---

## Troubleshooting

### Panel Not Showing

Check conditions in order:

1. **Module enabled?** - Check Apps → Message Panel Settings → Modules tab
2. **Configuration enabled?** - Check the "Enabled" toggle on the configuration
3. **Project matches?** - Is issue in one of the selected projects?
4. **Issue type matches?** - Is issue type in the selected types?
5. **Display JQL matches?** - Test the JQL in Issue Navigator with current issue
6. **User field matches?** - Is the viewing user in selected fields?

### Testing Display JQL

1. Copy your Display JQL
2. Open Issue Navigator
3. Add `AND key = ISSUE-123` (your test issue)
4. If no results, the issue doesn't match

### Panel Showing Everywhere

You may have left all filters empty. Add at least one filter to limit visibility.

### Panel Shows to Wrong Users

Check User Field filter - it uses OR logic between selected fields. If you want AND logic (user must be in ALL fields), use Display JQL instead:

{% raw %}
```jql
assignee = {{ currentUser.accountId }} AND reporter = {{ currentUser.accountId }}
```
{% endraw %}

---

## Next Steps

- [Data Sources](data-sources) - Configure what data the panel shows
- [Templates](templates) - Dynamic content syntax
- [Modal Windows](modal-windows) - Pop-up dialogs
- [Modules](modules) - Display locations
