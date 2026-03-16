---
title: Getting Started
key: jibrok-studio-jira
excerpt: Install the app, open the Console, and run your first script
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
const issue = await Issues.get(issueKey)
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

- **No network access** - except through `requestJira()` and built-in API namespaces
- **No filesystem** - scripts cannot read or write files
- **Resource limits** - execution time, loop iterations, and API calls are capped. Limits vary by trigger type. See [Limits](/docs/jibrok-studio-jira/limits) for details.
- **Method whitelisting** - only approved methods can be called
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

## What to do next

After your first script, here is a checklist to explore the platform:

- [ ] **Browse the API** - open the [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) panel (Help button in the Console toolbar) and explore available functions with examples
- [ ] **Search and update issues** - try `Issues.search()` and `issue.update()` in the Console. See [Scripting API](/docs/jibrok-studio-jira/scripting-api) for all available namespaces
- [ ] **Save a script** - save your work to the [Library](/docs/jibrok-studio-jira/script-library) with a name, folder, and labels
- [ ] **Set up a trigger** - attach a [trigger](/docs/jibrok-studio-jira/triggers) to run your script on a schedule, on Jira events, or on workflow transitions. See [Choose the right trigger](/docs/jibrok-studio-jira/triggers-comparison) to compare options
- [ ] **Try Sandbox Mode** - toggle Sandbox Mode on and run a script that modifies data. Write operations are simulated so you can verify logic safely
- [ ] **Explore use cases** - check [Use Cases](/docs/jibrok-studio-jira/use-cases) and [Scripting Examples](/docs/jibrok-studio-jira/scripting-examples) for practical recipes

### Based on your goal

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

---

## Reference

- [Script Console](/docs/jibrok-studio-jira/script-console) - Full console features: editor, output, history, variables
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and sandbox details
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Complete API reference
- [Limits](/docs/jibrok-studio-jira/limits) - Platform quotas and constraints
