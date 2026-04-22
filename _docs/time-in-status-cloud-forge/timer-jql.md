---
title: Timer - JQL search
key: time-in-status-cloud-forge
excerpt: "Search and sort Jira issues by Timer field values using JQL schema properties - find failed timers, check remaining time, and more."
category: search-jql
tags: [doc, cloud, time-in-status, forge, timer, jql, search, sorting, sla]
---

* TOC
{:toc}

---

## Overview

Timer fields use **schema properties** for JQL searching.

The general syntax is:

```
"Your Field Name[PropertyAlias]" operator value
```

---

## Searchable properties

| Property | Type | Description |
|----------|------|-------------|
| **DisplayValue** | text | Formatted time string |
| **HoursValue** | number | Hours component |
| **MinutesValue** | number | Minutes component |
| **SecondsValue** | number | Total elapsed time in seconds |
| **TimeInHoursValue** | number | Total elapsed time as decimal hours |
| **TimeInMinutesValue** | number | Total elapsed time in minutes |
| **StateValue** | text | Current state: Inactive, Running, Paused, Completed, or Failed |
| **GoalTimeSeconds** | number | Goal time in seconds |
| **LeftTimeSeconds** | number | Remaining time in seconds (goal minus elapsed) |
| **PauseTimeSeconds** | number | Accumulated pause time in seconds |
| **DateNextUpdate** | date | Next scheduled recalculation |
| **FirstStartDate** | date | When the timer first started |
| **LastStartDate** | date | When the timer last started or resumed |
| **StopDate** | date | When the timer was stopped/completed |
| **FailDate** | date | When the timer failed (exceeded goal) |
| **LastPauseDate** | date | When the timer was last paused |
| **RestartCount** | number | Number of restarts |

---

## Query examples

### Find all failed timers

```sql
"SLA Timer[StateValue]" = "Failed"
```

### Find running timers with less than 1 hour remaining

```sql
"SLA Timer[StateValue]" = "Running" AND "SLA Timer[LeftTimeSeconds]" < 3600
```

### Find timers that failed this week

```sql
"SLA Timer[FailDate]" >= startOfWeek()
```

### Find completed timers with goal under 4 hours

```sql
"SLA Timer[StateValue]" = "Completed" AND "SLA Timer[GoalTimeSeconds]" < 14400
```

### Find issues where timer spent more than the goal

```sql
"SLA Timer[SecondsValue]" > "SLA Timer[GoalTimeSeconds]"
```

### Find timers that have been restarted

```sql
"SLA Timer[RestartCount]" > 0
```

---

## Sorting

```sql
project = "SUPPORT" ORDER BY "SLA Timer[LeftTimeSeconds]" ASC
```

```sql
project = "SUPPORT" AND "SLA Timer[StateValue]" = "Failed" ORDER BY "SLA Timer[FailDate]" DESC
```

---

## Notes

- Replace `"SLA Timer"` with your actual Timer field name.
- `LeftTimeSeconds` can be negative for failed timers (shows how much time was exceeded).
- Text property searches (StateValue, DisplayValue) are case-sensitive.
- Date properties support Jira date functions: `startOfDay()`, `startOfWeek()`, `now()`, etc.
