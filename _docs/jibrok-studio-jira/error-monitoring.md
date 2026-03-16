---
title: Error Monitoring
key: jibrok-studio-jira
excerpt: Automatic error tracking, aggregation, and notifications for script failures
category: administration
tags:
  - doc
  - cloud
  - errors
  - monitoring
  - notifications
---

* TOC
{:toc}

## Overview

The Error Monitor automatically tracks and aggregates script errors across all trigger types, helping you identify and fix recurring problems.

---

## How it works

When a script fails during execution (from any trigger type), the error is recorded in the Error Monitor:

1. The error message is **normalized** - issue keys, UUIDs, line numbers, and status codes are replaced with placeholders
2. A **hash** is computed from the normalized message and the script source
3. If an error with the same hash already exists, the **occurrence count** is incremented
4. If it is a new error pattern, a new entry is created

This grouping ensures that the same error occurring across many issues appears as a single entry with a count, rather than flooding you with duplicates.

---

## Viewing errors

Open the **Error Monitor** tab in the Console to see all active errors.

Each error entry shows:

| Field | Description |
|-------|-------------|
| Script | The script that produced the error |
| Error Message | The original error message |
| Line | Error line number (if available) |
| Trigger Type | Which trigger caused the error |
| Occurrences | How many times this error has been recorded |
| First Seen | When the error first occurred |
| Last Seen | When the error most recently occurred |
| Issue | Linked Jira issue (if notifications are configured) |

**Filtering:** Filter errors by script or trigger type to narrow the list.

---

## Error statuses

| Status | Description |
|--------|-------------|
| **Active** | The error is ongoing and being tracked |
| **Resolved** | The error has been dismissed or the script source was changed |

Errors are automatically resolved when you save a new version of the script with different source code. You can also manually resolve errors by clicking the **Resolve** button.

---

## Automatic notifications

When a [Service Project](/docs/jibrok-studio-jira/admin-service-projects) is configured with error notifications enabled:

- **New errors** create a Jira issue in the service project with full error details, script link, and trigger context
- **Repeated errors** add milestone comments to the existing issue at 5, 10, 50, 100, 500, and 1,000 occurrences
- **Daily rate limit** prevents excessive issue creation

Notifications can be filtered by trigger type in the service project configuration.

---

## Throttling

To prevent database overload from high-frequency errors (e.g., a scripted field failing on every issue update), error recording is throttled. If the same error is recorded within 60 seconds, the duplicate update is skipped.

---

## Next steps

- [Service Project Integration](/docs/jibrok-studio-jira/admin-service-projects) - Configure error notifications
- [Triggers](/docs/jibrok-studio-jira/triggers) - Trigger types that can produce errors
- [Administration](/docs/jibrok-studio-jira/admin-settings) - Global trigger controls
