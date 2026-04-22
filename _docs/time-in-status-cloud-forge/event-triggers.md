---
title: Event triggers reference
key: time-in-status-cloud-forge
excerpt: "Complete reference of all event trigger types available for Stopwatch and Timer fields - status changes, assignments, field changes, and custom events."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, event-triggers, stopwatch, timer, configuration]
---

* TOC
{:toc}

---

## What are event triggers?

Event triggers are rules that control **when** Stopwatch and Timer fields change state. Each Stopwatch and Timer field setting has four event slots:

- **Start Events** - triggers that start (or resume) the stopwatch/timer
- **Pause Events** - triggers that pause it
- **Stop Events** - triggers that stop it
- **Restart Events** - triggers that reset and restart it

When an issue changes in Jira (status transition, field update, comment, etc.), the app checks the issue's changelog against the configured triggers. If a trigger matches, the corresponding action fires.

You can assign multiple triggers to each slot. Any matching trigger will fire the action.

---

## Trigger categories

### Status triggers

| Trigger | Description | Parameters |
|---------|-------------|------------|
| **STATUS_ANY** | Any status change | - |
| **STATUS_FROM** | Status changed **from** a specific status | `fromStatusId` |
| **STATUS_TO** | Status changed **to** a specific status | `toStatusId` |
| **STATUS_FROM_TO** | Status changed from one specific status to another | `fromStatusId`, `toStatusId` |

**Example**: Start a stopwatch when issue moves to "In Progress":
- Slot: Start Events
- Trigger: STATUS_TO, toStatusId = "In Progress"

### Status category triggers

| Trigger | Description | Parameters |
|---------|-------------|------------|
| **STATUS_CATEGORY_ANY** | Any status category change | - |
| **STATUS_CATEGORY_FROM** | Category changed **from** a specific category | `fromCategoryId` |
| **STATUS_CATEGORY_TO** | Category changed **to** a specific category | `toCategoryId` |
| **STATUS_CATEGORY_FROM_TO** | Category changed from one category to another | `fromCategoryId`, `toCategoryId` |

Status categories in Jira are: **To Do**, **In Progress**, **Done**.

**Example**: Stop a timer when issue reaches "Done" category:
- Slot: Stop Events
- Trigger: STATUS_CATEGORY_TO, toCategoryId = "Done"

### Assignee triggers

| Trigger | Description | Parameters |
|---------|-------------|------------|
| **FIRST_ASSIGNED** | Issue assigned for the first time (was never assigned before) | - |
| **UNASSIGNED** | Issue becomes unassigned (assignee removed) | - |
| **ASSIGNED** | Issue gets assigned (to anyone) | - |
| **ASSIGNEE_CHANGED** | Assignee field changed (from one person to another) | - |

**Example**: Start a stopwatch when issue is first assigned:
- Slot: Start Events
- Trigger: FIRST_ASSIGNED

### Field change triggers

| Trigger | Description | Parameters |
|---------|-------------|------------|
| **LABELS_CHANGED** | Labels field changed | - |
| **PRIORITY_CHANGED** | Priority field changed | - |
| **UP_PRIORITY** | Priority increased (moved to higher priority) | - |
| **DOWN_PRIORITY** | Priority decreased (moved to lower priority) | - |
| **COMPONENTS_CHANGED** | Components field changed | - |
| **FIRST_SET_COMPONENTS** | Components set for the first time | - |
| **RESOLUTION_SET** | Resolution set (issue resolved) | - |
| **RESOLUTION_REMOVED** | Resolution removed (issue reopened) | - |
| **FIRST_SET_RESOLUTION** | Resolution set for the first time | - |

**Example**: Pause a stopwatch when resolution is set:
- Slot: Pause Events
- Trigger: RESOLUTION_SET

### Custom field triggers

| Trigger | Description | Parameters |
|---------|-------------|------------|
| **CUSTOM_FIELD_CHANGED** | A custom field value changed | `fieldId` |
| **CUSTOM_FIELD_SET** | A custom field set to a value (was empty) | `fieldId` |
| **CUSTOM_FIELD_REMOVED** | A custom field value removed (set to empty) | `fieldId` |
| **FIRST_SET_CUSTOM_FIELD** | A custom field set for the first time ever | `fieldId` |

You select which custom field to monitor via the `fieldId` parameter.

**Example**: Start a timer when "Story Points" field is set:
- Slot: Start Events
- Trigger: CUSTOM_FIELD_SET, fieldId = "customfield_10001"

### Issue event triggers

| Trigger | Description | Parameters |
|---------|-------------|------------|
| **ISSUE_CREATED** | Issue created | - |
| **ISSUE_COMMENTED** | Comment added to the issue | - |
| **FIRST_COMMENT** | First comment added to the issue | - |
| **CREATE_PUBLIC_COMMENT** | Public (non-internal) comment created | - |
| **CREATE_FIRST_PUBLIC_COMMENT** | First public comment created | - |

**Example**: Start a stopwatch when a public comment is added:
- Slot: Start Events
- Trigger: CREATE_PUBLIC_COMMENT

### Structural change triggers

| Trigger | Description | Parameters |
|---------|-------------|------------|
| **CHANGE_PROJECT** | Issue moved to a different project | - |
| **CHANGE_ISSUE_TYPE** | Issue type changed | - |

### Custom event triggers

| Trigger | Description | Parameters |
|---------|-------------|------------|
| **CUSTOM_EVENT** | A custom event fires | `customEventId` |

Custom events are user-defined rules that match specific field value changes. Create them in the [Custom Events tab](/docs/time-in-status-cloud-forge/custom-events) of the admin panel, then reference them here.

**Example**: Start a timer when "Priority changed to Highest":
1. Create a custom event named "Priority to Highest" (field: Priority, action: CHANGE_TO, value: Highest)
2. Add trigger: CUSTOM_EVENT, customEventId = (the custom event's ID)

---

## Using the Event Trigger Builder

In the admin panel, when editing a Stopwatch or Timer field setting (or web panel), you configure event triggers using the **Event Trigger Builder**.

For each event slot (Start, Pause, Stop, Restart):

1. Click **Add event** to add a new trigger
2. Select the trigger type from the dropdown
3. Fill in the required parameters (status, field, custom event, etc.)
4. Add more triggers if needed - any matching trigger will fire

<!-- [Screenshot: sw-field-settings-events] -->

---

## Restart behavior

The **Restart** event slot resets the stopwatch/timer and starts it again.

By default, restart only works from the **Paused** state. If you enable **Allow restart from any state** (`doRestartFromAnyState`), restart can also trigger from the **Stopped** state (for Stopwatch) or **Completed/Failed** state (for Timer).

---

## Tips

- **Order matters**: if multiple event slots match the same changelog entry, the app processes them in order: Stop > Restart > Pause > Start.
- **Combine triggers**: use multiple triggers in the same slot for flexible rules. For example, add both STATUS_TO "Done" and RESOLUTION_SET to the Stop slot to stop on either event.
- **Use custom events** for complex conditions that built-in triggers cannot express, such as "Priority changed from Low to Critical" or "Custom field set to a specific value."
- **Test with existing issues**: after configuring triggers, run a [recalculation](/docs/time-in-status-cloud-forge/recalculation) to apply the rules to existing issues based on their changelog history.
