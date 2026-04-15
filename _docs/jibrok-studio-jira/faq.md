---
title: FAQ & Troubleshooting
key: jibrok-studio-jira
excerpt: "Frequently asked questions about JiBrok Studio for Jira - troubleshooting, limits, permissions, and common issues"
category: support
tags:
  - doc
  - cloud
  - faq
  - troubleshooting
  - support
seo_title: FAQ - JiBrok Studio Scripting for Jira
faq_schema:
  - question: "Who can use JiBrok Studio for Jira Cloud?"
    answer: "Only Jira site administrators. There is no role-based access - all admins have equal access to all features."
  - question: "What language do scripts use?"
    answer: "A JavaScript-like language that runs in a secure sandbox. Python and Groovy engines are also available."
  - question: "Is it safe to run scripts?"
    answer: "Yes. Scripts run in a multi-layer sandbox with strict resource limits. There is no way to access the host system, other apps, or data outside Jira."
  - question: "Can scripts call external APIs?"
    answer: "No. Scripts can only call the Jira REST API through requestJira() and built-in API namespaces. There is no fetch, XMLHttpRequest, or other network access."
  - question: "Can I use npm packages?"
    answer: "No. The sandbox has no module system. Only built-in globals and methods are available."
  - question: "Can scripts delete issues or change Jira configuration?"
    answer: "It depends on the execution identity. As Application - all DELETE operations are blocked. As Current User - the operation executes with that user's Jira permissions."
  - question: "Can I run scripts from Jira Automation?"
    answer: "Yes. JiBrok Studio provides an Automation action that can be used in Jira Automation rules. Configure it with a scriptId and optional issueKey."
  - question: "Can external systems trigger scripts?"
    answer: "Yes. The Webhook Trigger lets external systems call your scripts via HTTP requests with Basic Auth credentials. Supports GET, POST, PUT, and DELETE methods."
  - question: "What happens when my license expires?"
    answer: "All script execution is blocked: event triggers, scheduled scripts, async events, and field context updates are silently skipped. Workflow post functions, validators, and the Automation action return a 'License required' error. The admin UI (Console, Library, Administration) remains accessible so you can manage scripts while your license is being renewed."
last_modified_at: 2026-03-19
date: 2026-02-23
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## General

### Who can use JiBrok Studio for Jira Cloud?

Only Jira site administrators. There is no role-based access - all admins have equal access to all features.

### What language do scripts use?

A JavaScript-like language that runs in a secure sandbox. It supports most JS syntax (variables, functions, classes, async/await, destructuring) but runs in isolation with no access to the filesystem, network, or browser APIs. Python and Groovy engines are also available. See [Scripting Language](/docs/jibrok-studio-jira/scripting-language) for details.

### Is it safe to run scripts?

Yes. Scripts run in a multi-layer sandbox with strict resource limits. There is no way to access the host system, other apps, or data outside Jira. Sensitive endpoints (webhooks, audit logs, server info, user emails, bulk operations) are permanently blocked, and destructive operations require real user context. See [Security Overview](/docs/jibrok-studio-jira/security) for the complete security model.

### Why does the app request so many permissions?

JiBrok Studio requires 45 OAuth scopes across 9 categories. This number reflects Atlassian's requirement for fine-grained scopes - instead of one "full access" permission, each capability needs its own scope. For example, the Scripted Fields module alone requires 13 scopes for field and screen configuration. Most scopes are granular read permissions (e.g., separate scopes for reading issues, issue types, statuses, priorities, labels, and users). See [Security Overview](/docs/jibrok-studio-jira/security#why-does-the-app-need-these-permissions) for a complete breakdown by category.

### Can scripts delete issues or change Jira configuration?

It depends on the execution identity:

- **As Application** - all DELETE operations are blocked. Creating or modifying admin configuration (issue types, priorities, statuses, workflow schemes, screen schemes, groups, roles, permission schemes, and more) is also blocked. You will see the error: *"API call blocked: {METHOD} {PATH} - this operation is not allowed when running as app. Run the script as the current user instead."*
- **As Current User / Specific User** - the operation executes with that user's Jira permissions. DELETE is allowed only if the user has the corresponding Jira permission. All other restrictions (permanent blacklist, whitelist) still apply.

Destructive and administrative operations require real user context for proper Jira permission checks and correct audit trail attribution. See [Security Overview](/docs/jibrok-studio-jira/security#application-actor-restrictions) for the full list of restricted operations.

### Can scripts call external APIs?

No. Scripts can only call the Jira REST API through `requestJira()` and built-in API namespaces. There is no `fetch`, `XMLHttpRequest`, or other network access.

### Can I use npm packages?

No. The sandbox has no module system. Only built-in globals and methods are available. Use `eval(uuid)` to include other saved scripts.

### What happens when my license expires?

Script execution stops, but the admin UI remains accessible. Specifically:

- **Silently skipped** (trigger returns without running the script): event triggers, scheduled scripts, async events, field context updates, UI modifications on forms.
- **Explicit error** (visible to the user): workflow post functions and validators return a *"License required"* error, the Jira Automation action returns an error, and any action that calls the public resolver surfaces `LICENSE_REQUIRED`.
- **Still works**: the Console, Library, Administration, Version History, and Import/Export - so you can review, edit, and back up your scripts while renewing the license.

If your triggers suddenly stop firing without any errors in the Audit Log, check [Atlassian Marketplace](https://marketplace.atlassian.com/apps/2349892699) for your subscription status first - silent trigger skips are the most common symptom of an inactive license.

---

## Console issues

### What's the difference between "result" and "output"?

- **Output** (logs) - messages from `log()`, `print()`, `debug()`, `info()`, `warn()`, `error()` calls
- **Result** - the return value of the script, either from an explicit `return` or the value of the last expression

### What is Sandbox mode?

Sandbox mode runs the script with read-only Jira access. API calls that modify data (POST, PUT, DELETE) are simulated. Useful for testing scripts safely.

### What does "Run As" do?

It determines whose permissions are used for Jira API calls:

- **Current User** - your permissions (default)
- **Application** - the app's permissions (broader access)
- **Pre-configured User** - a named user from the admin-defined list
- **Specific User** - search for any Jira user

---

## Script errors

### Why did my script time out?

Scripts have execution time limits that vary by trigger type. See [Limits](/docs/jibrok-studio-jira/limits) for specific values. Common causes:

- Too many API calls (each call takes time)
- Large loops processing many items
- Complex JQL queries returning lots of data

**Tips:** Use `maxResults` in searches, process data in batches across multiple runs, select only needed `fields`. See [Limits](/docs/jibrok-studio-jira/limits) for all trigger-specific limits.

### I get "API call limit exceeded"

You've hit the per-execution API call limit (varies by trigger type, see [Limits](/docs/jibrok-studio-jira/limits)). Solutions:

- Use JQL to fetch data in bulk instead of one-by-one
- Use `Jira.search()` with specific `fields` to reduce data
- Split work across multiple scheduled runs

### What are uncatchable errors?

Some errors cannot be caught with `try/catch`: timeout errors, resource limit errors, and security errors. These immediately terminate the script to prevent abuse.

---

## Triggers not firing

### Checklist for all triggers

1. The **app license is active** - inactive licenses silently skip trigger execution (see [What happens when my license expires?](#what-happens-when-my-license-expires))
2. The **script** is enabled
3. The **trigger** is enabled
4. The trigger **type** is enabled globally in [Administration](/docs/jibrok-studio-jira/admin-settings)

### Scheduled triggers

- Verify the schedule interval (hourly/daily/weekly) is correct
- Check the Script Runs Audit in the Admin tab for execution records

### Event triggers

- Verify the correct event type is selected (e.g., `issue_updated` for issue edits)
- Events triggered by the app itself (via Application mode) are automatically ignored to prevent infinite loops
- Verify context restrictions (projects/issue types) match

### Async event triggers

- Ensure the target script has an enabled async event trigger
- Verify the `async_event` trigger type is enabled

---

## Scripted fields not updating

- Scripted fields recalculate on **issue create** and **issue update** only
- Verify the `scripted_fields` trigger type is enabled in Admin Settings
- Check that the field is assigned to the correct screens
- Scripts always run as Application - verify no API restriction blocks access

---

## UI modifications not working

- Verify the `uim` trigger type is enabled in Admin Settings
- Check the UIM trigger is configured for the correct project and issue type
- Ensure the script handles both `onInit` and `onChange` callbacks as needed
- Verify field IDs are correct (use `Fields.id()` to resolve by name)
- UIM scripts always run as **current user** - check user permissions
- Use **Sandbox Mode** in Console to test safely - UIM commands will be logged instead of executed

---

## Tables and queues issues

### What's the difference between tables and queues?

- **Tables** store persistent, structured data with columns and rows. Think of them as simple databases.
- **Queues** are for temporary, ordered messages that get processed and removed. Think of them as task lists.

### Tables

- Verify the table exists and column names match exactly (case-sensitive)
- Check row count hasn't reached the limit (see [Limits](/docs/jibrok-studio-jira/limits))
- Ensure row data size is within the allowed limit
- Tables can be accessed from scripts using the [Tables API](/docs/jibrok-studio-jira/scripting-api-tables) and directly from the UI

### Queues

- Verify the queue exists
- Check message count hasn't reached the limit (see [Limits](/docs/jibrok-studio-jira/limits))
- Ensure message payload is within the allowed limit
- Remember: `pull()` puts messages in Processing state - use `ack()` or `reject()` to finalize
- See [Queue API](/docs/jibrok-studio-jira/scripting-api-queues) for full reference

---

## Permission errors

- Check the **Run As** setting - the configured actor must have permission for the operations
- If using **Application** mode, verify it's enabled in Admin Settings
- API whitelist/blacklist may be blocking specific endpoints - check custom profiles
- Context restrictions may limit which projects/issue types the script can access

---

## Common error messages

### *"Trigger type {type} cannot be combined with other triggers"*

The **Workflow Condition** trigger is exclusive: it uses the Jira Expressions engine instead of the sandbox engine, so a script that has a Workflow Condition trigger cannot have any other triggers (scheduled, event, workflow post function, etc.). Remove the other triggers first, or create a separate script for the condition. See [Workflow Condition - Differences from other triggers](/docs/jibrok-studio-jira/triggers-workflow-condition#differences-from-other-triggers) for details.

### *"A trigger of this type already exists for this script"*

Every trigger type is a **singleton** - a single script can have at most one Scheduled trigger, one Event trigger, one Webhook trigger, etc. To react to a different schedule or event, create a second script. To react to many events of the same type, select multiple events within one Event trigger.

### *"Maximum triggers per script reached"*

Scripts can have at most 10 triggers total. If you need more, split the logic across multiple scripts and use [Async Events](/docs/jibrok-studio-jira/triggers-async) to chain them.

### *"Running as Application is disabled by admin"* / *"Running as a specific user is disabled by admin"*

The script's **Run As** setting requires a mode that the administrator has turned off globally in [Administration](/docs/jibrok-studio-jira/admin-settings). Either change the Run As setting in the script's Config tab, or ask your admin to enable the mode. Available Run As modes are controlled per-site and override any script-level configuration.

### *"License required"*

The app license is not active. Most triggers silently skip execution; workflow post functions, validators, and the Automation action return this error to their caller. See [What happens when my license expires?](#what-happens-when-my-license-expires) above.

### *"A scenario is already running for this script"*

Only one scenario per script can run at a time. Wait for the active run to finish, or cancel it from the Scenarios tab before starting a new one. See [Scenarios - Concurrency](/docs/jibrok-studio-jira/scenarios#concurrency).

---

## Performance tips

- Keep scripts simple and focused - do one thing well
- Use JQL `fields` parameter to fetch only needed data
- Avoid unnecessary API calls - cache data in variables
- Use Custom Tables for persistent data instead of repeated API lookups
- For bulk operations, process in batches across multiple scheduled runs
- Keep UIM scripts fast - they run on every form interaction
- Use the Globals script for shared constants instead of re-fetching in every script

---

## Automation & integrations

### Can I run scripts from Jira Automation?

Yes. JiBrok Studio provides an Automation action that can be used in Jira Automation rules. Configure it with:

- **scriptId** (required) - the ID of the script to run
- **issueKey** (optional) - supports smart values like `{{issue.key}}`

The Automation trigger type is enabled by default. You can disable it in [Administration](/docs/jibrok-studio-jira/admin-settings).

### Can I use scripts with Rovo AI Agent?

Yes. JiBrok Studio integrates with Rovo AI Agent, providing two actions: list available scripts and run a script. Scripts must have a Rovo trigger configured and be enabled.

The Rovo trigger type is **disabled by default** - enable it in [Administration](/docs/jibrok-studio-jira/admin-settings).

### Can external systems trigger scripts?

Yes. The [Webhook Trigger](/docs/jibrok-studio-jira/triggers-webhook) (Webtrigger) lets external systems call your scripts via HTTP requests with Basic Auth credentials. Supports GET, POST, PUT, and DELETE methods. Rate-limited per webhook.

The Webtrigger trigger type is **disabled by default** - enable it in [Administration](/docs/jibrok-studio-jira/admin-settings).

---

## Scenarios & bulk operations

### How do I process thousands of issues?

Use [Scenarios](/docs/jibrok-studio-jira/scenarios). Scenarios split long-running scripts into managed steps - each step runs as a separate Forge event, avoiding execution timeouts. The `batch()` step type handles automatic pagination, progress tracking, and error handling:

```js
batch('cleanup', 'project = PROJ AND updated < -180d', (issue) => {
  issue.transition('Done')
})
```

For simpler cases (under ~100 issues), a regular console script with `Issues.searchAll()` may be sufficient.

---

## Export, import & version history

### Can I back up or transfer scripts?

Yes. Scripts can be exported and imported as JSON (v2 format):

- **Export** individual scripts or all at once
- **Import** updates existing scripts by matching ID, or creates new ones if no match is found
- Exported data includes: id, name, source code, language, actor, labels, and folder path

### Can I revert a script to a previous version?

Yes. JiBrok Studio automatically saves versions for every script. A new version is created each time you save. Each version stores:

- Source code and description
- Author who made the change
- Snapshot of trigger configuration

Older versions are removed automatically when the limit is reached.

---

## Next steps

- [Getting Started](/docs/jibrok-studio-jira/getting-started) - First steps with JiBrok Studio for Jira Cloud
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language specifics and differences from JavaScript
