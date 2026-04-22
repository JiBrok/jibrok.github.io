---
title: Getting Started with Time in Status (Forge) for Jira Cloud
key: time-in-status-cloud-forge
excerpt: "Step-by-step walkthrough to configure Time in Status (Forge) - work calendars, field creation, field context config, and issue panels."
category: getting-started
tags: [doc, cloud, time-in-status, forge, time-tracking, business-calendar, setup, configuration]
---

This guide walks you through setting up Time in Status (Forge) end to end. After following these steps you will have a Time in Status field calculating against a work calendar, visible in the issue view, and searchable via JQL.

* TOC
{:toc}

---

## Step 1. Install and open the admin panel

If you have not installed the app yet, follow [Install Time in Status](/docs/time-in-status-cloud-forge/install).

Open the admin panel from **Jira Settings ⚙ → Apps → Manage apps → Time in Status → Configure**. The panel has one tab per feature: **Time in Status**, **Stopwatch**, **Timer**, **Time Between Dates**, **Activity Panels**, **Custom Events**, **Calendars**, **Recalculation**, and **Import / Export**.

---

## Step 2. Create a work calendar

Work calendars decide which hours count toward time calculations.

1. Go to the **Calendars** tab in the admin panel.
2. Click **Create calendar**.
3. Enter a name and time zone.
4. Configure work hours for each day of the week. Mark non-working days as **Holiday** or **Weekend**.
5. Optionally add **break times** (for example, lunch breaks) and **custom days** for holidays or one-off schedule changes.
6. Save.

A built-in **24/7 calendar** is always available if you want time to include every hour.

See [Work calendar](/docs/time-in-status-cloud-forge/work-calendar) for the full reference.

---

## Step 3. Create a Time in Status field

Unlike the Connect version, Forge fields are standard Jira custom fields. You create them the usual way, then bind a **field setting** in the admin panel.

1. In Jira, go to **Settings ⚙ → Issues → Custom fields → Create custom field**.
2. Search for **Time in Status** (provided by the JiBrok app) and select it.
3. Give the field a name, choose the projects and issue types that should see it, and save.
4. Open the field's **Contexts and default value** screen. Each Jira field context maps to a scope (global, or specific projects and issue types).
5. Click on a context - the app's **field context configuration** panel opens.
6. Pick or create a **Field setting** (the collection of calculation rules: which statuses to track, which calendar to use, display format, and so on). A setting can be reused across multiple contexts.

See [Create a Time in Status field](/docs/time-in-status-cloud-forge/time-in-status-field-create) for screenshots and [Field settings](/docs/time-in-status-cloud-forge/time-in-status-field-settings) for every available option.

---

## Step 4. Configure field settings

Field settings are managed in the admin panel's **Time in Status** tab. A field setting contains:

- **Name** - identifies the setting in context binding
- **Status mode** - `Selected statuses`, `Current issue status`, `All issue statuses`, or `Selected status categories`
- **Statuses** or **status categories** to track
- **Calendar** - the default work calendar, with optional per-issue override via a **Calendar Select** field or JQL-based calendar overrides
- **Time format** - one of 46 display formats, see [Time formats](/docs/time-in-status-cloud-forge/time-formats)
- **Display mode** - `Time in status` or `Time in status + icon`
- **JQL filter** - limits which issues the setting applies to (up to 4000 characters; no `ORDER BY`)
- **Rounding, status order, issue date limit, panel format override** - finer-grained display controls

Enable the **Active** toggle to start calculations.

---

## Step 5. Backfill existing issues

New and updated issues are calculated automatically in near real time. To process historical issues, use the **Recalculation** tab:

1. Open the **Recalculation** tab.
2. Find your field setting in the list.
3. Click **Run** and choose a mode:
   - **Full** - recalculate every matching issue
   - **Unprocessed** - only issues that have no stored value yet
   - **Stale** - only issues whose next scheduled update is overdue
4. Watch the progress. You can cancel a running job at any time.

If you need to halt all background processing for maintenance, use **Pause processing** at the top of the Recalculation tab.

See [Recalculation](/docs/time-in-status-cloud-forge/recalculation).

---

## Step 6. Show the data on the issue view

Two complementary ways to display time on an issue:

- **Custom field** - the field value appears wherever you add the custom field (screens, the issue detail view, reports, the Issue Navigator).
- **Issue panel** - a dedicated side panel with richer layouts, including current status highlighting and per-status breakdown.

Enable the Time in Status issue panel per project and issue type in **Issue panels** → project-level settings. See [Issue panels](/docs/time-in-status-cloud-forge/web-panel).

For audit-style reports (transition history, time by assignee) enable the [Activity panel](/docs/time-in-status-cloud-forge/activity-panels).

---

## Step 7. Search and sort by time

Because the Forge platform does not allow apps to register custom JQL functions, searching works through Jira's built-in **custom field property** search. Every Time in Status field exposes properties like `secondsValue`, `minutesValue`, `hoursValue`, `timeInHoursValue`, and `dateNextUpdate`:

```jql
"Your Field[SecondsValue]" > 3600 ORDER BY "Your Field[SecondsValue]" DESC
```

See [JQL search](/docs/time-in-status-cloud-forge/time-in-status-jql) for the full list of searchable properties and examples.

---

## Next steps

- Add [Stopwatch](/docs/time-in-status-cloud-forge/stopwatch-field-create), [Timer](/docs/time-in-status-cloud-forge/timer-field-create), or [Time Between Dates](/docs/time-in-status-cloud-forge/time-between-dates-field) fields for more advanced metrics.
- Set up [Custom Events](/docs/time-in-status-cloud-forge/custom-events) to trigger stopwatches and timers on business events.
- Enable [Activity panels](/docs/time-in-status-cloud-forge/activity-panels) for inline reports on every issue.
- Export your configuration as JSON with [Import / Export](/docs/time-in-status-cloud-forge/import-export-config) for backups or moves between environments.
