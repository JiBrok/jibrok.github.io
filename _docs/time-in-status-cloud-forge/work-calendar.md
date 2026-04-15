---
title: Work calendars
key: time-in-status-cloud-forge
excerpt: "Create work calendars for Time in Status (Forge) with business hours, time zones, breaks, holidays, and repeating schedules."
category: time-management
tags: [doc, cloud, time-in-status, forge, business-calendar, status-tracking, configuration]
---

> **Draft: Forge version documentation - work in progress.**

Work calendars define which hours count as working time. Every Time in Status, Stopwatch, Timer, and Time Between Dates field can bind to a calendar, so that time outside working hours (nights, weekends, holidays, breaks) is excluded from calculations.

* TOC
{:toc}

---

## Where calendars live

Calendars are managed on the **Calendars** tab of the admin panel:

**Settings ⚙ → Apps → Manage apps → Time in Status → Configure → Calendars**

The admin panel ships with a built-in **24/7 calendar** that always counts every second. Every field type can fall back to this calendar if you do not bind a custom one.

---

## Calendar types

Two calendar types are supported:

- **24/7** - every hour counts. This is the built-in default and cannot be edited.
- **Custom** - a calendar you define yourself, with days of the week, break times, custom days, and a time zone.

Pick the type when you create the calendar.

---

## Creating a custom calendar

1. Go to the **Calendars** tab.
2. Click **Create calendar**.
3. Enter:
   - **Name** - how the calendar appears in field setting pickers
   - **Description** (optional)
   - **Time zone** (`zoneId`) - calculations run in this zone regardless of viewer time zones
   - **Type** - `Custom`
4. Configure the **days of the week** (see below).
5. Optionally add **break times** and **custom days**.
6. Optionally adjust the **unit conversions** for long time formats (see Advanced).
7. Click **Save**.

You can edit a calendar at any time. Changes apply to new calculations immediately; to re-process historical issues, run a full recalculation on the affected field settings. See [Recalculation](/docs/time-in-status-cloud-forge/recalculation).

---

## Days of the week

Each weekday (Monday through Sunday) has its own configuration:

| Property | Meaning |
|---|---|
| **Type** | `Work`, `Holiday`, or `Weekend`. Non-work days are always zero seconds regardless of start/end hours. |
| **Start / End time** | Working hours on that day (for example `09:00 – 18:00`). |
| **Break times** | One or more intervals subtracted from the working hours - for example a lunch break. |
| **Use default break times** | Toggle to apply the calendar's default breaks rather than defining breaks per day. |

Defaults:

- **Monday - Friday** are created as `Work` days from 09:00 to 18:00
- **Saturday / Sunday** are created as `Weekend`
- No breaks are configured

Adjust to your team's schedule. Intervals must not overlap.

---

## Break times

Break times are intervals of the day that are excluded from working hours. Two ways to define them:

1. **Default break times** at the calendar level. Pick them once, then enable **Use default break times** on each work day to apply them.
2. **Per-day break times** configured directly on a weekday entry.

Common use cases:

- Lunch break (for example `13:00 – 14:00`)
- Mid-day shift changeover
- Scheduled daily standup excluded from SLA calculations

---

## Custom days

Custom days override the weekday schedule for specific dates. Use them for holidays, company events, or one-off changes.

| Property | Meaning |
|---|---|
| **Date** | `YYYY-MM-DD` - the specific date |
| **Type** | `Work`, `Holiday`, or `Weekend` |
| **Start / End time** | Optional hours if it is a partial work day |
| **Break times** | Same as weekday breaks |
| **Repeat** | `None`, `Week`, `Two-week`, `Month`, or `Year` - see below |

### Repeat patterns

| Pattern | Example use |
|---|---|
| **Week** | A recurring weekly event that is not tied to the normal weekday schedule |
| **Two-week** | Alternating on-call shifts, bi-weekly maintenance windows |
| **Month** | Monthly retrospective, end-of-month cutoff |
| **Year** | National holidays and annual events (for example `2025-12-25` set to `Holiday` with `Year` repeat) |

---

## Time zones

The calendar's `zoneId` controls **when** working hours begin and end on each calendar day. For example, a calendar with zone `Europe/Berlin` and work hours `09:00 – 18:00` starts at 09:00 Berlin local time.

Display is separate. Panels and fields render time values in the viewer's browser time zone where applicable, so users in different regions see consistent labels.

---

## Advanced: unit conversions

The Forge version supports 46 [time formats](/docs/time-in-status-cloud-forge/time-formats), including units like days, weeks, months, and years. These units are built from the calendar's **unit conversions**:

| Setting | Default |
|---|---|
| `secInHour` | 3600 |
| `secInDay` | 86 400 |
| `secInWeek` | 604 800 |
| `secInMonth` | 2 629 800 |
| `secInYear` | 31 557 600 |

If your business day is 8 hours long (not 24) and you want `D13` (`10d`) to reflect **business days** rather than calendar days, set `secInDay` to `28800` (8 × 3600). The same logic applies to week, month, and year units.

> Changing unit conversions rescales how long-form time formats render. Stored values in seconds are not affected.

---

## Binding a calendar to a field

Every field setting has a **Default calendar** picker. Optionally, bind a **Calendar Select** custom field to let users override the calendar per issue - see [Calendar Select field](/docs/time-in-status-cloud-forge/calendar-select-field).

Stopwatch and Timer field settings additionally support **calendar overrides by JQL**: add rules like `project = PROJ AND priority = Highest → Calendar "24/7"` to apply different calendars to different slices of issues. See the respective field pages for details.

---

## Next steps

- [Create a Time in Status field](/docs/time-in-status-cloud-forge/time-in-status-field-create)
- [Field setting reference](/docs/time-in-status-cloud-forge/time-in-status-field-settings)
- [Calendar Select field](/docs/time-in-status-cloud-forge/calendar-select-field)
