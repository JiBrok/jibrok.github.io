---
title: Script Console
key: jibrok-studio-jira
excerpt: Interactive code editor for writing and executing scripts
category: core-features
tags:
  - doc
  - cloud
  - console
  - editor
---

* TOC
{:toc}

## Overview

The Console is the main interface for writing and executing scripts. It provides a code editor with syntax highlighting, execution controls, output display, and configuration options.

<a href="/uploads/jibrok-studio-jira/console-jira-sidebar-navigation.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-jira-sidebar-navigation.png" alt="JiBrok Studio in Jira sidebar navigation" style="max-height:600px;width:auto;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/console-interface-overview.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-interface-overview.png" alt="Script Console interface overview" style="width:100%;" loading="lazy"></a>

---

## Code Editor

The editor supports:

- **Syntax highlighting** for the scripting language
- **Script engine selection** — choose between JavaScript (primary), Python, and Groovy engines. More engines will be added in future updates.
- **Variables popup** — insert available variable names into the editor
- **Local draft auto-save** — drafts are saved to browser localStorage automatically

<a href="/uploads/jibrok-studio-jira/console-editor-logging-functions.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-editor-logging-functions.png" alt="Code editor with logging functions example" style="width:100%;" loading="lazy"></a>

---

## Running Scripts

Click the **Run** button to execute the current script. During execution:

- The Run button shows a loading state
- Output appears in real-time in the Output tab
- The result is displayed when execution completes
- Errors are shown with descriptive messages

### Keyboard Shortcuts

Use the standard keyboard shortcut to run scripts quickly without clicking the button.

---

## Output and Results

### Log Output

Scripts produce output through logging functions:

| Function | Level | Use for |
|----------|-------|---------|
| `log()` / `print()` | log | General output |
| `debug()` | debug | Verbose debugging |
| `info()` | info | Status updates |
| `warn()` | warn | Warnings |
| `error()` | error | Error messages |

Each level has distinct styling in the output panel. Multiple arguments are joined with a space.

<a href="/uploads/jibrok-studio-jira/console-output-log-levels.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-output-log-levels.png" alt="Output panel showing different log levels" style="width:100%;" loading="lazy"></a>

### Script Result

The result field shows either:

- The value of the last expression (implicit return)
- The value passed to `return` (explicit return)

Complex objects are displayed as formatted JSON.

### Execution Metadata

After each run, the console shows:

- **Duration** — total script execution time
- **Result** — the value of the last expression or explicit `return`
- **Log output** — messages from `log()`, `debug()`, `info()`, `warn()`, `error()`

---

## Sandbox Mode

Toggle **Sandbox Mode** to simulate write operations without modifying Jira data.

When sandbox mode is active:

- **Read operations** (GET requests) execute normally
- **Write operations** (POST, PUT, DELETE) are simulated
- A banner shows the count of simulated requests
- Script output still reflects the simulated results

This is useful for testing bulk update scripts before running them for real, verifying script logic without side effects, and debugging write operations safely.

<a href="/uploads/jibrok-studio-jira/console-sandbox-tooltip.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-sandbox-tooltip.png" alt="Sandbox mode tooltip" style="width:100%;" loading="lazy"></a>

---

## Run As (Execution Identity)

The **Run As** dropdown controls which identity the script uses when making Jira API calls.

| Mode | Description |
|------|-------------|
| **Current User** | Script runs with your permissions (default) |
| **Application** | Script runs with app-level permissions (if enabled by admin) |
| **Pre-configured User** | Select from admin-defined user list (if configured) |
| **Specific User** | Search for any Jira user (if enabled by admin) |

<a href="/uploads/jibrok-studio-jira/console-run-as-dropdown.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-run-as-dropdown.png" alt="Run As dropdown with execution identity options" style="max-width:480px;width:100%;" loading="lazy"></a>

> **Note:** Available modes are controlled by the site administrator in [Administration](/docs/jibrok-studio-jira/admin-settings). If a mode is disabled after being selected, a warning is shown.

---

## Issue Key Context

The **Issue Key** field (e.g., `PROJ-123`) provides context to your script:

- The `issueKey` variable is set to the entered value
- The `issue` variable is automatically initialized with the issue data (fields, status, summary, etc.)
- Leave empty if your script doesn't need issue context

```js
// Both issueKey and issue are available when an issue key is entered
log("Working with:", issueKey)
log("Summary:", issue.summary)
log("Status:", issue.status)
```

---

## Syntax Check

Click the **Check** button to validate your script without executing it. This catches:

- Syntax errors (missing brackets, invalid tokens)
- Script complexity violations
- Input size violations

Check is faster than Run because it only parses the script without executing it.

---

## Saving Scripts

Click the **Save** button to save the script to the Library. If the script has unsaved changes, the Save button is highlighted.

### New Scripts

When saving a new script, you will be prompted to set a name in the Config tab first.

### Existing Scripts

When saving an existing script, a dialog appears where you can add an optional **version note** (up to 200 characters) describing the changes. Each save creates a new version entry in the Version History.

<a href="/uploads/jibrok-studio-jira/console-new-script-unsaved-dialog.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-new-script-unsaved-dialog.png" alt="Save dialog for existing script with version note" style="width:100%;" loading="lazy"></a>

### Validation on Save

Before saving, the script is automatically checked for syntax errors. If issues are found, a warning is shown - you can still save the script, but it may not execute correctly.

---

## Script Engine Reference

Click the **Help** button in the toolbar to open the Script Engine Reference - a built-in, searchable reference panel with examples for all script engines.

See [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) for a detailed overview of all categories and engine-specific content.

---

## Console Tabs

### Output

Shows the execution output — log messages and the script result. Cleared on each new run.

### History

Session-level history of recent executions. Each entry shows timestamp, script preview, execution status (success/error), and result preview. Click an entry to view full details.

### Run History

Persistent execution history across all sessions:

- Date and time
- Duration
- Status (success/error)
- Trigger type (console, scheduled, event, etc.)
- Issue key (if provided)

<a href="/uploads/jibrok-studio-jira/console-run-history.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-run-history.png" alt="Run History tab showing past executions" style="width:100%;" loading="lazy"></a>

### Version History

All saved versions of the current script:

- Date and author
- Change description
- Diff view between versions
- Restore to any previous version (up to 50 versions; restoring creates a new version entry)

### Config

Script metadata and configuration:

- Name, description, enabled status
- Engine selection
- Labels and folder
- Trigger configuration
- Context restrictions (projects, issue types)
- API restrictions (whitelist/blacklist profiles)
- Execution identity (Run As)

<a href="/uploads/jibrok-studio-jira/console-full-view-config.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-full-view-config.png" alt="Config tab with script settings" style="width:100%;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/console-triggers-tab-empty.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-triggers-tab-empty.png" alt="Triggers section in Config tab" style="width:100%;" loading="lazy"></a>

---

## Variables Popup

The **Variables** button in the editor toolbar opens a popup showing all available variables grouped by section:

<a href="/uploads/jibrok-studio-jira/console-variables-popup.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-variables-popup.png" alt="Variables popup showing available variables" style="max-height:600px;width:auto;" loading="lazy"></a>

| Section | Description | Examples |
|---------|-------------|---------|
| **Runtime** | Core runtime variables and API objects | `context`, `issue`, `requestJira`, `Jira`, `queue`, `tables`, `asyncEvent` |
| **Script API** | High-level API namespaces | `Issues`, `Users`, `Projects`, `Fields`, `Components`, `Versions`, `Boards`, `Sprints`, `DateUtils`, `CSV` |
| **Trigger Variables** | Variables injected based on configured triggers | `event` (event triggers), `uim`/`uimData` (UIM triggers) |
| **Global Variables** | Variables from the global variables script | Loaded dynamically from server |

- **Trigger Variables** are shown only when the script has relevant triggers configured
- **Global Variables** are fetched dynamically when the popup opens
- Clicking a variable inserts its name at the cursor position
- Each variable shows a tooltip with a brief description

---

## Local Draft

When working in draft mode (no saved script open), the Console automatically saves your work to the browser's localStorage.

**Saved fields:**

- Script source code (debounced 500ms)
- Issue key
- Actor (Run As setting)
- Sandbox mode toggle
- Script engine language

**Behavior:**

- Restored automatically when you return to the Console
- Cleared when you save the script to the Library
- Not synchronized between devices or browsers

---

## Next Steps

- [Script Library](/docs/jibrok-studio-jira/script-library) — Manage saved scripts
- [Triggers](/docs/jibrok-studio-jira/triggers) — Automate script execution
- [Administration](/docs/jibrok-studio-jira/admin-settings) — Configure Run As modes and security
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) — Language reference
- [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) — Built-in reference panel
