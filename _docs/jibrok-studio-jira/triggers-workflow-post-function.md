---
title: Workflow Post Function
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

## Workflow Post Function

Run scripts after a workflow transition completes. One per script (singleton).

A Workflow Post Function trigger executes your script every time an issue transitions through a specific workflow step. The script runs **after** the transition is complete, so the issue is already in its new status.

### Setup

1. Save a script in the Library
2. Go to the **Config** tab - **Triggers**
3. **Add Trigger** - select **Workflow Post Function**
4. **Save** the script
5. In **Jira Administration** - **Workflows**, edit the desired workflow
6. Select the transition you want to hook into
7. Add the **JiBrok Studio - Run Script** post function
8. Select the configured script from the dropdown

### Context Variables

The following variables are available in workflow post function scripts:

| Variable | Type | Description |
|----------|------|-------------|
| `issue` | object | The issue that transitioned (auto-loaded) |
| `issueKey` | string | Issue key (e.g. `"PROJ-123"`) |
| `event.issue` | object | Compact issue data (`id`, `key`) |
| `event.transition` | object | Transition details (see below) |
| `currentUser` | object | Current user info |

#### Transition Object

| Property | Type | Description |
|----------|------|-------------|
| `event.transition.from_status` | string | Status before transition |
| `event.transition.to_status` | string | Status after transition |
| `event.transition.transitionName` | string | Name of the transition |

### Run As (Actor Resolution)

The script runs with the **actor configured on the script**. If no specific actor is set, the identity is resolved in this order:

1. If set to **Application** - runs with app-level permissions
2. If set to a **specific user** - runs as that user
3. Otherwise - uses the **Jira user who performed the transition** (`atlassianId` from the event)
4. Fallback - runs as **Application**

### Limits

| Limit | Value |
|-------|-------|
| Max execution time | 15,000 ms |
| Max API calls | 40 |
| Max pending promises | 30 |
| Max loop iterations | 50,000 |

### Example

```js
// Log the transition details
log("Issue:", issueKey)
log("From:", event.transition.from_status, "->", event.transition.to_status)
log("Transition:", event.transition.transitionName)

// Auto-assign when moving to "In Progress"
if (event.transition.to_status === "In Progress" && !issue.fields.assignee) {
  const me = await Users.current()
  await Issues.get(issueKey).assign(me.accountId)
  log("Auto-assigned to:", me.displayName)
}

// Add a comment when issue is done
if (event.transition.to_status === "Done") {
  await Issues.get(issueKey).addComment(
    Adf.doc(
      Adf.paragraph(
        "Issue resolved via transition ",
        Adf.bold(event.transition.transitionName)
      )
    )
  )
}
```

---

## See Also

- [Triggers Overview](/docs/jibrok-studio-jira/triggers) - All trigger types at a glance
- [Event Triggers](/docs/jibrok-studio-jira/triggers-events) - React to Jira events
- [Async Events](/docs/jibrok-studio-jira/triggers-async) - Trigger scripts asynchronously
- [Limits](/docs/jibrok-studio-jira/limits) - All execution and storage limits
