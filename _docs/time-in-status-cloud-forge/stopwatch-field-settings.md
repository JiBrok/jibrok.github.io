---
title: Stopwatch - Field setting reference
key: time-in-status-cloud-forge
excerpt: "Complete reference for all Stopwatch field setting options - events, calculation types, calendars, display modes, and filtering."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, stopwatch, field-settings, configuration, event-triggers]
---

* TOC
{:toc}

---

## Overview

A Stopwatch field setting defines the rules for how a stopwatch accumulates time. You create and manage field settings in the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Stopwatch** tab > **Field Settings**.

Each field setting is then [bound to one or more field contexts](/docs/time-in-status-cloud-forge/field-context-config).

---

## General

| Setting | Description |
|---------|-------------|
| **Name** | Unique name for this setting (max 150 characters). Used to identify the setting in the admin panel and context configuration. |
| **Active** | Toggle on/off. When inactive, the field does not calculate or update values. |

---

## Event triggers

Event triggers control when the stopwatch changes state. At least one trigger across all slots is required.

| Slot | Effect | Description |
|------|--------|-------------|
| **Start Events** | Inactive/Paused → Running | Triggers that start or resume the stopwatch |
| **Pause Events** | Running → Paused | Triggers that pause the stopwatch |
| **Stop Events** | Running/Paused → Stopped | Triggers that stop the stopwatch |
| **Restart Events** | Paused (or any) → Running | Triggers that reset accumulated time and start again |

See [Event triggers reference](/docs/time-in-status-cloud-forge/event-triggers) for all available trigger types.

### Allow restart from any state

| Setting | Description |
|---------|-------------|
| **doRestartFromAnyState** | When **off** (default): restart only works from Paused state. When **on**: restart also works from Stopped state. |

---

## Calculate type

Determines how the stopwatch aggregates time when it restarts.

| Value | Description |
|-------|-------------|
| **ALL_STARTS** | Accumulate time from all start-stop cycles. The total time is the sum of all running periods. |
| **ONLY_FIRST_START** | Only count the first start-stop cycle. Subsequent restarts are ignored for the total time. |
| **ONLY_LAST_START** | Only count the most recent start-stop cycle. Previous cycles are discarded. |

---

## Calendar

| Setting | Description |
|---------|-------------|
| **Default Calendar** | The work calendar used for time calculation. Default is 24x7. Select a custom calendar to count only business hours. See [Work calendars](/docs/time-in-status-cloud-forge/work-calendar). |
| **Calendar Field** | Optional. Select a [Calendar Select](/docs/time-in-status-cloud-forge/calendar-select-field) field to allow per-issue calendar override. |
| **Calendar Overrides** | Optional. A list of JQL-based calendar overrides. Each entry has a JQL condition and a calendar. The first matching JQL determines the calendar for an issue. |

**Calendar override priority** (highest to lowest):
1. Calendar overrides (first matching JQL)
2. Calendar Select field value (per-issue)
3. Default calendar

---

## Display

| Setting | Description |
|---------|-------------|
| **Time Format** | How time is displayed. See [Time formats](/docs/time-in-status-cloud-forge/time-formats) for the full list. |
| **Display Mode** | Visual format of the field value (see table below). |
| **Use Rounding** | Round time values for calculation precision. |
| **Use Rounding for Display** | Round time values for display only (does not affect stored values). |

### Display modes

| Mode | Description |
|------|-------------|
| **TIME_SPENT** | Shows time as text only (e.g., "2h 30m") |
| **TIME_SPENT_ICON** | Shows time with a state icon on the right (e.g., "2h 30m ▶") |
| **ICON_TIME_SPENT** | Shows a state icon on the left with time (e.g., "▶ 2h 30m") |
| **PAUSE_TIME** | Shows accumulated pause time instead of active time |

---

## Restrictions

| Setting | Description |
|---------|-------------|
| **Issue Date Limit** | Only process issues created or updated after this date. Useful for avoiding recalculation of very old issues. |
| **JQL Filter** | Additional JQL condition (max 4000 characters, no ORDER BY). Only issues matching this JQL will be processed. |

---

## Stopwatch states

| State | Description |
|-------|-------------|
| **Inactive** | Initial state. No events have triggered the stopwatch yet. |
| **Running** | Stopwatch is actively accumulating time. |
| **Paused** | Stopwatch is paused. Time does not accumulate. |
| **Stopped** | Stopwatch is stopped. Final time is recorded. |

### State transitions

```
Inactive ──[Start]──→ Running
Running  ──[Pause]──→ Paused
Running  ──[Stop]───→ Stopped
Paused   ──[Start]──→ Running
Paused   ──[Restart]→ Running (resets time)
Paused   ──[Stop]───→ Stopped
Stopped  ──[Restart]→ Running (resets time, only if doRestartFromAnyState is on)
```
