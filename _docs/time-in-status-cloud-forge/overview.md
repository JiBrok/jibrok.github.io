---
title: Time in Status (Forge) for Jira Cloud
key: time-in-status-cloud-forge
excerpt: "Time in Status for Jira Cloud (Forge) - Forge-native app for tracking time in statuses with stopwatch, timer, and time-between-dates fields, work calendars, and activity reports."
category: getting-started
tags: [doc, cloud, time-in-status, forge, time-tracking, business-calendar, field-creation, status-tracking, web-panels, activity-panels]
---

> **Draft: Forge version documentation - work in progress.**
>
> **Looking for the Connect version docs?** See [Time in Status (Connect)](/docs/tis-cloud/overview).

## Welcome to Time in Status (Forge) for Jira Cloud

Time in Status helps teams measure how long issues stay in each status, how long timers and stopwatches run, and how much time passes between key dates. This is the **Forge-native** build of the app, rebuilt from the ground up on Atlassian's Forge platform.

Every field, panel, calendar, and report you configure lives directly inside your Jira Cloud site - no external services, no OAuth setup, no separate infrastructure.

---

## What you can do

### Track time in statuses

Create **Time in Status** fields that calculate time spent in selected statuses, a current status, all statuses, or selected status categories. Time is calculated against a work calendar you define, so only working hours count.

Each field is a standard Jira custom field. It is searchable, sortable, displayable on issue views, and exportable via the Issue Navigator or REST API.

[Create a Time in Status field →](/docs/time-in-status-cloud-forge/time-in-status-field-create)

### Run stopwatches and timers

- **Stopwatch** fields accumulate time while issues are in specific states, and pause/restart automatically on events you choose (status changes, comments, field changes, assignments, or custom events).
- **Timer** fields count down toward a goal time and mark issues as failed when they miss it. Goals can be JQL-driven, so the same field applies different deadlines to different issues.
- **Time Between Dates** fields calculate the elapsed time between any two date or datetime fields - useful for SLA-style "date committed vs date delivered" metrics.

### Define work calendars

Create work calendars with business hours, break times, time zones, holidays, and repeating patterns (weekly, bi-weekly, monthly, yearly). Any field or panel can bind to a calendar. A built-in **Calendar Select** custom field lets users pick a different calendar per issue when needed.

[Work calendars →](/docs/time-in-status-cloud-forge/work-calendar)

### Show time on the issue view

The app adds **issue panels** for Time in Status, Stopwatch, and Timer, plus an **Activity panel** with three built-in reports:

- **R1 - Time in Status**: per-status time breakdown for the current issue
- **R2 - Transition History**: chronological log of status changes with durations
- **R3 - Time by Assignee**: time grouped by the assignee at each moment

Panels are shown only where you want them - visibility is controlled per project and issue type.

[Issue panels →](/docs/time-in-status-cloud-forge/web-panel) · [Activity panels →](/docs/time-in-status-cloud-forge/activity-panels)

### Automate with Custom Events

Define named events (for example, "SLA paused", "Waiting for customer") tied to changes in status, fields, priorities, assignees, or comments. Stopwatch and Timer fields can listen for these events to start, pause, and stop.

[Custom Events →](/docs/time-in-status-cloud-forge/custom-events)

### Recalculate and migrate safely

The admin panel includes tools to:

- **Recalculate** all issues for a field (full, unprocessed-only, or stale-only)
- **Pause** all processing while you perform bulk operations
- **Import and export** the full configuration as JSON, including a conflict-resolution flow for safe moves between environments (with support for Data Center to Cloud migration)

[Recalculation →](/docs/time-in-status-cloud-forge/recalculation) · [Import / Export →](/docs/time-in-status-cloud-forge/import-export-config)

---

## How Forge differs from the Connect version

The Forge version is not a straight port - the platform differences matter:

| Area | Connect version | Forge version |
|---|---|---|
| Platform | Atlassian Connect + external server | 100% Forge native (Atlassian-hosted) |
| Stopwatch / Timer / Time Between Dates | Not available | **Built in** |
| Activity panels (R1 / R2 / R3) | Not available | **Built in** |
| Custom Events | Not available | **Built in** |
| Custom JQL functions (`time in hours:FIELD > 1.5`) | Available | Not available - use [searchable field properties](/docs/time-in-status-cloud-forge/time-in-status-jql) |
| Dashboard gadgets | Available | Not available |
| In-field statistics (avg / min / max / percentiles) | Available | Planned as a separate app |
| Field modules / quotas | Managed in-app | Not applicable on Forge |

See the full comparison on the [feature differences page](/docs/time-in-status-cloud-forge/featureDifferenceDocumentation).

---

## Get started

1. **[Install the app](/docs/time-in-status-cloud-forge/install)** from the Atlassian Marketplace
2. **[Create a work calendar](/docs/time-in-status-cloud-forge/work-calendar)** matching your team's schedule
3. **[Create a Time in Status field](/docs/time-in-status-cloud-forge/time-in-status-field-create)** and configure it for your projects
4. **[Add an issue panel](/docs/time-in-status-cloud-forge/web-panel)** so your team can see the data inline

For a step-by-step walkthrough see the [Getting started guide](/docs/time-in-status-cloud-forge/get-started).
