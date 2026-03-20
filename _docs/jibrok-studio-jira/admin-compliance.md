---
title: Compliance & Drift Monitoring
seo_title: "Compliance and Drift Monitoring for Jira Scripts"
key: jibrok-studio-jira
excerpt: Configuration baselines, drift detection, integrity reports, and CSV export
category: administration
tags:
  - doc
  - cloud
  - admin
  - compliance
  - drift
  - audit
last_modified_at: 2026-03-16
date: 2026-03-16
seo:
  date_modified: 2026-03-16
---

* TOC
{:toc}

> Part of the [Administration](/docs/jibrok-studio-jira/admin-settings) reference.
> [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) | [Admin Tools](/docs/jibrok-studio-jira/admin-tools) | [Audit Logs](/docs/jibrok-studio-jira/admin-audit) | **Compliance**

## Overview

The Compliance panel (in the **Audit** tab) provides tools for monitoring configuration integrity:

- **Integrity Report** - one-shot CSV snapshot of all system data with SHA-256 hashes
- **Baselines** - saved snapshots of configuration state at a point in time
- **Drift Checks** - compare current state against a baseline to detect changes

All baseline and drift check operations are recorded in the [Settings Audit](/docs/jibrok-studio-jira/admin-audit).

---

## Integrity report

Generates a downloadable CSV report of the entire system state - scripts, settings, whitelists, blacklists, global variables, labels, and folders. Each entry includes a SHA-256 hash for verification.

| Column | Description |
|--------|-------------|
| `category` | Data category (scripts, settings, labels, etc.) |
| `entity_name` | Entity name or identifier |
| `property_summary` | Key properties snapshot |
| `hash` | SHA-256 hash of the entity data |

Click **Generate Report** to download. The report captures the current state and is not stored.

---

## Baselines

A baseline is a point-in-time snapshot of your configuration. Use baselines to detect changes over time.

### Creating a baseline

1. Click **Create Baseline**
2. Enter a **name** (required, max 200 characters) and optional **description**
3. Configure the **scope** - which sections to include:
   - Scripts (optionally filtered by folder or label)
   - Settings
   - Custom Whitelists / Blacklists
   - Global Variables
   - Labels / Folders
4. Optionally enable **Auto-check** for scheduled monitoring
5. Click **Create**

The baseline captures the current state and computes SHA-256 hashes for all included data.

### Script filtering

When including scripts in the baseline scope, you can filter by:

| Mode | Description |
|------|-------------|
| **All** | Include every script |
| **By folder** | Include scripts in specific folders |
| **By label** | Include scripts with specific labels |

### Managing baselines

Each baseline card shows the name, script count, creation date, and auto-check status. Available actions:

- **Check Now** - run a drift check immediately
- **Auto-check toggle** - enable/disable scheduled checks
- **Delete** - remove the baseline and all its drift results

---

## Drift checks

A drift check compares the current system state against a saved baseline to detect what has changed.

### Running a check

Click **Check Now** on any baseline card. The check:

1. Captures the current system state using the same scope as the baseline
2. Computes SHA-256 hashes for all current data
3. Compares baseline vs. current hashes to detect additions, modifications, and removals
4. Stores the result with detailed property-level diffs

### Result status

| Status | Meaning |
|--------|---------|
| **Clean** | No changes detected - current state matches the baseline |
| **Drifted** | Changes detected - one or more items differ from the baseline |

### Viewing results

Expand a baseline card to see its drift check history:

| Column | Description |
|--------|-------------|
| **Date** | When the check was run |
| **Status** | Clean or Drifted |
| **Trigger** | Manual or Scheduled |
| **Changes** | Summary of added/modified/removed items |
| **Duration** | Execution time |

Click a result to see detailed changes grouped by category. For modified scripts, individual property changes are shown with baseline and current values side by side.

---

## Auto-check

Enable auto-check on a baseline to run drift checks automatically on a schedule. Toggle it on the baseline card or during creation.

Scheduled checks store results the same way as manual checks - viewable in the baseline's drift history.

---

## CSV export

Each drift result can be exported as a CSV file with detailed change information.

| Column | Description |
|--------|-------------|
| `category` | Data category (scripts, settings, labels, etc.) |
| `entity_id` | Entity UUID |
| `entity_name` | Entity name |
| `property` | Changed property name |
| `baseline_value` | Value in the baseline |
| `current_value` | Current value |
| `status` | Change type (added, modified, removed) |
| `detected_at` | Timestamp of the drift check |

Click the **CSV** button on any drift result to download.

---

## Next steps

- [Administration](/docs/jibrok-studio-jira/admin-settings) - All admin configuration
- [Audit Logs](/docs/jibrok-studio-jira/admin-audit) - Settings and script execution audit
- [Admin Tools](/docs/jibrok-studio-jira/admin-tools) - Import/export, health check, diagnostics
