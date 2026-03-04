---
title: Administration
key: jibrok-studio-jira
excerpt: Global configuration, security, audit logs, and import/export
category: administration
tags:
  - doc
  - cloud
  - admin
  - settings
  - security
  - audit
---

* TOC
{:toc}

## Overview

All administrative settings are in the **Admin** tab, accessible to Jira site administrators only. This page covers execution identity, trigger controls, API restrictions, script usage tracking, import/export, health checks, audit logs, support tools, and data privacy.

---

## Run As Configuration

Controls which execution identities are available to scripts.

| Mode | Description | Default |
|------|-------------|---------|
| **Current User** | Scripts run with the triggering user's permissions | Always available |
| **Application** | Scripts run with app-level permissions (Forge impersonation) | Off |
| **Pre-configured Users** | Admin-defined user list for script execution (up to 20 users) | Off |
| **Specific User** | Search for any Jira user to run as | Off |

### Pre-configured Users

When enabled, admins can create a list of users (up to 20) with optional descriptions. Script authors select from this dropdown in the Console or Config tab.

### What "Run As Application" Means

When a script runs as Application, it uses the Forge app's own permissions (with impersonation). This gives broader access than any individual user and is independent of who triggered the script. Use this for automated tasks that need system-level access.

> **Note:** If a mode is disabled after scripts are configured to use it, a warning is shown but existing configurations are preserved.

<a href="/uploads/jibrok-studio-jira/admin-run-as-config.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-run-as-config.png" alt="Run As configuration panel" style="width:100%;" loading="lazy"></a>

---

## Trigger Type Settings

Toggle each trigger type on/off globally:

| Trigger Type | Description |
|--------------|-------------|
| **Scheduled** | Recurring timer triggers |
| **Event** | Jira event triggers |
| **Async Event** | Async event triggers |
| **UIM** | UI Modification triggers |
| **Scripted Fields** | Custom field computation |
| **Automation** | Jira Automation action triggers |
| **Rovo** | Rovo AI Agent script access |
| **Workflow Post Function** | Workflow transition post functions |
| **Workflow Validator** | Workflow transition validators |
| **Workflow Condition** | Workflow transition conditions (Jira Expressions) |

Disabled types **preserve existing configurations** but prevent execution. All toggles are recorded in the audit log.

<a href="/uploads/jibrok-studio-jira/admin-triggers-toggles.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-triggers-toggles.png" alt="Trigger type toggle settings" style="width:100%;" loading="lazy"></a>

### Event Type Settings

Fine-grained control over which Jira event types trigger scripts. Only applies to scripts with Event triggers.

- 32 event types available (issue_created, issue_updated, etc.)
- 7 core events enabled by default: `issue_created`, `issue_updated`, `issue_deleted`, `issue_assigned`, `comment_created`, `comment_deleted`, `comment_mentioned`
- Disable specific event types to reduce unnecessary script executions
- Changes are recorded in the audit log

<a href="/uploads/jibrok-studio-jira/admin-event-types.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-event-types.png" alt="Event trigger type configuration" style="width:100%;" loading="lazy"></a>

### Audit Trigger Type Settings

Control which trigger types are logged in the Script Runs Audit:

| Trigger Type | Default | Description |
|--------------|---------|-------------|
| Manual | Enabled | Console executions |
| Scheduled | Enabled | Scheduled trigger runs |
| Event | Enabled | Event trigger runs |
| UIM | Enabled | UIM trigger runs |
| Scripted Fields | **Disabled** | Custom field computations (high volume) |
| Async Event | Enabled | Async event runs |
| Automation | Enabled | Automation action runs |
| Rovo | Enabled | Rovo action runs |
| Workflow Post Function | Enabled | Workflow post function runs |
| Workflow Validator | Enabled | Workflow validator runs |

Scripted Fields auditing is disabled by default because field computations can produce a high volume of audit entries.

---

## API Whitelist/Blacklist

Control which Jira REST API endpoints scripts can access.

### Global Whitelist

- **Disabled by default** (all endpoints allowed)
- Enable to enforce pattern-based URL restrictions
- Patterns use **glob syntax** (e.g., `/rest/api/3/issue/**`)
- **API Catalog** for quickly adding common endpoint groups
- **Reset to defaults** restores the original whitelist

<a href="/uploads/jibrok-studio-jira/admin-api-whitelist.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-api-whitelist.png" alt="Global API whitelist configuration" style="width:100%;" loading="lazy"></a>

### Global Blacklist

- **Disabled by default** (nothing blocked)
- Enable to block matching patterns
- Blacklist is checked **before** whitelist
- Useful for blocking sensitive endpoints while allowing everything else

<a href="/uploads/jibrok-studio-jira/admin-api-blacklist.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-api-blacklist.png" alt="Global API blacklist configuration" style="width:100%;" loading="lazy"></a>

### Custom API Restrictions

Create named whitelist/blacklist profiles for per-script restrictions:

- **Custom Whitelists** - named profiles with endpoint patterns, assigned to specific scripts in their Config tab. A script must pass both the global whitelist AND its custom whitelist.
- **Custom Blacklists** - named profiles assigned to specific scripts. Blacklist checked before whitelist at the script level.
- Up to **50 profiles** each, with up to **200 entries** per profile

<a href="/uploads/jibrok-studio-jira/admin-script-whitelists.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-script-whitelists.png" alt="Custom API restriction profiles" style="width:100%;" loading="lazy"></a>

---

## Script Usage

Track where scripts are used across your Jira instance - in workflows and custom fields.

### Collecting Data

Click **Collect Information** to scan all workflows and custom fields for script references. The process:

1. Scans all workflow rules (post functions, validators, conditions) for scripts managed by the app
2. Scans all scripted custom field configurations
3. Stores results in a usage cache

### Usage Table

| Column | Description |
|--------|-------------|
| **Script** | Script name (or truncated ID if deleted) |
| **Type** | Usage type - Post Function, Validator, Condition, or Custom Field |
| **Location** | Workflow name with link (for workflow rules) or field name (for custom fields) |
| **Version** | Version status - Current (green), Outdated (orange), or - (not tracked) |

### Version Tracking

For workflow rules, the table shows whether the deployed script version matches the latest saved version:

- **Current** - the workflow uses the latest script version
- **Outdated** - the workflow uses an older version
- **-** - version information is not available

### Search and Pagination

Search across script names, workflow names, and field names. Results are paginated (20 per page).

### Per-Script View

Each script also has a **Where Used** action in the Library context menu, showing only that script's usage locations.

---

## UIM Management

Manage UI Modification registrations:

- View all registered UIMs (Jira and JSM separately)
- Delete specific UIMs by context
- Register a **demo UIM** for testing
- Bulk delete all UIMs

---

## Import/Export

### Export

1. Go to the **Admin** tab > Export section
2. Select scripts to export (or export all)
3. Click **Export** - copy to clipboard or download as file

Exported data includes: script source code, name, description, enabled status, actor configuration, labels, folder path, trigger configurations, and version history.

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

## Health Check

Run database maintenance tasks:

- **Run migrations** - apply pending database schema updates (also runs hourly automatically)
- **Check duplicates** - detect and remove duplicate global variable scripts
- **Storage Usage** - view Forge SQL database size, table sizes, index sizes, and row counts
- **Data integrity** - detect and clean up orphaned records left by failed deletions

<a href="/uploads/jibrok-studio-jira/admin-health-check.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-health-check.png" alt="Health Check panel" style="width:100%;" loading="lazy"></a>

---

## Support

### Diagnostic Logging

Time-limited diagnostic logging for troubleshooting trigger and script execution issues.

- When enabled, detailed info-level logs are written for all trigger invocations
- Logs include: trigger invocations, script start/complete events, timing, skip reasons
- No sensitive data is logged (source code, issue data, PII are excluded)
- Duration options: 5 minutes to 14 days - auto-disables after the chosen duration
- Can be disabled manually at any time
- View logs: `forge logs --environment <env>`
- Enable/disable actions are recorded in the settings audit log

---

## Audit Logs

Three distinct audit log types are available in the Admin tab.

### Settings Audit

Admin action log recording:

- Trigger type toggles
- API whitelist/blacklist changes
- Run As configuration changes
- UIM registrations
- Database migrations

### Script Runs Audit

Rolling log of all script executions across the site.

**Displayed fields:**

| Field | Description |
|-------|-------------|
| Script name | Which script ran |
| Actor | Who ran the script (account) |
| Trigger type | scheduled, event, etc. |
| Issue key | If applicable |
| Status | Success or error |
| Duration | Execution time in milliseconds |

**Filtering options:**

- By script (dropdown includes deleted scripts that still have audit records)
- By trigger type
- By success/error status
- By user (account ID)
- By date range (from/to)

<a href="/uploads/jibrok-studio-jira/admin-audit-script-runs.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-audit-script-runs.png" alt="Script Runs audit log" style="width:100%;" loading="lazy"></a>

Maximum **10,000 records** (rolling window - oldest entries are automatically deleted when the limit is reached).

### Version History Audit

Cross-script version history log showing all saved versions across the library.

**Filtering options:**

- By script ID
- By author (account ID)

---

## Security and Permissions

### App Scopes

JiBrok Studio for Jira Cloud requires the following Jira scopes:

- Jira read/write with impersonation
- Jira Software boards and sprints
- JSM service desk requests

### Data and Privacy

**Personal data stored:**

- Account IDs in run logs, version history, and audit logs

**Data retention:**

- Audit run records: rolling 10,000 entries
- Version history: 50 versions per script
- Settings audit: rolling 10,000 entries

GDPR personal data reporting is supported through the Forge platform.

---

## Next Steps

- [Script Console](/docs/jibrok-studio-jira/script-console) - Run As selection in the console
- [Triggers](/docs/jibrok-studio-jira/triggers) - Trigger type configuration
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
