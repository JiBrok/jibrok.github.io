---
title: Time in Status - JQL search
key: time-in-status-cloud-forge
excerpt: "Search and sort Jira issues by Time in Status field values using JQL schema properties."
category: search-jql
tags: [doc, cloud, time-in-status, forge, jql, search, sorting, schema-properties]
---

* TOC
{:toc}

---

## Overview

Time in Status fields in the Forge app use **schema properties** for JQL searching. This replaces the JQL functions used in the Data Center version and entity properties used in the Connect version.

The general syntax is:

```
"Your Field Name[PropertyAlias]" operator value
```

Where `Your Field Name` is the name of your Time in Status custom field in Jira.

---

## Searchable properties

| Property | Type | Description |
|----------|------|-------------|
| **DisplayValue** | text | The formatted time string (e.g., "2h 30m") |
| **HoursValue** | number | Hours component of the time (e.g., 2 for "2h 30m") |
| **MinutesValue** | number | Minutes component (e.g., 30 for "2h 30m") |
| **SecondsValue** | number | Total time in seconds |
| **TimeInHoursValue** | number | Total time as decimal hours (e.g., 2.5 for "2h 30m") |
| **TimeInMinutesValue** | number | Total time in minutes (e.g., 150 for "2h 30m") |
| **StateValue** | text | Current state: Active or Inactive |
| **DateNextUpdate** | date | When the field value will next be recalculated |

### HoursValue and MinutesValue vs TimeInHoursValue and TimeInMinutesValue

- **HoursValue / MinutesValue** are the **components** of the time display. For "2h 30m": HoursValue = 2, MinutesValue = 30.
- **TimeInHoursValue / TimeInMinutesValue** are the **total** time converted to a single unit. For "2h 30m": TimeInHoursValue = 2.5, TimeInMinutesValue = 150.

Use `TimeInHoursValue` or `TimeInMinutesValue` for threshold searches (e.g., "more than 4 hours total"). Use `HoursValue` + `MinutesValue` for combined component searches.

---

## Query examples

### Find issues where time in status exceeds 4 hours

```sql
"Time in Status[TimeInHoursValue]" > 4
```

### Find issues where time is between 1 and 8 hours

```sql
"Time in Status[TimeInHoursValue]" >= 1 AND "Time in Status[TimeInHoursValue]" <= 8
```

### Find issues with more than 2 hours and 30 minutes (using components)

```sql
"Time in Status[HoursValue]" > 2 OR ("Time in Status[HoursValue]" = 2 AND "Time in Status[MinutesValue]" >= 30)
```

### Find issues where time exceeds 90 minutes

```sql
"Time in Status[TimeInMinutesValue]" > 90
```

### Find active issues (still accumulating time)

```sql
"Time in Status[StateValue]" = "Active"
```

---

## Sorting

Sort results by any numeric property:

```sql
project = "MY-PROJECT" ORDER BY "Time in Status[TimeInHoursValue]" DESC
```

```sql
project = "MY-PROJECT" ORDER BY "Time in Status[SecondsValue]" ASC
```

---

## Notes

- Replace `"Time in Status"` in the examples with your actual field name.
- Text property searches (StateValue, DisplayValue) are case-sensitive.
- Date properties support Jira date functions: `startOfDay()`, `startOfWeek()`, `now()`, etc.
- For other field types, see: [Stopwatch JQL](/docs/time-in-status-cloud-forge/stopwatch-jql), [Timer JQL](/docs/time-in-status-cloud-forge/timer-jql), [Time Between Dates JQL](/docs/time-in-status-cloud-forge/time-between-dates-jql).

---

## Migrating from Connect or Data Center

If you are migrating from the Connect version, note that the search syntax has changed:

| Connect (entity properties) | Forge (schema properties) |
|------------------------------|---------------------------|
| `"time in hours:Field Name" > 4` | `"Field Name[TimeInHoursValue]" > 4` |
| `"time in minutes:Field Name" > 90` | `"Field Name[TimeInMinutesValue]" > 90` |
| `"hours of:Field Name" > 2` | `"Field Name[HoursValue]" > 2` |
| `"minutes of:Field Name" > 30` | `"Field Name[MinutesValue]" > 30` |

If you are migrating from Data Center, the custom JQL functions (e.g., `timeInStatus()`) are replaced by schema property searches. See [Feature comparison](/docs/time-in-status-cloud-forge/feature-comparison) for details.
