---
title: Custom Events
key: time-in-status-cloud-forge
excerpt: "Create custom events - named rules that fire when specific field values change, used as triggers for Stopwatch and Timer fields."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, custom-events, event-triggers, stopwatch, timer, configuration]
---

* TOC
{:toc}

---

## What are Custom Events?

Custom Events are user-defined rules that fire when a **specific field value changes** in a particular way. They extend the built-in event triggers by letting you match precise value transitions.

For example:
- "Priority changed **to** Highest"
- "Resolution changed **from** Fixed **to** Won't Fix"
- "Custom field 'Region' **set** for the first time"

Custom Events are created in the admin panel and then referenced in Stopwatch or Timer field settings as `CUSTOM_EVENT` triggers.

---

## Creating a Custom Event

1. Open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Custom Events** tab
2. Click **Create**
3. Fill in the configuration:

<!-- [Screenshot: custom-events-form] -->

| Field | Description |
|-------|-------------|
| **Name** | Unique name for the event (e.g., "Priority to Highest"). |
| **Description** | Optional description explaining when this event fires. |
| **Field** | The field to monitor. Can be a system field or a custom field. |
| **Action** | The type of change to detect (see Actions below). |
| **Value From** | The previous value (required for CHANGE_FROM and CHANGE_FROM_TO actions). |
| **Value To** | The new value (required for CHANGE_TO and CHANGE_FROM_TO actions). |

4. Click **Save**

<!-- [Screenshot: custom-events-list] -->

---

## Actions

| Action | Description | Requires |
|--------|-------------|----------|
| **CHANGE_TO** | Field value changed **to** a specific value | Value To |
| **CHANGE_FROM** | Field value changed **from** a specific value | Value From |
| **CHANGE_FROM_TO** | Field value changed **from** one value **to** another | Value From, Value To |
| **SET** | Field value set (was empty, now has a value) | Value To |
| **REMOVE** | Field value removed (had a value, now empty) | Value From |
| **CHANGE** | Field value changed (any change) | - |
| **FIRST_SET** | Field set for the first time ever on this issue | - |

---

## Supported fields

### System fields

- **Status** - issue status
- **Priority** - issue priority
- **Issue Type** - issue type
- **Resolution** - issue resolution
- **Assignee** - issue assignee
- **Reporter** - issue reporter

For system fields, the **Value From** and **Value To** dropdowns show the available values (status names, priority names, etc.).

### Custom fields

Any custom field that appears in the issue changelog can be used. For custom fields, you enter the value as a text string.

---

## Using Custom Events in Stopwatch/Timer

After creating a Custom Event, use it as a trigger in Stopwatch or Timer field settings:

1. Open a Stopwatch or Timer field setting in the admin panel
2. In the event slots (Start, Pause, Stop, or Restart), click **Add event**
3. Select **CUSTOM_EVENT** as the trigger type
4. Select your Custom Event from the dropdown
5. Save

The stopwatch/timer will now react when the custom event fires.

See [Event triggers reference](/docs/time-in-status-cloud-forge/event-triggers) for more details on how triggers work.

---

## Examples

### Example 1: Start stopwatch when priority changes to Highest

1. Create Custom Event:
   - Name: "Priority to Highest"
   - Field: Priority
   - Action: CHANGE_TO
   - Value To: Highest

2. In Stopwatch field settings, add to Start Events:
   - Trigger: CUSTOM_EVENT
   - Custom Event: "Priority to Highest"

### Example 2: Pause timer when resolution is set to "Won't Do"

1. Create Custom Event:
   - Name: "Resolution Won't Do"
   - Field: Resolution
   - Action: CHANGE_TO
   - Value To: Won't Do

2. In Timer field settings, add to Pause Events:
   - Trigger: CUSTOM_EVENT
   - Custom Event: "Resolution Won't Do"

### Example 3: Restart stopwatch when assignee changes

1. Create Custom Event:
   - Name: "Assignee changed"
   - Field: Assignee
   - Action: CHANGE

2. In Stopwatch field settings, add to Restart Events:
   - Trigger: CUSTOM_EVENT
   - Custom Event: "Assignee changed"

---

## Tips

- **Custom Events vs built-in triggers**: use built-in triggers for common scenarios (STATUS_TO, RESOLUTION_SET, etc.). Use Custom Events when you need to match specific values or transitions that built-in triggers cannot express.
- **Reusable**: one Custom Event can be used by multiple Stopwatch and Timer field settings.
- **Test carefully**: Custom Events match against the issue changelog. After creating, run a [recalculation](/docs/time-in-status-cloud-forge/recalculation) to verify that events fire correctly for existing issues.
