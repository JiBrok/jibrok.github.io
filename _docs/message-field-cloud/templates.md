---
title: Dynamic Templates
key: message-field-cloud
excerpt: Create dynamic messages with variables, conditions, loops, and filters
category: templates
tags:
  - doc
  - cloud
  - templates
  - variables
  - conditions
---

# Dynamic Templates
{:.no_toc}

* TOC
{:toc}

{% raw %}

Create messages that adapt based on issue data, user context, and linked issues.

## Basic Syntax

### Variables

Output data with double curly braces:

```
{{ issue.key }}
{{ issue.fields.summary }}
{{ issue.fields.status.name }}
```

### Conditions

```
{% if condition %}
  Content when true
{% elif otherCondition %}
  Content when other is true
{% else %}
  Content otherwise
{% endif %}
```

### Loops

```
{% for item in array %}
  {{ item }}
{% empty %}
  Nothing found
{% endfor %}
```

---

## Available Variables

### Issue Data

| Variable | Description |
|----------|-------------|
| `{{ issue.key }}` | Issue key (PROJ-123) |
| `{{ issue.id }}` | Issue ID |
| `{{ issue.fields.summary }}` | Summary |
| `{{ issue.fields.description }}` | Description |
| `{{ issue.fields.status.name }}` | Status name |
| `{{ issue.fields.priority.name }}` | Priority name |
| `{{ issue.fields.assignee.displayName }}` | Assignee name |
| `{{ issue.fields.reporter.displayName }}` | Reporter name |
| `{{ issue.fields.created }}` | Created date |
| `{{ issue.fields.updated }}` | Updated date |
| `{{ issue.fields.duedate }}` | Due date |
| `{{ issue.fields.project.name }}` | Project name |
| `{{ issue.fields.project.key }}` | Project key |
| `{{ issue.fields.issuetype.name }}` | Issue type |

**Shortcuts:**
- `{{ key }}` → `{{ issue.key }}`
- `{{ fields.summary }}` → `{{ issue.fields.summary }}`
- `{{ project.key }}` → `{{ issue.fields.project.key }}`

**Custom fields:**
```
{{ issue.fields.customfield_10001 }}
{{ issue.fields["My Custom Field"] }}
```

### Current User

| Variable | Description |
|----------|-------------|
| `{{ currentUser.accountId }}` | Account ID |
| `{{ currentUser.displayName }}` | Display name |
| `{{ currentUser.emailAddress }}` | Email |
| `{{ currentUser.timeZone }}` | Time zone |

`{{ user }}` is an alias for `{{ currentUser }}`.

### Linked Issues

When using Linked Issues or JQL data source:

```
{{ linkedIssues.length }} - Count

{% for linked in linkedIssues %}
  {{ linked.key }}: {{ linked.fields.summary }}
{% endfor %}
```

---

## Conditions

### Comparison Operators

```
==   Equal to
!=   Not equal to
>    Greater than
<    Less than
>=   Greater or equal
<=   Less or equal
```

### Logical Operators

```
and   Logical AND
or    Logical OR
not   Logical NOT
```

### Membership

```
{% if "High" in ["High", "Highest"] %}
  High priority
{% endif %}
```

### Examples

**Check status:**
```
{% if issue.fields.status.name == "Done" %}
  Completed
{% endif %}
```

**Check assignee:**
```
{% if issue.fields.assignee %}
  Assigned to: {{ issue.fields.assignee.displayName }}
{% else %}
  Unassigned
{% endif %}
```

**Check current user:**
```
{% if issue.fields.assignee.accountId == currentUser.accountId %}
  This issue is assigned to you!
{% endif %}
```

**Combined conditions:**
```
{% if issue.fields.priority.name == "High" and issue.fields.status.name != "Done" %}
  High priority issue needs attention
{% endif %}
```

---

## Loops

### Basic Loop

```
{% for label in issue.fields.labels %}
  - {{ label }}
{% endfor %}
```

### With Empty Block

```
{% for issue in linkedIssues %}
  {{ issue.key }}
{% empty %}
  No linked issues
{% endfor %}
```

### Loop Variables

| Variable | Description |
|----------|-------------|
| `loop.index` | 0-based index |
| `loop.index1` | 1-based index |
| `loop.number` | Alias for index1 |
| `loop.first` | True for first item |
| `loop.last` | True for last item |
| `loop.even` | True for even iterations (0, 2, 4...) |
| `loop.odd` | True for odd iterations (1, 3, 5...) |
| `loop.length` | Total number of items |

**Example:**
```
{% for link in linkedIssues %}
  {{ loop.index1 }}. {{ link.key }}{% if not loop.last %}, {% endif %}
{% endfor %}
```

### Loop Control

```
{% break %}      Exit loop
{% continue %}   Skip to next
```

---

## Filters

Transform values using `|` (pipe):

### General Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `default(value)` | Fallback for null/empty | `{{ name \| default("Unknown") }}` |
| `coalesce(v1, v2, ...)` | First non-empty value | `{{ a \| coalesce(b, c) }}` |
| `empty` | Check if value is empty | `{% if items \| empty %}No items{% endif %}` |
| `len` | Get length | `{{ items \| len }}` |

### String Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `upper` | Uppercase | `{{ "hello" \| upper }}` → HELLO |
| `lower` | Lowercase | `{{ "HELLO" \| lower }}` → hello |
| `capitalize` | Capitalize first letter | `{{ "hello" \| capitalize }}` → Hello |
| `trim` | Remove whitespace | `{{ "  text  " \| trim }}` → text |
| `truncate(n, suffix)` | Truncate to n chars | `{{ text \| truncate(50) }}` |
| `replace(old, new)` | Replace substring | `{{ text \| replace("a", "b") }}` |
| `split(separator)` | Split into array | `{{ "a,b,c" \| split(",") }}` |
| `join(separator)` | Join array to string | `{{ labels \| join(", ") }}` |
| `match(regex)` | Test regex match | `{% if key \| match("^PROJ-") %}...{% endif %}` |

### Number Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `round` | Round to nearest integer | `{{ 3.7 \| round }}` → 4 |
| `ceil` | Round up | `{{ 3.2 \| ceil }}` → 4 |
| `floor` | Round down | `{{ 3.9 \| floor }}` → 3 |
| `formatNumber(locale)` | Format with locale | `{{ 1234.5 \| formatNumber("en-US") }}` → 1,234.5 |
| `percent(digits)` | Format as percentage | `{{ 0.75 \| percent(1) }}` → 75.0% |

### Array Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `first` | First element | `{{ items \| first }}` |
| `last` | Last element | `{{ items \| last }}` |
| `uniq` | Remove duplicates | `{{ labels \| uniq }}` |
| `reverse` | Reverse order | `{{ items \| reverse }}` |
| `slice(start, count)` | Get slice of array | `{{ items \| slice(0, 5) }}` |
| `take(n)` | Take first n items | `{{ items \| take(3) }}` |
| `sortBy(path, desc)` | Sort by property | `{{ issues \| sortBy("fields.priority.id") }}` |
| `map(path)` | Extract property from each | `{{ issues \| map("key") }}` |
| `filter(path, op, value)` | Filter by condition | `{{ issues \| filter("fields.status.name", "==", "Done") }}` |

**Filter operators:** `==`, `!=`, `>`, `>=`, `<`, `<=`, `includes`, `contains`

### Date Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `date(format, timezone)` | Format date | `{{ created \| date("yyyy-MM-dd") }}` |
| `fromNow` | Relative time | `{{ updated \| fromNow }}` → "2 hours ago" |
| `addDays(n)` | Add days | `{{ duedate \| addDays(7) }}` |
| `addHours(n)` | Add hours | `{{ created \| addHours(24) }}` |

**Date format tokens:** `yyyy`, `MM`, `dd`, `HH`, `mm`, `ss`

### HTML Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `nl2br` | Newlines to `<br/>` | `{{ text \| nl2br }}` |
| `escapeAttr` | Escape for HTML attributes | `<a title="{{ text \| escapeAttr }}">` |
| `urlEncode` | URL encode | `{{ text \| urlEncode }}` |
| `json(indent)` | Convert to JSON | `{{ data \| json(2) }}` |
| `jsonHtml(indent)` | JSON with `<br/>` | `{{ data \| jsonHtml }}` |

### Jira-Specific Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `statusBadge` | Status lozenge HTML | `{{ issue.fields.status \| statusBadge }}` |
| `avatar(size)` | User avatar HTML | `{{ issue.fields.assignee \| avatar(24) }}` |
| `issueLink` | Issue browse URL | `{{ linked.key \| issueLink }}` |
| `formatField(fieldId)` | Format field value | `{{ value \| formatField("customfield_10001") }}` |

> **Context-Dependent Filters**: The filters `statusBadge`, `avatar`, and `formatField` require runtime context to render properly. When used in Message Panel templates, this context is automatically provided. If the context is unavailable, these filters return the input value unchanged.

**Filter Details:**

- **`statusBadge`** - Renders a Jira status lozenge with appropriate colors. Pass the full status object, not just the name.
- **`avatar(size)`** - Renders a user avatar image. Size is in pixels (default: 24). Pass a user object with `avatarUrls` property.
- **`formatField(fieldId)`** - Formats a value according to Jira's field type. Useful for custom fields that need special rendering.

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

- [Message Formats](message-formats) - HTML, Markdown, ADF
- [Use Cases](use-cases) - Ready-to-use examples

{% endraw %}
