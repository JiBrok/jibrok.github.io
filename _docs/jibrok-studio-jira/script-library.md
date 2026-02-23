---
title: Script Library
key: jibrok-studio-jira
excerpt: Central management for saved scripts with folders, labels, search, and version history
category: core-features
tags:
  - doc
  - cloud
  - library
  - scripts
  - organization
---

* TOC
{:toc}

## Overview

The Library is the central hub for managing all saved scripts. It provides a table view with search, filtering, folder navigation, labels, and version history.

---

## Script List

The Library displays all saved scripts in a table:

| Column | Description |
|--------|-------------|
| **Name** | Script name (clickable to open) |
| **Preview** | First lines of script source code |
| **Created** | Creation date |
| **Updated** | Last modification date |
| **Author** | Who created or last edited the script |
| **Enabled** | On/off toggle |
| **Labels** | Assigned label tags |
| **Triggers** | Configured trigger types |

---

## Search and Filtering

### Search

Search across multiple fields:

- Script **name**
- Script **source code**
- **Author** name
- **Label** names

Results are highlighted to show which criteria matched.

### Filtering

- **By labels** — select one or more labels to filter
- **By trigger type** — show only scripts with specific triggers
- **By folder** — navigate into folders via breadcrumb navigation

---

## Folders

Folders provide a hierarchical structure for organizing scripts.

### Creating Folders

1. In the Library, click **Create Folder**
2. Enter a folder name
3. Choose a parent folder (or leave at root)

### Navigation

- Use the breadcrumb bar to navigate the folder hierarchy
- Click folder names to enter them
- "All Scripts" returns to the root

### Moving Scripts

Drag scripts between folders or use the script's Config tab to set the folder.

### Folder Limits

| Limit | Value |
|-------|-------|
| Max folders | 200 |
| Max folder name length | 50 characters |
| Max nesting depth | 10 levels |

Names must be unique within the same parent folder. When deleting a folder, its scripts and subfolders move to the parent folder (or root).

---

## Labels

Labels are color-coded tags for categorizing scripts. Unlike folders, one script can have multiple labels, and one label can be on multiple scripts.

### Creating Labels

1. Go to the **Admin** tab > Labels section
2. Click **Create Label**
3. Enter a name and optional color

### Available Colors

Auto, Default, Blue, Yellow, Purple, Red, Green. Each color has a regular and **bold** variant (13 options total).

### Assigning Labels

Assign labels in the script's Config tab. Select from available labels in the Labels dropdown.

### Filtering by Label

In the Library, click a label name to filter scripts by that label. Multiple labels can be selected.

### Label Limits

| Limit | Value |
|-------|-------|
| Max labels | 100 |
| Max label name length | 30 characters |
| Max labels per script | 10 |

Label names are normalized to lowercase. Deleting a label removes it from all scripts.

---

## Version History

Every time you save a script, a version snapshot is created automatically.

### Viewing Versions

Open a script and go to the **Version History** tab to see all saved versions with date, author, and description.

### Comparing Versions

Select two versions to see a **diff view** highlighting what changed between them.

### Restoring Versions

Restore any previous version — this creates a **new version entry** (the restored content becomes the latest version, preserving the full history).

### Limits

- Up to **50 versions** per script
- When the limit is reached, the oldest version is removed

---

## Script Actions

Each script has a quick actions menu:

| Action | Description |
|--------|-------------|
| **Open** | Open in Console editor |
| **Duplicate** | Create a copy with "(copy)" suffix |
| **Enable/Disable** | Toggle script execution |
| **Delete** | Remove from Library (with confirmation) |
| **Export** | Export as JSON |

> **Note:** Import/Export for bulk operations is available in the Admin tab. See [Administration](/docs/jibrok-studio-jira/admin-settings).

---

## Next Steps

- [Script Console](/docs/jibrok-studio-jira/script-console) — Write and run scripts
- [Triggers](/docs/jibrok-studio-jira/triggers) — Automate script execution
- [Administration](/docs/jibrok-studio-jira/admin-settings) — Import/export and label management
