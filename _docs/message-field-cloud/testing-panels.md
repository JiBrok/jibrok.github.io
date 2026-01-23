---
title: Testing Panels
key: message-field-cloud
excerpt: Preview panels with real issue data and debug templates
category: configuration
tags:
  - doc
  - cloud
  - configuration
  - testing
  - preview
  - debug
---

* TOC
{:toc}

## Panel Preview

![Panel Preview Example](/uploads/message-field-cloud/configuration/panel%20preview%20example.png)

Test with real issue data:
1. Enter an **Issue key** (e.g., PROJ-123)
2. Click **Preview Panel**
3. View rendered result

The preview shows exactly how the panel will appear on the issue, including:
- Applied templates with actual data
- JQL query results
- Message formatting and styling

---

## Show Issue JSON

![Show Issue JSON](/uploads/message-field-cloud/configuration/right%20panel%20json.png)

View complete data structure:
1. Enter issue key
2. Click **Download Issue Data**
3. Explore available fields

Useful for:
- Finding field IDs for templates
- Understanding data format
- Discovering available fields
- Debugging template expressions

---

## Template Syntax Guide

![Template Syntax Guide](/uploads/message-field-cloud/configuration/right%20panel%20syntax.png)

Quick reference panel with:
- Variable syntax
- Condition examples
- Loop patterns
- Filter functions

Access the syntax guide directly from the configuration editor for quick reference while building templates.

---

## Debugging Tips

### Template Not Rendering

1. Check template syntax - use the Syntax Guide panel
2. Verify field names match the Issue JSON data
3. Test with a simple template first: `{{ issue.key }}`

### Panel Not Appearing

1. Verify configuration is **Enabled**
2. Check [Context Filters](context-filters) match the test issue
3. Ensure the [Display Module](modules) is enabled globally
4. Test Display JQL condition separately in Issue Navigator

### JQL Query Returns No Results

1. Test the JQL in Issue Navigator first
2. Check that `currentIssue` placeholder works for your test issue
3. Verify linked issues exist if using link-based queries

---

## Next Steps

- [Configuration Basics](configuration-basics) - Basic panel settings
- [Bulk Operations](bulk-operations) - Export and import configurations
- [Templates](templates) - Dynamic content syntax
- [Context Filters](context-filters) - Control when panels appear
