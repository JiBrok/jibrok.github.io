---
title: Activity panel
key: time-in-status-cloud-forge
excerpt: "Configure the Activity panel - three built-in reports on the issue Activity tab: time by status, transition history, and time by assignee."
category: display-customization
tags: [doc, cloud, time-in-status, forge, activity-panels, reports, status-tracking, transition-history, assignee]
---

* TOC
{:toc}

---

## Overview

The Activity panel appears on the **Activity tab** of Jira issues. It provides three reports that help teams understand the lifecycle of an issue - how long it spent in each status, who worked on it, and the complete transition history.

Unlike web panels (which appear in the issue sidebar), the Activity panel is integrated into the Activity feed.

---

## Reports

### R1 - Time in Status

Shows a table of statuses with the time spent in each. Each status row includes:

- **Status name** with category color indicator
- **Total time** spent in that status
- **Current status** marker for the active status
- **Assignee breakdown** - time per assignee within each status (expandable)

<!-- [Screenshot: activity-panel-r1] -->

### R2 - Transition History

Shows the complete chronological history of status changes:

- **From status** → **To status** with category colors
- **Timestamp** of the transition
- **Author** who made the change
- **Time in source status** - how long the issue was in the previous status before the transition

<!-- [Screenshot: activity-panel-r2] -->

### R3 - Time by Assignee

Shows total time grouped by each person who was assigned the issue:

- **Assignee name** (or "Unassigned" for periods without an assignee)
- **Total time** the issue was assigned to that person
- **Status breakdown** - time per status while assigned to that person (expandable)

<!-- [Screenshot: activity-panel-r3] -->

---

## Configuration

Activity panel configuration is managed in the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Activity Panels** tab.

### Global settings

The global configuration applies to all projects unless overridden by a project-specific configuration.

| Setting | Description |
|---------|-------------|
| **Show Reports** | Which reports to display: R1 (Time in Status), R2 (Transition History), R3 (Time by Assignee). At least one must be selected. |
| **Calendar** | Work calendar for time calculations. Default is 24x7. |
| **Time Format** | How time values are displayed. See [Time formats](/docs/time-in-status-cloud-forge/time-formats). |
| **Status Order** | How to sort statuses: Default, Name A-Z, Name Z-A, Time ascending, Time descending. |
| **Ignore Statuses** | Statuses to exclude from reports. These statuses will not appear in R1 or R3, and transitions to/from them will still appear in R2 but without time calculation. |

<!-- [Screenshot: activity-panel-global-config] -->

### Project overrides

You can override global settings for specific projects. This is useful when different projects need different reports, calendars, or status exclusions.

1. Click **Add project override**
2. Select the project(s)
3. Configure the override settings (same options as global)
4. Click **Save**

<!-- [Screenshot: activity-panel-project-config] -->

Project overrides completely replace the global settings for the selected projects - they do not merge with global settings.

---

## Visibility

The Activity panel visibility is controlled through [panel visibility settings](/docs/time-in-status-cloud-forge/panel-visibility) using the `act` key in the `tis-cloud-panels` property.

To enable the Activity panel for all projects and issue types:

```json
{
  "act": ["*"]
}
```

---

## Tips

- **Performance**: Activity panel reports are calculated on demand when the issue is viewed. For issues with very long histories, the initial load may take a moment.
- **Calendar affects time values**: if you use a business-hours calendar, the time values in reports will only count working hours. Non-working time is excluded.
- **Ignore statuses**: use this to exclude workflow-internal statuses (like "Backlog" or "Waiting for Deployment") that clutter the reports.
- **R2 for auditing**: the Transition History report (R2) is useful for compliance and process auditing, as it shows exactly when each transition happened and who made it.
