---
title: Modal Windows
key: message-field-cloud
excerpt: Display panels in pop-up dialogs with auto-open and styling options
category: advanced
tags:
  - doc
  - cloud
  - modal
  - popup
  - advanced
---

* TOC
{:toc}

Display your panel content in a pop-up dialog instead of inline. Available for **Issue Panel** module only.

## Overview

Modal windows are useful for:
- Important warnings that need attention
- Detailed information without cluttering the issue view
- Blocking notifications that require acknowledgment
- Critical instructions for specific issues

---

## Enabling Modal Mode

1. Edit your panel configuration
2. Go to **Other Settings** tab
3. Enable **Show in modal window**
4. Configure modal options
5. Save

![Other Settings Tab](/uploads/message-field-cloud/configuration/panel%20settings%20other.png)

---

## Modal Options

### Show in Modal Window

Toggle to enable modal display. When enabled:
- A button appears in the Issue Panel location
- Clicking the button opens the modal dialog
- Panel content displays inside the modal

### Modal Button Text

Customize the button label that opens the modal.

- **Default**: "Show Information"
- **Max length**: 100 characters

**Examples:**
- "View Blockers"
- "Important Notice"
- "See Related Issues"

### Button Appearance

Visual style of the open button:

| Style | Use Case |
|-------|----------|
| **Default** | Standard button |
| **Primary** | Main action (blue) |
| **Subtle** | Less prominent |
| **Warning** | Caution (yellow) |
| **Danger** | Critical (red) |

### Modal Size

Control the dialog size:

| Size | Use Case |
|------|----------|
| **Small** | Simple messages |
| **Medium** | Standard content |
| **Large** | Tables, detailed info |
| **X-Large** | Complex dashboards |

### Modal Appearance (Color)

Set the modal header color for emphasis:

| Appearance | Color | Use Case |
|------------|-------|----------|
| **None** | Default | Standard information |
| **Warning** | Yellow/Orange | Cautions, reminders |
| **Danger** | Red | Critical alerts, blockers |

### Close Button Text

Customize the button that closes the modal.

- **Default**: "Close"

**Examples:**
- "Got it"
- "Acknowledge"
- "OK"

---

## Auto-Open Options

### Auto-Open Modal

Automatically open the modal when the issue loads.

**Use cases:**
- Critical warnings that must be seen
- Mandatory instructions
- Blocking information

### Show Once Per Issue

When combined with Auto-Open:
- Modal opens automatically only **once per issue** during the session
- After closing, it won't auto-open again for that issue
- User can still click the button to reopen

This prevents annoying repeated popups while ensuring users see important information.

---

## Configuration Examples

### Critical Blocker Warning

**Settings:**
- Data Source: Linked Issues → "is blocked by"
- Display JQL: `status != Done`
- **Modal enabled**: Yes
- **Button Text**: "View Blockers"
- **Button Appearance**: Danger
- **Modal Size**: Medium
- **Modal Appearance**: Danger
- **Auto-Open**: Yes
- **Show Once Per Issue**: Yes

**Result:** Red modal automatically opens showing blocking issues. Opens once per issue, users can acknowledge and continue working.

### Important Instructions

**Settings:**
- Data Source: Empty (Message only)
- Message: Instructions text
- Display JQL: `type = "Deployment"`
- **Modal enabled**: Yes
- **Button Text**: "Deployment Checklist"
- **Button Appearance**: Warning
- **Modal Size**: Large
- **Auto-Open**: No

**Result:** Yellow button appears on deployment issues. Users click to view checklist.

### Release Notes

**Settings:**
- Data Source: JQL → `{% raw %}"Epic Link" = {{ issue.key }}{% endraw %}`
- **Modal enabled**: Yes
- **Button Text**: "View Release Items"
- **Button Appearance**: Primary
- **Modal Size**: X-Large
- **Auto-Open**: No

**Result:** Blue button on epics opens large modal with all stories/tasks in the release.

### SLA Breach Alert

**Settings:**
- Data Source: Empty
- Message: SLA breach warning
- Display JQL: `priority = Highest AND created < -4h AND status != Done`
- **Modal enabled**: Yes
- **Button Text**: "SLA Alert"
- **Button Appearance**: Danger
- **Modal Appearance**: Danger
- **Modal Size**: Small
- **Auto-Open**: Yes
- **Show Once Per Issue**: Yes
- **Close Button Text**: "Acknowledge"

**Result:** Small red modal auto-opens on issues breaching SLA. User must acknowledge.

---

## Best Practices

### When to Use Modals

**Good use cases:**
- Critical blockers that need immediate attention
- Mandatory acknowledgments
- Detailed information that would clutter the issue view
- Time-sensitive warnings

**Avoid for:**
- General information (use inline panels)
- Frequently updated content
- Content users need to reference while working

### Auto-Open Carefully

- Use sparingly to avoid annoying users
- Always enable "Show Once Per Issue" with auto-open
- Reserve for truly critical information
- Combine with specific Display JQL filters

---

## Troubleshooting

### Modal Not Opening

1. Check that **Issue Panel** module is enabled globally
2. Verify the panel's context filters match the issue
3. Ensure "Show in modal window" is enabled

### Auto-Open Not Working

1. Modal only auto-opens on issue load
2. Check "Show Once Per Issue" - may have already shown
3. Clear browser cache to reset "shown" state
4. Verify Display JQL condition matches the issue

### Modal Appears on Wrong Issues

Review your context filters:
- Project filter
- Issue type filter
- Display JQL condition

---

## Next Steps

- [Context Filters](context-filters) - Control when modals appear
- [Templates](templates) - Dynamic modal content
- [Modules](modules) - Other display options
