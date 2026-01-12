---
title: Data Sources
key: message-field-cloud
excerpt: Configure panels with Linked Issues, JQL queries, or message-only content
category: configuration
tags:
  - doc
  - cloud
  - jql
  - linked-issues
  - data-sources
---

* TOC
{:toc}

Choose what data your panel displays: linked issues, JQL results, or just a message.

## Data Source Types

| Type | Shows Table | Use Case |
|------|-------------|----------|
| **Linked Issues** | Yes | Display issues connected by link types |
| **JQL Query** | Yes | Display issues from any JQL search |
| **Empty** | No | Message-only panels |

---

## Linked Issues

Display issues connected via Jira link types.

![Panel Linked Issues Settings](/uploads/message-field-cloud/configuration/panel%20settings%20linked%20issues.png)

### Configuration

1. Select **Linked Issues** as data source
2. Choose link types with direction:
   - **Inward**: "is blocked by", "is cloned by"
   - **Outward**: "blocks", "clones"
3. Select table fields (columns to display)
4. Optionally select display fields (fields shown above table)
5. Configure pagination and limits

### Link Type Selection

Each link type has two directions:

| Direction | Example | Description |
|-----------|---------|-------------|
| **Inward** | "is blocked by" | Current issue is the target |
| **Outward** | "blocks" | Current issue is the source |

You can select multiple link types and directions. All matching linked issues are combined.

### Example: Show Blockers

- **Link Type**: "is blocked by" (inward)
- **Table Fields**: Key, Summary, Status, Assignee
- **Max Issues**: 50

This shows all issues that block the current issue.

---

## JQL Query

Display issues matching any JQL search.

![JQL Settings](/uploads/message-field-cloud/configuration/panel%20settings%20jql.png)

### Basic Query

```jql
project = "Marketing" AND status = "In Progress"
```

### Parametric Mode

Use template variables to create dynamic queries:

{% raw %}
```jql
"Epic Link" = {{ issue.key }}
```

```jql
project = {{ issue.fields.project.key }} AND type = Bug
```

{% endraw %}

### Available Variables in JQL

{% raw %}
| Variable | Description |
|----------|-------------|
| `{{ issue.key }}` | Current issue key (e.g., PROJ-123) |
| `{{ issue.id }}` | Current issue ID |
| `{{ issue.fields.project.key }}` | Project key |
| `{{ issue.fields.project.id }}` | Project ID |
| `{{ issue.fields.assignee.accountId }}` | Assignee account ID |
| `{{ issue.fields.reporter.accountId }}` | Reporter account ID |
| `{{ currentUser.accountId }}` | Current user account ID |

**Shortcut syntax:**

| Shortcut | Equivalent |
|----------|------------|
| `{{ key }}` | `{{ issue.key }}` |
| `{{ fields.project.key }}` | `{{ issue.fields.project.key }}` |
| `{{ project.key }}` | `{{ issue.fields.project.key }}` |
| `{{ assignee.accountId }}` | `{{ issue.fields.assignee.accountId }}` |
{% endraw %}

### Example: Epic Children

{% raw %}
```jql
"Epic Link" = {{ issue.key }} ORDER BY status
```
{% endraw %}

Shows all stories/tasks in an epic, ordered by status.

### Example: Same Assignee

{% raw %}
```jql
assignee = {{ issue.fields.assignee.accountId }} AND status != Done
```
{% endraw %}

Shows other open issues assigned to the same person.

### Example: Current User's Issues

{% raw %}
```jql
assignee = {{ currentUser.accountId }} AND status != Done ORDER BY priority DESC
```
{% endraw %}

Shows open issues assigned to the person viewing the panel.

---

## Empty (Message Only)

Create panels without issue tables - just messages.

### Use Cases

- Warning banners
- Instructions
- Status indicators
- Contextual help
- Conditional messages

### Message Format

When using Empty data source, select the **Message Render Type**:

| Type | Description |
|------|-------------|
| **Plain Text** | Simple text, no formatting |
| **HTML** | Full HTML support |
| **Markdown** | GitHub-flavored markdown |
| **ADF** | Atlassian Document Format (structured) |

See [Message Formats](message-formats) for detailed syntax and examples.

### Example: Missing Description Warning

{% raw %}
**Message:**
```
{% if not issue.fields.description %}
⚠️ This issue needs a description. Please add details about:
- What needs to be done
- Acceptance criteria
- Related context
{% endif %}
```
{% endraw %}

### Example: Priority Warning

{% raw %}
```html
{% if issue.fields.priority.name == "Highest" %}
<div style="background: #ffebe6; padding: 12px; border-left: 4px solid #de350b;">
  <strong>Critical Priority</strong><br>
  This issue requires immediate attention.
</div>
{% endif %}
```
{% endraw %}

---

## Field Configuration

### Two Types of Fields

The panel supports two different field selections:

| Field Type | Where Displayed | Used For |
|------------|-----------------|----------|
| **Table Fields** (`linkedIssuesFieldId`) | Columns in issue table | Linked Issues or JQL results |
| **Display Fields** (`displayFieldIds`) | Above the table | Current issue data |

### Table Fields

Choose which columns appear in the issue table.

![Display Fields Tab](/uploads/message-field-cloud/configuration/panel%20settings%20fields.png)

**Steps:**
1. Click **Select Fields**
2. Check/uncheck fields
3. Drag to reorder
4. Click **Save**

**Available Fields:**
- **System**: Key, Summary, Status, Priority, Assignee, Reporter, Created, Updated
- **Custom**: Any custom fields in your instance
- **Form fields**: Open forms, Submitted forms
- **Date fields**: Due date, Start date, etc.

**Default Fields:** Key, Summary, Status, Priority, Assignee

**Limit:** Maximum 50 table fields per configuration.

### Display Fields

Show current issue data above the table.

![Display Fields Settings](/uploads/message-field-cloud/configuration/panel%20settings%20display%20fields.png)

These are fields from the **current issue** (not the linked issues), displayed in a compact format above the table.

**Use case:** Show Epic name, Sprint, or other context when viewing linked issues.

**Limit:** Maximum 50 display fields per configuration.

---

## Pagination and Limits

### Max Issues vs Rows Per Page

| Setting | Purpose | Range | Default |
|---------|---------|-------|---------|
| **Max Issues** | Total issues loaded from Jira API | 1-500 | 100 |
| **Rows Per Page** | Issues displayed per page in table | 1-25 | 10 |

**How they work together:**

1. **Max Issues** controls how many issues are fetched from Jira
2. **Rows Per Page** controls pagination display
3. The panel shows paginated results up to Max Issues limit

**Example:**
- Max Issues = 100, Rows Per Page = 10
- Panel fetches up to 100 issues
- Displays 10 per page with navigation
- User can browse through 10 pages maximum

### Performance Recommendations

| Scenario | Max Issues | Rows Per Page |
|----------|------------|---------------|
| Quick overview | 25 | 5 |
| Standard use | 100 | 10 |
| Comprehensive lists | 500 | 25 |

> **Tip:** Start with lower limits for better performance. Increase only if needed.

---

## Template Variables

When creating messages or descriptions, you have access to these variables:

### Issue Data

{% raw %}
| Variable | Description |
|----------|-------------|
| `{{ issue.key }}` | Issue key (PROJ-123) |
| `{{ issue.id }}` | Issue numeric ID |
| `{{ issue.fields.summary }}` | Summary text |
| `{{ issue.fields.description }}` | Description (may be ADF) |
| `{{ issue.fields.status.name }}` | Status name |
| `{{ issue.fields.priority.name }}` | Priority name |
| `{{ issue.fields.assignee.displayName }}` | Assignee name |
| `{{ issue.fields.reporter.displayName }}` | Reporter name |
| `{{ issue.fields.project.name }}` | Project name |
| `{{ issue.fields.project.key }}` | Project key |
| `{{ issue.fields.issuetype.name }}` | Issue type |
| `{{ issue.fields.created }}` | Created timestamp |
| `{{ issue.fields.updated }}` | Updated timestamp |
| `{{ issue.fields.duedate }}` | Due date |
{% endraw %}

### Shortcuts

{% raw %}
| Shortcut | Equivalent |
|----------|------------|
| `{{ key }}` | `{{ issue.key }}` |
| `{{ fields.summary }}` | `{{ issue.fields.summary }}` |
| `{{ priority.name }}` | `{{ issue.fields.priority.name }}` |
| `{{ status.name }}` | `{{ issue.fields.status.name }}` |
| `{{ project.key }}` | `{{ issue.fields.project.key }}` |
{% endraw %}

### Current User

{% raw %}
| Variable | Description |
|----------|-------------|
| `{{ currentUser.accountId }}` | User's account ID |
| `{{ currentUser.displayName }}` | User's display name |
| `{{ currentUser.timeZone }}` | User's timezone |
| `{{ currentUser.locale }}` | User's locale (e.g., "en-US") |
{% endraw %}

`{{ user }}` is an alias for `{{ currentUser }}`.

### Linked Issues (for Linked Issues/JQL sources)

{% raw %}
| Variable | Description |
|----------|-------------|
| `{{ linkedIssues }}` | Array of all loaded issues |
| `{{ linkedIssues.length }}` | Count of issues |
{% endraw %}

**Loop example:**

{% raw %}
```
{% for linked in linkedIssues %}
  {{ linked.key }}: {{ linked.fields.summary }}
{% empty %}
  No linked issues found.
{% endfor %}
```
{% endraw %}

### Loop Variables

{% raw %}
| Variable | Description |
|----------|-------------|
| `{{ loop.index }}` | 0-based index |
| `{{ loop.index1 }}` | 1-based index |
| `{{ loop.first }}` | True for first item |
| `{{ loop.last }}` | True for last item |
| `{{ loop.length }}` | Total items in loop |
{% endraw %}

See [Templates](templates) for complete syntax reference.

---

## Custom Fields

Access custom fields by ID or name:

{% raw %}
```
{{ issue.fields.customfield_10001 }}
{{ issue.fields["Story Points"] }}
```
{% endraw %}

### Finding Field IDs

1. In configuration, click **Download Issue Data**
2. Search for the field name in JSON
3. Note the `customfield_XXXXX` ID

### Common Custom Fields

{% raw %}
```
{{ issue.fields.customfield_10001 }}          {# Story Points #}
{{ issue.fields.customfield_10002.value }}    {# Select field value #}
{{ issue.fields.customfield_10003 | date }}   {# Date field #}
{{ issue.fields["Epic Link"] }}               {# Epic link key #}
```
{% endraw %}

---

## Next Steps

- [Context Filters](context-filters) - Control when panels appear
- [Templates](templates) - Dynamic content syntax
- [Use Cases](use-cases) - Ready-to-use examples
- [Message Formats](message-formats) - HTML, Markdown, ADF syntax

