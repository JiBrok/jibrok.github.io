---
title: "Scripting API: UI Modifications"
key: jibrok-studio-jira
excerpt: UIM API - modify form fields on Jira issue create and transition screens
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - api
  - uim
  - forms
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.

Available in UIM scripts only. The `uim` object lets you modify form fields on Jira issue create and transition screens.

---

## Methods

| Method | Description |
|--------|-------------|
| `uim.setValue(fieldId, value)` | Set field value |
| `uim.setName(fieldId, name)` | Set field display name |
| `uim.setDescription(fieldId, desc)` | Set field description |
| `uim.setRequired(fieldId, bool)` | Set field as required or optional |
| `uim.setVisible(fieldId, bool)` | Show or hide a field |
| `uim.setReadOnly(fieldId, bool)` | Set field as read-only or editable |
| `uim.setOptionsVisibility(fieldId, options, isVisible)` | Show/hide specific select options |

---

## Convenience aliases

| Alias | Equivalent to |
|-------|---------------|
| `uim.setFieldName(fieldId, name)` | `uim.setName(fieldId, name)` |
| `uim.setFieldDescription(fieldId, desc)` | `uim.setDescription(fieldId, desc)` |
| `uim.setFieldValue(fieldId, value)` | `uim.setValue(fieldId, value)` |
| `uim.hideField(fieldId)` | `uim.setVisible(fieldId, false)` |
| `uim.showField(fieldId)` | `uim.setVisible(fieldId, true)` |

---

## Examples

```js
// Set a field name and hide another field
uim.setFieldName("summary", "Brief description")
uim.hideField("description")

// Make a field required and set its value
uim.setRequired("priority", true)
uim.setFieldValue("priority", "High")

// Hide specific options in a select field
uim.setOptionsVisibility("priority", ["Lowest", "Low"], false)
```

### Conditional logic

```js
// Hide fields based on issue type
let issueType = uimData.fieldValues?.issuetype?.value
if (issueType === "Bug") {
  uim.showField("environment")
  uim.setRequired("environment", true)
} else {
  uim.hideField("environment")
}
```

### Dynamic field updates

```js
// Respond to field changes (onChange callback)
if (uimData.changedFieldId === "priority") {
  if (uimData.changedValue === "Critical") {
    uim.setRequired("duedate", true)
    uim.setFieldDescription("duedate", "Required for Critical priority")
  }
}
```

---

## UIM data

UIM scripts receive a `uimData` object with information about the current form state:

- `uimData.callbackType` - `'onInit'` or `'onChange'`
- `uimData.viewType` - `'GIC'`, `'IssueView'`, `'IssueTransition'`, or `'JSMRequestCreate'`
- `uimData.fieldValues` - current field values (e.g., `uimData.fieldValues?.priority?.value`)
- `uimData.context` - view context (project key, etc.)
- `uimData.changedFieldId` - field ID that changed (for onChange callbacks)
- `uimData.changedValue` - new value of the changed field

---

## Next steps

- [UI Modifications](/docs/jibrok-studio-jira/ui-modifications) - Setting up UIM triggers
- [Triggers](/docs/jibrok-studio-jira/triggers) - All trigger types including UIM
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - API overview
