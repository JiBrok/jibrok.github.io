---
title: Message Panel for Jira Cloud - Overview
key: message-field-cloud
excerpt: "Display contextual messages and data panels on Jira issue screens. Features dynamic templates, linked issues display, JQL queries, custom styling, and module-based targeting."
category: getting-started
tags: [doc, cloud, messaging, panels, linked-issues, jql, dynamic-templates, forge, rovo-integration]
---

# Welcome to Message Panel for Jira Cloud!

An Atlassian Forge application for displaying custom messages and linked issue panels on Jira issue screens.

## What is Message Panel?

Message Panel is a powerful Jira Cloud app that allows you to:
- 📋 **Display linked issues** in customizable tables with selected fields
- 🔍 **Query issues via JQL** and show results in organized panels
- 💬 **Show custom messages** with dynamic content using templates
- 📍 **Target specific locations** on issue screens (panels, activities, context menus)
- 🎨 **Customize appearance** with HTML, Markdown, or ADF formatting
- 🔄 **Use dynamic data** from current issue, linked issues, and Jira fields
- 🎯 **Control visibility** by projects, issue types, and JQL conditions
- 🤖 **Integrate with Rovo** for AI-powered issue analysis

## Key Features

### 📊 Linked Issues Display
- Show issues connected via link types (blocks, is blocked by, relates to, etc.)
- Display JQL query results in formatted tables
- Choose which fields to display in the table
- Support for all Jira field types with smart rendering
- Pagination and sorting options

### 🎨 Dynamic Templates
- Modern template engine with variables, conditions, and loops
- Access to issue fields, linked issues, and user data
- Real-time context updates
- Support for HTML, Markdown, and ADF formats
- Built-in filters and formatting functions

### 📍 Multiple Display Modules
- **Issue Panel** - Main panel on issue view screen
- **Issue Activity** - Appears in activity feed
- **Issue Context** - Quick info in context menu
- **Issue Action** - Custom action buttons
- **JSM Portal** - Service Management customer portal support

### 🎯 Targeted Display
- Filter by projects and issue types
- Additional JQL conditions for fine-grained control
- Weight-based ordering of multiple panels
- Per-module visibility settings

### 🔐 Access Control
- Project-based delegation system
- Admin and project admin roles
- Granular permissions per configuration
- Support for both global and project-level settings

### 🤖 Rovo Integration
- AI agent for analyzing linked issues
- Query relationships and dependencies
- Generate insights about issue hierarchies
- Automated impact analysis

## How It Works

1. **Configure Panels** - Create configurations in the admin settings page
2. **Define Data Source** - Choose linked issues or JQL query
3. **Select Fields** - Pick which fields to display in tables
4. **Add Messages** - Write custom messages with dynamic templates
5. **Set Display Rules** - Control where and when panels appear
6. **Enable Modules** - Activate panels on desired issue screens

## Compared to Data Center Version

| Feature | Data Center | Cloud (Forge) |
|---------|-------------|---------------|
| Display Method | Custom Field | Forge Modules |
| Templates | Velocity | Modern Template Engine |
| JavaScript | Full Support | Limited (Forge restrictions) |
| ScriptRunner | Supported | Not Available |
| Linked Issues | Via templates | Native support with UI |
| Field Display | Manual HTML | Automatic rendering |
| Admin UI | Custom field config | Dedicated admin page |
| Delegation | Field-based | Project-based |
| REST API | Full API | Forge API only |

## Use Cases

### 📌 Linked Issues Dashboard
Display related issues in organized panels:
- Blockers and dependencies
- Related bugs and tasks
- Parent-child relationships
- Custom link types

### 🎯 Contextual Instructions
Show dynamic messages based on issue data:
- SLA warnings for high-priority tickets
- Onboarding guides for new issue types
- Release notes and announcements
- Workflow-specific instructions

### 📊 JQL-Based Panels
Query and display issues matching criteria:
- All issues in current epic
- Bugs in the same component
- Tasks assigned to current user
- Custom searches with parameters

### 🔗 Impact Analysis
Visualize issue relationships:
- Downstream dependencies
- Affected features
- Test coverage
- Risk assessment

## Getting Started

1. **[Installation Guide](/docs/user-docs/install/)** - Install and configure Message Panel
2. **[Creating Configurations](/docs/user-docs/configuration/)** - Set up your first panel
3. **[Dynamic Templates](/docs/user-docs/dynamic-templates/)** - Learn template syntax
4. **[Template Examples](/docs/user-docs/template-examples/)** - Copy and paste examples
5. **[Modules Guide](/docs/user-docs/modules/)** - Understand display modules
6. **[Delegation](/docs/user-docs/delegation/)** - Manage user permissions

## Complete Documentation

### 🚀 Getting Started
- [Installation Guide](/docs/user-docs/install/) - Install and activate the app
- [Creating Configurations](/docs/user-docs/configuration/) - Step-by-step configuration
- [Managing Modules](/docs/user-docs/modules/) - Enable and configure modules

### ⚙️ Configuration
- [Basic Settings](/docs/user-docs/configuration/#basic-settings) - Name, description, data source
- [Display Settings](/docs/user-docs/configuration/#display-settings) - Fields, pagination, appearance
- [Filtering](/docs/user-docs/configuration/#filtering) - Projects, types, JQL conditions
- [Advanced Options](/docs/user-docs/configuration/#advanced-options) - Modal windows, actors

### 🎨 Templates & Customization
- [Dynamic Templates](/docs/user-docs/dynamic-templates/) - Template engine overview
- [Template Examples](/docs/user-docs/template-examples/) - Ready-to-use examples
- [Available Variables](/docs/user-docs/dynamic-templates/#variables) - Context and data access
- [Filters and Functions](/docs/user-docs/dynamic-templates/#filters) - Data transformation

### 🔧 Administration
- [Modules Management](/docs/user-docs/modules/) - Enable/disable display modules
- [Delegation](/docs/user-docs/delegation/) - Project-level permissions
- [Performance](/docs/user-docs/performance/) - Caching and optimization
- [Troubleshooting](/docs/user-docs/troubleshooting/) - Common issues and solutions

### 🔌 Integration
- [Rovo Agent](/docs/user-docs/rovo/) - AI-powered analysis
- [Forge API](/docs/user-docs/forge-api/) - Technical integration details

## Support

- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Get help and submit feature requests
- **[Atlassian Marketplace](https://marketplace.atlassian.com/apps/1234567/message-panel)** - View app listing and reviews
- **[Release Notes](/docs/user-docs/release-notes/)** - See what's new

## Screenshots

### Admin Configuration Page
Configure panels, set up data sources, and manage display rules from a centralized admin interface.

### Issue Panel Display
View linked issues and custom messages directly on the issue screen with smart field rendering.

### Dynamic Templates in Action
Create contextual messages that update in real-time based on issue data and user context.

---

**Built with ❤️ using Atlassian Forge**

Ready to get started? [Install Message Panel](/docs/user-docs/install/) now!
