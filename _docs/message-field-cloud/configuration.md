---
title: Configuration Guide
key: message-field-cloud
excerpt: "Create and configure Message Panel displays with data sources, field selection, and filtering options."
category: configuration
tags: [doc, cloud, configuration, linked-issues, jql, fields, filtering]
---

{:.no_toc}
* TOC
{:toc}

## Creating a Configuration

1. Go to **Apps** → **Message Panel Settings**
2. Click **Create New Configuration**
3. Configure settings (see sections below)
4. Click **Save**

## Basic Settings

### Name
- **Required** field
- Displayed as the panel title
- Use descriptive names: "Blockers", "Related Bugs", "Epic Progress"

### Description
- **Optional** field
- Supports dynamic templates with issue data
- Can reference fields and linked issues
- See [Dynamic Templates](/docs/message-field-cloud/dynamic-templates/) for syntax

**Example:**
{% raw %}
```
This issue has {{ linkedIssues.length }} related items
```
{% endraw %}

## Data Source

Choose what data the panel should display:

### Linked Issues
Display issues connected via link types.

- Select one or more link types with direction (inward/outward)
- Issues are aggregated from all selected link types
- Examples: "is blocked by", "relates to", "is parent of"

### JQL Query
Display issues matching a JQL search.

- Enter a valid JQL query
- Supports template variables: {% raw %}`project = {{ issue.fields.project.id }}`{% endraw %}
- Maximum 100 issues by default

**Template variables in JQL:**
{% raw %}
```jql
"Epic Link" = {{ issue.key }}
project = {{ projectId }} AND type = Bug
```
{% endraw %}

### Empty
Create a message-only panel with no issue table.

## Field Selection

Choose which Jira fields to display in the issue table.

1. Click **Select Fields** button
2. Select/deselect fields with checkboxes
3. Reorder fields by dragging
4. Click **Save**

**Default fields:** Key, Summary, Status, Priority, Assignee

## Display Settings

### Display Module
Choose where the panel appears:
- **Issue Panel** - Main panel on issue view
- **Issue Activity** - Activity feed
- **Issue Context** - Context menu
- **Issue Action** - Custom action button

See [Modules Guide](/docs/message-field-cloud/modules/) for details.

### Pagination
- **Rows Per Page** - Number of issues per page (default: 10)
- **Max Issues** - Maximum issues to load (default: 100)

### Weight
Control the display order of multiple panels:
- Lower weights appear first
- Range: -1000 to 1000
- Default: 0

## Filtering

Control which issues display the panel:

### Project Filter
Select one or more projects, or leave empty for all projects.

### Issue Type Filter
Select one or more issue types, or leave empty for all types.

### Display JQL
Additional JQL condition for showing the panel.

**Examples:**
```jql
priority in (Highest, High)
status in ("In Progress", "In Review")
assignee = {{ currentUser.accountId }}
```

## Message Format

Choose how the description is rendered:
- **Plain Text** - No formatting
- **HTML** - Full HTML support with styling
- **Markdown** - GitHub-flavored Markdown
- **ADF** - Atlassian Document Format

## Advanced Options

### Modal Window (Issue Panel only)

Display the panel in a modal dialog:
- **Show in Modal** - Enable modal window
- **Modal Button Text** - Button label
- **Button Appearance** - Visual style
- **Modal Size** - Dialog size (Small/Medium/Large/X-Large)
- **Auto-Open** - Open automatically on issue load
- **Show Once Per Issue** - Only auto-open once

### Execute As User

Run queries as a specific user instead of current user (site admins only).

## Configuration Management

### Duplicate Configuration
Click **...** menu → **Duplicate** to create a copy.

### Export/Import
- **Export** - Download as JSON
- **Import** - Upload JSON file

### Delete Configuration
Click **...** menu → **Delete** to remove permanently.

## Examples

### Blockers Dashboard
- Name: "⛔ Blockers"
- Data Source: Linked Issues → "is blocked by"
- Fields: Key, Summary, Status, Assignee
- Display JQL: `status != Done`

### Epic Progress
- Name: "Epic Progress"
- Data Source: JQL → {% raw %}`"Epic Link" = {{ key }}`{% endraw %}
- Fields: Key, Summary, Status, Assignee
- Module: Issue Panel

### Warning Banner
- Name: "⚠️ Missing Information"
- Data Source: Empty
- Description: {% raw %}`{% if not issue.fields.description %}Please add a description{% endif %}`{% endraw %}
- Display JQL: `status = "To Do"`

## Next Steps

- [Dynamic Templates](/docs/message-field-cloud/dynamic-templates/) - Add dynamic content
- [Template Examples](/docs/message-field-cloud/template-examples/) - Ready-to-use templates
- [Modules](/docs/message-field-cloud/modules/) - Display locations
- [Delegation](/docs/message-field-cloud/delegation/) - Project admin access
