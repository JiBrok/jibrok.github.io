---
title: Timer - Field setting reference
key: time-in-status-cloud-forge
excerpt: "Complete reference for all Timer field setting options - events, goals, calculation types, calendars, display modes, and filtering."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, timer, field-settings, configuration, sla, goals]
---

* TOC
{:toc}

---

## Overview

A Timer field setting defines the rules for how a timer counts down toward its goal. Create and manage field settings in the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Timer** tab > **Field Settings**.

Each field setting is [bound to one or more field contexts](/docs/time-in-status-cloud-forge/field-context-config).

---

## General

| Setting | Description |
|---------|-------------|
| **Name** | Unique name for this setting (max 150 characters). |
| **Active** | Toggle on/off. When inactive, the field does not calculate or update values. |

---

## Event triggers

Same structure as Stopwatch. At least one trigger across all slots is required.

| Slot | Effect | Description |
|------|--------|-------------|
| **Start Events** | Inactive/Paused → Running | Triggers that start or resume the timer |
| **Pause Events** | Running → Paused | Triggers that pause the timer |
| **Stop Events** | Running/Paused → Completed | Triggers that complete the timer (if within goal) |
| **Restart Events** | Paused (or any) → Running | Triggers that reset and restart the timer |

See [Event triggers reference](/docs/time-in-status-cloud-forge/event-triggers) for all trigger types.

### Allow restart from any state

| Setting | Description |
|---------|-------------|
| **doRestartFromAnyState** | When **off** (default): restart only from Paused. When **on**: restart also from Completed and Failed. |

---

## Goals

Goals define the target time for the timer. See [Timer goal configuration](/docs/time-in-status-cloud-forge/timer-goals) for full details.

| Setting | Description |
|---------|-------------|
| **Default Goal** | The fallback goal applied when no conditional goal matches. |
| **Goals** | A list of conditional goals with JQL conditions. The first matching goal wins. |
| **Allow Change Goal** | When on, re-evaluate goals during recalculation (goals can change as issue data changes). |

---

## Calculate type

| Value | Description |
|-------|-------------|
| **ALL_STARTS** | Accumulate time from all start-stop cycles. |
| **ONLY_FIRST_START** | Only count the first cycle. |
| **ONLY_LAST_START** | Only count the most recent cycle. |

---

## Calendar

| Setting | Description |
|---------|-------------|
| **Default Calendar** | Work calendar for time calculation. Default is 24x7. |
| **Calendar Field** | Optional [Calendar Select](/docs/time-in-status-cloud-forge/calendar-select-field) field for per-issue override. |
| **Calendar Overrides** | JQL-based calendar overrides. First matching JQL determines the calendar. |

---

## Display

| Setting | Description |
|---------|-------------|
| **Time Format** | How time is displayed. See [Time formats](/docs/time-in-status-cloud-forge/time-formats). |
| **Display Mode** | Visual format (see table below). |
| **Use Rounding** | Round time for calculation. |
| **Use Rounding for Display** | Round time for display only. |

### Display modes

| Mode | Description |
|------|-------------|
| **TIME_SPENT** | Time spent (e.g., "2h 30m") |
| **TIME_SPENT_ICON** | Time spent with icon on the right |
| **ICON_TIME_SPENT** | Icon on the left with time spent |
| **LEFT_TIME** | Time remaining until goal |
| **LEFT_TIME_ICON** | Time remaining with icon |
| **ICON_LEFT_TIME** | Icon with time remaining |
| **GOAL_TIME** | Goal time value |
| **GOAL_TIME_ICON** | Goal time with icon |
| **ICON_GOAL_TIME** | Icon with goal time |
| **PAUSE_TIME** | Accumulated pause time |
| **FAILED_DATE** | Date/time when the timer failed (exceeded goal) |

---

## Restrictions

| Setting | Description |
|---------|-------------|
| **Issue Date Limit** | Only process issues created or updated after this date. |
| **JQL Filter** | Additional JQL filter (max 4000 characters, no ORDER BY). |

---

## Timer states

| State | Description |
|-------|-------------|
| **Inactive** | No events have triggered the timer. |
| **Running** | Timer is actively counting. |
| **Paused** | Timer is paused. |
| **Completed** | Timer stopped within goal time. |
| **Failed** | Elapsed time exceeded goal time. |

### State transitions

```
Inactive   ──[Start]──→ Running
Running    ──[Pause]──→ Paused
Running    ──[Stop]───→ Completed (if time <= goal)
Running    ──[time > goal]→ Failed
Paused     ──[Start]──→ Running
Paused     ──[Restart]→ Running (resets time)
Paused     ──[Stop]───→ Completed
Completed  ──[Restart]→ Running (only if doRestartFromAnyState)
Failed     ──[Restart]→ Running (only if doRestartFromAnyState)
Failed     ──[Stop]───→ Failed (state unchanged, but stop event recorded)
```
