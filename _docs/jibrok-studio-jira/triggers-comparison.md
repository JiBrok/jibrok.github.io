---
title: Choose the Right Trigger
key: jibrok-studio-jira
excerpt: Compare all 11 trigger types and pick the right one for your use case
category: core-features
tags:
  - doc
  - cloud
  - triggers
  - comparison
---

* TOC
{:toc}

## Trigger comparison matrix

| Trigger type | When to use | Runs as | Issue context | Timing | Engine |
|---|---|---|---|---|---|
| [Scheduled](/docs/jibrok-studio-jira/triggers-scheduled) | Run scripts on a recurring schedule | Configured actor | No | Async | Sandbox |
| [Event](/docs/jibrok-studio-jira/triggers-events) | React to Jira events (issue created, updated, etc.) | Application | Yes (auto-loaded) | Async | Sandbox |
| [Async Event](/docs/jibrok-studio-jira/triggers-async) | Trigger scripts from other scripts | Caller's identity | Optional | Async (0-900s delay) | Sandbox |
| [Webhook](/docs/jibrok-studio-jira/triggers-webhook) | Execute scripts via HTTP requests | Configured actor | No | Sync | Sandbox |
| [Workflow Post Function](/docs/jibrok-studio-jira/triggers-workflow-post-function) | Run scripts after a workflow transition | Configured actor | Yes (auto-loaded) | Sync | Sandbox |
| [Workflow Validator](/docs/jibrok-studio-jira/triggers-workflow-validator) | Validate transitions before they complete | Configured actor | Yes (auto-loaded) | Sync | Sandbox |
| [Workflow Condition](/docs/jibrok-studio-jira/triggers-workflow-condition) | Control transition button visibility | N/A (Jira-native) | Yes (Jira-native) | Sync | Jira Expressions |
| [UI Modification](/docs/jibrok-studio-jira/ui-modifications) | Customize issue create/edit/transition forms | Current user | Yes (form context) | Real-time | Sandbox |
| [Scripted Field](/docs/jibrok-studio-jira/scripted-fields) | Compute custom field values | Application | Yes (RichIssue) | Sync | Sandbox |
| [Automation](/docs/jibrok-studio-jira/automation) | Run scripts as Jira Automation actions | Configured actor (default: Application) | Optional | Async | Sandbox |
| [Rovo AI](/docs/jibrok-studio-jira/rovo) | Let users run pre-approved scripts via Rovo chat | Current Rovo user | Optional | Async | Sandbox |

---

## Which trigger should I use?

### I need to react to a Jira event

Use an **[Event trigger](/docs/jibrok-studio-jira/triggers-events)**. It fires automatically when issues are created, updated, deleted, or when comments, worklogs, and other objects change. Choose from 32 event types.

If you need to run logic *during* a workflow transition (not just after), use a **[Workflow Post Function](/docs/jibrok-studio-jira/triggers-workflow-post-function)** or **[Workflow Validator](/docs/jibrok-studio-jira/triggers-workflow-validator)** instead.

### I need to run on a schedule

Use a **[Scheduled trigger](/docs/jibrok-studio-jira/triggers-scheduled)**. It supports intervals from every 5 minutes to weekly. Scheduled triggers have the highest loop iteration limit (100,000) and generous API call budget (100 calls), making them ideal for periodic bulk operations.

### I need to validate a workflow transition

Use a **[Workflow Validator](/docs/jibrok-studio-jira/triggers-workflow-validator)**. It runs before the transition completes and can block it with an error message. Company-managed projects only. The validator is fail-open - if the script errors out, the transition proceeds.

For simple visibility rules ("show/hide the transition button"), use a **[Workflow Condition](/docs/jibrok-studio-jira/triggers-workflow-condition)** with Jira Expressions instead.

### I need to modify issue forms

Use a **[UI Modification trigger](/docs/jibrok-studio-jira/ui-modifications)**. It intercepts issue create, edit, and transition forms to set field visibility, required state, default values, and available options in real-time.

### I need computed custom fields

Use a **[Scripted Field](/docs/jibrok-studio-jira/scripted-fields)**. It recalculates on every issue create and update. Available types: Text, Number, Date, DateTime, Paragraph.

### I need to chain scripts together

Use **[Async Events](/docs/jibrok-studio-jira/triggers-async)**. One script can trigger another asynchronously, with optional delay (up to 15 minutes) and payload. Useful for breaking complex workflows into stages.

### I need to receive HTTP requests

Use a **[Webhook trigger](/docs/jibrok-studio-jira/triggers-webhook)**. It provides a unique URL with Basic Auth authentication. Rate-limited to 60 requests per minute.

### I need to integrate with Jira Automation

Use an **[Automation trigger](/docs/jibrok-studio-jira/automation)**. Add a "Run JiBrok Studio Script" action to any Jira Automation rule. The script receives the issue context from the automation rule.

### I need non-admin users to run scripts

Use the **[Rovo AI trigger](/docs/jibrok-studio-jira/rovo)**. Admins pre-approve scripts, and regular users discover and run them through the Rovo chat interface. Scripts execute with the calling user's permissions.

---

## Comparing similar triggers

### Scheduled vs event

| | Scheduled | Event |
|---|---|---|
| **Fires when** | Clock interval (5min - weekly) | Jira event occurs |
| **Issue context** | No - query issues with JQL | Yes - the event payload includes the issue |
| **Best for** | Periodic scans, reports, bulk cleanup | Reacting to individual changes |
| **API calls** | 100 | 60 |
| **Loop iterations** | 100,000 | 50,000 |

### Workflow post function vs event

| | Workflow Post Function | Event |
|---|---|---|
| **Fires when** | After a specific transition | After any matching Jira event |
| **Timing** | Sync (during transition) | Async (after event) |
| **Transition context** | Yes (`event.transition` with from/to status) | No |
| **Scope** | Company-managed workflows only | All projects |
| **Best for** | Transition-specific logic (set fields, create linked issues) | General issue change reactions |

### Async event vs scheduled

| | Async Event | Scheduled |
|---|---|---|
| **Fires when** | Another script triggers it | Clock interval |
| **Delay** | 0-900 seconds | Fixed interval |
| **Issue context** | Via payload | Via JQL search |
| **Best for** | Script chaining, deferred processing | Periodic operations |
| **API calls** | 250 | 100 |

---

## Next steps

- [Triggers](/docs/jibrok-studio-jira/triggers) - Trigger overview and configuration
- [Limits](/docs/jibrok-studio-jira/limits) - Per-trigger execution limits
- [Administration](/docs/jibrok-studio-jira/admin-settings) - Enable/disable trigger types globally
