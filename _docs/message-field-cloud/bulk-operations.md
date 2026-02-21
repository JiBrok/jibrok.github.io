---
title: Bulk Operations
key: message-field-cloud
excerpt: Export, import, duplicate, and manage multiple configurations at once
category: configuration
tags:
  - doc
  - cloud
  - configuration
  - bulk
  - import
  - export
  - migration
---

* TOC
{:toc}

## Export Configurations

Save configurations as JSON file:
1. Go to **Apps** → **Message Panel Settings**
2. Click **Bulk Operations** tab
3. Select configurations to export
4. Click **Export Selected** or **Export All**

The exported file contains all selected panel configurations and custom field configurations in JSON format.

> **Tip:** Export configurations before making major changes as a backup.

---

## Import Configurations

Load configurations from JSON or CSV file:

![Import Configurations](/uploads/message-field-cloud/configuration/bulk%20import%20configurations.png)

1. Go to **Bulk Operations** tab
2. Click **Import**
3. Choose file format (JSON or CSV)
4. Paste file content
5. Click **Validate** to review
6. Confirm import

> **Note:** Imported configurations with duplicate names will be renamed automatically.

> **Note:** Export and import includes custom field configurations alongside panel configurations.

---

## JSON Format Reference

The JSON export uses the following structure:

```json
{
  "configurations": [
    {
      "name": "Configuration Name",
      "description": "Optional description",
      "enabled": true,
      "module": "jira:issuePanel",
      "weight": 0,
      "context": {
        "projects": ["PROJ1", "PROJ2"],
        "issueTypes": ["Bug", "Story"],
        "portals": [],
        "requestTypes": []
      },
      "dataSource": {
        "type": "jql",
        "jql": "project = PROJ AND status = Open",
        "maxIssues": 50,
        "rowsPerPage": 10
      },
      "message": {
        "renderType": "html",
        "content": "<p>Message content</p>",
        "messageType": "custom",
        "messageTitle": ""
      },
      "display": {
        "showName": true,
        "showDescription": true,
        "showCount": true,
        "showJqlLink": false,
        "displayJql": "",
        "displayCondition": "",
        "userFields": []
      },
      "modal": {
        "enabled": false,
        "buttonText": "",
        "buttonAppearance": "default",
        "modalSize": "medium",
        "autoOpen": false,
        "showOncePerIssue": false,
        "modalAppearance": "default",
        "closeButtonText": ""
      },
      "fields": {
        "tableFieldIds": [],
        "displayFieldIds": []
      },
      "linkedIssues": {
        "linkTypes": []
      }
    }
  ]
}
```

### Key Fields

| Field | Description |
|-------|-------------|
| `name` | Unique configuration name (max 100 characters) |
| `enabled` | Whether the configuration is active |
| `module` | Display module identifier |
| `weight` | Display order (lower = first, negatives allowed) |
| `context` | Project, issue type, portal, and request type filters |
| `dataSource.type` | `"jql"`, `"linkedIssues"`, or `"empty"` |
| `message.renderType` | `"text"`, `"html"`, `"markdown"`, or `"adf"` |
| `message.messageType` | `"custom"`, `"info"`, `"warning"`, `"error"`, `"success"`, or `"change"` |

---

## CSV Format Reference

The CSV export includes the following columns:

| Column | Description |
|--------|-------------|
| `name` | Configuration name |
| `description` | Configuration description |
| `enabled` | `true` or `false` |
| `module` | Display module |
| `weight` | Display order weight |
| `projects` | Comma-separated project keys |
| `issueTypes` | Comma-separated issue type names |
| `dataSourceType` | Data source type |
| `jql` | JQL query (if applicable) |
| `maxIssues` | Maximum issues to load |
| `rowsPerPage` | Rows per page |
| `renderType` | Message render type |
| `message` | Message content |
| `messageType` | Section message type |
| `messageTitle` | Section message title |
| `displayJql` | Display JQL condition |

> **Note:** CSV format is useful for bulk reviewing and editing configurations in a spreadsheet application. For full configuration fidelity (including all options), use JSON format.

---

## Validation Details

When importing configurations, the **Validate** step checks:

| Check | Description |
|-------|-------------|
| **Name uniqueness** | Detects duplicate names across existing and imported configurations |
| **Required fields** | Ensures `name` and `module` are present |
| **Module validity** | Checks that the module identifier is valid |
| **JQL syntax** | Basic JQL syntax validation (if applicable) |
| **Field limits** | Validates field counts don't exceed limits |
| **JSON structure** | Validates the JSON/CSV structure is well-formed |

### Name Conflict Resolution

When an imported configuration has the same name as an existing one:
- The import tool flags the conflict during validation
- You can choose to **rename** the imported configuration (a suffix is added automatically)
- Existing configurations are never overwritten during import

---

## Migration Between Instances

Use export/import to migrate configurations between Jira instances (e.g., dev → staging → production).

### Migration Workflow

1. **Export** all configurations from the source instance
2. **Review** the exported JSON for environment-specific values:
   - Project keys — must match on the target instance
   - Issue type names — must match on the target instance
   - Custom field IDs — may differ between instances
   - Portal IDs — will differ between instances
3. **Edit** the JSON if needed to adjust values for the target environment
4. **Import** into the target instance
5. **Validate** and review the import preview
6. **Test** imported configurations with real issues

### Tips for Migration

- **Project keys**: Keep project keys consistent across environments when possible
- **Custom fields**: Use field names instead of IDs in templates when possible — names are more portable
- **JQL queries**: Review parametric JQL for environment-specific references
- **Portals**: JSM portal IDs will need to be updated manually after import
- **Module settings**: Module enable/disable settings are not included in export — configure these separately on each instance

---

## Duplicate Configuration

Create a copy of existing configuration:
1. Click **...** menu on the configuration row
2. Select **Duplicate**
3. New configuration created with "(Copy)" suffix

---

## Bulk Enable/Disable

Enable or disable multiple configurations at once:

1. Go to **Bulk Operations** tab
2. Select configurations using checkboxes
3. Click **Enable Selected** or **Disable Selected**

This is useful for:
- Temporarily disabling all panels during maintenance
- Enabling a set of new configurations together
- Testing by toggling configurations on/off

> **Note:** Bulk enable/disable operations also apply to custom field configurations.

> **Tip:** You can also toggle individual configurations using the switch in the configuration list.

---

## Configuration Management

### Edit

1. Click on configuration name or row
2. Modify settings
3. Click **Save**

### Delete

Remove configuration permanently:
1. Click **...** menu
2. Select **Delete**
3. Confirm deletion

> **Warning:** Deletion is permanent. Export configuration first if you may need it later.

---

## Next Steps

- [Configuration Basics](configuration-basics) - Basic panel settings
- [Testing Panels](testing-panels) - Preview and debug configurations
- [Templates](templates) - Dynamic content syntax
- [Limits](limits) - Configuration size and count limits
