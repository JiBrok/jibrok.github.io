---
title: Import & Export
key: jibrok-studio-jira
excerpt: Export and import scripts as JSON for backup, migration, or sharing
category: administration
tags:
  - doc
  - cloud
  - import
  - export
  - backup
  - migration
---

* TOC
{:toc}

## Overview

Export and import scripts as JSON for backup, migration, or sharing between Jira sites.

---

## Export

1. Go to the **Admin** tab - Export section
2. Select scripts to export (or export all)
3. Click **Export**
4. Copy to clipboard or download as file

### What's included

- Script source code
- Name, description, enabled status
- Actor configuration
- Labels and folder path
- Trigger configurations
- Version history

### Export format

JSON with metadata:

```json
{
  "format_version": 1,
  "exportedAt": "2024-01-15T12:00:00Z",
  "scripts": [...]
}
```

---

## Import

1. Go to the **Admin** tab - Import section
2. Paste JSON or upload a file
3. Review the preview (created vs. updated counts)
4. Click **Import**

### Import behavior

- **New scripts** (unknown ID) are created
- **Existing scripts** (matching ID) are updated (merged)
- Folders are created automatically if they don't exist
- Labels are created automatically if they don't exist

### Validation

Before importing, the system validates:

- JSON format and version
- Script count limits
- Required fields

---

## Limits

See [Limits](/docs/jibrok-studio-jira/limits) for import size and script count limits.

---

## Next steps

- [Script Library](/docs/jibrok-studio-jira/script-library) - Managing scripts
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
- [Administration](/docs/jibrok-studio-jira/admin-settings) - Admin tab overview
