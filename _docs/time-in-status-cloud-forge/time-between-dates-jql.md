---
title: Time Between Dates - JQL search
key: time-in-status-cloud-forge
excerpt: "Search and sort Jira issues by Time Between Dates field values using JQL schema properties."
category: search-jql
tags: [doc, cloud, time-in-status, forge, time-between-dates, jql, search, sorting]
---

* TOC
{:toc}

---

## Overview

Time Between Dates fields use **schema properties** for JQL searching.

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
| **StateValue** | text | Current state: Active or Inactive |
| **GoalTimeSeconds** | number | Goal time in seconds (if configured) |
| **LeftTimeSeconds** | number | Remaining time in seconds |
| **DateNextUpdate** | date | Next scheduled recalculation |

---

## Query examples

### Find issues where time between dates exceeds 5 days

```sql
"Resolution Time[TimeInHoursValue]" > 120
```

### Find issues resolved within 4 hours

```sql
"Resolution Time[TimeInHoursValue]" <= 4
```

### Find active (still calculating) fields

```sql
"Resolution Time[StateValue]" = "Active"
```

### Sort by resolution time

```sql
project = "MY-PROJECT" ORDER BY "Resolution Time[TimeInHoursValue]" DESC
```

---

## Notes

- Replace `"Resolution Time"` with your actual field name.
- If the field uses `currentDateTime` as the end date, values update periodically.
- Text property searches are case-sensitive.
