---
title: Triggers
key: jibrok-studio-jira
excerpt: Automate script execution with schedules, events, async events, and more
category: core-features
tags:
  - doc
  - cloud
  - triggers

  - events
---

* TOC
{:toc}

## Overview

Triggers automate script execution in response to events, schedules, or user actions. Configure triggers in the script's **Config** tab.

### Trigger Types at a Glance

| Trigger Type | Covered in detail |
|---|---|
| Scheduled (hourly/daily/weekly) | [Scheduled Triggers](#scheduled-triggers) |
| Event (32 Jira events) | [Event Triggers](#event-triggers) |
| Async Event | [Async Events](#async-events) |
| UI Modification (onInit/onChange) | [UI Modifications](/docs/jibrok-studio-jira/ui-modifications) |
| Scripted Field (Text/Number/Date/DateTime) | [Scripted Fields](/docs/jibrok-studio-jira/scripted-fields) |
| Automation | [Jira Automation Integration](/docs/jibrok-studio-jira/automation) |
| Rovo | [Rovo AI Agent Integration](/docs/jibrok-studio-jira/rovo) |

---

## Scheduled Triggers

Run scripts on a recurring schedule. One per script (singleton).

| Interval | Description |
|----------|-------------|
| **Hourly** | Runs every hour |
| **Daily** | Runs once per day |
| **Weekly** | Runs once per week |

Scripts run with the **actor configured on the script**.

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

## Event Triggers

Run scripts in response to Jira events. One per script (singleton). You can select **multiple events** for one trigger.

### Available Events

| Category | Events |
|----------|--------|
| **Issue** | `issue_created`, `issue_updated`, `issue_deleted`, `issue_assigned` |
| **Comment** | `comment_created`, `comment_deleted`, `comment_mentioned` |
| **Worklog** | `worklog_created`, `worklog_updated`, `worklog_deleted` |
| **Attachment** | `attachment_created`, `attachment_deleted` |
| **Issue Link** | `issuelink_created`, `issuelink_deleted` |
| **Version** | `version_created`, `version_updated`, `version_released`, `version_deleted` |
| **Component** | `component_created`, `component_updated`, `component_deleted` |
| **Project** | `project_created`, `project_updated`, `project_deleted` |
| **Sprint** | `sprint_created`, `sprint_started`, `sprint_updated`, `sprint_closed`, `sprint_deleted` |
| **Board** | `board_created`, `board_updated`, `board_deleted` |

Scripts run with **application permissions**. The `event` variable contains the full event payload (see below).

### ignoreSelf Filter

Enable **ignoreSelf** to prevent infinite loops when your script modifies the issue that triggered it.

### Event Variable

The `event` object contains properties depending on the event type:

| Property | Type | Available for |
|----------|------|---------------|
| `event.eventType` | string | All events - the event type (e.g. `"issue_created"`) |
| `event.atlassianId` | string | All events - Account ID of the user who triggered the event |
| `event.issue` | object/undefined | Issue, comment, worklog, attachment events |
| `event.changelog` | object/undefined | `issue_updated` |
| `event.comment` | object/undefined | Comment events |
| `event.worklog` | object/undefined | Worklog events |
| `event.attachment` | object/undefined | Attachment events |
| `event.sprint` | object/undefined | Sprint events |
| `event.board` | object/undefined | Board events |
| `event.version` | object/undefined | Version events |
| `event.component` | object/undefined | Component events |
| `event.project` | object/undefined | Project, version, component events |
| `event.sourceIssueId` | string/undefined | Issue link events |
| `event.destinationIssueId` | string/undefined | Issue link events |
| `event.issueLinkType` | object/undefined | Issue link events |
| `event.associatedUsers` | array/undefined | Events that involve user lists |
| `event.mentionedAccountIds` | array/undefined | `comment_mentioned` |
| `event.user` | object/undefined | User-related context |

> **Automatic context:** When the event contains an `issue` object, the runtime variables `issue` and `issueKey` are set automatically - no need to call `getIssue()`.

### Example

```js
// Log field changes on issue_updated
if (event.eventType === "issue_updated" && event.changelog) {
  for (const item of event.changelog.items) {
    log(item.field, ":", item.fromString, "->", item.toString)
  }
}

// Access issue data directly (auto-populated from event)
log("Issue:", issueKey, "-", issue.fields.summary)
```

---

## Async Events

Trigger scripts asynchronously via Forge Queue. One per script (singleton).

Async events are triggered from scripts using `asyncEvent.push(scriptId, payload?, options?)` or `asyncEvent.pushSelf(payload?, options?)`. The target script must have an enabled async event trigger - otherwise events are discarded.

### Event Variable

The `event` variable in the target script contains:

| Property | Type | Description |
|----------|------|-------------|
| `event.payload` | object | Data passed by the sender (empty object if not provided) |
| `event.source` | string | `"script"` |
| `event.pushedBy` | string | Account ID of the sender |
| `event.pushedAt` | number | Timestamp in milliseconds |
| `event.scriptId` | string | UUID of the current script |
| `event.issueKey` | string/null | Issue key (e.g. `"PROJ-123"`) or `null` |
| `event.depth` | number | Current chain depth (0 = initial trigger) |
| `event.chainId` | string | UUID identifying the event chain (for tracing) |

> **Automatic context:** When `issueKey` is provided via options, the runtime variables `issue` and `issueKey` are set automatically in the target script.

### Options

| Option | Type | Description |
|--------|------|-------------|
| `issueKey` | string | Issue key in `PROJ-123` format, passed as context to the target script |
| `delayInSeconds` | number | Delay before processing (0-900, max 15 minutes) |

### Limits

| Limit | Value |
|-------|-------|
| Max `push`/`pushSelf` calls per execution | 10 |
| Max calls per execution (chained, depth > 0) | 3 |
| Max payload size | 100KB |
| Max delay | 900 seconds (15 minutes) |
| Max chain depth | 2 (allows 3 hops: depth 0, 1, 2) |

### Example

**Sender script** - pushes an event to a target script:

```js
// Push with payload and issue context
await asyncEvent.push(
  "550e8400-e29b-41d4-a716-446655440000",
  { action: "process", itemId: 42 },
  { issueKey: "PROJ-123", delayInSeconds: 60 }
)
```

**Target script** (must have an async event trigger enabled):

```js
log("Received from:", event.pushedBy)
log("Depth:", event.depth, "Chain:", event.chainId)

if (event.payload.action === "process") {
  // issueKey was passed in options, so issue is auto-loaded
  log("Processing:", issueKey, "-", issue.fields.summary)
}
```

See the [Async Event API](/docs/jibrok-studio-jira/scripting-api#asyncevent) for the full scripting reference.

---

## Context Restrictions

Scripts can be limited to specific **projects** (up to 50) and **issue types** (up to 50). When restricted, scripts skip non-matching issues.

For UI Modification triggers, you can also restrict by **JSM portals** (up to 50) and **request types** (up to 200).

Configure context restrictions in the script's **Config** tab.

---

## Managing Triggers

### Adding a Trigger

1. Open a script in the Console
2. Go to the **Config** tab
3. Click **Add Trigger**
4. Select trigger type and configure settings
5. **Save** the script

### Enabling/Disabling

Each trigger has its own enabled/disabled toggle, independent of the script's enabled status. **Both** must be enabled for the trigger to fire.

### Singleton vs Multiple

- **Singleton triggers** (Scheduled, Event, UIM, Scripted Fields, Async Event, Automation, Rovo): one per script

### Limits

- Up to **10 triggers** per script
- Global trigger type toggles are available in [Administration](/docs/jibrok-studio-jira/admin-settings)

---

## Next Steps

- [Script Console](/docs/jibrok-studio-jira/script-console) — Configure triggers via Config tab
- [Administration](/docs/jibrok-studio-jira/admin-settings) — Global trigger type controls
- [Scripted Fields](/docs/jibrok-studio-jira/scripted-fields) — Field computation triggers
- [UI Modifications](/docs/jibrok-studio-jira/ui-modifications) — Form customization triggers
- [Jira Automation Integration](/docs/jibrok-studio-jira/automation) — Run scripts from Jira Automation rules
- [Rovo AI Agent Integration](/docs/jibrok-studio-jira/rovo) — Expose scripts to Rovo AI
