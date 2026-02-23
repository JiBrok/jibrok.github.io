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

All administrative settings are in the **Admin** tab, accessible to Jira site administrators only. This page covers execution identity, trigger controls, API restrictions, import/export, health checks, audit logs, and data privacy.

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

Disabled types **preserve existing configurations** but prevent execution. All toggles are recorded in the audit log.

---

## API Whitelist/Blacklist

Control which Jira REST API endpoints scripts can access.

### Global Whitelist

- **Disabled by default** (all endpoints allowed)
- Enable to enforce pattern-based URL restrictions
- Patterns use **glob syntax** (e.g., `/rest/api/3/issue/**`)
- **API Catalog** for quickly adding common endpoint groups
- **Reset to defaults** restores the original whitelist

### Global Blacklist

- **Disabled by default** (nothing blocked)
- Enable to block matching patterns
- Blacklist is checked **before** whitelist
- Useful for blocking sensitive endpoints while allowing everything else

### Custom API Restrictions

Create named whitelist/blacklist profiles for per-script restrictions:

- **Custom Whitelists** — named profiles with endpoint patterns, assigned to specific scripts in their Config tab. A script must pass both the global whitelist AND its custom whitelist.
- **Custom Blacklists** — named profiles assigned to specific scripts. Blacklist checked before whitelist at the script level.
- Up to **50 profiles** each, with up to **200 entries** per profile

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
3. Click **Export** — copy to clipboard or download as file

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

- **Run migrations** — apply pending database schema updates (also runs hourly automatically)
- **Check duplicates** — detect and remove duplicate global variable scripts
- **Storage Usage** — view Forge SQL database size, table sizes, index sizes, and row counts

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

Maximum **10,000 records** (rolling window — oldest entries are automatically deleted when the limit is reached).

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

- [Script Console](/docs/jibrok-studio-jira/script-console) — Run As selection in the console
- [Triggers](/docs/jibrok-studio-jira/triggers) — Trigger type configuration
- [Limits](/docs/jibrok-studio-jira/limits) — All system limits
