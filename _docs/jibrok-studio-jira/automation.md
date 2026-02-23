---
title: Jira Automation Integration
key: jibrok-studio-jira
excerpt: Run JiBrok Studio scripts as Jira Automation actions
category: extensions
tags:
  - doc
  - cloud
  - automation
---

* TOC
{:toc}

## Overview

JiBrok Studio integrates with **Jira Automation** as a custom action. You can add the **"Run JiBrok Studio Script"** action to any automation rule to execute a script from your library.

Scripts run as **Application** (no user context), making this ideal for system-level automations that don't depend on a specific user's permissions.

---

## Setup

### 1. Enable the Automation Trigger Type

In the [Administration](/docs/jibrok-studio-jira/admin-settings) panel, ensure the **Automation** trigger type is enabled globally.

### 2. Add an Automation Trigger to a Script

1. Open a script in the Console
2. Go to the **Config** tab
3. Click **Add Trigger** and select **Automation**
4. **Save** the script

The script must be **enabled** and have an **enabled Automation trigger** to be available in Jira Automation.

<a href="/uploads/jibrok-studio-jira/automation-add-trigger.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-add-trigger.png" alt="Add Automation trigger to script" style="width:100%;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/automation-script-return-json.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-script-return-json.png" alt="Script returning JSON for automation" style="width:100%;" loading="lazy"></a>

### 3. Create an Automation Rule

1. In Jira, go to **Project Settings > Automation** (or global automation)
2. Create or edit a rule
3. Add the action **"Run Script - JiBrok Studio"**
4. Configure the inputs (see below)

<a href="/uploads/jibrok-studio-jira/automation-add-component.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-add-component.png" alt="Add component to automation rule" style="width:100%;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/automation-search-action.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-search-action.png" alt="Search for JiBrok Studio action" style="width:100%;" loading="lazy"></a>

---

## Action Inputs

| Input | Required | Description |
|-------|----------|-------------|
| **Script** | Yes | The script to execute (selected by script ID) |
| **Issue Key** | No | The issue key to pass to the script. Use `{% raw %}{{issue.key}}{% endraw %}` smart value to pass the triggering issue |

<a href="/uploads/jibrok-studio-jira/automation-action-config-select.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-action-config-select.png" alt="Automation action script selection" style="max-height:600px;width:auto;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/automation-action-config-full.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-action-config-full.png" alt="Automation action configuration" style="max-height:600px;width:auto;" loading="lazy"></a>

---

## Output Smart Values

The action produces smart values available to subsequent rule components:

| Smart value | Type | Description |
|-------------|------|-------------|
| `{% raw %}{{triggeredJiraScript.success}}{% endraw %}` | boolean | Whether the script executed successfully |
| `{% raw %}{{triggeredJiraScript.result}}{% endraw %}` | string | Script return value (string, number, or JSON object) |
| `{% raw %}{{triggeredJiraScript.error}}{% endraw %}` | string | Error message if script execution failed |
| `{% raw %}{{triggeredJiraScript.executionMs}}{% endraw %}` | integer | Script execution time in milliseconds |

### Accessing fields from a JSON result

If your script returns an object (e.g. `return { status: "done", count: 5 }`), the result is delivered as a JSON string. Use `jsonStringToObject()` to parse it and access individual fields:

- `{% raw %}{{jsonStringToObject(triggeredJiraScript.result)}}{% endraw %}` - the parsed object
- `{% raw %}{{jsonStringToObject(triggeredJiraScript.result).status}}{% endraw %}` - access a specific field
- `{% raw %}{{jsonStringToObject(triggeredJiraScript.result).count}}{% endraw %}` - access another field

<a href="/uploads/jibrok-studio-jira/automation-log-result-data.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-log-result-data.png" alt="Automation log result data" style="width:100%;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/automation-log-json-parse.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-log-json-parse.png" alt="Automation log JSON parse result" style="width:100%;" loading="lazy"></a>

---

## Example Automation Rule

**Scenario:** When a high-priority issue is created, run a script that assigns a reviewer and posts a Slack-style comment.

1. **Trigger:** Issue created
2. **Condition:** Priority = Highest or High
3. **Action:** Run Script - JiBrok Studio
   - Script: *"Auto-assign reviewer"*
   - Issue Key: `{% raw %}{{issue.key}}{% endraw %}`
4. **Condition:** `{% raw %}{{triggeredJiraScript.success}}{% endraw %}` equals `true`
5. **Action:** Log or send notification with `{% raw %}{{triggeredJiraScript.result}}{% endraw %}`

<a href="/uploads/jibrok-studio-jira/automation-rule-overview.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-rule-overview.png" alt="Automation rule overview" style="max-height:600px;width:auto;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/automation-rule-log-result.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-rule-log-result.png" alt="Automation rule execution log result" style="width:100%;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/automation-audit-log-results.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/automation-audit-log-results.png" alt="Automation audit log results" style="width:100%;" loading="lazy"></a>

---

## Important Notes

- Scripts run as **Application** — they use the Forge app's permissions, not a specific user's
- The script must have an enabled **Automation** trigger — otherwise the action will fail
- The **Automation** trigger type must be enabled in [Administration](/docs/jibrok-studio-jira/admin-settings)
- Standard [execution limits](/docs/jibrok-studio-jira/limits) apply

---

## Next Steps

- [Triggers](/docs/jibrok-studio-jira/triggers) — All trigger types
- [Administration](/docs/jibrok-studio-jira/admin-settings) — Enable/disable Automation trigger type
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) — Language and API reference
- [Limits](/docs/jibrok-studio-jira/limits) — Execution limits
