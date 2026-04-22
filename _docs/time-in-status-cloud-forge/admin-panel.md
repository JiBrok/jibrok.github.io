---
title: Admin panel overview
key: time-in-status-cloud-forge
excerpt: "Overview of the Time in Status (Forge) admin panel - access, tabs, and navigation for Jira administrators."
category: system-information
tags: [doc, cloud, time-in-status, forge, admin-panel, configuration, settings]
---

* TOC
{:toc}

---

## Accessing the admin panel

The admin panel is available to **Jira administrators** only.

To open it:

1. Go to **Jira Settings** (gear icon) > **Apps** > **Manage apps**
2. Find **Time in Status** in the list of installed apps
3. Click **Configure**

The admin panel opens in a new page inside Jira.

<!-- [Screenshot: admin-panel-overview] -->

---

## Tabs

The admin panel has **9 tabs**, each responsible for a specific area of configuration.

### Time in Status

Configure **Time in Status** custom fields and web panels. Time in Status fields track how long issues spend in selected statuses, with support for work calendars, status filtering, and multiple display formats.

- **Field Settings** sub-tab - create and manage field setting configurations
- **Web Panels** sub-tab - create panels that display time-in-status breakdown on the issue view

[Time in Status field settings reference →](/docs/time-in-status-cloud-forge/time-in-status-field-settings)

### Stopwatch

Configure **Stopwatch** custom fields and web panels. Stopwatch fields accumulate time based on events you define - they start, pause, stop, and restart automatically when specific changes happen on an issue.

- **Field Settings** sub-tab - define events and calculation rules
- **Web Panels** sub-tab - show stopwatch state and time on issue views

[Stopwatch field settings reference →](/docs/time-in-status-cloud-forge/stopwatch-field-settings)

### Timer

Configure **Timer** custom fields and web panels. Timer fields count down toward a goal time and mark issues as failed when the deadline is missed. Goals can vary by issue using JQL conditions.

- **Field Settings** sub-tab - define events, goals, and calculation rules
- **Web Panels** sub-tab - show timer state, time left, and goal on issue views

[Timer field settings reference →](/docs/time-in-status-cloud-forge/timer-field-settings)

### Time Between Dates

Configure **Time Between Dates** custom fields. These fields calculate the elapsed time between any two date or datetime fields on an issue, using a work calendar.

- **Field Settings** - define start/end date fields and display options

[Time Between Dates reference →](/docs/time-in-status-cloud-forge/time-between-dates-field)

### Custom Events

Define **Custom Events** - named rules that fire when a specific field value changes. Custom events can be used as triggers for Stopwatch and Timer fields.

For example, you can create a custom event "Priority changed to Highest" and use it as a start trigger for a stopwatch.

[Custom Events reference →](/docs/time-in-status-cloud-forge/custom-events)

### Activity Panels

Configure the **Activity Panel** that appears on the issue Activity tab. The panel provides three reports:

- **R1 - Time in Status** - time spent in each status with assignee breakdown
- **R2 - Transition History** - chronological status change log
- **R3 - Time by Assignee** - time grouped by assignee

Set global defaults and create per-project overrides.

[Activity Panels reference →](/docs/time-in-status-cloud-forge/activity-panels)

### Calendars

Create and manage **work calendars** with business hours, break times, holidays, time zones, and repeating patterns. Calendars are used by all field types and panels to calculate working time.

A built-in 24x7 calendar is always available as the default.

[Work calendars reference →](/docs/time-in-status-cloud-forge/work-calendar)

### Recalculation

Monitor and manage **data freshness** across all fields and contexts.

- View freshness statistics (up-to-date, stale, unprocessed issues)
- Start batch recalculation jobs (full, unprocessed only, or stale only)
- Monitor batch job progress and errors
- Pause and resume all background processing
- Detect and clean up orphaned field contexts

[Recalculation reference →](/docs/time-in-status-cloud-forge/recalculation)

### Import / Export

**Export** your configuration (calendars, field settings, web panels, custom events) as a JSON file for backup or transfer to another Jira site.

**Import** a previously exported configuration file, with options to skip, overwrite, or rename conflicting items. Supports automatic conversion from Data Center format.

[Import / Export reference →](/docs/time-in-status-cloud-forge/import-export-config)

---

## App information

At the bottom of the admin panel, you can find the app information badge showing:

- **App version** - the currently installed version
- **Environment** - development or production
- **Installation ID** - unique identifier for support requests
