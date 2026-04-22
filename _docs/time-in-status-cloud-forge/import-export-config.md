---
title: Import and Export configuration
key: time-in-status-cloud-forge
excerpt: "Export your Time in Status configuration as JSON for backup or transfer, and import configurations with conflict resolution and DC format conversion."
category: integration-export
tags: [doc, cloud, time-in-status, forge, import, export, configuration, backup, migration, data-center]
---

* TOC
{:toc}

---

## Overview

The Import / Export tab in the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) lets you:

- **Export** your configuration to a JSON file for backup or transfer to another Jira site
- **Import** a previously exported configuration, with options to handle conflicts
- **Convert** Data Center (Server) format configurations to Forge format during import

---

## Export

### Exportable sections

You can selectively export any combination of:

| Section | Description |
|---------|-------------|
| **Calendars** | Work calendars with all settings |
| **Custom Events** | Custom event definitions |
| **Field Settings** | Time in Status field settings |
| **Web Panels** | Time in Status web panels |
| **Stopwatch Field Settings** | Stopwatch field settings |
| **Stopwatch Web Panels** | Stopwatch web panels |
| **Timer Field Settings** | Timer field settings |
| **Timer Web Panels** | Timer web panels |
| **Time Between Dates Field Settings** | TBD field settings |
| **Calendar Field Configurations** | Calendar Select field context configs |

### How to export

1. Open the [admin panel](/docs/time-in-status-cloud-forge/admin-panel) > **Import / Export** tab
2. Click **Export**
3. Select the sections you want to export (or use **Select All**)
4. Click **Export**
5. The JSON output appears in a text area

<!-- [Screenshot: export-modal] -->

You can:
- **Copy to Clipboard** - copy the JSON to paste elsewhere
- **Download File** - save as a `.json` file with a timestamped filename

<!-- [Screenshot: export-result] -->

---

## Import

### How to import

1. Open the **Import / Export** tab
2. Click **Import**
3. Upload a JSON file or paste JSON content

<!-- [Screenshot: import-modal-upload] -->

4. The app validates the file and shows a **preview** of what will be imported

<!-- [Screenshot: import-modal-preview] -->

5. Select which items to import (checkboxes for each item)
6. Choose a **conflict strategy** for items that already exist
7. Click **Import**
8. Review the results

<!-- [Screenshot: import-result] -->

### Conflict strategies

When an imported item has the same name as an existing item:

| Strategy | Description |
|----------|-------------|
| **Skip** | Keep the existing item unchanged. The imported item is ignored. |
| **Overwrite** | Replace the existing item with the imported version. |
| **Rename** | Import the item with a numeric suffix appended to avoid the conflict. For example, if a calendar named `Business Hours` already exists, the imported one is stored as `Business Hours (1)`; if that also exists, `Business Hours (2)`, and so on. |

<!-- [Screenshot: import-modal-conflict] -->

### Validation

Before importing, the app validates:

- **Format** - correct JSON structure and version
- **References** - items that reference other items (e.g., a field setting referencing a calendar) are checked for consistency
- **Conflicts** - items with matching names are flagged

Each item in the preview shows:
- **Action**: Create, Update, or Skip
- **Warnings**: any issues found during validation
- **Valid**: whether the item can be imported

---

## Data Center format conversion

When you upload a JSON file exported from the **Data Center (Server)** version of Time in Status, the app automatically detects the format and converts it to Forge format.

The DC format (version 2) is converted to Forge format (version 1) with:

- Calendar mappings
- Field setting conversion
- Event trigger mapping
- Status and status category ID conversion

**Note**: some DC features may not have direct Forge equivalents. The app shows conversion warnings for any items that could not be fully converted.

---

## File limits

| Limit | Value |
|-------|-------|
| Maximum file size | 5 MB |
| Format | JSON |

---

## Use cases

### Backup configuration

Export all sections periodically to have a backup of your configuration. Store the JSON file in your team's document management system.

### Transfer between Jira sites

1. Export from the source Jira site
2. Import into the target Jira site
3. Use **Rename** strategy if both sites already have some configuration

### Migrate from Data Center

1. Export configuration from your DC instance (using the DC app's export feature)
2. Import the DC JSON file into the Forge app
3. The app automatically converts the format
4. Review conversion warnings and adjust as needed
5. Bind field contexts to the imported settings

See [Migration from Data Center](/docs/time-in-status-cloud-forge/migrationDocumentation) for a complete guide.

---

## Tips

- **Export before changes**: always export your current configuration before making significant changes. This gives you a restore point.
- **Selective import**: you do not need to import everything. Use the checkboxes to select only the items you need.
- **Calendar references**: if you import field settings that reference calendars, import the calendars first (or in the same batch) so the references resolve correctly.
- **Review warnings**: pay attention to validation warnings. They may indicate missing calendar references or unsupported features from DC format.
