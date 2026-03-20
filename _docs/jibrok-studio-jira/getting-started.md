---
title: Getting Started
key: jibrok-studio-jira
excerpt: "Install JiBrok Studio, open the Console, and run your first Jira script in under 5 minutes"
category: getting-started
tags:
  - doc
  - cloud
  - getting-started
  - installation
related:
  - jibrok-studio-jira/script-console
  - jibrok-studio-jira/triggers
  - jibrok-studio-jira/use-cases
  - jibrok-studio-jira/scripting-api
  - jibrok-studio-jira/scripting-language
seo_title: Getting Started with JiBrok Studio for Jira
last_modified_at: 2026-03-19
date: 2026-02-23
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Installation

1. Go to the [Atlassian Marketplace](https://marketplace.atlassian.com/) and search for JiBrok Studio for Jira Cloud
2. Click **Install** and select your Jira Cloud site
3. Once installed, the app appears in the Jira top menu under **Apps > JiBrok Studio for Jira Cloud**

> **Note:** JiBrok Studio for Jira Cloud is available to **Jira administrators only**. Non-admin users cannot access the app.

---

## Navigate to the app

Open the Jira top navigation bar and click **Apps > JiBrok Studio for Jira Cloud**. The Console tab opens by default with an empty editor.

---

## Your first script

### 1. Write a Script

Type the following into the editor:

```js
log("Hello from JiBrok Studio for Jira Cloud!")

const now = new Date()
log("Current time:", now.toISOString())

// The last expression becomes the script result
"Script completed successfully"
```

### 2. Run It

Click the **Run** button (or use the keyboard shortcut). You will see:

- The **output panel** shows log messages
- The **result field** shows the value of the last expression

### 3. Run with Issue Context

Enter a Jira issue key (e.g., `PROJ-1`) in the **Issue Key** field, then run:

```js
const issue = Issues.get(issueKey)
log("Issue:", issue.key)
log("Summary:", issue.summary)
log("Status:", issue.status)

issue.summary
```

The `issueKey` variable is automatically available when you provide an issue key.

---

## Key concepts

### Script isolation

Scripts run in a secure sandbox with strict limits:

- **No network access** - except through `requestJira()` and built-in functions (Issues, Users, Projects, etc.)
- **No filesystem** - scripts cannot read or write files
- **Resource limits** - execution time, loop iterations, and API calls are capped. Limits vary by trigger type. See [Limits](/docs/jibrok-studio-jira/limits) for details.
- **Safe methods only** - scripts can only use a curated set of approved operations
- **Auto-await** - async API calls are automatically resolved

### Output

Use `log()` to print values to the output panel:

```js
log("text")              // simple text
log("a", "b", "c")      // multiple values (space-separated)
log({key: "value"})      // objects are JSON-formatted
```

Other log levels: `debug()`, `info()`, `warn()`, `error()` - they appear with different styling in the output.

### Result

The **result** is the value of the last expression in your script, or the value passed to `return`:

```js
// Implicit result (last expression)
2 + 2
// result: 4

// Explicit return
return "done"
// result: "done"
```

### Sandbox mode

Toggle **Sandbox Mode** to test scripts that make changes without actually modifying Jira data. Write operations (POST, PUT, DELETE) are simulated and logged.

---

## Save to library

Click **Save** to persist your script to the Library:

1. Set a **name** (required)
2. Add an optional **description**
3. Choose a **folder** location
4. Assign **labels** for organization

Saved scripts appear in the [Script Library](/docs/jibrok-studio-jira/script-library) and can be accessed from any session.

---

## Based on your goal

| I want to... | Start here |
|---|---|
| Automate repetitive tasks | [Triggers](/docs/jibrok-studio-jira/triggers) - attach scheduled or event-based triggers |
| Create computed fields | [Scripted Fields](/docs/jibrok-studio-jira/scripted-fields) - Text, Number, Date, DateTime |
| Customize issue forms | [UI Modifications](/docs/jibrok-studio-jira/ui-modifications) - hide/show fields, set defaults |
| Process issues in bulk | [Scenarios](/docs/jibrok-studio-jira/scenarios) - split bulk operations into managed steps |
| Store custom data | [Data Storage](/docs/jibrok-studio-jira/data-storage) - Custom Tables and Message Queues |
| Add Jira Automation actions | [Automation integration](/docs/jibrok-studio-jira/automation) - run scripts from Automation rules |
| Validate workflow transitions | [Workflow Validator](/docs/jibrok-studio-jira/triggers-workflow-validator) - block invalid transitions |
| Receive external webhooks | [Webhook Trigger](/docs/jibrok-studio-jira/triggers-webhook) - trigger scripts via HTTP |

