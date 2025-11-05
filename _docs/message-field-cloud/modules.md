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

1. Go to **Apps** → **Message Panel Settings**
2. Click the **Modules** tab
3. Toggle modules on/off
4. Click **Save**

**Note**: Disabled modules won't appear anywhere, even if configurations target them.

### Per-Configuration Module Selection

Each configuration specifies which module to use:

1. Edit or create a configuration
2. Find **Display Module** setting
3. Select one module from dropdown
4. Save configuration

## Module Behavior

### Visibility Rules

A panel appears when ALL conditions are met:

1. Module is enabled globally
2. Configuration targets that module
3. Project filter matches (if set)
4. Issue type filter matches (if set)
5. Display JQL matches (if set)

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
