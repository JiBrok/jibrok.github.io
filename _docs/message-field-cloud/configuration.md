---
title: Message Panel Configuration Guide
key: message-field-cloud
excerpt: "Complete guide to creating and configuring Message Panel displays: data sources, field selection, filtering, templates, and advanced options."
category: configuration
tags: [doc, cloud, configuration, linked-issues, jql, fields, filtering, templates]
---

{:.no_toc}
* TOC
{:toc}

## Overview

Message Panel configurations define what data to display, where to show it, and how it should appear. Each configuration creates a panel that can display linked issues, JQL query results, and custom messages.

## Accessing Configuration

### Admin Configuration (Site Admins)

1. Click **Apps** in the top navigation
2. Select **Message Panel Settings**
3. You'll see the configuration list page

### Project Configuration (Project Admins with delegation)

1. Go to **Project Settings**
2. Select **Message Panel Settings** from the sidebar
3. View configurations for your project

## Creating a Configuration

1. Click **Create New Configuration** button

2. Fill in the basic information (see sections below)

3. Click **Save** to create the configuration

4. The panel will appear on matching issues immediately

## Basic Settings

### Name
- **Required** field
- Displayed as the panel title (if "Show Name" is enabled)
- Use a descriptive name that indicates the panel's purpose
- Examples: "Blockers", "Related Bugs", "Epic Progress", "Dependencies"

### Description
- **Optional** field
- Supports dynamic templates with full template engine syntax
- Can reference issue data, linked issues, and user context
- Rendered as HTML, Markdown, or ADF based on format setting
- Leave empty to show no message
- See [Dynamic Templates](/docs/user-docs/dynamic-templates/) for syntax

**Example descriptions:**
{% raw %}
```
This issue has {{ linkedIssues.length }} related items
```

```
{% if issue.fields.priority.name == "Highest" %}
⚠️ **High Priority** - Review dependencies before proceeding
{% endif %}
```
{% endraw %}

### Display Options

#### Show Name
- Toggle to display or hide the panel name
- Enabled by default
- When disabled, only the table (and description if provided) is shown

#### Show Description
- Toggle to display or hide the description message
- Enabled by default
- When disabled, description template is not rendered

#### Show Count
- Display the number of found issues in the panel header
- Format: "Panel Name (5 issues)"
- Useful for quick overview without expanding the panel

#### Show JQL Link
- Adds a "View in Jira" link that opens the search results
- Only appears for JQL-based panels
- Link opens in a new tab with the full JQL query
- Useful for diving deeper into results

## Data Source

Choose what data the panel should display:

### Linked Issues

Display issues connected to the current issue via link types.

**Settings:**

- **Link Types** - Select one or more link types with direction:
  - Inward links (e.g., "is blocked by", "is duplicated by")
  - Outward links (e.g., "blocks", "duplicates")
  - You can select multiple link types
  - Issues are aggregated from all selected link types

**Example use cases:**
- Show all blockers (is blocked by)
- Display related bugs (relates to - both directions)
- List child tasks (is parent of)
- Show duplicates (is duplicated by + duplicates)

### JQL Query

Display issues matching a JQL (Jira Query Language) search.

**Settings:**

- **JQL Query** - Enter a valid JQL query
- Supports template variables from current issue
- Maximum 100 issues returned by default (configurable)
- ORDER BY clause is automatically removed from display JQL

**Template Variables in JQL:**

You can use template syntax to make queries dynamic:

```jql
project = {{ issue.fields.project.id }} AND type = Bug
```

```jql
fixVersion = {{ issue.fields.fixVersions[0].id }}
```

```jql
"Epic Link" = {{ issue.key }}
```

**Short forms available:**
- `{{ key }}` → `{{ issue.key }}`
- `{{ id }}` → `{{ issue.id }}`
- `{{ projectId }}` → `{{ issue.fields.project.id }}`

**Available template features:**
- Variables: `{{ issue.fields.* }}`
- Conditions: `{% raw %}{% if %}{% endif %}{% endraw %}`
- Loops: `{% raw %}{% for %}{% endfor %}{% endraw %}`

See [JQL Templates](/docs/user-docs/dynamic-templates/#jql-templates) for more details.

### Empty

Create a message-only panel with no issue table.

**Use cases:**
- Display warnings or notices
- Show calculated metrics from templates
- Create informational banners
- Embed custom content

## Field Selection

Choose which Jira fields to display in the issue table.

### Available Fields

The field selector shows:
- **System fields** - Key, Summary, Status, Priority, Assignee, etc.
- **Custom fields** - All custom fields from your Jira instance
- **Field metadata** - Type, schema information

### Selecting Fields

1. Click **Select Fields** button
2. Search for fields by name
3. Select/deselect fields with checkboxes
4. Reorder fields by dragging (order determines column order)
5. Click **Save** to apply selection

**Default fields** (if none selected):
- Key
- Summary
- Status
- Priority
- Assignee

### Field Rendering

Message Panel automatically renders fields based on their type:

- **Status** - Color-coded badges
- **Priority** - Icons with names
- **User** - Avatar + display name
- **Date/DateTime** - Localized formatting
- **Select/Multi-select** - Formatted options
- **Numbers** - Proper formatting
- **Text** - Plain text or clickable links
- **ADF/HTML** - Rendered content
- **Custom fields** - Type-appropriate rendering

Over 30 field renderers are available. See [Field Rendering](/docs/user-docs/field-rendering/) for complete list.

## Display Settings

### Display Module

Choose where the panel should appear on issue screens:

- **Issue Panel** - Main panel on issue view
  - Shows on the right side of the issue
  - Can be expanded/collapsed
  - Supports modal window option

- **Issue Activity** - Activity feed integration
  - Appears in the activity timeline
  - Inline display
  - Good for showing recent changes

- **Issue Context** - Context menu info
  - Quick access from issue context
  - Compact view
  - Fast loading

- **Issue Action** - Custom action button
  - Adds button to issue actions menu
  - Opens panel on click
  - Good for on-demand data

See [Modules Guide](/docs/user-docs/modules/) for detailed comparison.

### Pagination

Control how many issues to show per page:

- **Rows Per Page** - Number of issues per table page
  - Default: 10
  - Options: 5, 10, 20, 50, 100
  - Larger numbers may impact performance

### Maximum Issues

Limit the total number of issues loaded:

- **Max Issues** - Maximum issues to fetch
  - Default: 100
  - Range: 1-1000
  - Helps with performance for large result sets
  - Issues beyond this limit are not loaded

### Weight

Control the display order of multiple panels:

- **Weight** - Numeric value for ordering
  - Default: 0
  - Lower weights appear first
  - Same weight = alphabetical by name
  - Range: -1000 to 1000

**Example ordering:**
- Blockers (weight: -10)
- Dependencies (weight: 0)
- Related Items (weight: 10)

## Filtering

Control which issues display the panel based on conditions.

### Project Filter

Limit panel to specific projects:

- Select one or more projects from dropdown
- Empty = all projects
- Wildcards:
  - `*` = all projects (same as empty)
  - `[]` = no projects (hides panel)

### Issue Type Filter

Limit panel to specific issue types:

- Select one or more issue types from dropdown
- Empty = all issue types
- Wildcards:
  - `*` = all issue types (same as empty)
  - `[]` = no issue types (hides panel)

**Example:** Only show on Bugs and Tasks in the Support project

### Display JQL

Additional JQL condition for showing the panel:

- **Display JQL** - JQL query that must match the current issue
- Supports template variables
- Panel is hidden if condition doesn't match
- Empty = no additional condition

**Use cases:**

Show only for high priority issues:
```jql
priority in (Highest, High)
```

Show only in specific status:
```jql
status in ("In Progress", "In Review")
```

Show based on custom field:
```jql
"Team" = "Backend" AND "Sprint" is not EMPTY
```

With templates:
```jql
assignee = {{ currentUser.accountId }}
```

**Performance note:** Display JQL is checked via Jira API, adding slight overhead.

## Message Format

Choose how the description message is rendered:

### Plain Text
- No formatting
- Fastest rendering
- Best for simple messages

### HTML
- Full HTML support
- Safe rendering (sanitized)
- Supports styling with limited CSS
- Links, lists, tables, formatting

### Markdown
- GitHub-flavored Markdown
- Converted to HTML
- Headers, lists, code blocks, links, emphasis
- Easier to write than HTML

### ADF (Atlassian Document Format)
- Native Jira format
- Rich formatting support
- Best integration with Jira
- JSON-based structure

See [Message Formats](/docs/user-docs/message-formats/) for examples.

## Advanced Options

### Modal Window (Issue Panel only)

Display the panel in a modal dialog instead of inline.

**Settings:**

- **Show in Modal** - Enable modal window display
- **Modal Button Text** - Text for the button that opens modal
  - Default: Panel name
  - Supports emojis

- **Button Appearance** - Visual style of the button
  - Default (neutral blue)
  - Primary (prominent blue)
  - Subtle (minimal styling)
  - Warning (orange)
  - Danger (red)

- **Modal Size** - Dialog window size
  - Small (400px)
  - Medium (600px) - default
  - Large (800px)
  - X-Large (90% of screen)

- **Auto-Open** - Automatically open modal when issue loads
  - Useful for important warnings
  - Can be annoying if overused

- **Show Once Per Issue** - Only auto-open once (with auto-open)
  - State saved in browser storage
  - Resets if issue is reopened

- **Modal Appearance** - Dialog visual style
  - Default (neutral)
  - Warning (yellow header)
  - Danger (red header)

- **Close Button Text** - Text for close button
  - Default: "Close"

**Example use cases:**
- Critical blockers warning (auto-open, danger appearance)
- Detailed dependency viewer (large size)
- Quick actions menu (small size, subtle button)

### Execute As User

Run the data query as a specific user instead of the current user:

- **Actor** - User account ID to impersonate
- Useful for consistent permissions
- Requires proper Atlassian impersonation permissions
- Leave empty to use current user (default)

**Use cases:**
- Service account for consistent access
- Read-only queries
- Public dashboards

**Security:** Only site admins can configure this setting.

## Preview and Testing

### Panel Preview

Test your configuration before saving:

1. Click **Preview** button
2. Enter a test issue key
3. See how the panel will look
4. Check field rendering
5. Verify template output

**Note:** Actual permissions and display conditions are applied in preview.

### JQL Preview

Test JQL queries with parameters:

1. Enter your JQL with template variables
2. Select a test issue
3. Click **Test JQL**
4. See the rendered query
5. View the result count
6. Check for errors

## Configuration Management

### Duplicate Configuration

Create a copy of an existing configuration:

1. Find the configuration in the list
2. Click the **...** menu
3. Select **Duplicate**
4. A copy is created with "(Copy)" suffix
5. Edit the copy as needed

### Export/Import

Export configurations for backup or migration:

1. Click **Export** button
2. Configuration is downloaded as JSON
3. To import, click **Import**
4. Select the JSON file
5. Configuration is created

**Use cases:**
- Backup important configurations
- Share configurations between sites
- Migrate from staging to production

### Delete Configuration

Remove a configuration:

1. Find the configuration in the list
2. Click the **...** menu
3. Select **Delete**
4. Confirm deletion

**Warning:** Deletion is permanent and cannot be undone.

## Best Practices

### Naming

- Use clear, descriptive names
- Include purpose or audience (e.g., "Dev Team Blockers")
- Be consistent across configurations
- Use prefixes for grouping (e.g., "Epic: ...", "Sprint: ...")

### Performance

- Limit max issues to reasonable numbers
- Use display JQL to filter early
- Select only needed fields
- Avoid complex templates in descriptions
- Consider pagination for large sets

### Templates

- Test templates with preview before saving
- Handle null/missing values gracefully
- Use conditions to avoid errors
- Keep templates readable with formatting
- Comment complex logic

### Organization

- Use weight to control panel order
- Group related panels together
- Name panels by priority or type
- Document complex configurations
- Use delegation for project-specific panels

### User Experience

- Don't overwhelm with too many panels
- Use modal windows for optional details
- Show names for clarity
- Include helpful descriptions
- Test with actual users

## Examples

### Example 1: Blockers Dashboard

**Configuration:**
- Name: "⛔ Blockers"
- Data Source: Linked Issues → "is blocked by"
- Fields: Key, Summary, Status, Assignee, Priority
- Module: Issue Panel
- Display JQL: `status != Done`
- Weight: -10 (show first)

### Example 2: Epic Progress

**Configuration:**
- Name: "Epic Progress"
- Data Source: JQL → `"Epic Link" = {{ key }}`
- Fields: Key, Summary, Status, Story Points, Assignee
- Description:
  ```
  Progress: {{ completedIssues }}/{{ totalIssues }} issues
  Remaining points: {{ remainingPoints }}
  ```
- Module: Issue Panel

### Example 3: Related Bugs

**Configuration:**
- Name: "Related Bugs"
- Data Source: JQL → `project = {{ projectId }} AND type = Bug AND status != Closed`
- Fields: Key, Summary, Priority, Status, Created
- Module: Issue Activity
- Max Issues: 5
- Filter: Project = Software, Type = Story, Epic

### Example 4: Warning Banner

**Configuration:**
- Name: "⚠️ Missing Information"
- Data Source: Empty
- Description:
  {% raw %}
  ```
  {% if not issue.fields.description %}
  Please add a description before moving to In Progress
  {% endif %}
  ```
  {% endraw %}
- Module: Issue Context
- Display JQL: `status = "To Do"`
- Show in Modal: Yes (auto-open, warning appearance)

## Next Steps

- [Learn about Dynamic Templates](/docs/user-docs/dynamic-templates/) - Add dynamic content
- [Explore Template Examples](/docs/user-docs/template-examples/) - Ready-to-use templates
- [Understand Modules](/docs/user-docs/modules/) - Choose the right display location
- [Set Up Delegation](/docs/user-docs/delegation/) - Allow project admins to configure

## Troubleshooting

### Panel Not Showing

Check:
- Module is enabled (Modules tab)
- Project/type filters match the issue
- Display JQL condition matches (if set)
- Configuration is saved
- Browser cache (try hard refresh)

### JQL Errors

Verify:
- JQL syntax is correct
- Template variables are valid
- Field names are correct (use quotes for multi-word fields)
- User has permission to run the query

### Template Errors

Common issues:
- Null reference (use `{% raw %}{% if field %}{% endraw %}` checks)
- Syntax errors (missing braces, wrong operators)
- Infinite loops (check loop conditions)
- Undefined variables (verify context)

### Performance Issues

Solutions:
- Reduce max issues limit
- Select fewer fields
- Use more specific JQL
- Add project/type filters
- Simplify templates

---

**Need more help?** Check out our [FAQ](/docs/user-docs/faq/) or [Contact Support](https://jibrok.atlassian.net/servicedesk/customer/portals).
