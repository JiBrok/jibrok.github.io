---
title: Calendar Select field
key: time-in-status-cloud-forge
excerpt: "Create and configure Calendar Select fields - let users pick a work calendar per issue to override default time calculations."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, calendar-select, custom-fields, work-calendar, configuration]
---

* TOC
{:toc}

---

## What is a Calendar Select field?

A Calendar Select field is an **editable** custom field that lets users choose a work calendar for a specific issue. When selected, this calendar overrides the default calendar configured in field settings for that issue.

This is useful when different issues need different work schedules. For example:
- An international support team where issues from different regions follow different business hours
- Projects where some issues follow a 24x7 schedule and others follow business hours
- VIP customers with extended support hours

---

## Creating the field

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Click **Create custom field**
3. Select **Calendar Select** from the field type list
4. Enter a name (e.g., "Work Calendar", "SLA Calendar")
5. Choose the field context
6. Click **Create**

---

## Context configuration

Each field context for Calendar Select has its own configuration:

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Find your Calendar Select field > **Contexts and default value**
3. Click on the context name
4. Configure:

| Setting | Description |
|---------|-------------|
| **Available Calendars** | Which calendars users can choose from. Select specific calendars or leave empty for all calendars. |
| **Default Calendar** | The calendar pre-selected for new issues. Optional. |

<!-- [Screenshot: cal-field-context-config] -->

---

## How it works with other fields

Calendar Select integrates with Time in Status, Stopwatch, Timer, and Time Between Dates fields through the **Calendar Field** setting.

To connect them:

1. Open the field setting for your TIS/Stopwatch/Timer/TBD field
2. Set **Calendar Field** to your Calendar Select field
3. Save

Now, when an issue has a Calendar Select value, that calendar will be used instead of the field setting's default calendar for time calculations on that issue.

### Calendar priority

When calculating time, the app checks calendars in this order (highest priority first):

1. **Calendar Overrides** (JQL-based, Stopwatch/Timer only) - first matching JQL
2. **Calendar Select field** value on the issue
3. **Default Calendar** from the field setting

---

## Using the field on issues

Users with edit permissions can set the calendar on any issue where the field is available:

1. Open the issue
2. Find the Calendar Select field
3. Click to open the dropdown
4. Select a calendar from the list

<!-- [Screenshot: cal-field-on-issue] -->

---

## JQL search

Calendar Select fields have two searchable properties:

| Property | Type | Description |
|----------|------|-------------|
| **CalendarId** | text | The internal ID of the selected calendar |
| **CalendarName** | text | The display name of the selected calendar |

### Examples

```sql
"Work Calendar[CalendarName]" = "Business Hours"
```

```sql
"Work Calendar[CalendarName]" = "24x7 Support"
```

---

## Tips

- **Not all issues need a value**: Calendar Select is optional. Issues without a value simply use the default calendar from the field setting.
- **Rename calendars carefully**: if you rename a calendar, the CalendarName search property updates on the next recalculation.
- **One field, many uses**: the same Calendar Select field can be referenced by multiple TIS/Stopwatch/Timer/TBD field settings.
