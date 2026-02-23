---
title: Overview
key: jibrok-studio-jira
excerpt: Scripting platform for Jira Cloud — automate, extend, and customize your Jira workflows
category: getting-started
tags:
  - doc
  - cloud
  - overview
  - introduction
---

* TOC
{:toc}

## What is JiBrok Studio for Jira Cloud?

JiBrok Studio for Jira Cloud is a Forge-based scripting platform for Jira Cloud. It lets Jira administrators write, manage, and automate scripts that interact with Jira data — all from within the Jira interface.

Scripts run in a secure sandbox with no access to external networks or filesystems. The only external interaction is through the Jira REST API, ensuring your data stays safe.

<a href="/uploads/jibrok-studio-jira/console-interface-overview.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/console-interface-overview.png" alt="JiBrok Studio Script Console interface" style="width:100%;" loading="lazy"></a>

---

## Key Capabilities

| Feature | Description |
|---------|-------------|
| **[Script Console](/docs/jibrok-studio-jira/script-console)** | Interactive code editor with syntax highlighting, multiple language engines, and instant execution |
| **[Script Library](/docs/jibrok-studio-jira/script-library)** | Central storage for saved scripts with folders, labels, search, and version history |
| **[Triggers](/docs/jibrok-studio-jira/triggers)** | Automate script execution via schedules, Jira events, and async events |
| **[Scripted Fields](/docs/jibrok-studio-jira/scripted-fields)** | Computed custom fields (text, number, date, datetime) that recalculate on issue create/update |
| **[UI Modifications](/docs/jibrok-studio-jira/ui-modifications)** | Dynamically customize issue create and transition forms |
| **[Automation](/docs/jibrok-studio-jira/automation)** | Run scripts as Jira Automation actions |
| **[Rovo AI Agent](/docs/jibrok-studio-jira/rovo)** | Expose scripts to Atlassian Rovo AI for natural language execution |
| **[Custom Tables](/docs/jibrok-studio-jira/data-storage)** | SQL-backed structured data storage with a visual browser |
| **[Message Queues](/docs/jibrok-studio-jira/data-storage)** | Async message processing with priority-based ordering |

---

## Who Is It For?

- **Jira administrators** who need to automate repetitive tasks
- **Automation engineers** building advanced workflows beyond native Jira capabilities
- **Teams** that need computed fields, conditional form logic, or custom data storage

> **Note:** JiBrok Studio for Jira Cloud is available to **Jira site administrators only**. Non-admin users cannot access the app interface.

---

## How It Works

1. **Write** scripts in the built-in code editor using a JavaScript-like language (Python and Groovy engines also available)
2. **Test** interactively in the Console with sandbox mode for safe experimentation
3. **Save** scripts to the Library for reuse and organization
4. **Automate** by attaching triggers — schedules, events, form changes, and more
5. **Store** structured data in Custom Tables and process async workloads via Message Queues

All scripts run inside a Forge-powered sandbox with strict resource limits. There is no access to external networks, filesystems, or browser APIs — only the Jira REST API is available.

---

## Next Steps

- [Getting Started](/docs/jibrok-studio-jira/getting-started) - Install the app and run your first script
- [Script Console](/docs/jibrok-studio-jira/script-console) - Learn the editor and execution features
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and sandbox details
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference (Issues, Users, Projects, Fields, utilities)
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
- [Triggers](/docs/jibrok-studio-jira/triggers) - Automate script execution
