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
---

* TOC
{:toc}

## Export Configurations

Save configurations as JSON file:
1. Go to admin page
2. Click **Bulk Operations** tab
3. Select configurations to export
4. Click **Export Selected** or **Export All**

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
