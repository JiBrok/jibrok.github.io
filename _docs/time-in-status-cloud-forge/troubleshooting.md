---
title: Troubleshooting and FAQ
key: time-in-status-cloud-forge
excerpt: "Common issues and solutions for Time in Status (Forge) - empty fields, invisible panels, stale values, import errors, and JQL troubleshooting."
category: system-information
tags: [doc, cloud, time-in-status, forge, troubleshooting, faq, support, common-issues]
---

* TOC
{:toc}

---

## Field shows no value / is empty

**Possible causes and fixes:**

1. **Field setting is inactive** - open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel), find the field setting, and make sure the **Active** toggle is on.

2. **No field context binding** - the Jira custom field must be bound to a field setting via its context. Go to Jira Settings > Issues > Custom fields, find the field, open Contexts and default value, and verify a field setting is selected. See [Field context configuration](/docs/time-in-status-cloud-forge/field-context-config).

3. **JQL filter excludes the issue** - if the field setting has a JQL filter, the issue may not match it. Check the JQL filter in the field setting and verify the issue matches.

4. **Issue date limit** - if the field setting has an Issue Date Limit, issues created before that date are not processed.

5. **Recalculation needed** - for existing issues, the app needs to process their changelog. Go to the [Recalculation tab](/docs/time-in-status-cloud-forge/recalculation) and run a recalculation for the affected context.

6. **Processing is paused** - check the Recalculation tab for a "Processing Paused" indicator. If paused, click Resume.

---

## Panel is not visible on the issue

**Possible causes and fixes:**

1. **Panel visibility not configured** - panels are hidden by default. You need to enable them via [panel visibility settings](/docs/time-in-status-cloud-forge/panel-visibility). Check that the `tis-cloud-panels` property includes the panel type (`tis`, `sw`, `tmr`, or `act`) for the relevant issue type.

2. **No web panel configured** - creating a web panel in the admin panel defines what to show, but you also need panel visibility to control where it appears. Make sure both are set up.

3. **Wrong project or issue type** - if the web panel is scoped to specific projects or issue types, the issue may not match.

4. **Jira caching** - Jira may cache panel visibility. Try refreshing the issue page or waiting a few minutes.

---

## Field values are not updating

**Possible causes and fixes:**

1. **Processing is paused** - check the [Recalculation tab](/docs/time-in-status-cloud-forge/recalculation) for "Processing Paused" status.

2. **Rate limits reached** - if your instance generates a high volume of updates, the app may be throttled. Values will continue updating at a reduced rate. See [Technical limits](/docs/time-in-status-cloud-forge/limits).

3. **Field is inactive** - verify the Active toggle in the field setting.

4. **Scheduled refresh timing** - some updates happen on a schedule (every 5 minutes or hourly) rather than immediately. For actively running stopwatches/timers, the `DateNextUpdate` property controls when the next refresh occurs.

5. **Check freshness** - go to the Recalculation tab and click Refresh on the relevant context to see current freshness statistics.

---

## Stopwatch or Timer is not starting

**Possible causes and fixes:**

1. **No matching event trigger** - verify that the start events in the field setting match the actual changes happening on the issue. For example, if the start event is STATUS_TO "In Progress", the issue must transition *to* "In Progress" (not just be in that status already).

2. **Event not in changelog** - the app reads the issue changelog to detect events. If a change does not appear in the changelog (e.g., bulk operations that skip changelog), the trigger will not fire.

3. **Wrong event type** - make sure you are using the correct trigger type. For example, `STATUS_TO` requires an exact status ID match. Check that the status IDs in your trigger match your workflow.

4. **Custom event misconfiguration** - if using CUSTOM_EVENT triggers, verify the custom event's field, action, and value settings match the actual changes.

5. **Already in target state** - a start event only fires if the stopwatch/timer is in a state that allows starting (Inactive or Paused). If it is already Running, start events are ignored.

6. **Run recalculation** - after fixing triggers, run a [Full recalculation](/docs/time-in-status-cloud-forge/recalculation) to reprocess existing issues from their changelog history.

---

## Calendar changes not reflected in values

After modifying a calendar (changing working hours, adding holidays, changing timezone), existing field values are not automatically recalculated.

**Fix:** Go to the [Recalculation tab](/docs/time-in-status-cloud-forge/recalculation) and run a **Full** recalculation for all contexts that use the modified calendar.

---

## JQL search returns no results

**Possible causes and fixes:**

1. **Wrong syntax** - Forge uses schema properties, not the Connect entity property syntax. The correct syntax is:
   ```
   "Your Field Name[PropertyAlias]" operator value
   ```
   See [Time in Status JQL](/docs/time-in-status-cloud-forge/time-in-status-jql) for the correct syntax.

2. **Case sensitivity** - text property values (StateValue, DisplayValue) are **case-sensitive**. Use `"Running"` not `"running"`.

3. **Field name mismatch** - the field name in JQL must exactly match your Jira custom field name, including spaces and capitalization.

4. **Field has no value** - if the field has not been calculated for any issues (no recalculation run), there are no values to search. Run a recalculation first.

5. **Wrong property alias** - verify you are using the correct property alias from the documentation. For example, use `TimeInHoursValue` (not `timeInHoursValue` or `TimeInHours`).

---

## Import errors

**Possible causes and fixes:**

1. **File too large** - maximum import file size is 5 MB. If your export is larger, try exporting fewer sections at a time.

2. **Invalid JSON** - the file must be valid JSON. If you edited it manually, check for syntax errors (missing commas, unclosed brackets).

3. **Wrong format version** - the Forge app expects format version 1 (Forge) or version 2 (DC/Server for automatic conversion). Other formats are not supported.

4. **Missing references** - if imported field settings reference calendars that do not exist, the import will show warnings. Import calendars first, then field settings.

5. **Name conflicts** - if items with the same name already exist, choose a conflict strategy: Skip (keep existing), Overwrite (replace), or Rename (import with modified name). See [Import/Export](/docs/time-in-status-cloud-forge/import-export-config).

---

## Timer shows "Failed" but issue was resolved on time

**Possible causes:**

1. **Wrong calendar** - the timer may be using a 24x7 calendar while you expected business hours. Check the calendar in the timer field setting.

2. **Goal misconfiguration** - if using JQL-based conditional goals, a different goal may have matched than expected. Check the goal order (first match wins).

3. **Pause events missing** - if the timer should pause during certain periods (e.g., "Waiting for Customer" status) but no pause events are configured, time accumulates continuously.

4. **Calendar Select field** - if a Calendar Select field is configured but the issue does not have a value, the timer uses the default calendar which may have different hours.

---

## Web panel shows different values than the custom field

This is expected behavior. Web panels and custom fields can have **different configurations**:

- Different calendars
- Different status selections
- Different time formats
- Different event triggers (for Stopwatch/Timer panels)

Each configuration calculates independently. If you want them to show the same values, make sure both use the same calendar, statuses, and settings.

---

## Contact support

If you cannot resolve your issue with the steps above:

1. Go to the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) and note the **App version** and **Installation ID** from the app info section
2. Describe the issue, including:
   - What you expected to happen
   - What actually happened
   - The field type and setting name
   - The issue key where you see the problem
3. Contact support through the Atlassian Marketplace or the app's support channels
