---
title: Workflow Validator
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

## Workflow Validator

Validate workflow transitions before they complete. One per script (singleton).

A Workflow Validator trigger executes your script every time an issue is about to transition through a specific workflow step. The script runs **before** the transition is applied - if the script blocks the transition, the issue stays in its current status and the user sees an error message.

> **Note:** Workflow Validators are available in **company-managed projects** only.

### Setup

1. Save a script in the Library
2. Go to the **Config** tab - **Triggers**
3. **Add Trigger** - select **Workflow Validator**
4. Configure the **default error message** (shown when the transition is blocked)
5. **Save** the script
6. In **Jira Administration** - **Workflows**, edit the desired workflow
7. Select the transition you want to validate
8. Add the **Run Script - JiBrok Studio** validator
9. Select the configured script from the dropdown

### Configuration

| Setting | Description |
|---------|-------------|
| `errorMessage` | Default error message shown to users when the transition is blocked. If the script returns its own message, this is overridden. Default: "Transition validation failed" |

### Context Variables

The following variables are available in workflow validator scripts:

| Variable | Type | Description |
|----------|------|-------------|
| `issue` | object | The issue being transitioned (auto-loaded) |
| `issueKey` | string | Issue key (e.g. `"PROJ-123"`) |
| `event.issue` | object | Compact issue data (`id`, `key`) |
| `event.transition` | object | Transition details (see below) |
| `event.modifiedFields` | object/null | Fields modified during the transition |
| `currentUser` | object | Current user info |

#### Transition Object

| Property | Type | Description |
|----------|------|-------------|
| `event.transition.from_status` | string | Status before transition |
| `event.transition.to_status` | string | Status after transition |
| `event.transition.transitionName` | string | Name of the transition |

### Return Values

The script's return value determines whether the transition is allowed or blocked:

| Return value | Effect |
|-------------|--------|
| `{ valid: false, errorMessage: "..." }` | Block transition with a custom error message |
| `{ valid: false }` | Block transition with the default error message |
| `{ valid: true }` | Allow transition |
| Truthy value (string, number, non-empty object) | Allow transition |
| Falsy value (`null`, `undefined`, `false`, `0`, `""`) | Block transition with the default error message |
| Script error (runtime exception) | **Fail-open** - transition is allowed |

> **Important:** Workflow Validators use a **fail-open** design. If the script fails due to a runtime error, license issue, or configuration problem, the transition is allowed. This prevents broken scripts from blocking all workflow transitions.

### Run As (Actor Resolution)

The script runs with the **actor configured on the script**. If no specific actor is set, the identity is resolved in this order:

1. If set to **Application** - runs with app-level permissions
2. If set to a **specific user** - runs as that user
3. Otherwise - uses the **Jira user who performed the transition**
4. Fallback - runs as **Application**

### Limits

| Limit | Value |
|-------|-------|
| Max execution time | 10,000 ms |
| Max API calls | 20 |
| Max pending promises | 20 |
| Max loop iterations | 50,000 |

### Example

```js
// Block transition to "Done" if there's no assignee
if (event.transition.to_status === "Done" && !issue.fields.assignee) {
  return { valid: false, errorMessage: "Please assign the issue before closing it" }
}

// Block transition if summary is empty
if (!issue.fields.summary || issue.fields.summary.trim() === "") {
  return { valid: false, errorMessage: "Issue summary cannot be empty" }
}

// Require a comment when rejecting
if (event.transition.transitionName === "Reject" && event.modifiedFields) {
  log("Modified fields:", JSON.stringify(event.modifiedFields))
}

// Check story points are set before moving to "In Progress"
if (event.transition.to_status === "In Progress") {
  const storyPoints = issue.fields.customfield_10016
  if (!storyPoints) {
    return { valid: false, errorMessage: "Story points must be estimated before starting work" }
  }
}

// Allow the transition
return { valid: true }
```

---

## See Also

- [Triggers Overview](/docs/jibrok-studio-jira/triggers) - All trigger types at a glance
- [Workflow Post Function](/docs/jibrok-studio-jira/triggers-workflow-post-function) - Run scripts after workflow transitions
- [Event Triggers](/docs/jibrok-studio-jira/triggers-events) - React to Jira events
- [Limits](/docs/jibrok-studio-jira/limits) - All execution and storage limits
