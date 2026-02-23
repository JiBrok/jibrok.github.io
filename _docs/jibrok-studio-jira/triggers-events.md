---
title: Event Triggers
key: jibrok-studio-jira
category: core-features
tags:
  - doc
  - cloud
  - triggers
  - events
---

* TOC
{:toc}

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

## See Also

- [Triggers Overview](/docs/jibrok-studio-jira/triggers) — All trigger types at a glance
- [Scheduled Triggers](/docs/jibrok-studio-jira/triggers-scheduled) — Run scripts on a schedule
- [Async Events](/docs/jibrok-studio-jira/triggers-async) — Trigger scripts asynchronously
