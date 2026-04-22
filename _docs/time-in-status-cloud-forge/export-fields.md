---
title: JQL reports and export
key: time-in-status-cloud-forge
excerpt: "Export Time in Status field values from JQL searches to Excel, CSV, and other formats using Jira's Issue Navigator."
category: integration-export
tags: [doc, cloud, time-in-status, forge, export, excel, csv, jql, reports]
---

* TOC
{:toc}

---

## Overview

Time in Status field values can be exported from Jira using the **Issue Navigator's** built-in export functionality. This works for all field types: Time in Status, Stopwatch, Timer, Time Between Dates, and Calendar Select.

---

## Displaying fields in the Issue Navigator

1. Go to **Jira** and run a JQL query
2. Switch to **List view** in the Issue Navigator
3. Click **Columns** to customize which columns are displayed
4. Search for and add your Time in Status field(s) to the column list

The field's `displayValue` (formatted time string) appears in the column.

---

## Exporting to Excel / CSV

1. Run your JQL query in the Issue Navigator
2. Click the **Export** button (top-right of results)
3. Choose your export format:
   - **Export Excel CSV (all fields)** - exports all visible fields
   - **Export Excel CSV (current fields)** - exports only the currently displayed columns
4. The downloaded file includes the field's display value

<!-- [Screenshot: jql-export-excel] -->

### What is exported

The exported value is the **display value** of the field - the formatted time string (e.g., "2h 30m", "1d 4h 15m"). This is the same value shown in the Issue Navigator column.

---

## Using JQL for reports

Combine JQL searches with field exports to create reports:

### Example: Issues exceeding SLA

```sql
project = "SUPPORT" AND "SLA Timer[StateValue]" = "Failed"
```

Export the results with Timer fields visible to see which issues failed and by how much.

### Example: Time spent per status this month

```sql
project = "DEV" AND created >= startOfMonth()
```

Add Time in Status fields to columns, export, and analyze in a spreadsheet.

### Example: Stopwatch durations for completed issues

```sql
project = "OPS" AND "Response Time[StateValue]" = "Stopped" ORDER BY "Response Time[TimeInHoursValue]" DESC
```

---

## Tips

- **Sort before export**: use `ORDER BY` in your JQL to pre-sort the exported data.
- **Multiple fields**: you can add multiple Time in Status fields to the column list and export them all at once.
- **Spreadsheet analysis**: after exporting to CSV/Excel, use pivot tables or charts to analyze time distribution across statuses, projects, or time periods.
- **Scheduled exports**: combine JQL saved filters with Jira automation or external tools to schedule periodic exports for reporting.
