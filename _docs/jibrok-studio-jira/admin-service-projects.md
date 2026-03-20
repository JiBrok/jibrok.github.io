---
title: Service Project Integration
seo_title: "Service Project Integration for Jira Scripts"
key: jibrok-studio-jira
excerpt: Automatic issue creation in service desk projects and issue tracking sync
category: administration
tags:
  - doc
  - cloud
  - admin
  - service-project
  - notifications
  - tracking
last_modified_at: 2026-03-16
date: 2026-03-16
seo:
  date_modified: 2026-03-16
---

* TOC
{:toc}

> Part of the [Administration](/docs/jibrok-studio-jira/admin-settings) reference.
> [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) | [Admin Tools](/docs/jibrok-studio-jira/admin-tools) | [Audit Logs](/docs/jibrok-studio-jira/admin-audit) | **Service Projects**

## Overview

Service Project Integration allows the application to automatically create Jira issues in a service desk project when certain events occur (e.g., script errors, notifications). It also tracks which issues were affected by script executions.

Two components:
- **Service Notifications** - automatic issue creation with configurable templates
- **Issue Tracking** - buffered sync of script execution data to Jira issue properties

---

## Service project configuration

Configure the service project in the **Admin** tab under **Service Project Settings**.

### Project selection

Select the target Jira project where issues will be created. Only projects accessible to the application are listed.

### Issue type

Set the default issue type for created issues. Available types depend on the selected project.

### Summary customization

| Setting | Description |
|---------|-------------|
| **Summary Prefix** | Text prepended to issue summaries (e.g., `[Studio]`) |
| **Summary Postfix** | Text appended to issue summaries |

### Metadata

| Setting | Description |
|---------|-------------|
| **Labels** | Comma-separated labels applied to created issues |
| **Component** | Default component for created issues |
| **Assignee** | Default assignee (searchable, minimum 2 characters) |
| **Custom Fields** | JSON-formatted custom field values |

### Save / clear

- **Save** - store the configuration
- **Clear** - remove the configuration and disable service notifications

---

## Service notifications

When configured, the application creates Jira issues with:

- Summary: prefix + notification summary + postfix
- Description from the notification details
- Configured labels, component, assignee, and custom fields
- Issue type from the configuration

Issue creation is non-blocking - if it fails, the error is logged but does not affect the triggering operation.

---

## Issue tracking

Issue tracking records which Jira issues were affected by script executions. Data is buffered locally and synced periodically to Jira issue properties.

### Tracked operations

| Operation | Trigger |
|-----------|---------|
| **create** | Script creates a new issue |
| **update** | Script updates an issue, adds a comment, worklog, or watcher |
| **transition** | Script transitions an issue |
| **delete** | Script deletes an issue |

### How it works

1. When a script modifies a Jira issue (create, update, transition, etc.), an entry is added to the tracking buffer
2. A scheduled sync reads pending entries and writes them as Jira issue properties via bulk API
3. Issue properties contain a history of which scripts affected the issue, with timestamps and operation types

### Settings

| Setting | Description |
|---------|-------------|
| **Tracking Enabled** | Toggle issue tracking on/off |
| **Sync Hour** | Hour (0-23) for the daily sync (adjusted to site timezone) |

### Issue property structure

Each tracked issue receives a `studio-executions` property:

```json
{
  "lastRunAt": "2025-01-15T10:30:00+00:00",
  "lastScriptId": "abc-123",
  "runCount": 5,
  "hasErrors": 0,
  "scriptIds": "abc-123 def-456",
  "history": [
    { "ts": "2025-01-15T10:30:00+00:00", "sid": "abc-123", "vid": null, "ok": 1 }
  ]
}
```

- `hasErrors` is a sticky flag - once set to `1`, it stays `1` permanently
- `history` keeps the last 400 entries per issue
- `scriptIds` is a space-separated list of all scripts that ever modified the issue

### JQL examples

Use Jira issue property syntax to search for tracked issues:

| JQL | Description |
|-----|-------------|
| `issue.property[studio-executions].runCount > 0` | All issues modified by scripts |
| `issue.property[studio-executions].hasErrors = 1` | Issues with failed executions |
| `issue.property[studio-executions].lastScriptId = "abc-123"` | Issues last modified by a specific script |
| `issue.property[studio-executions].scriptIds ~ "abc-123"` | Issues ever modified by a specific script |
| `issue.property[studio-executions].runCount > 10` | Frequently modified issues |

### Troubleshooting

| Issue | Solution |
|-------|----------|
| Pending count not decreasing | Check that sync hour matches expectations (uses site timezone). Use "Sync Now" button for manual sync |
| Entries stuck in-flight | In-flight entries are automatically reset after 24 hours. The next sync will retry them |
| No data on issues | Verify tracking is enabled. Only write operations (create/update/transition/delete) are tracked, not reads |

### Sync process

The sync runs at the configured hour and processes entries in batches:

1. Pending entries are grouped by issue
2. Existing issue properties are fetched via search API
3. New data is merged with existing history
4. Properties are written via Jira bulk API
5. Synced entries are cleaned up after 30 days

---

## Next steps

- [Administration](/docs/jibrok-studio-jira/admin-settings) - All admin configuration
- [Admin Tools](/docs/jibrok-studio-jira/admin-tools) - Import/export, health check, diagnostics
- [Audit Logs](/docs/jibrok-studio-jira/admin-audit) - Settings and script execution audit
