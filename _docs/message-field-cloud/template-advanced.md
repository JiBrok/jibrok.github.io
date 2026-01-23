---
title: Template Advanced
key: message-field-cloud
excerpt: Advanced template features, JQL templates, display conditions, and debugging
category: templates
tags:
  - doc
  - cloud
  - templates
  - advanced
  - jql
  - conditions
---

* TOC
{:toc}

{% raw %}

Advanced template features including functions, JQL templates, display conditions, and debugging.

---

## Built-in Functions

Functions are called directly (not with pipe):

### Date Functions

| Function | Description | Example |
|----------|-------------|---------|
| `now()` | Current date/time | `{{ now() }}` |
| `date(value)` | Parse date | `{{ date("2024-01-15") }}` |
| `isPast(date)` | Check if date is in past | `{% if isPast(duedate) %}Overdue{% endif %}` |
| `isFuture(date)` | Check if date is in future | `{% if isFuture(duedate) %}On time{% endif %}` |
| `dateBefore(d1, d2)` | Check if d1 is before d2 | `{% if dateBefore(created, updated) %}...{% endif %}` |
| `dateAfter(d1, d2)` | Check if d1 is after d2 | `{% if dateAfter(updated, created) %}Modified{% endif %}` |
| `dateDiff(d1, d2, unit)` | Difference between dates | `{{ dateDiff(now(), created, "days") }}` days ago |

**dateDiff units:** `milliseconds`, `seconds`, `minutes`, `hours`, `days`, `weeks`

### Utility Functions

| Function | Description | Example |
|----------|-------------|---------|
| `range(start, end, step)` | Generate number array | `{% for i in range(1, 5) %}{{ i }}{% endfor %}` |

**range() example - progress bar:**
```
{% set progress = 75 %}
{% set filled = (progress / 5) | round %}
{% for i in range(1, 20) %}{% if i <= filled %}#{% else %}.{% endif %}{% endfor %}
```

---

## Advanced Features

### Set Variables

```
{% set count = 0 %}
{% set userName = issue.fields.assignee.displayName %}
{% set total = linkedIssues | len %}
```

### With Blocks

```
{% with issue.fields.assignee as user %}
  {% if user %}
    {{ user.displayName }} ({{ user.emailAddress }})
  {% endif %}
{% endwith %}
```

Or assignment syntax:
```
{% with count = linkedIssues | len %}
  Total: {{ count }}
{% endwith %}
```

### Switch/Case

```
{% switch issue.fields.status.name %}
  {% case "To Do" %}
    Not started
  {% case "In Progress", "In Review" %}
    Work in progress
  {% case "Done" %}
    Completed
  {% default %}
    Other
{% endswitch %}
```

### Ternary Operator

```
{{ issue.fields.priority ? issue.fields.priority.name : "None" }}
```

### Whitespace Control

Use `-` to trim whitespace:
```
{%- if condition -%}
  Content
{%- endif -%}
```

---

## JQL Templates

Use templates in JQL queries:

### Issues in Same Epic

```jql
"Epic Link" = {{ issue.key }} AND status != Done ORDER BY priority DESC
```

### Same Project and Type

```jql
project = {{ issue.fields.project.id }} AND type = {{ issue.fields.issuetype.id }} AND key != {{ issue.key }}
```

### Assigned to Current User

```jql
assignee = {{ currentUser.accountId }} AND status in ("To Do", "In Progress") ORDER BY priority DESC
```

### Issues Blocking This One

```jql
issue in linkedIssues({{ issue.key }}, "is blocked by") AND status != Done
```

### Same Fix Version

```jql
{% if issue.fields.fixVersions | length > 0 %}
fixVersion in ({% for version in issue.fields.fixVersions %}{{ version.id }}{% if not loop.last %},{% endif %}{% endfor %}) AND type = Bug AND status != Closed
{% endif %}
```

### Same Components

```jql
{% if issue.fields.components | length > 0 %}
component in ({% for comp in issue.fields.components %}"{{ comp.name }}"{% if not loop.last %},{% endif %}{% endfor %}) AND key != {{ issue.key }}
{% endif %}
```

---

## Best Practices

### Always Check for Null

```
{% if issue.fields.assignee %}
  {{ issue.fields.assignee.displayName }}
{% endif %}
```

Or use default filter:
```
{{ issue.fields.assignee.displayName | default("Unassigned") }}
```

### Safe Property Access

For deeply nested properties:
```
{% with issue.fields.customfield_10001 as cf %}
  {% if cf and cf.value %}
    {{ cf.value }}
  {% endif %}
{% endwith %}
```

### Comments

```
{# This won't be displayed #}

{% comment %}
Multi-line comment
{% endcomment %}
```

### HTML Escaping

- `{{ value }}` - Auto-escapes HTML (safe)
- `{{{ value }}}` - Raw output (use carefully)

---

## Display Condition Templates

Display Conditions use the same template syntax but with special output interpretation rules. They control when a panel is shown.

### Output Interpretation

| Output | Result |
|--------|--------|
| Empty string `""` | **Hidden** |
| `false` (boolean) | **Hidden** |
| String `"false"`, `"no"`, `"0"` | **Hidden** |
| Any other value | **Shown** |

### Simple Expression Examples

```
{{ 'urgent' in fields.labels }}
```
→ Outputs `true` or `false`

```
{{ fields.priority.name == 'High' }}
```
→ Outputs `true` or `false`

```
{{ fields.assignee }}
```
→ Outputs user object (truthy) or empty (falsy)

### If Statement Examples

```
{% if fields.assignee %}show{% endif %}
```
→ Outputs `"show"` or `""`

```
{% if 'blocker' in fields.labels %}yes{% endif %}
```
→ Outputs `"yes"` or `""`

### Complex Expressions

**Multiple conditions (AND):**
```
{{ fields.priority.name == 'High' and fields.status.name != 'Done' }}
```

**Multiple conditions (OR):**
```
{{ 'urgent' in fields.labels or 'critical' in fields.labels }}
```

**Using filters:**
```
{% set highPriorityBlockers = linkedIssues | filter("fields.priority.name", "==", "High") %}
{{ highPriorityBlockers | len > 0 }}
```

### Current User Conditions

```
{{ fields.assignee.accountId == currentUser.accountId }}
```
→ Show only to assignee

```
{{ fields.reporter.accountId == currentUser.accountId }}
```
→ Show only to reporter

```
{% if fields.assignee.accountId == currentUser.accountId or fields.reporter.accountId == currentUser.accountId %}show{% endif %}
```
→ Show to assignee OR reporter

### Error Safety

Display Conditions use **fail-close** behavior:

- Syntax error → panel hidden
- Missing data → panel hidden
- Exception → panel hidden

Always test your conditions before deploying.

**Safe null checks:**
```
{% if fields.assignee and fields.assignee.accountId == currentUser.accountId %}show{% endif %}
```

---

## Debugging Templates

When templates don't work as expected:

1. **Check variable paths** - Use `{{ issue | json(2) }}` to see available data
2. **Test conditions** - Output intermediate values: `Debug: {{ issue.fields.status.name }}`
3. **Verify filters** - Test filter chain step by step
4. **Check for null** - Many errors come from accessing properties on null values

---

## Common Mistakes

### Accessing Null Properties

**Wrong:**
```
{{ issue.fields.assignee.displayName }}
```

**Right:**
```
{{ issue.fields.assignee.displayName | default("Unassigned") }}
{# or #}
{% if issue.fields.assignee %}
  {{ issue.fields.assignee.displayName }}
{% endif %}
```

### Date Comparison

**Wrong:**
```
{% if issue.fields.duedate < now %}
```

**Right:**
```
{% if isPast(issue.fields.duedate) %}
{# or #}
{% if dateBefore(issue.fields.duedate, now()) %}
```

### Building Dynamic Arrays

**Wrong** (JavaScript methods don't work):
```
{% set items = [] %}
{% set items = items.concat([newItem]) %}
```

**Right** (use filter instead):
```
{% set doneItems = allItems | filter("status", "==", "Done") %}
```

### Unsupported Filters

| Not Supported | Use Instead |
|---------------|-------------|
| `values` | `\| map("fieldName")` on array |
| `sum` | Manual loop with counter |
| `keys` | `\| map("key")` if applicable |
| `groupBy` | Use `\| uniq` + `\| filter()` |

---

## Next Steps

- [Templates](templates) - Basic syntax and variables
- [Template Filters](template-filters) - All available filters
- [Message Formats](message-formats) - HTML, Markdown, ADF

{% endraw %}
