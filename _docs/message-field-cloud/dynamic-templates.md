---
title: Dynamic Templates
key: message-field-cloud
excerpt: "Create dynamic messages with variables, conditions, loops, and filters. Access issue data, linked issues, and user context in real-time."
category: templates-customization
tags: [doc, cloud, dynamic-templates, template-engine, variables, conditions, loops, filters]
---

{:.no_toc}
* TOC
{:toc}

## Overview

Dynamic templates allow you to create messages and JQL queries that adapt based on issue data, linked issues, user information, and other context. The template engine provides a powerful yet safe way to generate dynamic content.

{% raw %}

## Template Syntax

Message Panel uses a modern template engine with the following syntax:

![Template Syntax Guide](/uploads/message-field-cloud/configuration/right%20panel%20syntax.png)

**Quick Access**: The Template Syntax Guide is available directly in the panel configuration interface. Click the "Template Syntax Guide" tab when creating or editing a panel to see examples and documentation without leaving the page.

### Variables

Output data using double curly braces:

```
{{ variableName }}
```

**HTML Escaping:**
- `{{ variable }}` - Auto-escapes HTML (safe for user input)
- `{{{ variable }}}` - Raw output without escaping (use carefully)

**Examples:**
```
Issue Key: {{ issue.key }}
Summary: {{ issue.fields.summary }}
Status: {{ issue.fields.status.name }}
```

### Conditions

Control what's displayed based on logic:

```
{% if condition %}
  Content when true
{% elif otherCondition %}
  Content when other is true
{% else %}
  Content otherwise
{% endif %}
```

**Example:**
```
{% if issue.fields.priority.name == "Highest" %}
  ⚠️ Critical Priority Issue
{% elif issue.fields.priority.name == "High" %}
  ⚡ High Priority Issue
{% else %}
  Standard priority
{% endif %}
```

### Loops

Iterate over arrays and objects:

```
{% for item in array %}
  {{ item }}
{% endfor %}
```

**With empty block:**
```
{% for issue in linkedIssues %}
  - {{ issue.key }}: {{ issue.fields.summary }}
{% empty %}
  No linked issues found
{% endfor %}
```

**Loop variables:**
- `loop.index` - 0-based index (0, 1, 2, ...)
- `loop.index1` - 1-based index (1, 2, 3, ...)
- `loop.first` - true for first iteration
- `loop.last` - true for last iteration
- `loop.even` - true for even iterations
- `loop.odd` - true for odd iterations

**Example:**
```
{% for link in linkedIssues %}
  {{ loop.index1 }}. {{ link.key }}
  {% if not loop.last %}, {% endif %}
{% endfor %}
```

### Comments

Add notes that won't be displayed:

```
{# Single line comment #}

{% comment %}
Multi-line comment
Can span multiple lines
{% endcomment %}
```

### Filters

Transform data with filters using the pipe symbol:

```
{{ value | filterName }}
{{ value | filter1 | filter2 }}
{{ value | filterWithArgs(arg1, arg2) }}
```

**Example:**
```
{{ issue.fields.summary | upper }}
{{ issue.fields.description | truncate(100) }}
{{ issue.fields.created | date("YYYY-MM-DD") }}
```

## Available Variables

### Issue Data

Access the current issue's data:

#### `issue`
The complete issue object with all fields.

**Properties:**
- `issue.key` - Issue key (e.g., "PROJ-123")
- `issue.id` - Issue ID (numeric)
- `issue.self` - API URL for the issue
- `issue.fields` - All issue fields (see below)

**Short forms:**
- `{{ key }}` → same as `{{ issue.key }}`
- `{{ id }}` → same as `{{ issue.id }}`

#### `issue.fields`
All issue field values.

**System fields:**
```
{{ issue.fields.summary }}
{{ issue.fields.description }}
{{ issue.fields.status.name }}
{{ issue.fields.priority.name }}
{{ issue.fields.assignee.displayName }}
{{ issue.fields.reporter.displayName }}
{{ issue.fields.created }}
{{ issue.fields.updated }}
{{ issue.fields.duedate }}
{{ issue.fields.resolutiondate }}
{{ issue.fields.project.name }}
{{ issue.fields.project.key }}
{{ issue.fields.issuetype.name }}
```

**Custom fields:**
```
{{ issue.fields.customfield_10001 }}
{{ issue.fields["My Custom Field"] }}
```

**Arrays and objects:**
```
{% for component in issue.fields.components %}
  {{ component.name }}
{% endfor %}

{% for version in issue.fields.fixVersions %}
  {{ version.name }}
{% endfor %}

{% if issue.fields.assignee %}
  Assigned to: {{ issue.fields.assignee.displayName }}
{% endif %}
```

#### `fields`
Shortcut for `issue.fields`:

```
{{ fields.summary }}
→ same as {{ issue.fields.summary }}
```

### User Context

Access information about the current user viewing the panel:

#### `currentUser`
The user viewing the panel.

**Properties:**
```
{{ currentUser.accountId }}
{{ currentUser.displayName }}
{{ currentUser.emailAddress }}
{{ currentUser.active }}
{{ currentUser.timeZone }}
{{ currentUser.locale }}
```

**Example:**
```
{% if issue.fields.assignee.accountId == currentUser.accountId %}
  This issue is assigned to you!
{% endif %}
```

#### `user`
Alias for `currentUser`:

```
{{ user.displayName }}
→ same as {{ currentUser.displayName }}
```

### Project Context

#### `project`
Shortcut for current issue's project:

```
{{ project.name }}
{{ project.key }}
{{ project.id }}
→ same as {{ issue.fields.project.* }}
```

### Linked Issues

Access issues related to the current issue:

#### `linkedIssues`
Array of linked issues (when using LINKED_ISSUES data source).

**Properties:**
```
{{ linkedIssues.length }} - Number of linked issues

{% for linked in linkedIssues %}
  {{ linked.key }}
  {{ linked.fields.summary }}
  {{ linked.fields.status.name }}
{% endfor %}
```

**Example - Count by status:**
```
{% set done = 0 %}
{% set inProgress = 0 %}
{% for linked in linkedIssues %}
  {% if linked.fields.status.name == "Done" %}
    {% set done = done + 1 %}
  {% elif linked.fields.status.statusCategory.key == "indeterminate" %}
    {% set inProgress = inProgress + 1 %}
  {% endif %}
{% endfor %}

Progress: {{ done }} done, {{ inProgress }} in progress
```

### Context Information

#### `context`
Additional contextual information:

```
{{ context.extension.project.id }}
{{ context.extension.project.key }}
{{ context.extension.issue.id }}
{{ context.extension.issue.key }}
```

## Operators

### Comparison Operators

```
==   Equal to
!=   Not equal to
>    Greater than
<    Less than
>=   Greater than or equal to
<=   Less than or equal to
```

**Example:**
```
{% if issue.fields.priority.id > 3 %}
  Low priority
{% endif %}
```

### Logical Operators

```
and   Logical AND
or    Logical OR
not   Logical NOT
```

**Example:**
```
{% if issue.fields.assignee and issue.fields.status.name == "Open" %}
  Assigned and open
{% endif %}

{% if not issue.fields.duedate %}
  No due date set
{% endif %}
```

### Membership Operator

```
in    Check if value is in array
```

**Example:**
```
{% if "High" in ["High", "Highest"] %}
  High priority category
{% endif %}

{% if issue.fields.status.name in ["Done", "Closed", "Resolved"] %}
  Issue is completed
{% endif %}
```

### Ternary Operator

```
condition ? valueIfTrue : valueIfFalse
```

**Example:**
```
Priority: {{ issue.fields.priority ? issue.fields.priority.name : "None" }}
```

## Control Structures

### Set Variables

Create or update variables:

```
{% set variableName = value %}
```

**Examples:**
```
{% set count = 0 %}
{% set userName = issue.fields.assignee.displayName %}
{% set isHighPriority = issue.fields.priority.name == "Highest" %}
```

### With Blocks

Create a scoped alias for a value:

```
{% with expression as aliasName %}
  {{ aliasName.property }}
{% endwith %}
```

**Example:**
```
{% with issue.fields.assignee as user %}
  {% if user %}
    Assigned to: {{ user.displayName }} ({{ user.emailAddress }})
  {% endif %}
{% endwith %}
```

### Switch/Case

Multi-way branching:

```
{% switch expression %}
  {% case value1 %}
    Content for value1
  {% case value2, value3 %}
    Content for value2 or value3
  {% default %}
    Default content
{% endswitch %}
```

**Example:**
```
{% switch issue.fields.status.name %}
  {% case "To Do" %}
    🔵 Not started
  {% case "In Progress", "In Review" %}
    🟡 Work in progress
  {% case "Done" %}
    ✅ Completed
  {% default %}
    ⚪ Other status
{% endswitch %}
```

### Loop Control

Control loop execution:

```
{% break %}      Exit loop early
{% continue %}   Skip to next iteration
```

**Example:**
```
{% for issue in linkedIssues %}
  {% if issue.fields.status.name == "Done" %}
    {% continue %}
  {% endif %}
  - {{ issue.key }}: {{ issue.fields.summary }}
  {% if loop.index >= 5 %}
    {% break %}
  {% endif %}
{% endfor %}
```

## Filters

Transform values using filters:

### String Filters

#### `upper`
Convert to uppercase:
```
{{ "hello" | upper }}
→ HELLO
```

#### `lower`
Convert to lowercase:
```
{{ "HELLO" | lower }}
→ hello
```

#### `capitalize`
Capitalize first letter:
```
{{ "hello world" | capitalize }}
→ Hello world
```

#### `title`
Title case:
```
{{ "hello world" | title }}
→ Hello World
```

#### `truncate(length)`
Truncate to specified length:
```
{{ issue.fields.summary | truncate(50) }}
→ First 50 characters...
```

#### `nl2br`
Convert newlines to `<br>` tags:
```
{{{ issue.fields.description | nl2br }}}
```

### Array Filters

#### `length` / `size`
Get array length:
```
{{ linkedIssues | length }} issues found
```

#### `first`
Get first element:
```
{{ issue.fields.components | first }}
```

#### `last`
Get last element:
```
{{ issue.fields.fixVersions | last }}
```

#### `join(separator)`
Join array elements:
```
{{ issue.fields.labels | join(", ") }}
```

#### `sort`
Sort array:
```
{% for label in issue.fields.labels | sort %}
  {{ label }}
{% endfor %}
```

### Date Filters

#### `date(format)`
Format date/datetime:
```
{{ issue.fields.created | date("YYYY-MM-DD") }}
{{ issue.fields.updated | date("DD/MM/YYYY HH:mm") }}
```

**Format tokens:**
- `YYYY` - 4-digit year
- `MM` - 2-digit month
- `DD` - 2-digit day
- `HH` - 2-digit hour (24h)
- `mm` - 2-digit minute
- `ss` - 2-digit second

### Other Filters

#### `default(fallback)`
Provide default value if null/undefined:
```
{{ issue.fields.assignee | default("Unassigned") }}
{{ issue.fields.duedate | default("No due date") }}
```

#### `escape`
HTML escape (automatic for `{{ }}`):
```
{{ userInput | escape }}
```

#### `json`
Convert to JSON string:
```
{{ issue.fields.components | json }}
```

## JQL Templates

Use templates in JQL queries for dynamic searches:

### Basic JQL Templates

```jql
project = {{ issue.fields.project.id }}
```

```jql
assignee = {{ currentUser.accountId }}
```

```jql
"Epic Link" = {{ issue.key }}
```

### Conditional JQL

```jql
project = {{ project.id }}
{% if issue.fields.priority.name == "Highest" %}
  AND priority = Highest
{% endif %}
```

### Loop in JQL

```jql
key in (
  {% for component in issue.fields.components %}
    {{ component.id }}
    {% if not loop.last %},{% endif %}
  {% endfor %}
)
```

### Common JQL Patterns

**Issues in same epic:**
```jql
"Epic Link" = {{ key }} AND status != Done
```

**Same project and type:**
```jql
project = {{ project.id }} AND type = {{ issue.fields.issuetype.id }}
```

**Assigned to current user:**
```jql
assignee = {{ currentUser.accountId }} AND status in ("To Do", "In Progress")
```

**Same components:**
```jql
{% if issue.fields.components %}
component in (
  {% for comp in issue.fields.components %}
    "{{ comp.name }}"{% if not loop.last %},{% endif %}
  {% endfor %}
)
{% endif %}
```

See [JQL Examples](/docs/user-docs/template-examples/#jql-examples) for more patterns.

## Advanced Techniques

### Null Safety

Always check for null/undefined values:

```
{% if issue.fields.assignee %}
  Assigned to: {{ issue.fields.assignee.displayName }}
{% else %}
  Unassigned
{% endif %}
```

```
{{ issue.fields.duedate | default("No due date") }}
```

### Nested Conditions

```
{% if issue.fields.assignee %}
  {% if issue.fields.assignee.accountId == currentUser.accountId %}
    You are assigned to this issue
  {% else %}
    Assigned to: {{ issue.fields.assignee.displayName }}
  {% endif %}
{% else %}
  This issue is unassigned
{% endif %}
```

### Calculations

```
{% set totalEstimate = 0 %}
{% for issue in linkedIssues %}
  {% if issue.fields.timeoriginalestimate %}
    {% set totalEstimate = totalEstimate + issue.fields.timeoriginalestimate %}
  {% endif %}
{% endfor %}

Total estimate: {{ totalEstimate }} seconds
```

### Complex Filtering

```
{% set highPriorityIssues = [] %}
{% for issue in linkedIssues %}
  {% if issue.fields.priority.name in ["Highest", "High"] %}
    {% set highPriorityIssues = highPriorityIssues.concat([issue]) %}
  {% endif %}
{% endfor %}

Found {{ highPriorityIssues | length }} high priority issues
```

## Next Steps

- [Template Examples](/docs/message-field-cloud/template-examples/) - Ready-to-use template examples
- [Configuration Guide](/docs/message-field-cloud/configuration/) - Set up panels

{% endraw %}
