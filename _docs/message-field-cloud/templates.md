---
title: Dynamic Templates
key: message-field-cloud
excerpt: Create dynamic messages with variables, conditions, and loops
category: templates
tags:
  - doc
  - cloud
  - templates
  - variables
  - conditions
---

* TOC
{:toc}

{% raw %}

Create messages that adapt based on issue data, user context, and linked issues.

![Template Editor with Preview](/uploads/message-field-cloud/configuration/template%20editor%20with%20preview.png)

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

## Common Filters

Transform values using `|` (pipe):

| Filter | Description | Example |
|--------|-------------|---------|
| `default(value)` | Fallback for null | `{{ name \| default("Unknown") }}` |
| `len` | Get length | `{{ items \| len }}` |
| `date(format)` | Format date | `{{ created \| date("yyyy-MM-dd") }}` |
| `fromNow` | Relative time | `{{ updated \| fromNow }}` |
| `upper` | Uppercase | `{{ text \| upper }}` |
| `lower` | Lowercase | `{{ text \| lower }}` |
| `truncate(n)` | Truncate to n chars | `{{ text \| truncate(50) }}` |
| `join(sep)` | Join array | `{{ labels \| join(", ") }}` |
| `first` | First element | `{{ items \| first }}` |
| `last` | Last element | `{{ items \| last }}` |
| `take(n)` | Take first n items | `{{ items \| take(5) }}` |
| `filter(path, op, val)` | Filter array | `{{ issues \| filter("status", "==", "Done") }}` |
| `statusBadge` | Status lozenge | `{{ status \| statusBadge }}` |
| `avatar(size)` | User avatar | `{{ assignee \| avatar(24) }}` |
| `issueLink` | Issue link | `{{ linked \| issueLink }}` |

See [Template Filters](template-filters) for the complete list.

---

## Next Steps

- [Template Filters](template-filters) - Complete filter reference
- [Template Advanced](template-advanced) - Functions, JQL templates, display conditions
- [Message Formats](message-formats) - HTML, Markdown, ADF
- [Use Cases](use-cases) - Ready-to-use examples

{% endraw %}
