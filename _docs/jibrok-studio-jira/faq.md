---
title: FAQ & Troubleshooting
key: jibrok-studio-jira
excerpt: Frequently asked questions and solutions to common issues
category: administration
tags:
  - doc
  - cloud
  - faq
  - troubleshooting
  - support
---

* TOC
{:toc}

## General

### Who can use JiBrok Studio for Jira Cloud?

Only Jira site administrators. There is no role-based access - all admins have equal access to all features.

### What language do scripts use?

A JavaScript-like language that runs in a secure sandbox. It supports most JS syntax (variables, functions, classes, async/await, destructuring) but runs in isolation with no access to the filesystem, network, or browser APIs. Python and Groovy engines are also available. See [Scripting Language](/docs/jibrok-studio-jira/scripting-language) for details.

### Is it safe to run scripts?

Yes. Scripts run in a multi-layer sandbox with strict resource limits. There is no way to access the host system, other apps, or data outside Jira. See [Forge Platform & Security Architecture](/docs/jibrok-studio-jira/forge-platform-security) for a detailed explanation of the security model and tenant isolation.

### Can scripts call external APIs?

No. Scripts can only call the Jira REST API through `requestJira()` and built-in API namespaces. There is no `fetch`, `XMLHttpRequest`, or other network access.

### Can I use npm packages?

No. The sandbox has no module system. Only built-in globals and methods are available. Use `eval(uuid)` to include other saved scripts.

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

1. The **script** is enabled
2. The **trigger** is enabled
3. The trigger **type** is enabled globally in [Administration](/docs/jibrok-studio-jira/admin-settings)

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
