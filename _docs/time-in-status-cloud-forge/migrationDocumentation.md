---
title: Migration from Data Center to Cloud
key: time-in-status-cloud-forge
excerpt: "Guide for migrating Time in Status configuration from Jira Data Center (Server) to Jira Cloud with the Forge app."
category: migration
tags: [doc, cloud, time-in-status, forge, migration, data-center, server]
---

* TOC
{:toc}

---

## Overview

This guide covers migrating your Time in Status configuration from **Jira Data Center (Server)** to **Jira Cloud** using the Time in Status Forge app.

The migration involves transferring your calendar, field setting, and event configurations. There are two paths:

- **Automatic path via JCMA** (recommended) — the [Jira Cloud Migration Assistant](https://www.atlassian.com/migration) carries Time in Status settings as part of a normal app migration and automatically remaps status, project, issue-type, and custom-field IDs between Data Center and Cloud.
- **Manual path via JSON export / import** — export configuration from the Data Center app as a JSON file, then import it into the Forge app on Cloud using [Import / Export](/docs/time-in-status-cloud-forge/import-export-config). The Forge app automatically detects and converts the Data Center format.

Pick the automatic path unless you have a reason to do it by hand — it is faster and avoids ID-remapping errors.

For the full end-to-end DC-side protocol (prerequisites, JiBrok Studio scenario, binding manifest), see the [Data Center → Forge migration guide](/docs/time-in-status/migration-to-forge).

---

## Automatic path via JCMA

### What transfers automatically

When you run JCMA with Time in Status selected, the migration carries:

- **Work calendars** — all custom calendars, working hours, breaks, holidays, and timezone settings
- **Field settings** — Time in Status, Stopwatch, Timer, Time Between Dates, and Calendar Select configurations
- **Web panel configurations**
- **Custom events** — named trigger rules
- **Field context bindings** — for each Data Center custom field that has a matching Forge custom field on the destination, the binding between the Jira context and the Forge field setting is re-created automatically

JCMA also remaps IDs that differ between sites:

- Status IDs
- Project IDs
- Issue type IDs
- Custom field IDs (both Jira built-in and app-owned)

This means calendars, field settings, and bindings arrive already referencing valid Cloud IDs — no manual ID adjustment is needed.

### What still needs manual work

- **Create custom fields in Cloud** — the Jira custom fields themselves (of types Time in Status, Stopwatch, Timer, Time Between Dates, Calendar Select) must exist on the Cloud side before or during the migration. The DC-side migration page generates a **JiBrok Studio scenario** that creates them with correct contexts and screen attachments. If you skip this step, field context bindings will have nothing to attach to.
- **Configure panel visibility** — Forge panels are controlled through Jira project properties. See [Panel visibility](/docs/time-in-status-cloud-forge/panel-visibility).
- **Review conversion warnings** — a few Data Center field types have no Forge equivalent (helper fields, Transition Counter, Is Status, JQL Function Field). JCMA flags them; see [Feature comparison](/docs/time-in-status-cloud-forge/feature-comparison).
- **Run recalculation** — after fields and bindings are in place, run a [full recalculation](/docs/time-in-status-cloud-forge/recalculation) for every context to populate values.

### Running JCMA

The DC-side steps (preparing the app, starting JCMA, monitoring the migration) are covered in detail on the [DC → Forge migration guide](/docs/time-in-status/migration-to-forge). The Cloud-side is passive — once JCMA uploads the app data, the Forge app processes it in the background and confirms the result back to JCMA.

### Troubleshooting

- **JCMA reports the app migration failed** — open the JCMA log for the app-data step. The Forge app writes a detailed `Migration failed at <step>` message explaining which phase failed (payload download, format detection, import, or field binding).
- **Configuration imported but custom fields are missing** — this means the DC side only sent configuration. Run the JiBrok Studio scenario on the Cloud side to create the Jira custom fields, then re-run the binding step from the DC migration page.
- **Some field bindings were not created** — this can happen if the Cloud custom field does not yet exist when JCMA runs. Create the field, then re-upload the binding manifest from the DC-side migration page.

---

## Manual path (JSON export / import)

Use this path if JCMA is unavailable in your environment or if you want to migrate a subset of the configuration.

### Step 1: Export from Data Center

1. Open your Time in Status configuration in the DC Jira instance
2. Export your configuration (calendars, field settings, panels, events) as a JSON file
3. Save the JSON file locally

### Step 2: Install Forge app on Cloud

1. Install **Time in Status (Forge)** from [Atlassian Marketplace](https://marketplace.atlassian.com)
2. Verify the app is installed: go to Jira Settings > Apps > Manage apps

### Step 3: Import configuration

1. Open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Import / Export** tab
2. Click **Import**
3. Upload the DC JSON file
4. The app automatically detects the DC format and converts it to Forge format
5. Review the preview - check for conversion warnings
6. Select items to import and choose a conflict strategy
7. Click **Import**

See [Import/Export configuration](/docs/time-in-status-cloud-forge/import-export-config) for detailed import instructions.

### Step 4: Review and adjust

After import, review the converted configuration:

- **Calendars** - verify timezone, working hours, breaks, and holidays transferred correctly
- **Field settings** - check status selections, event triggers, display modes
- **Custom events** - verify field mappings and action types

Some DC features may not have direct Forge equivalents. The import process shows warnings for any items that could not be fully converted.

### Step 5: Create Jira custom fields

1. Go to **Jira Settings** > **Issues** > **Custom fields**
2. Create custom fields for each field type:
   - Time in Status fields
   - Stopwatch fields (if used in DC)
   - Timer fields (if used in DC)
   - Time Between Dates fields (if used in DC)
   - Calendar Select field (if needed)
3. Set appropriate field contexts for each field

### Step 6: Bind field contexts

1. For each custom field, open its **Contexts and default value**
2. Bind each context to the appropriate imported field setting
3. See [Field context configuration](/docs/time-in-status-cloud-forge/field-context-config) for details

### Step 7: Configure panels

1. Review imported web panels in the admin panel
2. Configure [panel visibility](/docs/time-in-status-cloud-forge/panel-visibility) for each project
3. Set up [Activity panel](/docs/time-in-status-cloud-forge/activity-panels) configuration if desired

### Step 8: Recalculate

1. Go to the [Recalculation tab](/docs/time-in-status-cloud-forge/recalculation)
2. Run **Full** recalculation for each field context
3. Monitor batch job progress and review any errors

---

## JQL migration

Data Center uses custom JQL functions (e.g., `timeInStatus()`, `dateOfFirstTransition()`). Forge uses **schema properties** instead.

See [Feature comparison](/docs/time-in-status-cloud-forge/feature-comparison) for a detailed mapping between DC JQL functions and Forge schema property searches.

General pattern:

| DC (JQL functions) | Forge (schema properties) |
|---------------------|--------------------------|
| `timeInStatus("In Progress") > "4h"` | `"Field Name[TimeInHoursValue]" > 4` |
| Custom JQL functions (270+) | Schema property searches per field type |

For complete JQL references:
- [Time in Status JQL](/docs/time-in-status-cloud-forge/time-in-status-jql)
- [Stopwatch JQL](/docs/time-in-status-cloud-forge/stopwatch-jql)
- [Timer JQL](/docs/time-in-status-cloud-forge/timer-jql)
- [Time Between Dates JQL](/docs/time-in-status-cloud-forge/time-between-dates-jql)

---

## Migration checklist

Preparation (both paths):

1. [ ] Upgrade the Data Center app to the latest version so the Migration page is available
2. [ ] Install Time in Status (Forge) on the destination Cloud site from Atlassian Marketplace
3. [ ] Install JiBrok Studio for Jira Cloud on the destination (needed for automatic field creation)

Automatic path via JCMA (recommended):

4. [ ] Configure JCMA with the target Cloud site
5. [ ] Start a JCMA app migration with Time in Status enabled
6. [ ] On the DC-side Migration page, run the JiBrok Studio scenario to create Jira custom fields on Cloud
7. [ ] Apply the binding manifest produced by the scenario so field contexts attach to the imported settings

Manual path (if not using JCMA):

4. [ ] Export configuration JSON from the Data Center Migration page
5. [ ] Import the JSON via the Forge app's Import / Export tab
6. [ ] Review and fix any conversion warnings
7. [ ] Create the Jira custom fields in Cloud (by hand or via JiBrok Studio)
8. [ ] Bind field contexts to the imported field settings

After either path:

- [ ] Configure panel visibility for each project
- [ ] Run full recalculation for all field contexts
- [ ] Update saved JQL filters to use schema-property syntax
- [ ] Update dashboard gadgets and automation rules
- [ ] Verify values on sample issues across different projects
- [ ] Train the team on any UI differences

---

## Tips

- **Prefer JCMA**: the automatic path remaps IDs between instances and creates bindings for you. The manual path works, but every remapping is on you.
- **Feature comparison**: review the [DC / Connect / Forge feature comparison](/docs/time-in-status-cloud-forge/feature-comparison) to understand differences between versions. Helper fields, Transition Counter, Is Status, and JQL Function Field have no Forge equivalent and are excluded from the migration.
- **Test on staging**: if possible, test the migration on a staging Cloud site before migrating production.
- **JQL audit**: search your DC instance for all saved filters that use Time in Status JQL functions. Document them so you can recreate them with Forge syntax.
- **Calendar timezones**: DC calendars may use the server timezone. Verify that imported calendars have the correct IANA timezone set for Cloud.
