---
title: Admin Tools
seo_title: "Jira Script Admin Tools - Usage and Diagnostics"
key: jibrok-studio-jira
excerpt: Script usage tracking, UIM management, import/export, health check, diagnostics
category: administration
tags:
  - doc
  - cloud
  - admin
  - tools
  - import
  - export
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

> Part of the [Administration](/docs/jibrok-studio-jira/admin-settings) reference.
> [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) | **Admin Tools** | [Audit Logs](/docs/jibrok-studio-jira/admin-audit)

## Track script usage

Track where scripts are used across your Jira instance - in workflows and custom fields.

### Collecting data

Click **Collect Information** to scan all workflows and custom fields for script references. The process:

1. Scans all workflow rules (post functions, validators, conditions) for scripts managed by the app
2. Scans all scripted custom field configurations
3. Stores results in a usage cache

### Usage table

| Column | Description |
|--------|-------------|
| **Script** | Script name (or truncated ID if deleted) |
| **Type** | Usage type - Post Function, Validator, Condition, or Custom Field |
| **Location** | Workflow name with link (for workflow rules) or field name (for custom fields) |
| **Version** | Version status - Current (green), Outdated (orange), or - (not tracked) |

### Version tracking

For workflow rules, the table shows whether the deployed script version matches the latest saved version:

- **Current** - the workflow uses the latest script version
- **Outdated** - the workflow uses an older version
- **-** - version information is not available

### Search and pagination

Search across script names, workflow names, and field names. Results are paginated (20 per page).

### Per-script view

Each script also has a **Where Used** action in the Library context menu, showing only that script's usage locations.

---

## Manage UI modifications

Manage UI Modification registrations:

- View all registered UIMs (Jira and JSM separately)
- Delete specific UIMs by context
- Register a **demo UIM** for testing
- Bulk delete all UIMs

---

## Export and import scripts

### Export

1. Go to the **Admin** tab > Export section
2. Select scripts to export (or export all)
3. Click **Export** - copy to clipboard or download as file

See [Import & Export](/docs/jibrok-studio-jira/import-export) for details on what's included and the export format.

### Import

1. Go to the **Admin** tab > Import section
2. Paste JSON or upload a file (max **5 MB**)
3. Review the preview (created vs. updated counts)
4. Click **Import**

Import behavior:

- **New scripts** (unknown ID) are created
- **Existing scripts** (matching ID) are updated (merged)
- Folders are created automatically if they don't exist
- Labels are created automatically if they don't exist

---

## Run health check

Run database maintenance tasks:

- **Run migrations** - apply pending database schema updates (also runs hourly automatically)
- **Check duplicates** - detect and remove duplicate global variable scripts
- **Storage Usage** - view Forge SQL database size, table sizes, index sizes, and row counts
- **Data integrity** - detect and clean up orphaned records left by failed deletions

<a href="/uploads/jibrok-studio-jira/admin-health-check.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-health-check.png" alt="Health Check panel" style="width:100%;" loading="lazy"></a>

---

## Support

### Diagnostic logging

Time-limited diagnostic logging for troubleshooting trigger and script execution issues.

- When enabled, detailed info-level logs are written for all trigger invocations
- Logs include: trigger invocations, script start/complete events, timing, skip reasons
- No sensitive data is logged (source code, issue data, PII are excluded)
- Duration options: 5 minutes to 14 days - auto-disables after the chosen duration
- Can be disabled manually at any time
- Diagnostic logs are written to the Forge runtime log. Contact the app vendor if you need access to raw logs
- Enable/disable actions are recorded in the settings audit log

---

## Next steps

- [Administration](/docs/jibrok-studio-jira/admin-settings) - Core settings overview
- [Audit Logs](/docs/jibrok-studio-jira/admin-audit) - Settings, script runs, and version history audit
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
