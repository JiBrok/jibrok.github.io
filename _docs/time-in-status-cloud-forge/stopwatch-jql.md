---
title: Stopwatch - JQL search
key: time-in-status-cloud-forge
excerpt: "Search and sort Jira issues by Stopwatch field values using JQL schema properties."
category: search-jql
tags: [doc, cloud, time-in-status, forge, stopwatch, jql, search, sorting]
---

* TOC
{:toc}

---

## Overview

Stopwatch fields in the Forge app use **schema properties** for JQL searching. This is different from the Connect version (which used entity properties) and the Data Center version (which used custom JQL functions).

The general syntax is:

```
"Your Field Name[PropertyAlias]" operator value
```

Where `Your Field Name` is the name of your Stopwatch custom field in Jira.

---

## Searchable properties

| Property | Type | Description |
|----------|------|-------------|
| **DisplayValue** | text | The formatted time string (e.g., "2h 30m") |
| **HoursValue** | number | Hours component of the time (e.g., 2 for "2h 30m") |
| **MinutesValue** | number | Minutes component of the time (e.g., 30 for "2h 30m") |
| **SecondsValue** | number | Total time in seconds |
| **TimeInHoursValue** | number | Total time as decimal hours (e.g., 2.5 for "2h 30m") |
| **TimeInMinutesValue** | number | Total time in minutes (e.g., 150 for "2h 30m") |
| **StateValue** | text | Current state: Inactive, Running, Paused, or Stopped |
| **PauseTimeSeconds** | number | Total accumulated pause time in seconds |
| **DateNextUpdate** | date | When the field value will next be recalculated |
| **FirstStartDate** | date | Timestamp when the stopwatch first started |
| **LastStartDate** | date | Timestamp when the stopwatch last started or resumed |
| **StopDate** | date | Timestamp when the stopwatch stopped |
| **LastPauseDate** | date | Timestamp when the stopwatch was last paused |
| **RestartCount** | number | Number of times the stopwatch has been restarted |

---

## Query examples

### Find issues with running stopwatches

```sql
"Response Time[StateValue]" = "Running"
```

### Find issues where stopwatch time exceeds 4 hours

```sql
"Response Time[TimeInHoursValue]" > 4
```

### Find issues where stopwatch time is between 1 and 8 hours

```sql
"Response Time[TimeInHoursValue]" >= 1 AND "Response Time[TimeInHoursValue]" <= 8
```

### Find issues where stopwatch started this week

```sql
"Response Time[FirstStartDate]" >= startOfWeek()
```

### Find stopped stopwatches with more than 2 restarts

```sql
"Response Time[StateValue]" = "Stopped" AND "Response Time[RestartCount]" > 2
```

### Find issues with significant pause time (more than 1 hour)

```sql
"Response Time[PauseTimeSeconds]" > 3600
```

---

## Sorting

You can sort results by any numeric or date property:

```sql
project = "MY-PROJECT" ORDER BY "Response Time[TimeInHoursValue]" DESC
```

```sql
project = "MY-PROJECT" ORDER BY "Response Time[FirstStartDate]" ASC
```

---

## Notes

- Replace `"Response Time"` in the examples above with your actual Stopwatch field name.
- Text property searches (StateValue, DisplayValue) are case-sensitive.
- Date properties support Jira date functions: `startOfDay()`, `startOfWeek()`, `startOfMonth()`, `now()`, etc.
- For more JQL details, see the field-specific JQL pages: [Time in Status JQL](/docs/time-in-status-cloud-forge/time-in-status-jql), [Timer JQL](/docs/time-in-status-cloud-forge/timer-jql), [Time Between Dates JQL](/docs/time-in-status-cloud-forge/time-between-dates-jql).
