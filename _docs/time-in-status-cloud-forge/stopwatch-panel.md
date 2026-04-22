---
title: Stopwatch issue panel
key: time-in-status-cloud-forge
excerpt: "Configure Stopwatch web panels to display stopwatch state and time on Jira issue views."
category: display-customization
tags: [doc, cloud, time-in-status, forge, stopwatch, web-panels, issue-panel, configuration]
---

* TOC
{:toc}

---

## Overview

The Stopwatch issue panel displays the **stopwatch state and accumulated time** directly on the issue view. It shows whether the stopwatch is running, paused, or stopped, along with the time spent and pause time.

You can create multiple stopwatch panels with different event configurations.

<!-- [Screenshot: sw-panel-on-issue] -->

---

## Creating a web panel

1. Open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Stopwatch** tab > **Web Panels**
2. Click **Create**
3. Configure the panel settings (see reference below)
4. Click **Save**
5. Enable [panel visibility](/docs/time-in-status-cloud-forge/panel-visibility) for the relevant projects

<!-- [Screenshot: sw-web-panel-form] -->

---

## Settings reference

### Scope

| Setting | Description |
|---------|-------------|
| **Name** | Unique panel name (max 150 characters). |
| **Projects** | Which projects show this panel. Empty = all. |
| **Issue Types** | Which issue types show this panel. Empty = all. |

### Event triggers

The panel uses its own event configuration (independent from field settings):

| Slot | Description |
|------|-------------|
| **Start Events** | What starts the stopwatch in this panel |
| **Pause Events** | What pauses it |
| **Stop Events** | What stops it |
| **Restart Events** | What restarts it |

See [Event triggers reference](/docs/time-in-status-cloud-forge/event-triggers) for all trigger types.

| Setting | Description |
|---------|-------------|
| **Allow Restart from Any State** | When on, restart works from Stopped state too. |
| **Calculate Type** | How to aggregate time: ALL_STARTS, ONLY_FIRST_START, or ONLY_LAST_START. |

### Calendar and display

| Setting | Description |
|---------|-------------|
| **Calendar** | Work calendar. Default is 24x7. |
| **Calendar Field** | Optional Calendar Select field for per-issue override. |
| **Time Format** | See [Time formats](/docs/time-in-status-cloud-forge/time-formats). |
| **Display Mode** | TIME_SPENT, TIME_SPENT_ICON, ICON_TIME_SPENT, or PAUSE_TIME. |
| **Use Rounding for Display** | Round time for display. |
| **Show Zero Value** | Show panel when time is zero. |

### Behavior

| Setting | Description |
|---------|-------------|
| **Weight** | Panel ordering (lower = higher position). |
| **Periodic Update** | Auto-refresh every 60 seconds. Recommended for running stopwatches. |

---

## Panel display

The panel shows:

- **State indicator** - Inactive, Running, Paused, or Stopped
- **Time spent** - accumulated running time
- **Pause time** - accumulated pause time (if display mode includes it)

The panel auto-refreshes when Periodic Update is enabled, so users see updated time without reloading the page.

---

## Tips

- **Independent from field settings**: web panel event configuration is separate from the Stopwatch field setting. This lets you show a panel with different events than the custom field.
- **Periodic Update**: enable this for panels that track active work, so the displayed time updates automatically.
