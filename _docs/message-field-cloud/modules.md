---
title: Display Modules
key: message-field-cloud
excerpt: Learn about all display locations including Jira and JSM Portal modules
category: configuration
tags:
  - doc
  - cloud
  - modules
  - jsm
  - display-locations
---

# Display Modules
{:.no_toc}

* TOC
{:toc}

Message Panel can display in multiple locations across Jira and Jira Service Management.

## Module Overview

| Module | Location | Supports Modal |
|--------|----------|----------------|
| **Issue Panel** | Right sidebar | Yes |
| **Issue Activity** | Activity feed tab | No |
| **Issue Context** | Context panel | No |
| **Issue Action** | Toolbar button | No |
| **JSM Portal Panel** | Request details page | No |
| **JSM Portal Footer** | Portal page footer | No |
| **JSM Portal Subheader** | Portal page subheader | No |

---

## Jira Modules

### Issue Panel

**Location**: Right sidebar on issue view

![Issue Panel Example](/uploads/message-field-cloud/configuration/example%20issue%20panel.png)

**Features**:
- Collapsible/expandable panels
- Supports modal windows
- Best for detailed information

**Use for**: Main data displays, linked issues tables, dashboards

---

### Issue Activity

**Location**: Tab in Activity section

![Issue Activity Example](/uploads/message-field-cloud/configuration/example%20issue%20activity.png)

**Features**:
- Appears alongside Comments, History tabs
- Inline display
- Good for activity context

**Use for**: Recent changes, timeline context

---

### Issue Context

**Location**: Right sidebar context panel

![Issue Context Example](/uploads/message-field-cloud/configuration/example%20issue%20context.png)

**Features**:
- Collapsible section
- Alongside Details, Automation panels
- Quick access

**Use for**: Reference data, supplementary details

---

### Issue Action

**Location**: Issue toolbar

![Issue Action Example](/uploads/message-field-cloud/configuration/example%20issue%20panel%20button.png)

**Features**:
- Custom action button
- Opens on click
- User-initiated

**Use for**: On-demand queries, interactive tools

---

## JSM Portal Modules

These modules display on the customer-facing Jira Service Management portal.

### Portal Request Detail Panel

**Location**: Request details page in customer portal

**Features**:
- Visible to customers viewing their requests
- Shows alongside request details
- Supports templates with request data

**Use for**:
- Customer instructions
- SLA information
- Related articles or links

---

### Portal Footer

**Location**: Bottom of portal pages

**Features**:
- Appears on all portal pages
- Global visibility
- Static or dynamic content

**Use for**:
- Contact information
- Legal notices
- Help links

---

### Portal Subheader

**Location**: Below portal header

**Features**:
- Prominent placement
- Visible before request details
- Good for announcements

**Use for**:
- Service announcements
- Maintenance notices
- Important updates

---

## Enabling Modules

### Global Settings

![Module Settings](/uploads/message-field-cloud/configuration/module%20settings.png)

1. Go to **Apps** → **Message Panel Settings**
2. Click the **Module Settings** tab
3. Toggle modules on/off
4. Click **Save Settings**

Disabled modules won't display anywhere, even with configurations targeting them.

### Per-Configuration

Each configuration specifies its display module:

1. Edit or create a configuration
2. Find **Display Module** dropdown
3. Select one module
4. Save

---

## Visibility Rules

A panel appears when **ALL** conditions are met:

1. Module is enabled globally
2. Configuration targets that module
3. Project filter matches (if specified)
4. Issue type filter matches (if specified)
5. Display JQL condition matches (if specified)
6. User field condition matches (if specified)
7. Request type matches (JSM only, if specified)

**Example**: Panel with:
- Module: Issue Panel
- Projects: "Marketing"
- Display JQL: `status = "In Progress"`

Shows in right sidebar **only** for Marketing issues with status "In Progress".

---

## Multiple Panels

Multiple configurations can target the same module:

- **Order**: By weight (lower first), then alphabetically
- **Collapsing**: Each panel collapses independently (Issue Panel only)

---

## Next Steps

- [Configuration Basics](configuration-basics) - Create panel configurations
- [Context Filters](context-filters) - Control when panels appear
- [Modal Windows](modal-windows) - Pop-up dialogs (Issue Panel only)
- [JSM Integration](jsm-integration) - Detailed JSM setup
