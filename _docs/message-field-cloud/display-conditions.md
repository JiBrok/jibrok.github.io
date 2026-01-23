---
title: Display Conditions
key: message-field-cloud
excerpt: Control panel visibility with JQL and template-based conditions
category: configuration
tags:
  - doc
  - cloud
  - filters
  - jql
  - conditions
  - visibility
---

* TOC
{:toc}

Dynamic conditions that control when panels appear based on issue data, user context, or JQL queries.

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

## Display Condition (Template-Based)

Template-based filter for dynamic panel visibility. More flexible than Display JQL - supports complex logic and works with JSM Create modules.

### How It Works

The system evaluates a template expression and interprets the output:

| Output | Panel |
|--------|-------|
| Empty string, `false`, `no`, `0` | **Hidden** |
| Any other value | **Shown** |

### Basic Examples

{% raw %}
**Check labels:**
```
{{ 'urgent' in fields.labels }}
```

**Check priority:**
```
{{ fields.priority.name == 'High' }}
```

**Check assignee exists:**
```
{% if fields.assignee %}show{% endif %}
```

**Check current user is assignee:**
```
{{ fields.assignee.accountId == currentUser.accountId }}
```
{% endraw %}

### Expression vs If-Statement Style

{% raw %}
**Expression style** - outputs true/false:
```
{{ fields.priority.name in ['High', 'Highest'] }}
```

**If-statement style** - outputs text or nothing:
```
{% if fields.priority.name == 'High' %}show{% endif %}
```
{% endraw %}

Both styles work. Expression style is more concise for simple conditions.

### Combined Conditions

{% raw %}
**AND logic:**
```
{{ fields.priority.name == 'High' and fields.status.name != 'Done' }}
```

**OR logic:**
```
{{ 'urgent' in fields.labels or fields.priority.name == 'Highest' }}
```

**Complex conditions:**
```
{% if fields.priority.name in ['High', 'Highest'] and fields.assignee %}
  {% if fields.duedate and isPast(fields.duedate) %}show{% endif %}
{% endif %}
```
{% endraw %}

---

## Display Condition vs Display JQL

| Feature | Display Condition | Display JQL |
|---------|-------------------|-------------|
| **Syntax** | Template expressions | JQL query |
| **Evaluated on** | Client-side | Server-side |
| **Works with JSM Create** | Yes | No |
| **Complex logic** | Easy (and/or/if) | Limited |
| **Current user checks** | `currentUser.accountId` | `currentUser()` |
| **Performance** | Faster (no API call) | Slower (JQL search) |
| **Error behavior** | Fail-close (hide) | Fail-open (show) |

> **When to use which:** Use Display Condition for most cases. Use Display JQL when you need to check related issues or fields not available in issue data.

---

## Error Handling

### Display Condition (Fail-Close)

Display Condition uses **fail-close** behavior:
- If expression has syntax errors → panel hidden
- If required data is missing → panel hidden
- If evaluation fails → panel hidden

This prevents accidental exposure of panels when conditions can't be properly evaluated.

### Display JQL (Fail-Open)

Display JQL uses **fail-open** behavior:
- If JQL has syntax errors → panel shown
- If query fails → panel shown

Always test your JQL conditions before deploying.

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

### By Current User

{% raw %}
```jql
assignee = {{ currentUser.accountId }}
reporter = {{ currentUser.accountId }}
watcher = {{ currentUser.accountId }}
```
{% endraw %}

---

## Troubleshooting

### Panel Not Showing

1. **Test Display JQL in Issue Navigator** - Add `AND key = ISSUE-123` to test with specific issue
2. **Check Display Condition syntax** - Use Preview to test template expressions
3. **Verify data exists** - Check that fields you're testing actually have values

### Panel Showing Everywhere

You may have left conditions empty or have a syntax error in Display Condition (which fails-open for JQL).

### Testing Display Conditions

Use the Preview panel with a real issue key to test how your condition evaluates.

---

## Next Steps

- [Context Filters](context-filters) - Project, issue type, and user field filters
- [Templates](templates) - Template syntax reference
- [JSM Create Modules](jsm-create-modules) - Using conditions on create forms
