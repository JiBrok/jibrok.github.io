---
title: Overview
key: message-field-cloud
excerpt: Learn what Message Panel for Jira Cloud does and how it helps your team
category: getting-started
tags:
  - doc
  - cloud
  - overview
  - introduction
---

* TOC
{:toc}

## What is Message Panel?

Message Panel is a Jira Cloud app that displays dynamic information panels on issues. It helps teams communicate important context, warnings, and related data directly where work happens.

![Message Panel Example](/uploads/message-field-cloud/configuration/example%20issue%20activity.png)

**[Get it on Atlassian Marketplace](https://marketplace.atlassian.com/apps/1219615/message-field?hosting=cloud&tab=overview)**

Use it to:
- Show warnings and blockers prominently on issues
- Display related issues from JQL queries
- Present linked issues in organized tables
- Guide users with contextual instructions
- Automate information display based on conditions

## Key Features

| Feature | Description |
|---------|-------------|
| **Dynamic Templates** | Use `{% raw %}{{ issue.fields.status.name }}{% endraw %}` syntax to show live issue data |
| **Multiple Data Sources** | Display linked issues, JQL results, or custom messages |
| **Display Modules** | Jira modules (Issue Panel, Activity, Context, Action) and JSM Portal modules |
| **Conditional Display** | Show panels only for specific projects, issue types, or JQL conditions |
| **User Field Visibility** | Show panels only when viewing user is in specific fields |
| **Enable/Disable** | Toggle configurations on/off without deleting them |
| **Modal Windows** | Display important information in pop-up dialogs (Issue Panel) |
| **Message Formats** | Plain text, HTML, Markdown, or ADF formatting |
| **Delegation** | Allow project admins to manage their own panels |
| **Rovo Integration** | AI-powered actions for analysis and automation |

## Use Cases

**For Development Teams:**
- Show blocking issues that must be resolved first
- Display epic progress and child issue summaries
- Link related bugs and features

**For Support Teams:**
- Show customer information from linked tickets
- Display SLA warnings and escalation notices
- Guide agents with resolution instructions

![JSM Portal Example](/uploads/message-field-cloud/configuration/example%20jsm%20portal%20full.png)

**For Project Managers:**
- Present dependency information
- Show milestone and deadline reminders
- Display team workload summaries

## How It Works

1. **Create a configuration** in the admin page
2. **Choose a data source**: linked issues, JQL query, or message only
3. **Set display conditions**: which projects and issue types
4. **Add dynamic content** using template syntax
5. **Enable the module** where you want it to appear

## Next Steps

- [Getting Started](getting-started) - Create your first panel in 5 minutes
- [Modules](modules) - Learn about display locations
- [Templates](templates) - Master dynamic content
- [Use Cases](use-cases) - Examples and best practices

## Support

- [Atlassian Marketplace](https://marketplace.atlassian.com/apps/1219615/message-field?hosting=cloud&tab=overview) - Get the app
- [Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals) - Get help and report issues
