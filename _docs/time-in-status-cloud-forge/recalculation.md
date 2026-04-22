---
title: Recalculation and data freshness
key: time-in-status-cloud-forge
excerpt: "Monitor data freshness, run batch recalculation jobs, manage processing state, and clean up orphaned field contexts."
category: system-information
tags: [doc, cloud, time-in-status, forge, recalculation, batch-jobs, data-freshness, administration]
---

* TOC
{:toc}

---

## Overview

The Recalculation tab in the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) lets you monitor and manage the freshness of field values across your Jira instance. It shows which issues have been processed, which are stale, and lets you trigger batch recalculation jobs.

<!-- [Screenshot: recalc-panel-overview] -->

---

## When to recalculate

You should run a recalculation when:

- **New field setting created** - existing issues need their values calculated for the first time
- **Field setting changed** - changes to statuses, events, calendars, or goals need to be applied to existing issues
- **Calendar modified** - working hours, holidays, or timezone changes affect all calculated values
- **Issues seem stale** - field values have not updated as expected
- **After initial setup** - to backfill values for all existing issues

---

## Data freshness

The Recalculation tab shows freshness statistics for each field and context combination.

<!-- [Screenshot: recalc-freshness-bar] -->

### Freshness categories

| Category | Description |
|----------|-------------|
| **Up-to-date** | Issues whose field values are current and valid. |
| **Stale** | Active issues whose field values exist but may be outdated (e.g., `DateNextUpdate` is in the past). Only active fields can be stale — a running timer, a running stopwatch, or a Time in Status field in the Active state. Stopped, completed, and inactive fields are considered up-to-date regardless of `DateNextUpdate`. The scheduled handlers process stale issues automatically, but you can trigger immediate recalculation. |
| **Unprocessed** | Issues that have never had their field values calculated. These need a recalculation to get initial values. |

### Freshness bar

Each field context shows a stacked bar with the proportion of up-to-date (green), stale (yellow), and unprocessed (gray) issues. Click **Refresh** to update the freshness data.

---

## Running a recalculation

### Recalculation modes

| Mode | Description |
|------|-------------|
| **Full** | Recalculate all issues in this context. Use after significant configuration changes. |
| **Unprocessed** | Only calculate values for issues that have never been processed. Use for initial backfill. |
| **Stale** | Only recalculate issues with stale data (DateNextUpdate in the past). Use for targeted refresh. |

### How to start

1. Find the field and context in the Recalculation tab
2. Click the **Recalculate** button
3. Select the mode (Full, Unprocessed, or Stale)
4. The batch job starts in the background

### Monitoring batch jobs

<!-- [Screenshot: recalc-batch-job-running] -->

Active and recent batch jobs show:

| Field | Description |
|-------|-------------|
| **Status** | Pending, Running, Completed, Failed, or Cancelled |
| **Progress** | Processed / Total issues with progress bar |
| **Errors** | Number of issues that failed to process, with error details |
| **Duration** | How long the job has been running |

### Cancelling a job

Click **Cancel** on a running job to stop it. Already-processed issues keep their updated values.

---

## Processing pause

You can **pause all background processing** globally. While pause is on:

- Scheduled recalculation cycles are skipped
- Event-driven updates (issue create/update) are skipped
- New batch jobs cannot be started
- Active batch jobs are **frozen in place** — their queued work is skipped until you resume, at which point processing picks up where it left off. Running jobs are **not** cancelled and keep their already-processed values.

Use this during maintenance or when you need to make multiple configuration changes without triggering intermediate recalculations.

<!-- [Screenshot: recalc-processing-paused] -->

To pause: click **Pause Processing** at the top of the Recalculation tab.
To resume: click **Resume Processing**.

---

## Orphaned contexts

An orphaned context occurs when:

- A Jira custom field is deleted, but its context data remains in the app
- A field context is removed from Jira, but the app still has a binding for it

The Recalculation tab detects orphaned entries and lets you **clean them up**:

- **Cleanup orphaned field** - removes all data for a deleted custom field
- **Cleanup orphaned context** - removes data for a deleted field context

---

## How automatic updates work

The app updates field values through several mechanisms:

| Mechanism | Trigger | Frequency |
|-----------|---------|-----------|
| **Event-driven** | Issue created or updated | Immediate (via queue) |
| **Frequent scheduled refresh** | Picks up stale active fields | Every 5 minutes |
| **Slow scheduled refresh** | Periodic maintenance sweep | Every hour |

Scheduled refresh cycles pick up active issues with `DateNextUpdate` in the past and recalculate them. The further in the future the next update is needed, the less frequently the value is refreshed.

---

## Tips

- **Full recalculation is safe**: running a Full recalculation does not duplicate or corrupt data. It simply recalculates all values from the issue changelog.
- **Large instances**: for instances with many issues, Full recalculation may take time. Monitor progress in the batch job status area.
- **Errors are per-issue**: if a batch job shows errors, click to see which specific issues failed and why. Common causes: issue deleted during processing, permission issues, or rate limiting.
- **Pause before bulk changes**: if you are making multiple configuration changes (updating calendars, events, settings), pause processing first, make all changes, then resume and run a Full recalculation.
