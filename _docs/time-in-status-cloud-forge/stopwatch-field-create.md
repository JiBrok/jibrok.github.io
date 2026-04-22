---
title: Create a Stopwatch field
key: time-in-status-cloud-forge
excerpt: "Step-by-step guide to creating and configuring a Stopwatch custom field in Time in Status (Forge) for Jira Cloud."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, stopwatch, field-creation, custom-fields]
---

* TOC
{:toc}

---

## What is a Stopwatch field?

A Stopwatch field accumulates working time based on events you define. It starts, pauses, stops, and restarts automatically when specific changes happen on an issue - such as status transitions, assignments, comments, or custom field changes.

Unlike Time in Status fields (which track time per status), Stopwatch fields track a single running total controlled by event triggers.

**States**: Inactive → Running → Paused → Stopped

---

## Step 1: Create the Jira custom field

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Click **Create custom field**
3. Select **Stopwatch** from the field type list (under "Time in Status" app)
4. Enter a name for your field (e.g., "Response Time", "Work Time")
5. Choose the field context - which projects and issue types this field applies to
6. Click **Create**

<!-- [Screenshot: sw-field-jira-create] -->

---

## Step 2: Create a field setting

Before the field can calculate values, you need a **field setting** that defines the events and calculation rules.

1. Open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Stopwatch** tab > **Field Settings**
2. Click **Create**
3. Configure the setting (see [Stopwatch field settings reference](/docs/time-in-status-cloud-forge/stopwatch-field-settings) for all options):
   - **Name** - a descriptive name (e.g., "Response Time Stopwatch")
   - **Start Events** - what starts the stopwatch (e.g., status changed to "In Progress")
   - **Stop Events** - what stops it (e.g., status changed to "Done")
   - **Calendar** - the work calendar for time calculation
   - **Time Format** - how the time is displayed
4. Click **Save**

<!-- [Screenshot: sw-field-settings-form] -->

---

## Step 3: Bind the field context to the setting

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Find your Stopwatch field > click **...** > **Contexts and default value**
3. Click on the context name
4. In the configuration panel, select the field setting you created in Step 2
5. Click **Save**

The app will start processing new issue events for this context.

See [Field context configuration](/docs/time-in-status-cloud-forge/field-context-config) for details.

---

## Step 4: Backfill existing issues

For issues that already exist, the app needs to process their changelog history to calculate stopwatch values.

1. Go to the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Recalculation** tab
2. Find your Stopwatch field and context
3. Click **Recalculate** > select **Full** mode
4. Monitor the batch job progress

See [Recalculation](/docs/time-in-status-cloud-forge/recalculation) for details.

---

## Next steps

- [Stopwatch field settings reference](/docs/time-in-status-cloud-forge/stopwatch-field-settings) - all configuration options
- [Event triggers reference](/docs/time-in-status-cloud-forge/event-triggers) - complete list of available triggers
- [Stopwatch JQL search](/docs/time-in-status-cloud-forge/stopwatch-jql) - search and sort by stopwatch values
- [Stopwatch issue panel](/docs/time-in-status-cloud-forge/stopwatch-panel) - display stopwatch on issue views
- [Work calendars](/docs/time-in-status-cloud-forge/work-calendar) - configure business hours
