# Message Panel for Jira Cloud - User Documentation

Welcome to the complete user documentation for Message Panel, an Atlassian Forge app for displaying contextual messages and linked issue panels on Jira Cloud.

## 📚 Documentation Structure

This documentation is organized into the following sections:

### 🚀 Getting Started

Start here if you're new to Message Panel:

1. **[Overview](overview.md)** - Introduction to Message Panel, key features, and use cases
2. **[Installation Guide](install.md)** - Step-by-step installation and setup instructions
3. **[Configuration Guide](configuration.md)** - Complete guide to creating and managing configurations

### 🎨 Templates & Customization

Learn how to create dynamic, data-driven messages:

4. **[Dynamic Templates](dynamic-templates.md)** - Template engine syntax, variables, conditions, loops, and filters
5. **[Template Examples](template-examples.md)** - Ready-to-use template examples you can copy and paste

### 🔧 Advanced Topics

Dive deeper into Message Panel capabilities:

6. **[Display Modules](modules.md)** - Understanding Issue Panel, Activity, Context, and Action modules
7. **[Rovo Integration](rovo-integration.md)** - AI-powered analysis with Atlassian Rovo agents
8. **[Delegation & Permissions](delegation.md)** - Project-based access control and delegation policies

## 📖 Quick Links by Topic

### For New Users

- [What is Message Panel?](overview.md#what-is-message-panel)
- [How to Install](install.md#install-from-atlassian-marketplace)
- [Create Your First Panel](configuration.md#creating-a-configuration)
- [Simple Template Examples](template-examples.md#basic-messages)

### For Administrators

- [Global Module Settings](modules.md#enabling-modules)
- [Delegation Policies](delegation.md#delegation-policies)
- [Security Considerations](delegation.md#security-considerations)
- [Performance Tips](configuration.md#performance)

### For Power Users

- [Advanced Templates](dynamic-templates.md#advanced-techniques)
- [JQL Templates](template-examples.md#jql-templates)
- [Complex Filtering](configuration.md#filtering)
- [Modal Windows](configuration.md#modal-window-issue-panel-only)
- [Rovo AI Integration](rovo-integration.md)

### Common Tasks

- [Display Linked Issues](configuration.md#linked-issues)
- [Query Issues with JQL](configuration.md#jql-query)
- [Show Status Messages](template-examples.md#status-and-progress)
- [Create Warnings](template-examples.md#due-date-warning)
- [Track Progress](template-examples.md#epic-progress-dashboard)

## 🎯 Use Case Index

Find documentation for your specific use case:

### Issue Management

- **Blocker Tracking** → [Configuration: Linked Issues](configuration.md#linked-issues) + [Example: Blockers Warning](template-examples.md#blockers-warning)
- **Epic Progress** → [Configuration: JQL Query](configuration.md#jql-query) + [Example: Epic Dashboard](template-examples.md#epic-progress-dashboard)
- **Related Bugs** → [Configuration: JQL Query](configuration.md#jql-query) + [Example: JQL Templates](template-examples.md#same-project-and-type)
- **Dependencies** → [Configuration: Linked Issues](configuration.md#linked-issues) + [Modules: Issue Panel](modules.md#issue-panel)

### Notifications & Warnings

- **SLA Alerts** → [Templates: Conditions](dynamic-templates.md#conditions) + [Example: SLA Warning](template-examples.md#sla-warning)
- **Due Date Reminders** → [Templates: Date Filters](dynamic-templates.md#date-filters) + [Example: Due Date Warning](template-examples.md#due-date-warning)
- **Missing Info** → [Templates: Null Safety](dynamic-templates.md#null-safety) + [Example: Checklist](template-examples.md#missing-information-checklist)
- **High Priority** → [Templates: Switch/Case](dynamic-templates.md#switchcase) + [Example: Priority Messages](template-examples.md#conditional-message)

### Team Management

- **Workload Distribution** → [Example: Team Workload](template-examples.md#team-workload)
- **Progress Tracking** → [Example: Progress Indicator](template-examples.md#progress-indicator)
- **Assignment Checks** → [Example: Assignee Check](template-examples.md#assignee-check)
- **Current User Context** → [Variables: User Context](dynamic-templates.md#user-context)

### Custom Dashboards

- **Epic Dashboard** → [Example: Epic Progress](template-examples.md#epic-progress-dashboard)
- **Sprint Overview** → [Configuration: JQL Query](configuration.md#jql-query) + [Templates: Loops](dynamic-templates.md#loops)
- **Component Status** → [Templates: Multi-Select](template-examples.md#multi-select-field)
- **Project Metrics** → [Templates: Calculations](dynamic-templates.md#calculations)

### AI & Automation

- **AI-Powered Analysis** → [Rovo Integration](rovo-integration.md)
- **Intelligent Agents** → [Rovo: Agent Configuration](rovo-integration.md#agent-configuration-examples)
- **Recursive Dependency Tracking** → [Rovo: Recursive Queries](rovo-integration.md#example-use-cases)
- **Automated Issue Analysis** → [Rovo: Automated Analysis](rovo-integration.md#example-use-cases)

## 🔍 Feature Index

### Configuration Features

| Feature | Documentation |
|---------|---------------|
| **Linked Issues Display** | [Configuration: Linked Issues](configuration.md#linked-issues) |
| **JQL Queries** | [Configuration: JQL Query](configuration.md#jql-query) |
| **Field Selection** | [Configuration: Field Selection](configuration.md#field-selection) |
| **Display Filtering** | [Configuration: Filtering](configuration.md#filtering) |
| **Modal Windows** | [Configuration: Modal Window](configuration.md#modal-window-issue-panel-only) |
| **Pagination** | [Configuration: Pagination](configuration.md#pagination) |
| **Weight Ordering** | [Configuration: Weight](configuration.md#weight) |

### Template Features

| Feature | Documentation |
|---------|---------------|
| **Variables** | [Templates: Variables](dynamic-templates.md#variables) |
| **Conditions** | [Templates: Conditions](dynamic-templates.md#conditions) |
| **Loops** | [Templates: Loops](dynamic-templates.md#loops) |
| **Filters** | [Templates: Filters](dynamic-templates.md#filters) |
| **JQL Templates** | [Templates: JQL Templates](dynamic-templates.md#jql-templates) |
| **Null Safety** | [Templates: Null Safety](dynamic-templates.md#null-safety) |

### Module Features

| Module Type | Best For | Documentation |
|-------------|----------|---------------|
| **Issue Panel** | Main data displays | [Modules: Issue Panel](modules.md#issue-panel) |
| **Issue Activity** | Timeline updates | [Modules: Issue Activity](modules.md#issue-activity) |
| **Issue Context** | Quick reference | [Modules: Issue Context](modules.md#issue-context) |
| **Issue Action** | User actions | [Modules: Issue Action](modules.md#issue-action) |

### Advanced Features

| Feature | Description | Documentation |
|---------|-------------|---------------|
| **Rovo AI Integration** | AI-powered analysis with Atlassian Rovo agents | [Rovo Integration](rovo-integration.md) |
| **Recursive Queries** | Automatic multi-level linked issue analysis | [Rovo: Recursive Queries](rovo-integration.md) |
| **Panel Instructions** | AI agents execute panel-defined analysis workflows | [Rovo: Panel Instructions](rovo-integration.md) |

## 🎓 Learning Path

### Beginner Path (15 minutes)

1. Read [Overview](overview.md) to understand what Message Panel does
2. Follow [Installation Guide](install.md) to install the app
3. Create your first panel using [Configuration Guide](configuration.md#creating-a-configuration)
4. Try a simple template from [Template Examples](template-examples.md#basic-messages)

### Intermediate Path (30 minutes)

1. Learn [Dynamic Templates](dynamic-templates.md) syntax
2. Explore [Template Examples](template-examples.md) for common patterns
3. Understand [Display Modules](modules.md) and choose the right location
4. Configure [Filtering](configuration.md#filtering) to control visibility

### Advanced Path (60 minutes)

1. Master [Advanced Template Techniques](dynamic-templates.md#advanced-techniques)
2. Create [JQL Templates](dynamic-templates.md#jql-templates) for dynamic queries
3. Set up [Modal Windows](configuration.md#modal-window-issue-panel-only) for optional content
4. Integrate with [Atlassian Rovo](rovo-integration.md) for AI-powered analysis
5. Configure [Delegation](delegation.md) for project teams
6. Optimize [Performance](configuration.md#performance)

## 🔗 External Resources

### Atlassian Resources

- [Atlassian Forge Documentation](https://developer.atlassian.com/platform/forge/)
- [Jira Cloud Platform](https://developer.atlassian.com/cloud/jira/platform/)
- [Atlassian Rovo](https://www.atlassian.com/software/rovo) - AI-powered platform for intelligent agents
- [JQL Documentation](https://support.atlassian.com/jira-software-cloud/docs/what-is-advanced-searching-in-jira-cloud/)
- [Jira Permissions](https://support.atlassian.com/jira-cloud-administration/docs/manage-project-permissions/)

### Community & Support

- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Submit tickets and get help
- **[Atlassian Community](https://community.atlassian.com/)** - Ask questions and share ideas
- **[Atlassian Marketplace](https://marketplace.atlassian.com/)** - View app listing and reviews

### Related Apps

- **Message Field for Data Center** - Server/Data Center version of this app
- **Other Jibrok Apps** - Explore our complete app portfolio

## 📝 Document Conventions

Throughout this documentation, you'll see:

- ✅ **Do this** - Recommended approach
- ❌ **Don't do this** - Not recommended
- ⚠️ **Warning** - Important caution
- 💡 **Tip** - Helpful suggestion
- 📌 **Note** - Additional information

### Code Examples

**Template code**:
{% raw %}
```
{{ variable }}
{% if condition %}...{% endif %}
```
{% endraw %}

**JQL queries**:
```jql
project = PROJ AND type = Bug
```

**Configuration examples**:
```
Field: Value
Setting: Option
```

## 🆘 Getting Help

### Documentation Navigation

Each page includes:
- Table of contents for quick navigation
- Cross-references to related topics
- Examples for common patterns
- Troubleshooting sections

### Common Issues

- [Installation Issues](install.md#troubleshooting-installation)
- [Configuration Problems](configuration.md#troubleshooting)
- [Template Errors](dynamic-templates.md#debugging-templates)
- [Module Issues](modules.md#troubleshooting)
- [Permission Problems](delegation.md#troubleshooting)

### Contact Support

If you can't find what you need:

1. **Search the docs** - Use your browser's find feature (Ctrl+F / Cmd+F)
2. **Check examples** - Look in [Template Examples](template-examples.md)
3. **Ask community** - Post in [Atlassian Community](https://community.atlassian.com/)
4. **Contact us** - Submit a ticket to [Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)

## 🔄 Documentation Updates

This documentation is regularly updated to reflect:
- New features and capabilities
- Bug fixes and improvements
- User feedback and questions
- Best practices and patterns

**Last Updated**: 2025

**Version**: 1.0 (Cloud)

## 📜 License & Terms

Message Panel for Jira Cloud is:
- Built on Atlassian Forge platform
- Subject to Atlassian Marketplace terms
- Licensed per Jira Cloud user

For licensing questions, visit the [Atlassian Marketplace](https://marketplace.atlassian.com/).

---

## 🚀 Ready to Get Started?

1. **New to Message Panel?** → Start with [Overview](overview.md)
2. **Ready to install?** → Go to [Installation Guide](install.md)
3. **Want to dive deep?** → Check out [Configuration Guide](configuration.md)
4. **Looking for examples?** → Browse [Template Examples](template-examples.md)
5. **Want AI-powered analysis?** → Explore [Rovo Integration](rovo-integration.md)

**Happy configuring!** 🎉

---

**Need help?** [Contact Support](https://jibrok.atlassian.net/servicedesk/customer/portals) | **Found a bug?** [Report Issue](https://jibrok.atlassian.net/servicedesk/customer/portals) | **Have feedback?** [Share Ideas](https://jibrok.atlassian.net/servicedesk/customer/portals)

*Built with ❤️ for the Jira community*
