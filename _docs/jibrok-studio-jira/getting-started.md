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
---

* TOC
{:toc}

## Installation

1. Go to the [Atlassian Marketplace](https://marketplace.atlassian.com/) and search for JiBrok Studio for Jira Cloud
2. Click **Install** and select your Jira Cloud site
3. Once installed, the app appears in the Jira top menu under **Apps > JiBrok Studio for Jira Cloud**

> **Note:** JiBrok Studio for Jira Cloud is available to **Jira administrators only**. Non-admin users cannot access the app.

---

## Navigate to the App

Open the Jira top navigation bar and click **Apps > JiBrok Studio for Jira Cloud**. The Console tab opens by default with an empty editor.

---

## Your First Script

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

## Key Concepts

### Script Isolation

Scripts run in a secure sandbox with strict limits:

- **No network access** - except through `requestJira()` and built-in API namespaces
- **No filesystem** - scripts cannot read or write files
- **Resource limits** - execution time, loop iterations, and API calls are capped. Limits vary by trigger type (e.g., console: 18s/40 API calls, scheduled: 55s/100 API calls). See [Limits](/docs/jibrok-studio-jira/limits) for details.
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

### Sandbox Mode

Toggle **Sandbox Mode** to test scripts that make changes without actually modifying Jira data. Write operations (POST, PUT, DELETE) are simulated and logged.

---

## Save to Library

Click **Save** to persist your script to the Library:

1. Set a **name** (required)
2. Add an optional **description**
3. Choose a **folder** location
4. Assign **labels** for organization

Saved scripts appear in the [Script Library](/docs/jibrok-studio-jira/script-library) and can be accessed from any session.

---

## Next Steps

- [Script Console](/docs/jibrok-studio-jira/script-console) - Learn all console features: editor, output, history, variables
- [Script Library](/docs/jibrok-studio-jira/script-library) - Save and organize your scripts
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and sandbox details
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference
- [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) - Built-in reference with examples for all engines
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples for common scenarios
- [Triggers](/docs/jibrok-studio-jira/triggers) - Automate script execution
