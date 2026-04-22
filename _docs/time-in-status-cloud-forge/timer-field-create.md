---
title: Create a Timer field
key: time-in-status-cloud-forge
excerpt: "Step-by-step guide to creating and configuring a Timer custom field in Time in Status (Forge) for Jira Cloud."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, timer, field-creation, custom-fields, sla]
---

* TOC
{:toc}

---

## What is a Timer field?

A Timer field is a countdown timer with a goal (deadline). It starts, pauses, stops, and restarts based on events you define. When the elapsed time exceeds the goal, the timer is marked as **Failed**.

Timers are ideal for SLA tracking, response time commitments, and any scenario where you need to measure whether work was completed within a time limit.

**States**: Inactive → Running → Paused → Completed / Failed

---

## Step 1: Create the Jira custom field

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Click **Create custom field**
3. Select **Timer** from the field type list (under "Time in Status" app)
4. Enter a name for your field (e.g., "SLA Timer", "Response SLA")
5. Choose the field context
6. Click **Create**

---

## Step 2: Create a field setting

1. Open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Timer** tab > **Field Settings**
2. Click **Create**
3. Configure the setting (see [Timer field settings reference](/docs/time-in-status-cloud-forge/timer-field-settings) for all options):
   - **Name** - a descriptive name
   - **Start Events** - what starts the timer
   - **Stop Events** - what stops it (marks as Completed if within goal)
   - **Goals** - the target time (see [Timer goal configuration](/docs/time-in-status-cloud-forge/timer-goals))
   - **Calendar** - the work calendar
   - **Display Mode** - what to show (time spent, time left, goal, failed date, etc.)
4. Click **Save**

<!-- [Screenshot: tmr-field-settings-form] -->

---

## Step 3: Bind the field context to the setting

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Find your Timer field > click **...** > **Contexts and default value**
3. Click on the context name
4. Select the field setting from Step 2
5. Click **Save**

See [Field context configuration](/docs/time-in-status-cloud-forge/field-context-config) for details.

---

## Step 4: Backfill existing issues

1. Go to the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Recalculation** tab
2. Find your Timer field and context
3. Click **Recalculate** > select **Full** mode
4. Monitor the batch job progress

See [Recalculation](/docs/time-in-status-cloud-forge/recalculation) for details.

---

## Next steps

- [Timer field settings reference](/docs/time-in-status-cloud-forge/timer-field-settings) - all configuration options
- [Timer goal configuration](/docs/time-in-status-cloud-forge/timer-goals) - set up default and conditional goals
- [Event triggers reference](/docs/time-in-status-cloud-forge/event-triggers) - complete list of available triggers
- [Timer JQL search](/docs/time-in-status-cloud-forge/timer-jql) - search and sort by timer values
- [Timer issue panel](/docs/time-in-status-cloud-forge/timer-panel) - display timer on issue views
