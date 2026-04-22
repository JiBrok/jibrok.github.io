---
title: Panel visibility and project settings
key: time-in-status-cloud-forge
excerpt: "Control which issue panels (Time in Status, Stopwatch, Timer, Activity) are visible per project and issue type."
category: display-customization
tags: [doc, cloud, time-in-status, forge, panel-visibility, web-panels, issue-panel, configuration]
---

* TOC
{:toc}

---

## How panel visibility works

Time in Status (Forge) provides four types of issue panels:

- **Time in Status** panel - status time breakdown
- **Stopwatch** panel - stopwatch state and time
- **Timer** panel - timer state, goal, and time left
- **Activity** panel - status reports on the Activity tab

By default, **no panels are visible**. You need to enable them for the projects and issue types where you want them to appear.

Panel visibility is controlled through a Jira property called `tis-cloud-panels`. This property can be set at two levels:

- **App level** - applies to all projects (global default)
- **Project level** - overrides the app-level setting for a specific project

---

## The `tis-cloud-panels` property

The property is a JSON object with four keys:

```json
{
  "tis": ["*"],
  "sw": ["*"],
  "tmr": ["10001", "10002"],
  "act": ["*"]
}
```

Each key controls one panel type:

| Key | Panel |
|-----|-------|
| `tis` | Time in Status panel |
| `sw` | Stopwatch panel |
| `tmr` | Timer panel |
| `act` | Activity panel |

Each value is an array of **issue type IDs** for which the panel should be visible:

- `["*"]` - visible for **all issue types**
- `["10001", "10002"]` - visible only for specific issue type IDs
- `[]` or key absent - **not visible**

---

## Configuring visibility

### From the admin panel

The app provides a way to manage panel visibility from the admin panel. When you configure web panels in the Time in Status, Stopwatch, or Timer tabs, the app automatically syncs the visibility settings.

You can also use the **Sync panel visibility** action to update the visibility configuration across all projects.

### How the display condition works

The app uses Jira's `displayConditions.jiraExpression` to check visibility. For each panel, Jira evaluates:

1. Does the **project** have a `tis-cloud-panels` property with this panel type enabled for this issue type?
2. If not, does the **app** have a global `tis-cloud-panels` property with this panel type enabled?

If either check passes, the panel is displayed.

---

## Examples

### Enable all panels for all projects

Set the app-level property:

```json
{
  "tis": ["*"],
  "sw": ["*"],
  "tmr": ["*"],
  "act": ["*"]
}
```

### Enable only Time in Status and Activity panels

```json
{
  "tis": ["*"],
  "act": ["*"]
}
```

### Enable Timer panel only for Bug issue type in a specific project

Set the project-level property for that project:

```json
{
  "tmr": ["10001"]
}
```

Where `10001` is the issue type ID for Bug.

---

## Tips

- **Web panels vs panel visibility**: Creating a web panel in the admin panel defines **what** the panel shows (which statuses, calendar, format). Panel visibility controls **where** it appears (which projects and issue types). You need both.
- **Issue type IDs**: To find issue type IDs, go to Jira Settings > Issues > Issue types, and check the URL when clicking an issue type.
- **Changes may be cached**: Jira may cache panel visibility. Changes usually appear within a few minutes. Refreshing the issue page can help.
