---
title: Version History
key: jibrok-studio-jira
excerpt: Automatic version tracking, comparison, and rollback for scripts
category: core-features
tags:
  - doc
  - cloud
  - versions
  - history
  - rollback
---

* TOC
{:toc}

## Overview

Every change to a script is automatically saved as a version, enabling change tracking, comparison, and rollback.

---

## What's tracked

Each version captures a snapshot of:

- **Source code**
- **Name** and **description**
- **Actor** (Run As) setting
- **Enabled** status
- **Type** (script or global)
- **Folder** assignment
- **Whitelist/Blacklist** assignments
- **Trigger** configuration (type, settings, enabled)
- **Author** (who made the change)

---

## Viewing history

1. Open a script in the Console
2. Go to the **Version History** tab
3. See all versions listed by date (newest first)

Each version shows: date, author, description, and actions.

---

## Comparing versions

Click **Diff** to compare any two versions side-by-side:

- **Green** highlights show additions
- **Red** highlights show removals
- Settings changes are summarized above the code diff

---

## Restoring a version

1. Click **Restore** on any version
2. Confirm the restoration
3. The script is rolled back to that version's state

### What gets restored

- Source code
- Name, description
- Actor setting
- Enabled status
- Folder assignment
- Whitelist/Blacklist assignments
- Trigger configuration (type, settings, enabled)

> **Note:** Restoring creates a new version entry (the restore action is recorded).

### Legacy versions

Older versions (created before the full snapshot feature) may only restore the source code.

---

## Limits

When the version limit is reached, the oldest version is automatically deleted (FIFO). See [Limits](/docs/jibrok-studio-jira/limits) for version count and description length limits.

---

## Next steps

- [Script Console](/docs/jibrok-studio-jira/script-console) - Version History tab
- [Script Library](/docs/jibrok-studio-jira/script-library) - Script management
- [Audit Logs](/docs/jibrok-studio-jira/admin-audit) - Version History Audit
