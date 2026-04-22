---
title: Time Between Dates field
key: time-in-status-cloud-forge
excerpt: "Create and configure Time Between Dates fields - calculate elapsed working time between any two date fields on a Jira issue."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, time-between-dates, field-creation, custom-fields, date-fields]
---

* TOC
{:toc}

---

## What is a Time Between Dates field?

A Time Between Dates field calculates the elapsed working time between two date or datetime fields on an issue. Unlike Stopwatch and Timer fields (which are event-driven), this field is purely based on date field values.

Common use cases:
- **Created to Resolved** - how long from issue creation to resolution
- **Due Date to Resolved** - whether issues are resolved before their due date
- **Committed date vs Delivered date** - delivery accuracy
- **Any two custom date fields** - flexible SLA and metric tracking

---

## Creating the field

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Click **Create custom field**
3. Select **Time Between Dates** from the field type list
4. Enter a name (e.g., "Resolution Time", "Delivery Accuracy")
5. Choose the field context
6. Click **Create**

---

## Field setting reference

Create and manage field settings in the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Time Between Dates** tab.

### Date fields

| Setting | Description |
|---------|-------------|
| **Start Field** | The date/datetime field to start calculation from. Can be a system field (e.g., Created) or any custom date field. |
| **End Field** | The date/datetime field to end calculation at. Special option: `currentDateTime` uses the current time as the end date (field recalculates continuously). |
| **Use Absolute Value** | When **on**: always shows positive time (swaps start/end if start > end). When **off**: can show negative time if end date is before start date. |

### General

| Setting | Description |
|---------|-------------|
| **Name** | Unique name for this setting (max 150 characters). |
| **Active** | Toggle on/off. |

### Calendar

| Setting | Description |
|---------|-------------|
| **Calendar** | Work calendar for time calculation. Default is 24x7. |
| **Calendar Field** | Optional [Calendar Select](/docs/time-in-status-cloud-forge/calendar-select-field) field for per-issue override. |

### Display

| Setting | Description |
|---------|-------------|
| **Time Format** | How time is displayed. See [Time formats](/docs/time-in-status-cloud-forge/time-formats). |
| **Display Mode** | Visual format (see table below). |
| **Use Rounding** | Round time values for calculation. |
| **Use Rounding for Display** | Round time values for display only. |

#### Display modes

| Mode | Description |
|------|-------------|
| **TIME_SPENT** | Elapsed time (e.g., "2d 4h") |
| **TIME_SPENT_ICON** | Elapsed time with icon |
| **ICON_TIME_SPENT** | Icon with elapsed time |
| **LEFT_TIME** | Time remaining until goal |
| **LEFT_TIME_ICON** | Time remaining with icon |
| **ICON_LEFT_TIME** | Icon with time remaining |
| **GOAL_TIME** | Goal time value |
| **TIME_SPENT_AND_GOAL_TIME** | Elapsed / Goal (e.g., "2d / 5d") |
| **TIME_SPENT_AND_GOAL_TIME_ICON** | Same with icon |
| **ICON_TIME_SPENT_AND_GOAL_TIME** | Icon with elapsed / goal |

### Restrictions

| Setting | Description |
|---------|-------------|
| **Issue Date Limit** | Only process issues created or updated after this date. |
| **JQL Filter** | Additional JQL filter (max 4000 characters, no ORDER BY). |

---

## Binding to a field context

After creating the field and field setting:

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Find your Time Between Dates field > **Contexts and default value**
3. Click on the context and select the field setting
4. Run [recalculation](/docs/time-in-status-cloud-forge/recalculation) for existing issues

See [Field context configuration](/docs/time-in-status-cloud-forge/field-context-config) for details.

---

## Tips

- **currentDateTime as end field**: use this to create a continuously updating field that shows "time since Created" or "time since a custom date."
- **Absolute value**: enable this when the order of dates is uncertain (e.g., comparing two custom dates where either could be first).
- **Calendar matters**: without a calendar, all 24 hours count. With a business-hours calendar, weekends and non-working time are excluded.
