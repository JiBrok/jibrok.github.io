---
title: FAQ & Troubleshooting
key: message-field-cloud
excerpt: Answers to common questions and troubleshooting guide
category: guides
tags:
  - doc
  - cloud
  - faq
  - troubleshooting
  - help
---

* TOC
{:toc}

## Installation & Setup

### The app is installed but I don't see any panels

1. Go to **Apps** → **Message Field Settings**
2. Check the **Module Settings** tab — ensure the desired modules are enabled
3. Create at least one panel configuration with [Configuration Basics](configuration-basics)
4. Verify the configuration is **Enabled** (toggle is on)
5. Check that the configuration targets the correct project and issue type

### What permissions are needed to install the app?

Only **Jira site administrators** can install apps from the Atlassian Marketplace. After installation, site admins can use [Delegation](delegation) to allow project admins to manage configurations for their projects.

### Modules are not appearing in the expected locations

1. Verify modules are enabled in **Module Settings**
2. After enabling a module, refresh the issue page
3. For JSM portal modules, verify UIM registrations in the [Modules](modules) page — use **Reregister All** if needed
4. Check that your browser is not caching old content (try hard refresh)

---

## Panels Not Showing

If a panel isn't appearing where you expect it, work through this checklist:

### Diagnostic Checklist

1. **Is the module enabled?**
   - Go to **Module Settings** and verify the target module is toggled on

2. **Is the configuration enabled?**
   - Open the configuration and check the **Enabled** toggle

3. **Do context filters match?**
   - Check **Project** filter — does the issue's project match?
   - Check **Issue Type** filter — does the issue type match?
   - Check **Portal** filter (JSM) — does the portal match?
   - Check **Request Type** filter (JSM) — does the request type match?

4. **Does the Display JQL match?**
   - Test the Display JQL in Jira's Issue Navigator with the specific issue
   - For parametric JQL, use [Test JQL](testing-panels) to see the resolved query

5. **Does the Display Condition match?**
   - Use the [Test Context](testing-panels) feature to check all conditions at once

6. **Does the User Field filter match?**
   - If user field visibility is configured, verify the current user is in the specified field

> **Tip:** Use the **Test Context** button in the configuration editor to check all conditions for a specific issue at once.

---

## Template Issues

### My template shows raw text instead of rendered content

- Ensure the **Message Render Type** is set correctly (HTML for HTML content, Markdown for Markdown)
- Verify template syntax: variables use {% raw %}`{{ double braces }}`{% endraw %} and logic uses {% raw %}`{% block tags %}`{% endraw %}
- Check for unclosed tags: every {% raw %}`{% if %}`{% endraw %} needs {% raw %}`{% endif %}`{% endraw %}, every {% raw %}`{% for %}`{% endraw %} needs {% raw %}`{% endfor %}`{% endraw %}

### Template shows an error message

- Check the error details — they usually include the line number and description
- Common causes:
  - Typo in variable name ({% raw %}`{{ isue.key }}`{% endraw %} instead of {% raw %}`{{ issue.key }}`{% endraw %})
  - Missing closing tag
  - Invalid filter name
  - Unclosed string in condition
- Use **Preview Panel** to test incrementally — start with a simple template and add complexity

### How do I debug template variables?

1. Use **Download Issue Data** to see all available fields and their values
2. Start with {% raw %}`{{ issue | dump }}`{% endraw %} to see the full issue object (for debugging only)
3. Test individual variables: {% raw %}`{{ issue.fields.status.name }}`{% endraw %}
4. Use the `default` filter to handle null values: {% raw %}`{{ issue.fields.assignee.displayName | default("Unassigned") }}`{% endraw %}

### Template is slow or times out

- The template engine has an **800ms timeout** and a **10,000 iteration limit**
- Avoid heavy operations inside loops (nested loops, complex filters)
- Use {% raw %}`| take(N)`{% endraw %} to limit loop iterations
- Reduce the number of linked issues with a lower **Max Issues** setting
- See [Limits](limits) for all template engine constraints

---

## JQL Issues

### Parametric JQL not resolving

If template variables in JQL aren't being replaced:
- Ensure the JQL field contains valid template syntax: {% raw %}`{{ issue.key }}`{% endraw %}
- Use **Test JQL** to see the resolved query
- Check that the variable path exists in the issue data (use **Download Issue Data**)
- Add `| default("")` to prevent errors from null values

### "User does not have permission" error

- The JQL runs as the **viewing user** by default
- If the user doesn't have permission to browse certain projects, those issues won't appear
- Site admins can configure the **Actor** setting to run JQL as a specific user
- For JSM portal panels, consider using the **Application user** actor option

### currentUser not working in JQL

{% raw %}
- Use `{{ currentUser.accountId }}` — not `currentUser()` (which is Jira's built-in function)
- `currentUser()` works in **Display JQL** (Jira native) but not in parametric JQL templates
- In the JQL data source, use: `assignee = "{{ currentUser.accountId }}"`
{% endraw %}

---

## JSM Portal Issues

### Panel not showing on portal

1. Verify you're using a **JSM Portal module** (not a Jira module)
2. Check the **Portal** filter in context settings — at least one portal must be selected
3. Verify UIMs are registered: go to [Modules](modules) → **UIM Management** → **Reregister All** if needed
4. Check that the request type matches (if request type filter is set)
5. Clear browser cache and reload the portal page

### Customers can't see the panel

- JSM portal panels use **unlicensed access** — customers don't need a Jira license
- Verify the module is one of the JSM portal modules (Portal Panel, Footer, Subheader, or Create variants)
- Ensure the panel is targeting the correct portal and request types

### Panel shows different data on portal vs Jira

- Portal panels may run with different permissions than Jira panels
- JQL results can differ based on the executing user's permissions
- For consistent results, consider using the **Actor** setting or the **Application user** option

---

## Custom Field Issues

### Custom field not appearing on screens

1. Verify the **Custom Field** module is enabled in Module Settings
2. Ensure the custom field is added to the relevant **Jira screens** (create, edit, view, transition)
3. Check that a **field context** covers the current project and issue type
4. Verify a **configuration exists** for the specific field context

### Field shows empty on certain issue types

- Each field context needs its own configuration
- If no configuration exists for a context, the field displays as empty
- Go to **Custom Fields** tab → select the field → select the context → create a configuration

### Custom field configurations disappearing

- Message Field runs an hourly cleanup scheduler that detects deleted fields and removed contexts
- If a custom field is deleted in Jira, its configurations are automatically **disabled**
- If a field context is removed, the associated configuration is **disabled**
- Disabled configurations can be found in the configuration list and re-enabled if the field/context is restored

---

## Performance

### Panels are slow to render

- Reduce **Max Issues** — start with 50 and increase only if needed
- Simplify JQL queries — avoid `text ~ "keyword"` on large datasets
- Use indexed fields in JQL: `project`, `status`, `assignee`, `priority`
- Reduce the number of **table fields** — each field adds to rendering time
- Simplify template logic — avoid nested loops and complex calculations
- See [Limits](limits) for performance recommendations

### Too many API calls

- Each panel with a JQL or Linked Issues data source makes API calls to load issue data
- Panels with **Empty** data source make no additional API calls
- Consider combining information into fewer panels rather than many small ones
- Use **Display JQL** conditions to prevent unnecessary data loading when the panel wouldn't be shown

---

## Delegation Issues

### Project admin can't see Message Field Settings

1. Verify delegation is **enabled** for the project — check with a site admin
2. The setting appears in **Project Settings** → **Apps** → **Message Field Settings**
3. The user must have the **Administer Projects** permission for the project
4. If using "Disable with Exceptions" policy, the specific project must be in the enabled list

### Project admin can't edit a configuration

- Project admins can only edit configurations that target **their specific project**
- Configurations targeting "All Projects" or multiple projects are managed by site admins only
- The **Actor** setting cannot be changed by project admins

---

## Rovo Issues

### Rovo agent not appearing

- Rovo agents may take **up to 24 hours** to appear after app installation
- Verify Rovo is **enabled** on your Atlassian site
- Ensure the user has a **Rovo-enabled plan**
- Try refreshing the Rovo skills list

### Agent actions timing out

- Reduce the scope of analysis — use specific issue keys instead of broad queries
- Add link type filters to narrow dependency trees
- Use project filters to limit the search scope
- Break large analyses into multiple smaller queries
- See [Rovo Integration](rovo-integration) for optimization tips

---

## Related Documentation

- [Testing Panels](testing-panels) - Preview and debug tools
- [Configuration Basics](configuration-basics) - Panel setup
- [Limits](limits) - System limits and performance
- [Permissions & Security](permissions-security) - Access control details
