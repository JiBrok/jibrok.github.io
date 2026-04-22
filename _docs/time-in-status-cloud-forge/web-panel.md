---
title: Time in Status issue panel
key: time-in-status-cloud-forge
excerpt: "Configure Time in Status web panels to display per-status time breakdown on Jira issue views."
category: display-customization
tags: [doc, cloud, time-in-status, forge, web-panels, issue-panel, status-tracking, configuration]
---

* TOC
{:toc}

---

## Overview

The Time in Status issue panel displays a **per-status time breakdown** directly on the issue view. Each panel shows how much time the issue has spent in selected statuses, calculated against a work calendar.

You can create multiple panels with different configurations - for example, one panel showing all statuses and another showing only "In Progress" and "In Review."

<!-- [Screenshot: tis-web-panel-on-issue] -->

---

## Creating a web panel

1. Open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Time in Status** tab > **Web Panels**
2. Click **Create**
3. Configure the panel settings (see reference below)
4. Click **Save**
5. Enable [panel visibility](/docs/time-in-status-cloud-forge/panel-visibility) for the projects where you want the panel to appear

<!-- [Screenshot: tis-web-panel-form] -->

---

## Settings reference

### Scope

| Setting | Description |
|---------|-------------|
| **Name** | Unique panel name (max 150 characters). Displayed as the panel header on issues. |
| **Projects** | Which projects show this panel. Empty = all projects. |
| **Issue Types** | Which issue types show this panel. Empty = all issue types. |

### Status configuration

| Setting | Description |
|---------|-------------|
| **Status Mode** | How to select which statuses to display. Options: **Selected Statuses** (pick specific statuses), **Current Status** (only the current status), **All Statuses** (every status the issue has been in), **Selected Categories** (pick status categories). |
| **Statuses** | When Status Mode is Selected Statuses - choose which statuses to display. |
| **Status Categories** | When Status Mode is Selected Categories - choose categories (To Do, In Progress, Done). |
| **Status Order** | How to sort statuses in the panel: Default (time descending), Name A-Z, Name Z-A, ID ascending, ID descending, Time ascending, Time descending. |

### Calendar

| Setting | Description |
|---------|-------------|
| **Calendar** | Work calendar for time calculation. Default is 24x7. |
| **Calendar Field** | Optional [Calendar Select](/docs/time-in-status-cloud-forge/calendar-select-field) field for per-issue override. |

### Display

| Setting | Description |
|---------|-------------|
| **Time Format** | How time is displayed. See [Time formats](/docs/time-in-status-cloud-forge/time-formats). |
| **Show Type** | **Total Time** - shows the total across all selected statuses. **Time in Status** - shows time for each individual status. |
| **Display Mode** | **TIME** - text only. **TIME_ICON** - with status category icon. |
| **Use Rounding for Display** | Round time values when displaying (does not affect stored data). |
| **Show Zero Value** | Show statuses with zero time. When off, statuses with no time are hidden. |

### Behavior

| Setting | Description |
|---------|-------------|
| **Weight** | Panel ordering. Lower weight = higher position. Panels are displayed in ascending weight order. |
| **Periodic Update** | Auto-refresh the panel every 60 seconds. Useful for issues in active statuses where time is accumulating. |

---

## Tips

- **Multiple panels**: create different panels for different views. For example, a "Development Time" panel showing only development statuses and a "Full Lifecycle" panel showing all statuses.
- **Panel visibility**: creating a web panel defines *what* it shows. You also need to enable *where* it appears using [panel visibility settings](/docs/time-in-status-cloud-forge/panel-visibility).
- **Weight for ordering**: if you have multiple panels on the same issue, use weight to control the display order.
- **Calendar matters**: time displayed in panels respects the selected calendar. Business hours calendar will show less time than 24x7 for the same period.
