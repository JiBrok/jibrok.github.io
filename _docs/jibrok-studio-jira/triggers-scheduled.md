---
title: Scheduled Triggers
key: jibrok-studio-jira
category: core-features
tags:
  - doc
  - cloud
  - triggers
---

* TOC
{:toc}

## Scheduled Triggers

Run scripts on a recurring schedule. One per script (singleton).

| Interval | Description |
|----------|-------------|
| **Every 5 minutes** | Runs approximately every 5 minutes |
| **Hourly** | Runs every hour |
| **Daily** | Runs once per day |
| **Weekly** | Runs once per week |

Scripts run with the **actor configured on the script**.

**How it works:** The scheduled handler pushes each script into the async queue instead of executing them directly. Each script then runs independently in its own async consumer invocation with up to 55 seconds of execution time and 100 API calls.

> **Note:** The `event` variable is **not available** in scheduled triggers. Use the [Jira REST API](/docs/jibrok-studio-jira/scripting-api#jira-rest-api) or [built-in functions](/docs/jibrok-studio-jira/scripting-api) to fetch data.

### Example

```js
// Daily cleanup: close stale issues with no updates in 30 days
const jql = 'status = "Waiting for Customer" AND updated <= -30d'
const results = await jqlSearch(jql, ["status"])

for (const issue of results.issues) {
  await editIssue(issue.key, {
    transition: { id: "31" }  // "Close" transition
  })
  log("Closed:", issue.key)
}

return results.issues.length + " issues closed"
```

---

## See Also

- [Triggers Overview](/docs/jibrok-studio-jira/triggers) - All trigger types at a glance
- [Event Triggers](/docs/jibrok-studio-jira/triggers-events) - React to Jira events
- [Async Events](/docs/jibrok-studio-jira/triggers-async) - Trigger scripts asynchronously
