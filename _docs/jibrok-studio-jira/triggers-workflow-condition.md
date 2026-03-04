---
title: Workflow Condition
key: jibrok-studio-jira
category: core-features
tags:
  - doc
  - cloud
  - triggers
  - workflow
---

* TOC
{:toc}

## Workflow Condition

Control whether a workflow transition is allowed using a Jira Expression. One per script (singleton).

A Workflow Condition trigger evaluates a Jira Expression every time an issue is about to transition through a specific workflow step. Unlike other triggers, the expression is **not executed in the JiBrok sandbox engine** - it is sent directly to Jira and evaluated natively as a [Jira Expression](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/).

If the expression returns `true`, the transition is allowed. If it returns `false` (or any other value), the transition button is hidden from the user.

> **Note:** Workflow Conditions are available in **company-managed projects** only.

### Setup

1. Save a script in the Library
2. Go to the **Config** tab - **Triggers**
3. **Add Trigger** - select **Workflow Condition**
4. The script engine is automatically set to **Jira Expressions**
5. Write your Jira Expression in the editor
6. **Save** the script
7. In **Jira Administration** - **Workflows**, edit the desired workflow
8. Select the transition you want to control
9. Add the **JiBrok Studio - Workflow Condition** condition
10. Select the configured script from the dropdown

### Jira Expressions Engine

When you add a Workflow Condition trigger, the script engine is automatically switched to **Jira Expressions**. This is a special engine type that differs from JavaScript, Python, and Groovy:

- The script is a **native Jira Expression**, not sandbox code
- Jira evaluates the expression directly - there are **no sandbox engine limits** (no execution time cap, no API call limits, no loop iteration limits)
- All limits and restrictions are managed by Jira itself
- The Jira Expressions engine is **exclusive to the Workflow Condition trigger** - it cannot be used with other trigger types
- Adding a Workflow Condition trigger removes all other triggers from the script

### Configuration

| Setting | Description |
|---------|-------------|
| `description` | Optional description for the condition (up to 2,000 characters). Helps identify the condition in Jira workflow configuration |

### Context Variables

Jira Expressions have their own context, provided by Jira (not by the JiBrok sandbox):

| Variable | Type | Description |
|----------|------|-------------|
| `issue` | Issue | The issue being transitioned |
| `project` | Project | The project the issue belongs to |
| `user` | User | The user performing the transition |
| `now()` | DateTime | Current date and time (function call) |

These are standard Jira Expression context variables. For the full list of available properties and methods, see [Atlassian Jira Expressions documentation](https://developer.atlassian.com/cloud/jira/platform/jira-expressions-type-reference/).

### Examples

```
// Allow transition only if the issue has an assignee
issue.assignee != null
```

```
// Allow transition only for issues with "High" or "Highest" priority
issue.priority.name in ["High", "Highest"]
```

```
// Allow transition only if the current user is the reporter
user.accountId == issue.reporter.accountId
```

```
// Allow transition only for issues created more than 1 day ago
now().minusDays(1).isAfter(issue.created)
```

```
// Combine multiple conditions
issue.assignee != null && issue.priority.name != "Low" && issue.status.name == "In Review"
```

### Differences from Other Triggers

| Aspect | Workflow Condition | Other Triggers |
|--------|-------------------|----------------|
| Engine | Jira Expressions (native Jira) | JavaScript / Python / Groovy (sandbox) |
| Execution | Evaluated by Jira | Executed in JiBrok sandbox |
| Engine limits | None (managed by Jira) | Execution time, API calls, loop iterations |
| Sandbox features | None (no `log()`, `requestJira()`, API namespaces) | Full sandbox API |
| Return value | `true` = allow, anything else = hide transition | Varies by trigger type |
| Behavior on block | Transition button is hidden | Depends on trigger (error message for validators) |
| Compatible triggers | None (exclusive) | Can combine with other triggers |

---

## See Also

- [Triggers Overview](/docs/jibrok-studio-jira/triggers) - All trigger types at a glance
- [Workflow Validator](/docs/jibrok-studio-jira/triggers-workflow-validator) - Validate transitions with sandbox scripts
- [Workflow Post Function](/docs/jibrok-studio-jira/triggers-workflow-post-function) - Run scripts after workflow transitions
- [Limits](/docs/jibrok-studio-jira/limits) - All execution and storage limits
- [Jira Expressions documentation](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/) - Atlassian reference
