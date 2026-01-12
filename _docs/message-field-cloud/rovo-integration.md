---
title: Rovo Integration
key: message-field-cloud
excerpt: Integrate Message Panel with Atlassian Rovo for AI-powered analysis
category: advanced
tags:
  - doc
  - cloud
  - rovo
  - ai
  - integration
---

{:.no_toc}
* TOC
{:toc}

## Overview

Message Panel integrates with Atlassian Rovo, allowing AI-powered agents to analyze and interact with your panel data. This integration enables intelligent automation, data analysis, and enhanced decision-making capabilities.

**Key Features**:
- **Instruction-Driven Analysis** - Define analysis workflows in panel messages that Rovo agents execute
- **Recursive Queries** - Automatically analyze linked issues across multiple levels
- **Structured Data Access** - Retrieve issue data, custom fields, and relationships

## What is Rovo Integration?

Atlassian Rovo is an AI-powered platform that helps teams work smarter with intelligent agents and automation. Message Panel provides skills that Rovo agents can use to retrieve and analyze panel information from any Jira issue.

### Key Benefits

- **AI-Powered Analysis** - Let Rovo agents analyze panel data and provide insights
- **Intelligent Automation** - Automate workflows based on panel information
- **Natural Language Queries** - Ask questions about panel data in plain language
- **Context-Aware Responses** - Agents understand panel structure and custom fields
- **Multi-Level Analysis** - Build dependency trees and analyze impact chains

---

## Message Panel Assistant

The Message Panel Assistant is an AI-powered tool built into the admin settings. It helps you create and update panel configurations by generating templates with issue variables, loops, and conditions based on your natural language requests.

![Message Panel Assistant](/uploads/message-field-cloud/configuration/message-panel-assistant.png)

**How to use:**
1. Open Message Panel Settings in Jira admin
2. Click the Assistant icon to open the AI panel
3. Describe what template you need in plain language
4. Review the generated configuration
5. Apply changes directly to your panel

---

## Message Panel Agent

Message Panel includes a pre-built Rovo agent ready to use.

> **Note**: The agent may take up to 24 hours to appear after installation.

![Message Panel Agent](/uploads/message-field-cloud/configuration/rovo%20agent%20Message%20Panel%20Agent.png)

### Agent Details

**Name**: Message Panel Agent

**Description**: Provides access to Message Panel data: custom messages, instructions, work item fields, and related items via link types or JQL queries. Supports nested queries for analysis.

### Conversation Starters

- "Analyze linked issues for this configuration"
- "Show me the relationship tree for this issue"
- "What are the dependencies for this issue?"
- "Analyze impact of changes to this issue"
- "Find all blocked issues in this chain"
- "Show me the complete issue hierarchy"

### Agent Behavior

The agent is configured to:

1. **Execute user requests** - Perform specific analysis or tasks
2. **Follow panel instructions** - Execute instructions from panel description
3. **Render messages** - Convert panel message to readable format
4. **Analyze linked issues** - Use linked issue data for analysis
5. **Utilize field values** - Leverage display field values for insights

### Using Panel Instructions

You can define analysis workflows in the panel **Description** field:

```
When analyzing this panel:
1. List all blocking issues with their status
2. Calculate total story points across linked issues
3. Identify any overdue items
4. Recommend which blockers to prioritize
```

The agent reads and follows these instructions when retrieving the panel.

---

## Example Use Cases

### Epic Progress Tracking

**Panel Configuration**:
- Name: "Epic Progress"
- Data Source: JQL
- JQL: {% raw %}`"Epic Link" = {{ issue.key }}`{% endraw %}
- Description: "Calculate completion percentage. Identify blocked stories. Recommend next actions."

**Agent Query**: "What's the progress on EPIC-100?"

The agent will retrieve the panel, read your instructions, analyze the linked stories, and provide a formatted progress report.

### Dependency Impact Analysis

**Scenario**: Before making breaking changes, understand the impact.

**Agent Query**: "What would be impacted if I change CORE-50?"

The agent will analyze dependencies, build a relationship tree, identify blocked issues, and provide a comprehensive impact report.

### Circular Dependency Detection

**Scenario**: Find and fix circular dependencies causing issues.

**Agent Query**: "Are there any circular dependencies involving PROJ-100?"

The agent will detect cycles, explain each cycle path, and recommend which links to remove.

---

## Best Practices

### Effective Panel Instructions

Put clear instructions in panel **Description**:

```
Analyze the linked issues in this panel:
1. Group by status category
2. Calculate total story points
3. Identify items past due date
4. Flag issues without assignee
5. Recommend which items to prioritize
```

### Performance Tips

1. **Specify panel name** - Faster than fetching all panels
2. **Target specific relationships** - Filter by link types when possible
3. **Narrow scope** - Use project filters for large organizations

### Security

- Agents respect Jira permissions
- Only authorized data is retrieved
- Panel instructions are visible to users with panel access

---

## Troubleshooting

### Skill Not Appearing

**Solutions**:
- Ensure Message Panel app is installed
- Check admin permissions
- Wait up to 24 hours after installation
- Refresh the skills list

### No Data Returned

**Solutions**:
- Verify issue key exists and is accessible
- Check panel is configured for the project/issue type
- Ensure user has permission to view the issue
- Confirm panel module is enabled

### Panel Instructions Not Followed

**Solutions**:
- Ensure instructions are in the Description field (not Message)
- Make instructions clear and actionable
- Test with simple instructions first
- Add explicit "When analyzing this panel:" prefix

### Actions Timing Out

**Solutions**:
- Reduce depth for tree operations
- Add link type filters
- Use project filters to narrow scope
- Break large analyses into multiple queries

---

## Next Steps

- [Configuration Basics](configuration-basics) - Set up panels for Rovo analysis
- [Templates](templates) - Create dynamic panel content
- [Data Sources](data-sources) - Configure JQL and linked issues
- [Atlassian Rovo Documentation](https://www.atlassian.com/software/rovo) - Learn more about Rovo

## Support

For questions about Rovo integration:
- [Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals) - Get help
- [Atlassian Community](https://community.atlassian.com/) - Ask the community
- [Rovo Documentation](https://www.atlassian.com/software/rovo/resources) - Rovo resources
