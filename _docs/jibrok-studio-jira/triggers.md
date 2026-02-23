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
| Scheduled (hourly/daily/weekly) | [Scheduled Triggers](/docs/jibrok-studio-jira/triggers-scheduled) |
| Event (32 Jira events) | [Event Triggers](/docs/jibrok-studio-jira/triggers-events) |
| Async Event | [Async Events](/docs/jibrok-studio-jira/triggers-async) |
| UI Modification (onInit/onChange) | [UI Modifications](/docs/jibrok-studio-jira/ui-modifications) |
| Scripted Field (Text/Number/Date/DateTime) | [Scripted Fields](/docs/jibrok-studio-jira/scripted-fields) |
| Automation | [Jira Automation Integration](/docs/jibrok-studio-jira/automation) |
| Rovo | [Rovo AI Agent Integration](/docs/jibrok-studio-jira/rovo) |

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

<a href="/uploads/jibrok-studio-jira/triggers-tab-empty-state.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/triggers-tab-empty-state.png" alt="Triggers tab empty state" style="width:100%;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/triggers-add-dialog-types.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/triggers-add-dialog-types.png" alt="Add Trigger dialog with trigger type options" style="width:100%;" loading="lazy"></a>

<a href="/uploads/jibrok-studio-jira/triggers-add-dialog-rovo.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/triggers-add-dialog-rovo.png" alt="Add Trigger dialog showing Rovo option" style="max-height:600px;width:auto;" loading="lazy"></a>

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
