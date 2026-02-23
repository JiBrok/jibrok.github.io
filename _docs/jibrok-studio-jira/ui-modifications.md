---
title: UI Modifications
key: jibrok-studio-jira
excerpt: Dynamically customize issue create and transition forms using scripts
category: extensions
tags:
  - doc
  - cloud
  - ui-modifications
  - uim
  - forms
---

* TOC
{:toc}

## Overview

UI Modifications (UIM) let you dynamically customize Jira issue create and transition forms using scripts. React to form events in real-time to show/hide fields, set values, change requirements, and more.

---

## Capabilities

| Method | Description |
|--------|-------------|
| `uim.setValue(fieldId, value)` | Set a field's value programmatically |
| `uim.setVisible(fieldId, boolean)` | Show or hide a field |
| `uim.setRequired(fieldId, boolean)` | Set a field as required or optional |
| `uim.setReadOnly(fieldId, boolean)` | Set a field as read-only |
| `uim.setName(fieldId, name)` | Change a field's display name |
| `uim.setDescription(fieldId, text)` | Set a field's description text |
| `uim.setOptionsVisibility(fieldId, options, boolean)` | Show or hide specific options in a select field |

### Convenience Aliases

| Alias | Equivalent to |
|-------|---------------|
| `uim.setFieldName(fieldId, name)` | `uim.setName(fieldId, name)` |
| `uim.setFieldDescription(fieldId, desc)` | `uim.setDescription(fieldId, desc)` |
| `uim.setFieldValue(fieldId, value)` | `uim.setValue(fieldId, value)` |
| `uim.hideField(fieldId)` | `uim.setVisible(fieldId, false)` |
| `uim.showField(fieldId)` | `uim.setVisible(fieldId, true)` |

---

## Trigger Configuration

UIM is configured as a trigger type on scripts. Add a **UIM trigger** in the script's Config tab:

| Setting | Description |
|---------|-------------|
| **Projects** | Which Jira projects |
| **Issue Types** | Which issue types within those projects |
| **JSM Service Desks** | For service desk request forms |
| **Request Types** | For specific request types |
| **Field IDs** | Fields to monitor for onChange events |
| **Callbacks** | `onInit` (form opens), `onChange` (field changes), or both |

### Contexts

UIM scripts apply to:

- **Create screens** — issue creation forms
- **Edit screens** — issue edit forms
- **Transition screens** — workflow transition dialogs
- **JSM portal** — service desk request forms (per project/request type)

---

## Callback Types

### onInit

Fires when the form opens. Use this to set initial field states:

```js
if (uimData.callbackType === 'onInit') {
  uim.setName("summary", "Brief Description")
  uim.setVisible("description", false)
  uim.setRequired("priority", true)
}
```

### onChange

Fires when a monitored field value changes. Use this to react dynamically:

```js
if (uimData.changedFieldId === 'priority') {
  let priority = uimData.fieldValues?.priority?.value
  if (priority === 'Highest' || priority === 'High') {
    uim.setVisible('duedate', true)
    uim.setRequired('duedate', true)
    uim.setDescription('duedate', 'Due date is required for high priority issues')
  } else {
    uim.setRequired('duedate', false)
    uim.setDescription('duedate', '')
  }
}
```

---

## Examples

### Conditional Required Fields

```js
if (uimData.callbackType === 'onInit' || uimData.changedFieldId === 'priority') {
  let priority = uimData.fieldValues?.priority?.value
  if (priority === 'Highest' || priority === 'High') {
    uim.setRequired('duedate', true)
  } else {
    uim.setRequired('duedate', false)
  }
}
```

### Show/Hide Fields by Issue Type

```js
if (uimData.callbackType === 'onInit' || uimData.changedFieldId === 'issuetype') {
  let type = uimData.fieldValues?.issuetype?.value
  if (type === 'Bug') {
    uim.setVisible('environment', true)
    uim.setVisible('customfield_10100', true)  // Steps to reproduce
  } else {
    uim.setVisible('environment', false)
    uim.setVisible('customfield_10100', false)
  }
}
```

### Auto-Fill Fields on Create

```js
if (uimData.callbackType === 'onInit' && uimData.viewType === 'GIC') {
  let user = await Users.current()
  uim.setValue('reporter', { accountId: user.accountId })

  // Set default due date to 2 weeks from now
  let due = DateUtils.addDays(new Date(), 14)
  uim.setValue('duedate', DateUtils.format(due, 'YYYY-MM-DD'))
}
```

---

## Demo Mode

Test UIM scripts safely using Demo Mode:

1. Go to **Admin > UIM Management**
2. Click **Register Demo**
3. UIM actions are logged but have no visual effect
4. Review behavior before deploying to real forms

---

## Admin Management

Administrators can manage UIM registrations in the Admin tab:

- View all registered UIMs (Jira and JSM separately)
- Delete specific UIMs by context
- Register a demo UIM for testing
- Bulk delete all UIMs

---

## Important Notes

- UIM scripts always run as **current user**
- UIM is registered per project/issue type combination
- Multiple UIM scripts on the same form may conflict
- Keep UIM scripts fast and simple for best performance

---

## Next Steps

- [Triggers](/docs/jibrok-studio-jira/triggers) — UIM trigger configuration details
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) — Language and API reference
- [Administration](/docs/jibrok-studio-jira/admin-settings) — UIM registration management
