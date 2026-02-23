---
title: Rovo AI Agent Integration
key: jibrok-studio-jira
excerpt: Expose JiBrok Studio scripts to Atlassian Rovo AI agent
category: extensions
tags:
  - doc
  - cloud
  - rovo
  - ai
---

* TOC
{:toc}

## Overview

JiBrok Studio registers as a **Rovo AI agent**, allowing Atlassian Rovo to discover and run scripts from your library through natural language conversations. Users can ask Rovo to list available scripts and execute them — directly from the Rovo chat interface.

---

## How It Works

The JiBrok Studio agent provides two actions to Rovo:

| Action | Description |
|--------|-------------|
| **List available scripts** | Returns all enabled scripts that have a Rovo trigger |
| **Run script** | Executes a specific script by ID, optionally with an issue key |

### Agent Prompt

Rovo uses JiBrok Studio as a scripting assistant. The agent will:

1. First list available scripts to show what's possible
2. Run the selected script when the user chooses one
3. Automatically pass the issue key from context if available

---

## Setup

### 1. Enable the Rovo Trigger Type

In the [Administration](/docs/jibrok-studio-jira/admin-settings) panel, ensure the **Rovo** trigger type is enabled globally.

### 2. Add a Rovo Trigger to a Script

1. Open a script in the Console
2. Go to the **Config** tab
3. Click **Add Trigger** and select **Rovo**
4. **Save** the script

Only scripts with an enabled Rovo trigger are visible to the Rovo agent.

### 3. Use from Rovo

1. Open Rovo chat in Jira
2. Ask the JiBrok Studio agent to list scripts or run a specific one
3. If you're viewing an issue, Rovo can pass the issue key to the script automatically

---

## Script Context

When a script is executed via Rovo:

- **Execution identity:** Current User (the Rovo conversation user; falls back to Application if unavailable). Can be changed in the script's actor configuration.
- **Issue key:** Optionally passed from the Rovo conversation context
- **Trigger type:** `rovo`

The script receives the same `event` variable as other trigger types, with trigger-specific metadata.

---

## Run Script Outputs

| Variable | Type | Description |
|----------|------|-------------|
| `success` | boolean | Whether the script executed successfully |
| `result` | string | Script return value (serialized) |
| `error` | string | Error message if execution failed |
| `executionMs` | integer | Script execution time in milliseconds |

Rovo displays these results in the chat conversation.

---

## Important Notes

- Scripts must be **enabled** with an **enabled Rovo trigger** to appear in Rovo
- By default, scripts run as the **current Rovo user** — they use that user's Jira permissions. If the user cannot be resolved, falls back to Application.
- The **Rovo** trigger type must be enabled in [Administration](/docs/jibrok-studio-jira/admin-settings)
- Standard [execution limits](/docs/jibrok-studio-jira/limits) apply

---

## Next Steps

- [Triggers](/docs/jibrok-studio-jira/triggers) — All trigger types
- [Administration](/docs/jibrok-studio-jira/admin-settings) — Enable/disable Rovo trigger type
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) — Language and API reference
- [Limits](/docs/jibrok-studio-jira/limits) — Execution limits
