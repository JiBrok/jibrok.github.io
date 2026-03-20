---
title: Overview
key: jibrok-studio-jira
excerpt: "JiBrok Studio for Jira Cloud is a Forge-based scripting platform. Automate workflows, create scripted fields, and extend Jira with JavaScript, Python, and Groovy."
category: getting-started
tags:
  - doc
  - cloud
  - overview
  - introduction
related:
  - jibrok-studio-jira/getting-started
  - jibrok-studio-jira/script-console
  - jibrok-studio-jira/triggers
  - jibrok-studio-jira/use-cases
  - jibrok-studio-jira/scripting-api
seo_title: JiBrok Studio Overview - Scripting for Jira Cloud
software_schema: true
last_modified_at: 2026-03-19
date: 2026-02-23
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## What is JiBrok Studio for Jira Cloud?

Write, manage, and automate scripts that interact with your Jira data - directly from the Jira interface. JiBrok Studio for Jira Cloud is a Forge-based scripting platform built for Jira administrators.

Scripts run in a secure sandbox with no access to external networks or filesystems. The only way scripts interact with data is through the Jira REST API of the current site.

> [Get JiBrok Studio on Atlassian Marketplace](https://marketplace.atlassian.com/apps/2349892699) - free to get started.

<a href="/uploads/jibrok-studio-jira/console-interface-overview.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-interface-overview.png" alt="JiBrok Studio Script Console interface" width="2754" height="1736" style="width:100%;height:auto;" loading="lazy"></a>

---

## Key capabilities

| Feature | Description |
|---------|-------------|
| **[Script Console](/docs/jibrok-studio-jira/script-console)** | Interactive code editor with syntax highlighting, multiple language engines, and instant execution |
| **[Script Library](/docs/jibrok-studio-jira/script-library)** | Central storage for saved scripts with folders, labels, search, and version history |
| **[Triggers](/docs/jibrok-studio-jira/triggers)** | Automate script execution via schedules, Jira events, webhooks, and async events |
| **[Scripted Fields](/docs/jibrok-studio-jira/scripted-fields)** | Computed custom fields (text, number, date, datetime, paragraph) that recalculate on issue create/update |
| **[UI Modifications](/docs/jibrok-studio-jira/ui-modifications)** | Dynamically customize issue create and transition forms |
| **[Automation](/docs/jibrok-studio-jira/automation)** | Run scripts as Jira Automation actions |
| **[Rovo AI Agent](/docs/jibrok-studio-jira/rovo)** | Expose scripts to Atlassian Rovo AI for natural language execution |
| **[Workflow Post Function](/docs/jibrok-studio-jira/triggers-workflow-post-function)** | Run scripts after workflow transitions with full transition context |
| **[Workflow Validator](/docs/jibrok-studio-jira/triggers-workflow-validator)** | Validate workflow transitions with scripts before they complete |
| **[Workflow Condition](/docs/jibrok-studio-jira/triggers-workflow-condition)** | Control transition visibility with Jira Expressions |
| **[Custom Tables](/docs/jibrok-studio-jira/data-storage)** | Structured data storage with a visual browser |
| **[Message Queues](/docs/jibrok-studio-jira/data-storage)** | Async message processing with priority-based ordering |
| **[Webhook Trigger](/docs/jibrok-studio-jira/triggers-webhook)** | Trigger scripts via HTTP requests with Basic Auth and rate limiting |
| **[Scenarios](/docs/jibrok-studio-jira/scenarios)** | Split long-running scripts into managed steps for bulk operations |
| **[Script Usage Tracking](/docs/jibrok-studio-jira/admin-tools#script-usage)** | See where scripts are used across workflows and custom fields |

---

## Who is it for?

- **Jira administrators** who need to automate repetitive tasks
- **Automation engineers** building advanced workflows beyond native Jira capabilities
- **Teams** that need computed fields, conditional form logic, or custom data storage

---

## Next steps

- [Getting Started](/docs/jibrok-studio-jira/getting-started) - Install the app and run your first script
- [Script Console](/docs/jibrok-studio-jira/script-console) - Learn the editor and execution features
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference (Issues, Users, Projects, Fields, utilities)
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
- [Triggers](/docs/jibrok-studio-jira/triggers) - Automate script execution
