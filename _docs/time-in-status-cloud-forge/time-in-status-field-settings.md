---
title: Time in Status - Field setting reference
key: time-in-status-cloud-forge
excerpt: "Every option on a Time in Status (Forge) field setting - status mode, calendar, time format, display mode, rounding, JQL filter, and more."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, field-creation, status-tracking, business-calendar, configuration]
---

A **field setting** is the collection of rules that determine how a Time in Status field calculates its value. You can create, edit, and delete settings from the admin panel's **Time in Status** tab, or directly from a field's context configuration panel in Jira.

One setting can be bound to multiple contexts. See [Create a Time in Status field](/docs/time-in-status-cloud-forge/time-in-status-field-create) for the binding workflow.

* TOC
{:toc}

---

## Identification

### Name

Free text identifier used to find the setting when binding it to field contexts. Make names descriptive - for example `Bug resolving time (all projects)` rather than `setting 1`.

### Active

Master toggle. When **Active** is off, the setting keeps its configuration but does not calculate new data. Turn it off during maintenance or when retiring a setting without deleting it.

---

## Status selection

### Status mode

Choose which statuses the field tracks:

| Value | Meaning |
|---|---|
| **Selected statuses** | Calculate time in the statuses you pick from the Statuses list below |
| **Current issue status** | Only the status the issue is in right now |
| **All issue statuses** | Every status the issue has ever been in |
| **Selected status categories** | Every status in the categories you pick (for example `In Progress`) |

### Statuses

Visible when Status mode is **Selected statuses**. Pick one or more statuses from your Jira site. The field returns total time spent in those statuses, according to the Display setting below.

### Status categories

Visible when Status mode is **Selected status categories**. Pick one or more categories (`To Do`, `In Progress`, `Done`). Any status whose category matches is counted.

### Status order

Controls the order in which statuses are listed in the issue panel:

- **Default** - Jira's natural workflow order
- **Name ascending / descending**
- **ID ascending / descending**
- **Time ascending / descending**

The **Time** options are useful to surface the longest-running statuses at the top of the panel.

---

## Calendar

### Default calendar

Which [work calendar](/docs/time-in-status-cloud-forge/work-calendar) to use. If left blank, the built-in 24/7 calendar applies.

### Calendar Select field

Optional. Bind a **Calendar Select** custom field to let users override the calendar **per issue**. When set, the value of that field on each issue wins over the default calendar. See [Calendar Select field](/docs/time-in-status-cloud-forge/calendar-select-field).

---

## Display

### Display mode

- **Time in status** - the time value only
- **Time in status + icon** - the time value prefixed with the current status icon

### Time format

One of 46 formats, ranging from raw seconds (`D1`) to long-form strings like `1 year 2 month 3 weeks 6 days 13 hours 5 minutes 7 seconds` (`D45`). See the full list on [Time formats](/docs/time-in-status-cloud-forge/time-formats).

### Panel format override

Optional. A different time format to use in the issue panel than the one shown inside the custom field. Use this when you want a compact format (for example `D11` - `13:48`) in the Issue Navigator but a verbose format (for example `D14` - `10 days`) in the panel.

### Show type

- **Total time** - a single number summing the selected statuses
- **Time in status** - a breakdown per status, shown as a table in the issue panel

### Use rounding

Round the stored time value to the nearest minute before formatting.

### Use rounding for display

Round only for display; the underlying value remains precise. Useful when you want clean labels in the UI but exact values available for JQL search and export.

---

## Filtering

### JQL filter

Optional. Limits the setting to issues that match a JQL query, even inside a bound context. Useful when one context (for example `Project PROJ / Issue type Bug`) should only apply the setting to a subset of issues.

Rules:

- Up to **4000 characters**
- **No `ORDER BY`** clause - the filter is used for matching only
- Standard Jira JQL syntax, evaluated server-side during processing

### Issue date limit

Optional date (`YYYY-MM-DD`). Only issues with a creation date **on or after** this date are calculated. Useful when you want to start tracking from a specific point in time and ignore historical issues.

---

## Binding to contexts

A field setting only takes effect once it is bound to a **Jira field context**. Binding happens in Jira's field administration, on the field's **Contexts and default value** screen - see [Create a Time in Status field](/docs/time-in-status-cloud-forge/time-in-status-field-create).

One setting can be bound to many contexts. Changes to the setting affect every bound context immediately.

---

## Recalculation after changes

Editing a setting does not automatically re-process existing issues. After making changes that affect stored values (for example, switching calendars or changing the Status mode), run a **Full** recalculation from the **Recalculation** tab. See [Recalculation](/docs/time-in-status-cloud-forge/recalculation).
