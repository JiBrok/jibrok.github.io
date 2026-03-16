---
title: Recipes
key: jibrok-studio-jira
excerpt: Built-in batch operations for recalculating fields and processing issues at scale
category: administration
tags:
  - doc
  - cloud
  - recipes
  - batch
  - bulk
---

* TOC
{:toc}

## Overview

Recipes are built-in batch operations that process large numbers of Jira issues. They run as background jobs with progress tracking.

---

## Available recipes

### Recalculate fields

Recalculates scripted field values for issues matching a JQL query. Use this when you change a field script and need to update existing issues.

**Parameters:**

| Parameter | Required | Description |
|-----------|----------|-------------|
| Scripted Field | Yes | The scripted field to recalculate |
| Field Context | Yes | The field context (project/issue type scope) |
| JQL Filter | No | Additional JQL to narrow the scope |

The recipe automatically combines the field context restrictions with your JQL filter to determine which issues to process.

---

## Running a recipe

1. Open the **Recipes** tab in the Console
2. Select a recipe from the list
3. Configure the parameters
4. Click **Start**

The recipe validates parameters, counts matching issues, and starts a background job. You will see the job appear in the progress list immediately.

---

## Tracking progress

Each running recipe shows:

| Field | Description |
|-------|-------------|
| Status | `pending`, `running`, `completed`, `failed`, or `cancelled` |
| Total | Total issues to process |
| Processed | Successfully processed issues |
| Failed | Issues that encountered errors |
| Skipped | Issues that were skipped |

Progress updates in real-time. Click the job to see per-item errors if any occurred.

---

## Duplicate prevention

If a recipe with identical parameters is already running, starting a new one is blocked. Wait for the existing job to complete or cancel it first.

---

## Cancellation

Click **Cancel** on a running job to stop it. Issues already processed keep their new values - cancellation only prevents processing of remaining issues.

---

## Next steps

- [Scripted Fields](/docs/jibrok-studio-jira/scripted-fields) - Field configuration and context restrictions
- [Administration](/docs/jibrok-studio-jira/admin-settings) - Service project for notifications
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
