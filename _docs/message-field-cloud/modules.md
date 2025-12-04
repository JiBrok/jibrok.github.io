---
title: Display Modules
key: message-field-cloud
excerpt: "Understand different display locations for Message Panel: Issue Panel, Activity, Context, and Action modules."
category: configuration
tags: [doc, cloud, modules, display-locations, forge-modules]
---

{:.no_toc}
* TOC
{:toc}

## Available Modules

Message Panel uses Atlassian Forge modules to display panels in different locations on Jira issue screens.

### Issue Panel

**Location**: Right sidebar on issue view screen

**Characteristics**:
- Main display location
- Collapsible/expandable panels
- Supports modal windows
- Best for detailed information

**When to use**:
- Main data displays
- Linked issues tables
- Detailed dashboards

### Issue Activity

**Location**: Activity feed timeline

**Characteristics**:
- Appears in activity/comments section
- Inline display only
- Mixed with comments and history

**When to use**:
- Recent changes summary
- Activity-related info
- Timeline context

### Issue Context

**Location**: Context menu (more actions)

**Characteristics**:
- Appears in "..." menu
- Compact quick view
- Fast access

**When to use**:
- Optional information
- Quick reference data
- Supplementary details

### Issue Action

**Location**: Issue actions menu

**Characteristics**:
- Adds custom action button
- Opens on-click
- User-initiated

**When to use**:
- User-triggered displays
- On-demand queries
- Interactive tools

## Enabling Modules

### Global Module Settings

![Module Settings](/uploads/message-field-cloud/configuration/module%20settings.png)

1. Go to **Apps** → **Message Panel Settings**
2. Click the **Module Settings** tab
3. Toggle modules on/off:
   - **Issue Panel** - Displays messages as a collapsible panel on the issue view page
   - **Issue Activity** - Shows messages in the activity stream section of the issue
   - **Issue Context Panel** - Displays messages in the context panel on the right side of the issue view
   - **Issue Action** - Adds an action button to the issue toolbar for viewing messages
4. Click **Save Settings**

**Note**: Disabled modules won't appear anywhere, even if configurations target them. Configure which modules are enabled for displaying message panels in your Jira instance. These settings control where and how the panels appear in the issue view.

### Per-Configuration Module Selection

Each configuration specifies which module to use:

1. Edit or create a configuration
2. Find **Display Module** setting
3. Select one module from dropdown
4. Save configuration

## Module Behavior

### Visibility Rules - Where and When Panels Appear

Understanding panel visibility requires knowing TWO key concepts:

**WHERE** = Display Module (Issue Panel, Activity, Context, or Action)
**WHEN** = Context Filters (Projects, Issue Types, JQL conditions)

A panel appears when ALL of these conditions are met:

1. **Module is enabled globally** - The module type must be turned on in Module Settings
2. **Configuration targets that module** - The panel config must select that specific module
3. **Project filter matches** - Issue must be in selected projects (if any specified)
4. **Issue type filter matches** - Issue must have selected type (if any specified)
5. **Display JQL matches** - Issue must match JQL condition (if any specified)
6. **User field condition matches** - Current user must be in specified fields (if any specified)

**Example**: You have a panel configured with:
- Display Module: Issue Panel
- Projects: "Marketing"
- Display JQL: `status = "In Progress"`

This panel will appear in the **right sidebar** (Issue Panel location) ONLY when viewing issues from the "Marketing" project that have status "In Progress".

### Multiple Panels

Multiple configurations can target the same module:

- **Ordering**: By weight (lower first), then alphabetically
- **Collapsible**: Each panel can be collapsed independently (Issue Panel only)

## Module-Specific Features

### Issue Panel - Modal Windows

Display panels in modal dialogs:

**Options**:
- **Show in Modal** - Enable modal window
- **Modal Button Text** - Custom button label
- **Button Appearance** - Visual style
- **Modal Size** - Small/Medium/Large/X-Large
- **Auto-Open** - Open automatically on issue load
- **Show Once Per Issue** - Only auto-open once

**Example use case**: Critical blockers warning with auto-open and danger appearance.

## Next Steps

- [Configuration Guide](/docs/message-field-cloud/configuration/) - Set up panels
- [Dynamic Templates](/docs/message-field-cloud/dynamic-templates/) - Add dynamic content
- [Template Examples](/docs/message-field-cloud/template-examples/) - Ready-to-use examples
