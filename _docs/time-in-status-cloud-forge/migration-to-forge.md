---
title: Migration from Connect to Forge
key: time-in-status-cloud-forge
excerpt: "Step-by-step guide for migrating from the Time in Status Connect (Cloud) app to the new Time in Status Forge app."
category: migration
tags: [doc, cloud, time-in-status, forge, migration, connect, upgrade]
---

* TOC
{:toc}

---

## Overview

Time in Status (Forge) is the next-generation rebuild of the Time in Status Cloud app, built on Atlassian's Forge platform. This guide helps you migrate from the Connect version to the Forge version.

The Connect → Forge upgrade is an **in-place replacement** on the same Jira Cloud site via a standard Atlassian Marketplace update. The Jira Cloud Migration Assistant (JCMA) is **not** used — JCMA is only for Data Center → Cloud transfers.

> ⚠️ **Once the Marketplace update is applied, rollback to Connect is not possible.** Export your Connect configuration to a JSON file *before* pressing the update button.

For the complete step-by-step protocol from the Connect side (export, field-creation scenario, binding manifest), see the [Connect → Forge migration guide](/docs/tis-cloud/migration-to-forge).

---

## Migration at a glance

1. **Export configuration from Connect** — in the Connect admin, open *Migration to Forge* and export calendars, field settings, web panels, and custom events as a JSON file. Save it securely before the upgrade — this is the only channel that carries your configuration across.
2. **Upgrade via Marketplace** — accept the Forge update. Connect is replaced in place on the same site.
3. **Import configuration into Forge** — open the [Import/Export tab](/docs/time-in-status-cloud-forge/import-export-config) and load the JSON file you saved.
4. **Recreate Jira custom fields and contexts** — either by hand or by running the scenario generated on the Connect side (JiBrok Studio). Bind each context to the matching imported field setting. See [Field context configuration](/docs/time-in-status-cloud-forge/field-context-config).
5. **Configure panel visibility** — Forge panels are controlled through Jira project properties. See [Panel visibility](/docs/time-in-status-cloud-forge/panel-visibility).
6. **Update JQL queries** — the search syntax has changed. See the migration table below.
7. **Run recalculation** — run a [full recalculation](/docs/time-in-status-cloud-forge/recalculation) for every context to populate field values.

---

## JQL syntax changes

The Forge app uses **schema properties** instead of Connect's entity properties:

| Connect syntax | Forge syntax |
|----------------|-------------|
| `"time in hours:Field Name" > 4` | `"Field Name[TimeInHoursValue]" > 4` |
| `"time in minutes:Field Name" > 90` | `"Field Name[TimeInMinutesValue]" > 90` |
| `"hours of:Field Name" > 2` | `"Field Name[HoursValue]" > 2` |
| `"minutes of:Field Name" > 30` | `"Field Name[MinutesValue]" > 30` |

Update any saved filters, dashboards, and automation rules that use the old syntax.

See [Time in Status JQL](/docs/time-in-status-cloud-forge/time-in-status-jql) for the complete Forge JQL reference.

---

## New features in Forge

The Forge version includes features not available in Connect:

- **Stopwatch fields** - event-driven time tracking with start/pause/stop/restart
- **Timer fields** - countdown timers with goals and failure detection
- **Time Between Dates fields** - calculate time between any two date fields
- **Calendar Select field** - per-issue calendar override
- **Custom Events** - define custom trigger rules based on field value changes
- **Activity Panel** - three built-in reports on the issue Activity tab
- **Import/Export** - full configuration backup and transfer
- **Recalculation management** - batch jobs, freshness monitoring, pause/resume

---

## Migration checklist

Before the Marketplace upgrade (while the Connect UI is still available):

1. [ ] Open the **Migration to Forge** tab in the Connect admin
2. [ ] Export configuration (calendars, field settings, web panels, custom events) as a JSON file and store it securely
3. [ ] Capture the screen attachments for each custom field as described on the Migration tab
4. [ ] Generate the JiBrok Studio field-creation scenario if you plan to use the automatic path

After the Marketplace upgrade:

5. [ ] Open the Forge admin panel and confirm you can reach **Import / Export**
6. [ ] Import the JSON file you saved earlier
7. [ ] Create the Jira custom fields — either by running the generated scenario or by hand
8. [ ] Bind each field context to the matching imported field setting (either via the binding manifest or manually)
9. [ ] Configure [panel visibility](/docs/time-in-status-cloud-forge/panel-visibility) for each project
10. [ ] Run a [full recalculation](/docs/time-in-status-cloud-forge/recalculation) for every field context
11. [ ] Update JQL queries in saved filters, dashboards, and automation rules to the Forge syntax
12. [ ] Verify field values on sample issues across different projects

---

## Tips

- **Back up before you upgrade**: the Connect → Forge upgrade is in place and cannot be rolled back. The JSON export from Step 2 is the only artefact that carries your configuration across.
- **Start with one project**: bind and recalculate one project first to verify everything works correctly before rolling out to the rest.
- **Check saved filters**: search your Jira instance for filters using the old Connect JQL syntax and update them to the Forge schema-property syntax.
