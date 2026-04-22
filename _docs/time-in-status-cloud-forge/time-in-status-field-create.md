---
title: Create a Time in Status field
key: time-in-status-cloud-forge
excerpt: "Create a Time in Status custom field in Jira Cloud (Forge), bind it to a field context, and attach a reusable field setting."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, field-creation, setup, configuration]
---

* TOC
{:toc}

---

## How fields work on Forge

In the Forge version, every Time in Status field is a **standard Jira custom field** created through Jira's regular custom field screen. The app registers the field type and provides a custom configuration panel that appears inside each Jira **field context**.

Settings are stored as reusable **Field settings** in the admin panel. One field setting can be bound to many contexts, so you can share the same calculation rules across projects or issue types without duplicating configuration.

Conceptually:

```
Jira custom field  (e.g. "Time in Resolving")
  └── Field context A  (Project PROJ, Issue type Bug)
        └── bound to → Field setting "Bug resolving time"
  └── Field context B  (Project PROJ, Issue type Task)
        └── bound to → Field setting "Task resolving time"
```

---

## Step 1. Create the Jira custom field

1. Sign in to your Jira Cloud site as an administrator.
2. Go to **Settings ⚙ → Issues → Custom fields**.
3. Click **Create custom field**.
4. In the field type picker, search for **Time in Status** (provided by JiBrok) and select it.
5. Give the field a name that describes what it measures (for example, `Time in Resolving`).
6. Choose the **projects** and **issue types** this field should apply to. Jira creates a field context for each scope you choose.
7. Add the field to the screens where you want it visible, then save.

> The same screen is where you can add the related Forge field types - **Stopwatch**, **Timer**, **Time Between Dates**, and **Calendar Select**. Each has its own configuration panel, described on its own page.

---

## Step 2. Bind the field context to a field setting

Each field context must be bound to a **field setting** before calculations start.

1. Still on the custom field's admin page, open **Contexts and default value**.
2. Click the context you just created (or the default global context).
3. Jira opens the context detail view and displays the **Time in Status field context configuration** panel provided by the app.
4. In the panel, choose an existing field setting from the dropdown, or click **Create new** to define a new one on the fly.
5. Save.

The context is now bound. Any issue matching the context (project and issue type) will be calculated according to the selected setting.

---

## Step 3. Configure or review the field setting

Field settings live in the admin panel's **Time in Status** tab and can also be created directly from the context configuration panel in Step 2.

A field setting controls:

- Which statuses (or status categories) to track
- Which work calendar to use
- Display format and display mode
- Optional JQL filter, rounding, status order, and issue date limit

See [Field setting reference](/docs/time-in-status-cloud-forge/time-in-status-field-settings) for every option.

Make sure the **Active** toggle is enabled. Inactive settings do not calculate new data.

---

## Step 4. Backfill historical issues

New issues are calculated automatically as they are created or updated. For pre-existing issues, run a recalculation:

1. Open **Settings ⚙ → Apps → Time in Status → Configure → Recalculation**.
2. Find your field setting in the list.
3. Click **Run** and choose **Full** to process all matching issues.

See [Recalculation](/docs/time-in-status-cloud-forge/recalculation) for details on modes and progress tracking.

---

## Next steps

- [Field setting reference](/docs/time-in-status-cloud-forge/time-in-status-field-settings)
- [Search and sort by time (JQL)](/docs/time-in-status-cloud-forge/time-in-status-jql)
- [Add an issue panel](/docs/time-in-status-cloud-forge/web-panel)
