---
title: Timer issue panel
key: time-in-status-cloud-forge
excerpt: "Configure Timer web panels to display timer state, goal, time remaining, and failure date on Jira issue views."
category: display-customization
tags: [doc, cloud, time-in-status, forge, timer, web-panels, issue-panel, sla, configuration]
---

* TOC
{:toc}

---

## Overview

The Timer issue panel displays the **timer state, time spent, goal, time remaining, and failure date** directly on the issue view. It provides at-a-glance SLA status for each issue.

<!-- [Screenshot: tmr-panel-on-issue] -->

---

## Creating a web panel

1. Open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Timer** tab > **Web Panels**
2. Click **Create**
3. Configure the panel settings
4. Click **Save**
5. Enable [panel visibility](/docs/time-in-status-cloud-forge/panel-visibility) for the relevant projects

---

## Settings reference

### Scope

| Setting | Description |
|---------|-------------|
| **Name** | Unique panel name (max 150 characters). |
| **Projects** | Which projects show this panel. Empty = all. |
| **Issue Types** | Which issue types show this panel. Empty = all. |

### Event triggers

Same structure as Stopwatch panels - the panel has its own event configuration:

| Slot | Description |
|------|-------------|
| **Start Events** | What starts the timer |
| **Pause Events** | What pauses it |
| **Stop Events** | What stops/completes it |
| **Restart Events** | What restarts it |

See [Event triggers reference](/docs/time-in-status-cloud-forge/event-triggers).

| Setting | Description |
|---------|-------------|
| **Allow Restart from Any State** | Restart from Completed/Failed states too. |
| **Calculate Type** | ALL_STARTS, ONLY_FIRST_START, or ONLY_LAST_START. |

### Goals

| Setting | Description |
|---------|-------------|
| **Default Goal** | The fallback goal time. |
| **Goals** | JQL-based conditional goals. |

See [Timer goal configuration](/docs/time-in-status-cloud-forge/timer-goals) for details.

### Calendar and display

| Setting | Description |
|---------|-------------|
| **Calendar** | Work calendar. Default is 24x7. |
| **Calendar Field** | Optional Calendar Select field. |
| **Time Format** | See [Time formats](/docs/time-in-status-cloud-forge/time-formats). |
| **Display Mode** | See [Timer display modes](/docs/time-in-status-cloud-forge/timer-field-settings#display-modes). |
| **Use Rounding for Display** | Round time for display. |
| **Show Zero Value** | Show panel when time is zero. |

### Behavior

| Setting | Description |
|---------|-------------|
| **Weight** | Panel ordering. |
| **Periodic Update** | Auto-refresh every 60 seconds. |

---

## Panel display

The panel shows (depending on display mode):

- **State** - Inactive, Running, Paused, Completed, or Failed
- **Time spent** - elapsed time since start
- **Goal time** - the target time
- **Time remaining** - how much time is left before failure
- **Pause time** - accumulated pause time
- **Failed date** - when the timer exceeded the goal

---

## Tips

- **Display mode matters**: choose a display mode that gives users the most useful information. For SLA tracking, **LEFT_TIME_AND_FAILED_DATE** shows both the countdown and when the SLA was breached.
- **Periodic Update**: essential for running timers so users see the countdown update in real time.
- **Different goals per panel**: web panel goals are independent from field setting goals. You can show different SLA views on the same issue.
