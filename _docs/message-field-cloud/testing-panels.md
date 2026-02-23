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

## JQL Parameter Preview

For panels using **parametric JQL** (JQL with template variables), use the **Test JQL** feature to verify the query resolves correctly.

**How to test:**
1. Enter an **Issue key** in the preview field
2. Click **Test JQL**
3. The template variables are replaced with real values from the specified issue
4. The resolved JQL is shown along with the number of matching issues

**Example:**

{% raw %}
Your JQL template:
```jql
"Epic Link" = {{ issue.key }} AND status != Done
```

With issue key `PROJ-100`, resolves to:
```jql
"Epic Link" = PROJ-100 AND status != Done
```
{% endraw %}

The result shows how many issues match and whether the JQL is valid.

> **Tip:** If the resolved JQL returns 0 results, verify the issue has the expected relationships or data.

---

## Message Parameter Preview

Test how your message template renders with real issue data.

**How to test:**
1. Enter an **Issue key** in the preview field
2. Click **Preview Panel**
3. Template variables are replaced with actual values from the issue
4. The rendered message is displayed exactly as it would appear on the issue

This is especially useful for:
- Verifying conditional blocks (`{% raw %}{% if %}{% endraw %}`) show the correct branch
- Checking date formatting and calculations
- Testing loop output with real linked issues data
- Validating HTML/Markdown rendering

---

## Context Preview

The **Test Context** feature checks all filter conditions for a specific issue to determine whether a panel would be visible.

**How to test:**
1. Enter an **Issue key**
2. Click **Test Context**
3. View results for each filter condition:
   - **Project filter** - does the issue's project match?
   - **Issue type filter** - does the issue type match?
   - **Display JQL** - does the issue match the JQL condition?
   - **User field filter** - does the current user match?
   - **Portal/Request type filter** (JSM) - do the portal settings match?

Each condition shows a pass/fail status, making it easy to identify which filter is preventing a panel from appearing.

> **Tip:** If all conditions pass but the panel still doesn't show, verify the display module is enabled in [Module Settings](modules).

---

## Testing Display Conditions

Display conditions use template syntax to conditionally show or hide panels. To test them:

1. Configure a **Display Condition** using template syntax (see [Display Conditions](display-conditions))
2. Enter a test **Issue key** in the preview
3. Click **Preview Panel** - the preview respects display conditions
4. If the condition evaluates to false, the preview shows that the panel would be hidden

**Testing tips:**
- Start with a simple condition and build up complexity
- Use the **Issue JSON** view to verify field values before writing conditions
- Test with multiple issues to verify both the "show" and "hide" cases
- Remember that display conditions **fail open** by default - if the template has an error, the panel shows

---

## Testing JSM Portal Panels

JSM portal panels have additional considerations when testing:

- **Portal filter** - ensure the correct portal is selected in context filters
- **Request type filter** - verify the request type matches
- **Customer vs Agent view** - portal panels are visible to customers; test from the customer portal if possible
- **Unlicensed access** - JSM portal panels use `unlicensedAccess`, so the viewer doesn't need a Jira license

**Tips for testing JSM panels:**
1. Use **Preview Panel** with a service desk issue key to test message rendering
2. Verify the portal and request type filters match in **Test Context**
3. Open the customer portal in a separate browser/incognito window to see the actual customer view
4. For JSM Create modules, test by navigating to the request creation form in the portal

---

## Display Fields Preview

![Display Fields Preview](/uploads/message-field-cloud/configuration/panel%20settings%20display%20fields%20preview.png)

When configuring **Display Fields** (fields from the current issue shown above the table), you can preview how they render:

1. Select the display fields you want to show
2. Enter an **Issue key** in the preview
3. Click **Preview Panel**
4. The display fields appear above the issue table with real data

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

## Common Errors

### Template Syntax Errors

When a template has a syntax error, the panel displays an error message instead of the rendered content.

**Common causes:**
- Missing closing tags: {% raw %}`{% if ... %}` without `{% endif %}`{% endraw %}
- Typo in variable name: {% raw %}`{{ isue.key }}` instead of `{{ issue.key }}`{% endraw %}
- Invalid filter: {% raw %}`{{ value | nonexistentFilter }}`{% endraw %}
- Unclosed string: {% raw %}`{% if status == "Open %}`{% endraw %}

**How to fix:**
1. Check the error message - it typically includes the line number and description
2. Use the **Template Syntax Guide** panel for correct syntax
3. Start with a minimal template and add complexity incrementally
4. Use **Preview Panel** after each change to catch errors early

### JQL Errors

JQL errors appear when the query syntax is invalid or references nonexistent fields.

**Common causes:**
- Referencing a custom field that doesn't exist: `"Custom Field Name" = value`
- Invalid JQL function: `status = inProgress()` (not a valid function)
- Parametric JQL where the template variable resolves to an empty value

**How to fix:**
1. Test the JQL in Jira's Issue Navigator first
2. For parametric JQL, use **Test JQL** to see the resolved query
3. Ensure custom field names match exactly (case-sensitive)
4. Check that template variables have `| default` fallbacks for potentially empty values

### Display Condition Errors

Display conditions use the same template engine as messages. Errors in display conditions cause the condition to **fail open** - the panel shows regardless.

**How to fix:**
1. Use **Test Context** to check the condition evaluation
2. Verify the condition returns a truthy/falsy value
3. Test the condition in the message template first to debug, then move it to the display condition field

---

## Debugging Tips

### Template Not Rendering

1. Check template syntax - use the Syntax Guide panel
2. Verify field names match the Issue JSON data
3. Test with a simple template first: {% raw %}`{{ issue.key }}`{% endraw %}

### Panel Not Appearing

1. Verify configuration is **Enabled**
2. Check [Context Filters](context-filters) match the test issue
3. Ensure the [Display Module](modules) is enabled globally
4. Test Display JQL condition separately in Issue Navigator
5. Use **Test Context** to check all conditions at once

### JQL Query Returns No Results

1. Test the JQL in Issue Navigator first
2. Use **Test JQL** to see the resolved parametric query
3. Verify linked issues exist if using link-based queries
4. Check that the executing user has permission to see the target issues

---

## Next Steps

- [Configuration Basics](configuration-basics) - Basic panel settings
- [Bulk Operations](bulk-operations) - Export and import configurations
- [Templates](templates) - Dynamic content syntax
- [Context Filters](context-filters) - Control when panels appear
- [FAQ](faq) - Common issues and troubleshooting
