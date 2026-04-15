---
title: Time in Status - DC / Connect / Forge feature comparison
key: time-in-status-cloud-forge
excerpt: "Feature-by-feature parity between the three Time in Status versions: Data Center, Cloud Connect (legacy), and Cloud Forge."
category: reference
tags:
  - doc
  - time-in-status
  - comparison
  - data-center
  - cloud
  - forge
---

* TOC
{:toc}

---

## Overview

Time in Status ships in three flavors, each built for a different Atlassian hosting model:

- **Data Center (DC)** - the original Java plugin for Jira Data Center and Server. Feature-rich, with 13 custom field types, 270+ custom JQL functions, deep workflow and reporting integration.
- **Cloud (Connect)** - the legacy Atlassian Connect Cloud app. Focused on Time in Status calculations, web panels, and a dashboard gadget for statistical aggregation.
- **Cloud (Forge)** - the new Atlassian Forge Cloud app, actively replacing the Connect build. Brings timers, stopwatches, time-between-dates fields, a greatly expanded event-trigger system, configuration export/import, and a changelog-based calculation engine back to Cloud.

The tables on this page list supported features side by side in a fixed **DC | Connect | Forge** column order so you can compare the two common paths: **DC → Forge** (Data Center customers evaluating a move to Cloud) and **Connect → Forge** (existing Cloud customers upgrading to the new Forge build). For step-by-step migration instructions, see the DC [Migration to Forge guide]({{ site.baseurl }}/docs/time-in-status/migration-to-forge/) and the Cloud [Migration to Forge guide]({{ site.baseurl }}/docs/tis-cloud/migration-to-forge/).

---

## Legend

| Symbol | Meaning |
|:------:|---------|
| ✅ | Supported in this version |
| ❌ | Not supported in this version |
| 📊 | Not part of the main app - planned for a separate **Forge dashboard gadgets app** that will cover DC reporting, helper fields, and Connect statistical aggregation in a single product |
| - | Not applicable to this version |

---

## Overall parity at a glance

| Area | DC | Connect | Forge |
|------|:--:|:-------:|:-----:|
| Custom field types | **13** | 1 | **5** (plus 📊 gadgets app for helpers) |
| JQL search | 270+ custom functions | ~8 entity properties | **~16 schema properties** covering ~90% of DC use cases |
| Time display formats | ~46 | 29 | ~46 |
| Event trigger types | ~4 | 2 | **39** |
| Issue panels | **7** | 1 | **4** (plus Activity panel) |
| Admin pages | **20+** | ~6 | ~15 |
| Charts and reports | 3 chart types | 1 dashboard gadget | Activity panel (main app) + 📊 separate gadgets app |

The rest of the page breaks these down feature by feature.

---

## Custom field types

| Field | DC | Connect | Forge | Notes |
|-------|:--:|:-------:|:-----:|-------|
| Time in Status | ✅ | ✅ | ✅ | Core field - time spent in selected statuses |
| Timer (SLA) | ✅ | ❌ | ✅ | Countdown timer with a goal time |
| Stopwatch | ✅ | ❌ | ✅ | Automatic stopwatch driven by events |
| Time Between Dates | ❌ | ❌ | ✅ | **New in Forge** - difference between two date fields |
| Calendar Select / Calendar Field | ✅ | ❌ | ✅ | DC: Calendar Field (picker with working hours). Forge: Calendar Select (per-issue calendar selection). Equivalent functionality |
| Transition Counter | ✅ | ❌ | ❌ | Counts transitions between specific status pairs (from → to) |
| Is Status | ✅ | ❌ | ❌ | Boolean - is the issue currently in one of the selected statuses |
| JQL Function Field | ✅ | ❌ | ❌ | Periodic value calculation from a JQL query |
| Helper fields (6 types) | ✅ | ❌ | ❌ | See the "Helpers and statistics" sub-table below |

### Helpers and statistics

> 📊 **Planned**: helper fields and statistical aggregation (Connect) will ship through **dashboard gadgets in a separate Forge app**. The gadgets will cover helper use cases (date extraction, numeric values, statistics) and Connect-style statistics (min / max / average / percentiles) in a single interface.

| Helper field (DC) | Purpose | Forge equivalent |
|-------------------|---------|------------------|
| TIS Helper - Statistic | Min / max / average over a TIS field | 📊 Separate gadgets app |
| TIS Helper - Number | TIS value as a number for 3rd-party integrations | Not required - Forge schema properties already expose numeric values (`secondsValue`, `timeInHoursValue`) |
| Timer Helper - Statistic | Statistics over a timer | 📊 Separate gadgets app |
| Timer Helper - Date | Extracts dates (start / stop / fail) | Not required - Forge schema properties: `firstStartDate`, `stopDate`, `failDate` |
| Timer Helper - Number | Timer as a number | Not required - Forge schema properties: `secondsValue`, `goalTimeSeconds`, `leftTimeSeconds` |
| Stopwatch Helper - Statistic | Statistics over a stopwatch | 📊 Separate gadgets app |
| Stopwatch Helper - Date | Extracts dates from a stopwatch | Not required - Forge schema properties: `firstStartDate`, `lastStartDate`, `stopDate` |
| Stopwatch Helper - Number | Stopwatch as a number | Not required - Forge schema properties: `secondsValue`, `pauseTimeSeconds` |

**Summary**: 5 out of 8 DC helper fields are no longer needed in Forge - custom field schema properties already expose numeric and date values directly. The 3 statistical helpers, together with Connect's statistical aggregation, will be covered by the separate gadgets app.

| Connect statistic | Purpose | Forge equivalent |
|-------------------|---------|------------------|
| min / max / sum / average | Aggregation across many issues | 📊 Separate gadgets app |
| Percentile 5–99% | 19 percentile values | 📊 Separate gadgets app |
| Comparative display (`TIME_AVERAGE`, `TIME_MEDIAN`…) | Shows "value vs statistic" | 📊 Separate gadgets app |

---

## Time display formats

| Capability | DC | Connect | Forge | Notes |
|------------|:--:|:-------:|:-----:|-------|
| Show-format variants | ~46 | 29 | 46 | Forge ports the full DC set |
| Minutes / hours / days | ✅ | ✅ | ✅ | |
| Weeks / months / years | ✅ | ✅ | ✅ | |
| Combined (`1y 2M 3w 6d`) | ✅ | ✅ | ✅ | |
| Percentage | ✅ | ❌ | ❌ | DC-only format |
| `useRounding` | ✅ | ✅ | ✅ | |
| `useRoundingForDisplay` | ✅ | ✅ | ✅ | |

---

## Status selection modes

| Mode | DC | Connect | Forge |
|------|:--:|:-------:|:-----:|
| `SELECTED_STATUSES` | ✅ | ✅ | ✅ |
| `CURRENT_STATUS` | ✅ | ✅ | ✅ |
| `ALL_STATUSES` | ✅ | ✅ | ✅ |
| `SELECTED_CATEGORIES` | ✅ | ✅ | ✅ |

Full parity.

---

## Display modes

| Mode | DC | Connect | Forge | Notes |
|------|:--:|:-------:|:-----:|-------|
| `TIME` (plain time) | ✅ | ✅ | ✅ | |
| `TIME_ICON` / `ICON_TIME` | ✅ | ❌ | ✅ | |
| Statistical (average, median, min, max) | ✅ | ✅ | 📊 | 📊 Separate gadgets app |
| Percentile (5–99%) | ❌ | ✅ | 📊 | 📊 Separate gadgets app |
| Timer: `TIME_SPENT`, `LEFT_TIME`, `GOAL_TIME` | ✅ | - | ✅ | |
| Timer: `FAILED_DATE` | ✅ | - | ✅ | |
| Stopwatch: `TIME_SPENT`, `PAUSE_TIME` | ✅ | - | ✅ | |
| Time Between Dates: `GOAL_TIME`, `LEFT_TIME` | - | - | ✅ | Forge-only |

---

## Work calendars

| Capability | DC | Connect | Forge | Notes |
|------------|:--:|:-------:|:-----:|-------|
| Create / edit | ✅ | ✅ | ✅ | |
| Working hours per weekday | ✅ | ✅ | ✅ | |
| Breaks | ✅ | ✅ | ✅ | |
| Holidays and special days | ✅ | ✅ | ✅ | |
| Recurring patterns | ✅ | ✅ | ✅ | `WEEK`, `TWO_WEEK`, `MONTH`, `YEAR` |
| Time zone support | ✅ | ✅ | ✅ | |
| 24 × 7 calendar | ✅ | ✅ | ✅ | |
| Per-issue calendar override | ✅ (Calendar Field) | ❌ | ✅ (Calendar Select) | Equivalent functionality |

---

## Issue panels

| Panel | DC | Connect | Forge | Notes |
|-------|:--:|:-------:|:-----:|-------|
| TIS web panel (right sidebar) | ✅ | ✅ | ✅ | |
| Stopwatch issue panel | ✅ | - | ✅ | |
| Timer issue panel | ✅ | - | ✅ | |
| Activity: time by status + assignee | ✅ (tab panel) | ❌ | ✅ (R1) | |
| Activity: transition history | ✅ (tab panel) | ❌ | ✅ (R2) | |
| Activity: time by assignee | ✅ (tab panel) | ❌ | ✅ (R3) | |
| Action history (Timer) | ✅ (tab panel) | ❌ | ❌ | Detailed timer event log |
| Action history (Stopwatch) | ✅ (tab panel) | ❌ | ❌ | Detailed stopwatch event log |
| Configurable web panels | ✅ | ✅ | ✅ | |
| Panel visibility conditions | ✅ | ❌ | ✅ | |
| "Show zero values" option | ❌ | ✅ | ✅ | |
| Periodic update | ❌ | ✅ | ✅ | |

---

## JQL search parity

DC ships over 270 custom JQL functions. Connect and Forge cannot register custom JQL functions (platform restriction), so search is implemented through **custom field schema properties** (Forge) and **entity properties** (Connect), both queryable with plain JQL.

### Search mechanism by version

| Version | Mechanism | JQL syntax example |
|---------|-----------|--------------------|
| DC | Custom JQL functions | `"Timer" IN isRunning()` |
| Connect | Entity properties with aliases | `"seconds:{fieldName}" > 3600` |
| Forge | Custom field schema properties | `"Timer[StateValue]" = "Running"` |

### Schema properties by field type (Forge)

**Time in Status:**

| Property | Type | Description |
|----------|------|-------------|
| `displayValue` | text | Formatted time (`2h 30m`) |
| `hoursValue` | number | Whole hours |
| `minutesValue` | number | Whole minutes |
| `secondsValue` | number | Seconds - the base unit |
| `timeInHoursValue` | number | Hours with one decimal place |
| `timeInMinutesValue` | number | Minutes, decimal |
| `stateValue` | text | `Active` / `Inactive` |
| `dateNextUpdate` | date | ISO 8601, next recalculation |

**Stopwatch** - all TIS properties plus:

| Property | Type | Description |
|----------|------|-------------|
| `pauseTimeSeconds` | number | Paused time (seconds) |
| `firstStartDate` | date | First start timestamp |
| `lastStartDate` | date | Most recent start timestamp |
| `stopDate` | date | Stop timestamp |
| `lastPauseDate` | date | Most recent pause timestamp |
| `restartCount` | number | Number of restarts |
| `stateValue` | text | `Inactive` / `Running` / `Paused` / `Stopped` |

**Timer** - all Stopwatch properties plus:

| Property | Type | Description |
|----------|------|-------------|
| `goalTimeSeconds` | number | Goal time (seconds) |
| `leftTimeSeconds` | number | Remaining time (may be negative) |
| `failDate` | date | Date the timer failed |
| `stateValue` | text | `Inactive` / `Running` / `Paused` / `Completed` / `Failed` |

**Time Between Dates:**

| Property | Type | Description |
|----------|------|-------------|
| `displayValue`, `hours/minutes/secondsValue`, `timeInHours/MinutesValue` | as TIS | Base numeric properties |
| `goalTimeSeconds` | number | Difference between the two dates |
| `leftTimeSeconds` | number | Time left until `endDate` |
| `stateValue` | text | `Active` / `Inactive` |

**Calendar Select:**

| Property | Type | Description |
|----------|------|-------------|
| `calendarId` | text | Calendar ID |
| `calendarName` | text | Calendar name |

### Equivalent JQL queries

#### Time in Status - by state

| DC JQL | Connect JQL | Forge JQL |
|--------|-------------|-----------|
| `"TIS" IN active()` | `"state:{field}" = "ACTIVE"` | `"TIS[StateValue]" = "Active"` |
| `"TIS" IN inactive()` | `"state:{field}" = "INACTIVE"` | `"TIS[StateValue]" = "Inactive"` |

#### Time in Status - by time

| DC JQL | Connect JQL | Forge JQL |
|--------|-------------|-----------|
| `"TIS" IN time(">", "5h")` | `"seconds:{field}" > 18000` | `"TIS[SecondsValue]" > 18000` |
| `"TIS" IN time("<", "30m")` | `"seconds:{field}" < 1800` | `"TIS[SecondsValue]" < 1800` |
| `"TIS" IN realTime(">", "2h")` | `"seconds:{field}" > 7200` | `"TIS[SecondsValue]" > 7200` |
| `"TIS" IN realTimeBetween("1h", "8h")` | `"seconds:{field}" >= 3600 AND "seconds:{field}" <= 28800` | `"TIS[SecondsValue]" >= 3600 AND "TIS[SecondsValue]" <= 28800` |
| `"TIS" IN timeInStatus("Open,In Progress", ">", "1d")` | No direct equivalent (one field = one status set) | No direct equivalent |

> **Note**: the DC `realTime()` function computes live time including the current moment. Connect and Forge return the last recalculated value. The difference is small when updates run frequently, but it exists.

#### Timer - by state

| DC JQL | Forge JQL | Notes |
|--------|-----------|-------|
| `"Timer" IN isRunning()` | `"Timer[StateValue]" = "Running"` | Full equivalent |
| `"Timer" IN isPaused()` | `"Timer[StateValue]" = "Paused"` | Full equivalent |
| `"Timer" IN isCompleted()` | `"Timer[StateValue]" = "Completed"` | Full equivalent |
| `"Timer" IN isFailed()` | `"Timer[StateValue]" = "Failed"` | Full equivalent |
| `"Timer" IN isFailedRealTime()` | `"Timer[StateValue]" = "Failed"` | Forge updates state on recalculation |

#### Timer - by time

| DC JQL | Forge JQL | Notes |
|--------|-----------|-------|
| `"Timer" IN timeSpent(">", "2h")` | `"Timer[SecondsValue]" > 7200` | Full equivalent |
| `"Timer" IN timeLeft("<", "1h")` | `"Timer[LeftTimeSeconds]" < 3600` | Full equivalent |
| `"Timer" IN pauseTime(">", "30m")` | `"Timer[PauseTimeSeconds]" > 1800` | Full equivalent |
| `"Timer" IN searchByGoal(goalId)` | `"Timer[GoalTimeSeconds]" = {seconds}` | Search by goal value, not by ID |
| `"Timer" IN searchByRestartCount(">", 2)` | `"Timer[RestartCount]" > 2` | Full equivalent |

#### Timer - by dates

| DC JQL | Forge JQL | Notes |
|--------|-----------|-------|
| `"Timer" IN startInDay()` | `"Timer[FirstStartDate]" >= startOfDay()` | Full equivalent |
| `"Timer" IN startInWeek()` | `"Timer[FirstStartDate]" >= startOfWeek()` | Full equivalent |
| `"Timer" IN startInMonth()` | `"Timer[FirstStartDate]" >= startOfMonth()` | Full equivalent |
| `"Timer" IN stopInDay()` | `"Timer[StopDate]" >= startOfDay()` | Full equivalent |
| `"Timer" IN failInDay()` | `"Timer[FailDate]" >= startOfDay()` | Full equivalent |
| `"Timer" IN failInDateRange("2024-01-01", "2024-12-31")` | `"Timer[FailDate]" >= "2024-01-01" AND "Timer[FailDate]" <= "2024-12-31"` | Full equivalent |
| `"Timer" IN searchByStartDate(">", "2024-01-01")` | `"Timer[FirstStartDate]" > "2024-01-01"` | Full equivalent |
| `"Timer" IN searchByStopDate("<", "2024-06-01")` | `"Timer[StopDate]" < "2024-06-01"` | Full equivalent |
| `"Timer" IN searchByFailDate(">", "2024-01-01")` | `"Timer[FailDate]" > "2024-01-01"` | Full equivalent |
| `"Timer" IN searchByPausedDate()` | `"Timer[LastPauseDate]" IS NOT EMPTY` | Full equivalent |
| `"Timer" IN pauseInDay()` | `"Timer[LastPauseDate]" >= startOfDay()` | Full equivalent |

#### Stopwatch - by state and time

| DC JQL | Forge JQL | Notes |
|--------|-----------|-------|
| `"SW" IN isStopped()` | `"Stopwatch[StateValue]" = "Stopped"` | Full equivalent |
| *(no `isRunning` in DC for SW)* | `"Stopwatch[StateValue]" = "Running"` | **Forge extends** DC - this state wasn't searchable in DC |
| *(no `isPaused` in DC for SW)* | `"Stopwatch[StateValue]" = "Paused"` | **Forge extends** DC |
| `"SW" IN timeSpent(">", "4h")` | `"Stopwatch[SecondsValue]" > 14400` | Full equivalent |
| `"SW" IN startInDay()` | `"Stopwatch[FirstStartDate]" >= startOfDay()` | Full equivalent |
| `"SW" IN searchByRestartCount(">", 0)` | `"Stopwatch[RestartCount]" > 0` | Full equivalent |

#### Statistical comparisons (Connect)

| Connect JQL | Forge JQL |
|-------------|-----------|
| `"time is less than average:{field}" = "true"` | 📊 Separate gadgets app |
| `"time is longer than median:{field}" = "true"` | 📊 Separate gadgets app |

#### DC functions without a direct equivalent

| DC JQL | Reason | Alternative |
|--------|--------|-------------|
| `timeInStatus("Open,Done", ">", "1d")` | DC allows inline status lists in JQL. Connect and Forge bind statuses to the field setting | Create a separate field with the desired status set |
| `timeInStatusByJql(jql, ">", "1d")` | Same - inline parameterization | Create a field with a JQL filter |
| `compareFields(field1, ">", field2)` | Cross-field comparison | Standard JQL has no cross-field comparison |
| `myAutoTrackTickets()` | AutoTrack is not in Forge | No equivalent |
| `searchByCalendar(calName)` | Search by bound calendar | `"Calendar Select[CalendarName]" = "name"` (via Calendar Select field) |
| `searchByTimerConfig(configId)` | Search by timer configuration | No direct equivalent - config is bound to the field context |
| `searchByTimerScheme(schemeId)` | Search by timer scheme | No direct equivalent |

### JQL coverage summary

| Category | DC functions | Forge equivalent | Coverage |
|----------|--------------|------------------|----------|
| State search | ~10 | ✅ via `StateValue` | **100%** |
| Time search | ~15 | ✅ via `SecondsValue`, `LeftTimeSeconds`, `PauseTimeSeconds`, `GoalTimeSeconds` | **100%** |
| Date search | ~40 | ✅ via `FirstStartDate`, `StopDate`, `FailDate`, `LastPauseDate` | **100%** |
| Restart count search | ~2 | ✅ via `RestartCount` | **100%** |
| Inline status parameterization | ~6 | ❌ (statuses bound to the field) | 0% (by design) |
| Cross-field comparison | ~4 | ❌ | 0% |
| Config / scheme search | ~6 | ❌ | 0% |
| Statistical comparisons | 0 (DC) / ~6 (Connect) | 📊 Separate gadgets app | In the gadgets app |
| **Total key use cases** | | | **~90%** covered via schema properties |

---

## Events and triggers

| Capability | DC | Connect | Forge | Notes |
|------------|:--:|:-------:|:-----:|-------|
| Status change triggers | ✅ | ✅ (webhook) | ✅ (event trigger) | |
| Issue create trigger | ✅ | ✅ (webhook) | ✅ | |
| Comment triggers | ❌ | ❌ | ✅ | `ISSUE_COMMENTED`, `FIRST_COMMENT` |
| Assignee triggers | ✅ | ❌ | ✅ | `ASSIGNED`, `UNASSIGNED`, `FIRST_ASSIGNED` |
| Priority triggers | ❌ | ❌ | ✅ | `PRIORITY_CHANGED`, `UP_PRIORITY`, `DOWN_PRIORITY` |
| Label / component triggers | ❌ | ❌ | ✅ | `LABELS_CHANGED`, `COMPONENTS_CHANGED` |
| Resolution triggers | ❌ | ❌ | ✅ | `RESOLUTION_SET` / `REMOVED` |
| Custom field triggers | ❌ | ❌ | ✅ | `CUSTOM_FIELD_CHANGED` / `SET` / `REMOVED` |
| Project / type change triggers | ❌ | ❌ | ✅ | `CHANGE_PROJECT`, `CHANGE_ISSUE_TYPE` |
| Custom events (named rules) | ✅ (limited) | ❌ | ✅ (full CRUD and UI) | |
| Total trigger types | ~4 | 2 | **39** | Forge expands the surface significantly |

---

## Field configuration

| Capability | DC | Connect | Forge | Notes |
|------------|:--:|:-------:|:-----:|-------|
| Field context mapping | ✅ (scheme-based) | ✅ (project + issue type / JQL) | ✅ (field context API) | |
| JQL-based context | ❌ | ✅ | ✅ | |
| Projects + issue types context | ✅ | ✅ | ✅ | |
| `issueDateLimit` | ❌ | ❌ | ✅ | Cap calculation by issue date |
| Calculation mode (SW / Timer) | ❌ | - | ✅ | `ALL_STARTS`, `ONLY_FIRST`, `ONLY_LAST` |
| Goal configurations (Timer) | ✅ | - | ✅ | Time goals + JQL conditions |
| Restart events (Stopwatch) | ✅ | - | ✅ | |

---

## Admin UI

| Section | DC | Connect | Forge |
|---------|:--:|:-------:|:-----:|
| Field settings CRUD | ✅ | ✅ | ✅ |
| Calendar management | ✅ | ✅ | ✅ |
| Web panel management | ✅ | ✅ | ✅ |
| Timer settings | ✅ | - | ✅ |
| Stopwatch settings | ✅ | - | ✅ |
| Time Between Dates settings | - | - | ✅ |
| Calendar Select settings | - | - | ✅ |
| Custom events UI | ✅ (admin page) | ❌ | ✅ |
| Event trigger builder | ❌ | ❌ | ✅ (visual builder) |
| Batch recalculation UI | ❌ | ❌ | ✅ (job progress, errors) |
| Export / import UI | ❌ | ❌ | ✅ (10 sections) |
| Activity panel configuration | ❌ | ❌ | ✅ (global + per project) |
| Performance settings (JQL) | ✅ | ❌ | ❌ |
| Performance settings (threads) | ✅ | ❌ | ❌ |
| Auto worklog settings | ✅ | ❌ | ❌ |
| Auto track settings | ✅ | ❌ | ❌ |
| Field templates | ✅ | ❌ | ❌ |
| Action history settings | ✅ | ❌ | ❌ |
| Restore from history | ✅ | ❌ | ❌ |
| Manual timer / stopwatch control | ✅ | ❌ | ❌ |
| Report management | ✅ | ❌ | ❌ |
| Report permissions | ✅ | ❌ | ❌ |
| Dashboard settings | ❌ | ✅ | ❌ |
| Statistics settings | ❌ | ✅ | ❌ |
| Task monitoring | ❌ | ✅ | ✅ |
| Freshness monitoring | ❌ | ❌ | ✅ |
| Orphan cleanup | ❌ | ❌ | ✅ |
| Processing pause | ❌ | ❌ | ✅ |

---

## Export / import

| Capability | DC | Connect | Forge |
|------------|:--:|:-------:|:-----:|
| Configuration export | ❌ | ❌ | ✅ |
| Configuration import | ❌ | ❌ | ✅ |
| Conflict resolution (skip / overwrite) | - | - | ✅ |
| Sections: calendars, custom events, TIS / SW / Timer / TBD settings, web panels, Calendar Select | - | - | 10 sections |

**Forge-only** feature. Use it for site-to-site moves and for configuration backups.

---

## Reports and analytics

| Capability | DC | Connect | Forge | Notes |
|------------|:--:|:-------:|:-----:|-------|
| Bar charts | ✅ | ❌ | 📊 | Separate gadgets app |
| Line charts | ✅ | ❌ | 📊 | Separate gadgets app |
| Pie charts | ✅ | ❌ | 📊 | Separate gadgets app |
| Table reports | ✅ | ❌ | 📊 | Separate gadgets app |
| CSV export | ✅ | ❌ | 📊 | Separate gadgets app |
| Report permissions | ✅ | ❌ | 📊 | Separate gadgets app |
| Dashboard gadgets | ❌ | ✅ | 📊 | Separate gadgets app - will cover the Connect gadget, DC reports, helpers, and statistics |
| Statistical aggregation | ❌ | ✅ | 📊 | Separate gadgets app - min / max / sum / average / percentiles |
| Activity panel reports | ✅ (tab panels) | ❌ | ✅ (Activity panel) | In the main Forge app |

> 📊 **Dashboard gadgets and charts will ship in a separate Forge app.** It will consolidate:
>
> - DC reports (bar / line / pie charts, tables, CSV export)
> - The Connect "Calculated functions for TIS" dashboard gadget
> - Helper-field statistics (min / max / average / percentiles)
> - Connect statistical aggregation
>
> Keeping reporting in a dedicated product prevents the main app from becoming bloated and lets us offer reporting as a standalone module.

---

## Automation

| Capability | DC | Connect | Forge | Notes |
|------------|:--:|:-------:|:-----:|-------|
| Auto worklog | ✅ | ❌ | ❌ | Auto-create Jira worklogs from timer / stopwatch |
| Auto track | ✅ | ❌ | ❌ | Automatic activity tracking |
| Scheduled recalculation | ❌ | ✅ | ✅ | |
| Background processing | ✅ | ✅ | ✅ | |
| Stale issue refresh | ❌ | ✅ | ✅ | |
| Batch recalculation | ❌ | ✅ | ✅ | |

---

## History and restoration

| Capability | DC | Connect | Forge | Notes |
|------------|:--:|:-------:|:-----:|-------|
| Timer action history | ✅ (own database) | ❌ | ❌ (via Jira changelog) | DC keeps its own event log; Forge rebuilds state from the Jira changelog on every recalculation |
| Stopwatch action history | ✅ (own database) | ❌ | ❌ (via Jira changelog) | Same - Forge has no standalone event log |
| Restore from changelog | ✅ (explicit action) | ❌ | ✅ (by design) | Forge **always** recalculates from the changelog on every run |
| Manual timer / stopwatch control | ✅ | ❌ | ❌ | Manual value correction |

---

## Unique features per version

### Only in DC

1. **Transition Counter field** - counts transitions between specific status pairs (from → to). Useful for metrics like "how many times did this issue return to Open".
2. **Is Status field** - a boolean that reports "this issue is currently in one of the selected statuses". Handy for quick filters and conditional logic in automations.
3. **JQL Function Field** - periodically runs a JQL query and stores the result as the field value, letting you build calculated fields from arbitrary JQL expressions.
4. **270+ custom JQL functions** - a rich search surface. Forge and Connect cover ~90% of the same use cases via schema properties (see the JQL section), but inline status parameterization and cross-field comparison stay DC-only.
5. **Auto worklog** - automatically creates Jira worklogs based on timer / stopwatch data when the timer or stopwatch stops.
6. **Auto track** - automatically tracks user activity and manages tracking state based on Jira events.
7. **Field templates** - predefined field-value configurations you can apply quickly to new fields.
8. **Action history** - a detailed log of every timer / stopwatch event (start, stop, pause, fail with timestamp and author), shown in a dedicated issue panel.
9. **Manual timer / stopwatch control** - REST API and UI for forcing start / stop / pause / fail on a timer or stopwatch and for correcting stored values.
10. **Performance tuning** - dedicated admin pages for JQL caching and multithreading (thread pool size, queue limits).

### Only in Connect

1. **Statistical aggregation** - min, max, sum, average, and 19 percentile values (5%, 10% … 95%, 99%) calculated periodically in the background. Enables "your time vs average / median" displays. Moving to 📊 the separate gadgets app.
2. **Dashboard gadget** - "Calculated functions for Time in Status". Configurable dashboard widget with JQL filter, status grouping, and statistical function selection. Moving to 📊 the separate gadgets app.
3. **Statistical JQL aliases** - entity properties such as `timeLess{Function}` and `timeLonger{Function}` let you search for issues with statistical comparisons ("time is less than average").

### Only in Forge

1. **Time Between Dates** - a new field type that computes the difference between two date / datetime fields on an issue. Supports work calendars, absolute mode, and goal time. No equivalent in DC or Connect.
2. **Calendar Select** - picks a work calendar at the individual-issue level. Equivalent to the DC Calendar Field but with a cleaner architecture (context-based configs bound to the field context), so different issues can use different calendars for the same field.
3. **39 event trigger types** - a vastly expanded trigger surface compared to DC (~4 types) and Connect (2 types). Includes comments, priorities, labels, components, resolution, custom fields, and project / issue-type changes, and each trigger can invoke Custom Events.
4. **Custom events with full UI** - named, reusable trigger rules with full CRUD, a visual Event Trigger Builder, validation, and reuse inside stopwatch and timer configurations.
5. **Export / import of configuration** - full export and import of every setting (10 sections: calendars, custom events, TIS / SW / Timer / TBD settings, web panels, Calendar Select). Conflict resolution (skip / overwrite) included. Used for site-to-site moves and backups.
6. **Activity Panel** - three issue-level reports built on the fly from the Jira changelog: R1 (time per status broken down by assignee), R2 (chronological transition history), R3 (time per assignee). A single Forge module with both global and per-project configuration.
7. **Batch job management** - a full UI for monitoring and controlling recalculation jobs: progress, errors, cancellation, restart. Includes freshness monitoring per field / context.
8. **Orphan cleanup** - automatically finds and removes stale mappings when a field or context is deleted in Jira.
9. **Processing pause** - a global pause switch for all async processing, useful during maintenance or troubleshooting without stopping the app.

---

## Summary: picking the right version

- **You're on Data Center and evaluating Cloud?** Forge now covers the core of the DC product - TIS, timers, stopwatches, work calendars, panels, and ~90% of the DC JQL use cases through schema properties. Reporting and helper fields will come through the separate dashboard gadgets app. See the [DC → Forge migration guide]({{ site.baseurl }}/docs/time-in-status/migration-to-forge/).
- **You're on Connect and upgrading?** Forge is a strict superset for anything you use today: all the Connect TIS calculation modes and formats are supported, plus timers, stopwatches, Time Between Dates, event triggers, custom events, export / import, and the Activity panel. See the [Connect → Forge migration guide]({{ site.baseurl }}/docs/tis-cloud/migration-to-forge/).
- **You need charts, percentiles, or dashboard aggregation?** Watch for the separate Forge dashboard gadgets app. It will consolidate DC reporting, helper fields, and Connect statistical aggregation in one place without bloating the main app.
