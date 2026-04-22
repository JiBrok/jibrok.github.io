---
title: Field context configuration
key: time-in-status-cloud-forge
excerpt: "How to bind Jira custom field contexts to Time in Status field settings - the link between a Jira field and its calculation rules."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, field-context, configuration, custom-fields]
---

* TOC
{:toc}

---

## What is a field context?

In Jira, every custom field has one or more **contexts**. A context defines which projects and issue types the field applies to. By default, a new custom field has a single **Global context** that covers all projects and issue types.

You can create additional contexts to scope a field to specific projects or issue types. For example, you might have one context for "Project A, Bug type" and another for "All other projects."

---

## How contexts work with Time in Status

Each Time in Status field (Time in Status, Stopwatch, Timer, Time Between Dates, Calendar Select) is a standard Jira custom field. To make it calculate values, you need to **bind each field context to a field setting**.

The relationship is:

```
Jira custom field
  └── Field context (scope: projects + issue types)
        └── Field setting (calculation rules)
```

One field setting can serve multiple contexts. For example, you can create a single "Standard SLA" timer setting and bind it to contexts across several projects.

---

## Configuring a field context

### Step 1: Open the field's context list

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Find your Time in Status field in the list
3. Click **...** (more actions) > **Contexts and default value**

You will see a list of all contexts for this field.

<!-- [Screenshot: field-context-jira-admin] -->

### Step 2: Open context configuration

Click on a context name to open its configuration page. You will see the Time in Status configuration panel provided by the app.

<!-- [Screenshot: field-context-config-ui] -->

### Step 3: Select or create a field setting

The configuration panel lets you:

- **Select an existing field setting** from the dropdown - choose a setting you have already created in the admin panel
- **Create a new field setting** - opens the admin panel to create a new setting, then returns to bind it

Once a field setting is selected and saved, the app will start calculating values for all issues in this context.

---

## Automatic context sync

The app automatically detects when field contexts are created, updated, or deleted in Jira. When you:

- **Create a new context** - the app registers it and waits for you to bind a field setting
- **Update a context** (change projects or issue types) - the app adjusts which issues are recalculated
- **Delete a context** - the app cleans up the binding and stops calculating for the removed scope

---

## Tips

- **Start with the admin panel**: create your field settings, calendars, and events in the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) before configuring contexts. This way you will have settings ready to bind.
- **One setting, many contexts**: reuse the same field setting across multiple contexts to keep configuration consistent.
- **Check recalculation**: after binding a new context, go to the [Recalculation tab](/docs/time-in-status-cloud-forge/recalculation) to monitor progress and trigger a backfill for existing issues.
- **Orphaned contexts**: if a field is deleted from Jira but its context data remains, use the Recalculation tab to clean up orphaned entries.
