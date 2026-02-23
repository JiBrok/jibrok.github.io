---
title: Custom Fields
key: message-field-cloud
excerpt: Use Message Field as a native Jira custom field
category: configuration
tags:
  - doc
  - cloud
  - custom-field
  - modules
---

* TOC
{:toc}

## What is the Custom Field Module?

The Custom Field module allows Message Field to function as a **native Jira custom field** rather than a display panel. Instead of appearing in fixed locations (sidebar, activity feed, etc.), the message is embedded directly in a custom field — visible on issue create, edit, transition, and view screens.

This is ideal for delivering contextual guidance, warnings, or dynamic information exactly where users interact with issue data.

### How It Differs from Panel Modules

| | Panel Modules | Custom Field Module |
|--|---------------|---------------------|
| **Location** | Fixed positions (sidebar, activity, context) | Custom field area on issue screens |
| **Visibility** | Issue view only | Create, edit, transition, and view screens |
| **Configuration** | Global per project/issue type | Per field context (project + issue type combination) |
| **Setup** | Enable module → create config | Create Jira custom field → add to screens → configure per context |
| **Modal support** | Yes (Issue Panel) | No |

---

## Setup Guide

### Step 1: Enable the Custom Field Module

1. Go to **Apps** → **Message Field Settings**
2. Click the **Module Settings** tab
3. Enable **Message Field (Custom Field)**
4. Click **Save Settings**

![Module Settings — Custom Field enabled](/uploads/message-field-cloud/configuration/module-settings-custom-field.png)

### Step 2: Create a Custom Field in Jira

1. Go to **Jira Administration** → **Issues** → **Custom Fields**
2. Click **Create custom field**
3. Select the **Message Field** field type
4. Enter a name and description for the field
5. Click **Create**

> **Tip:** You can create multiple Message Field custom fields for different purposes (e.g., *Form Instructions*, *Compliance Notice*, *Priority Guidance*).

### Step 3: Add the Field to Screens

Add your new custom field to the Jira screens where you want it to appear:

1. Go to **Jira Administration** → **Issues** → **Screens**
2. Select the relevant screen(s):
   - **Create Screen** — field appears when creating issues
   - **Edit Screen** — field appears when editing issues
   - **View Screen** — field appears on issue view
   - **Transition Screen** — field appears during workflow transitions
3. Add your Message Field custom field to each screen

### Step 4: Configure the Field

1. Go to **Apps** → **Message Field Settings**
2. Select the **Custom Fields** tab
3. Select your custom field from the dropdown

![Custom field selector dropdown](/uploads/message-field-cloud/configuration/custom-field-selector.png)

{:start="4"}
4. Choose a **field context** (project + issue type combination)
5. Configure the message content, data source, and display options
6. Click **Save**

![Custom field context configuration](/uploads/message-field-cloud/configuration/custom-field-context-config.png)

---

## Field Contexts

Jira custom fields use **contexts** to define which projects and issue types the field applies to. Message Field leverages these contexts to provide **different configurations per context**.

This means you can show:
- One message for Bug issues in Project A
- A different message for Story issues in Project A
- Yet another message for all issues in Project B

Each context has its own independent configuration — data source, message template, display conditions, and formatting.

### How Contexts Work

1. When Jira displays the custom field, it determines which **field context** applies based on the current project and issue type
2. Message Field looks up the configuration for that specific context
3. The configured message is rendered and displayed in the field

> **Note:** If no configuration exists for a context, the field displays as empty.

---

## Display Modes

### Issue View (Read-Only)

On the issue view screen, the custom field displays the rendered message as a read-only field value. It appears alongside other custom fields in the issue detail section.

![Custom field on issue view](/uploads/message-field-cloud/configuration/custom-field-issue-view.png)

### Create and Edit Screens

On create and edit screens, the custom field displays in the form alongside other fields. This is ideal for:
- Showing form-filling instructions
- Displaying warnings or compliance notices
- Providing context-sensitive guidance based on the selected project or issue type

### Transition Screens

When configured on a transition screen, the field appears during workflow transitions. Use this to:
- Show transition-specific instructions
- Display warnings before status changes
- Provide checklists or reminders

---

## Configuration Options

Custom field configurations support the same options as panel configurations:

| Option | Description |
|--------|-------------|
| **Data Source** | Empty (message only), Linked Issues, or JQL Query |
| **Message Template** | Dynamic content using template syntax |
| **Message Format** | Plain text, HTML, Markdown, or ADF |
| **Display JQL** | Conditional display based on JQL (issue view only) |
| **User Fields Filter** | Show only for users in specific fields (issue view only) |

> **Note:** Display JQL and User Fields conditions are only evaluated on issue view screens, not on create/transition screens where the issue does not yet exist.

---

## UIM for Create Screens

Message Field uses **UI Modifications (UIM)** to display custom field content on create screens. This is managed automatically, but there are two configuration options that control this behavior:

| Option | Description |
|--------|-------------|
| **UIM for Jira** (`uimForJira`) | Enables the custom field on standard Jira issue create forms |
| **UIM for JSM** (`uimForJsm`) | Enables the custom field on JSM portal request creation forms |

When enabled, the custom field content appears in the create form alongside other fields, providing guidance and context before the issue is created.

> **Note:** UIM registrations are managed through the [Modules](modules) page. If the custom field doesn't appear on create screens, check the UIM status and use **Reregister All** if needed.

---

## Automatic Cleanup

Message Field automatically manages custom field configurations through an **hourly scheduler** that detects changes to fields and contexts.

### What the Scheduler Detects

| Change | Action |
|--------|--------|
| Custom field **deleted** in Jira | Configuration is **disabled** |
| Field context **removed** | Associated configuration is **disabled** |
| Field context **re-added** | Configuration can be manually re-enabled |

### How It Works

1. The scheduler runs every hour
2. It checks all custom field configurations against Jira's current field and context data
3. Orphaned configurations (where the field or context no longer exists) are marked as **disabled**
4. Disabled configurations remain in the list and can be cleaned up manually or re-enabled if the field/context is restored

This prevents stale configurations from accumulating and ensures the system stays in sync with your Jira custom field setup.

---

## Limitations

- **Display conditions limited on create screens** — JQL and User Fields conditions only work on issue view, not on create/transition screens
- **One configuration per context** — Each field context has a single configuration (unlike panel modules where multiple configs can target the same module)
- **Screen configuration required** — The field must be added to Jira screens manually; enabling the module alone is not sufficient

---

## Next Steps

- [Modules](modules) — Overview of all display modules
- [Configuration Basics](configuration-basics) — Create and manage configurations
- [Templates](templates) — Dynamic content with template syntax
- [FAQ](faq) — Custom field troubleshooting
- [Getting Started](getting-started) — Quick start guide
