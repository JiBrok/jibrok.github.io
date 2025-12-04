---
title: Rovo Integration
key: message-field-cloud
excerpt: "Integrate Message Panel data with Atlassian Rovo agents for intelligent analysis and automation."
category: advanced-features
tags: [doc, cloud, rovo, ai, agents, integration, automation]
---

{:.no_toc}
* TOC
{:toc}

## Overview

Message Panel seamlessly integrates with Atlassian Rovo, allowing you to leverage AI-powered agents to analyze and interact with your panel data. This integration enables intelligent automation, data analysis, and enhanced decision-making capabilities.

## What is Rovo Integration?

Atlassian Rovo is an AI-powered platform that helps teams work smarter with intelligent agents and automation. Message Panel provides a dedicated skill that Rovo agents can use to retrieve and analyze panel information from any Jira issue.

### Key Benefits

- **AI-Powered Analysis** - Let Rovo agents analyze panel data and provide insights
- **Intelligent Automation** - Automate workflows based on panel information
- **Natural Language Queries** - Ask questions about panel data in plain language
- **Context-Aware Responses** - Agents understand panel structure and custom fields
- **Enhanced Decision Making** - Get AI-assisted recommendations based on panel data

## How It Works

The Message Panel Rovo integration provides a skill called **"Analyze Message Panel"** that agents can use to:

1. **Retrieve Panel Data** - Access panel information for any Jira issue
2. **Parse Custom Fields** - Understand and extract custom field values
3. **Analyze Relationships** - Process linked issues and their connections
4. **Generate Insights** - Provide AI-powered analysis and recommendations

When you add the "Analyze Message Panel" skill to your Rovo agent, it can:
- Fetch message panel configurations
- Retrieve issue data from panels
- Analyze linked issues
- Answer questions about panel content
- Make intelligent recommendations

## Adding the Skill to Your Rovo Agent

![Add Message Panel Skill to Rovo Agent](/uploads/message-field-cloud/configuration/rovo%20action%20Analyze%20Message%20Panel.png)

To enable Message Panel analysis in your Rovo agent:

1. **Open Agent Configuration** - Go to your Rovo agent settings
2. **Add Skills** - Click "Add skills" button
3. **Search for Skill** - Type "Analyze Message Panel" in the search box
4. **Select the Skill** - Click on the "Analyze Message Panel" skill card
5. **Configure** - Add instructions on how the agent should use this skill

The skill will appear under "By Atlassian" → "Jira" in the skills selection dialog.

### Skill Details

**Skill Name**: Analyze Message Panel

**Description**: Retrieves Message Panel information for a Jira issue, including custom field data, panel configurations, and linked issue details.

**Capabilities**:
- Access panel data for specific issue keys
- Retrieve custom field values
- Analyze linked issues
- Understand panel templates and configurations

## Example Use Cases

### 1. Automated Issue Analysis

**Scenario**: Automatically analyze blockers and dependencies when an issue is updated.

**Agent Instructions**:
```
When an issue is mentioned, use the "Analyze Message Panel" skill to:
1. Retrieve panel data for the issue
2. Identify any blocking issues
3. Analyze priority and status
4. Suggest next actions
```

### 2. Smart Reporting

**Scenario**: Generate intelligent reports based on panel data.

**Agent Instructions**:
```
Use "Analyze Message Panel" to:
1. Collect data from multiple issues
2. Identify patterns and trends
3. Create summary reports
4. Highlight critical issues
```

### 3. Dependency Tracking

**Scenario**: Track and alert on issue dependencies.

**Agent Instructions**:
```
For each issue in the epic, use "Analyze Message Panel" to:
1. Check linked issues
2. Identify unresolved dependencies
3. Flag potential blockers
4. Recommend resolution order
```

## Agent Configuration Examples

### Basic Panel Analyzer

```
You are a Jira panel analyzer. When users ask about issue details:

1. Use "Analyze Message Panel" skill with the issue key
2. Summarize the panel information
3. Highlight important fields
4. Explain any linked issues

Always provide clear, concise answers based on the panel data.
```

### Blocker Detective

```
You are a blocker detection agent. Your job is to:

1. Use "Analyze Message Panel" to retrieve issue data
2. Identify blocking and blocked issues
3. Assess impact and priority
4. Recommend actions to resolve blockers

Focus on actionable insights and clear communication.
```

### Status Reporter

```
You are a status reporting agent. When asked about project status:

1. Use "Analyze Message Panel" for relevant issues
2. Gather status, priority, and assignment data
3. Identify trends and patterns
4. Generate concise status summaries

Present information in a clear, organized format.
```

## Best Practices

### Effective Agent Instructions

1. **Be Specific** - Clearly define when and how to use the skill
2. **Set Context** - Explain what information to prioritize
3. **Define Output** - Specify how to present results
4. **Handle Errors** - Include instructions for missing or incomplete data

### Optimizing Performance

1. **Target Specific Issues** - Use issue keys when possible
2. **Filter Relevant Data** - Focus on specific fields or panels
3. **Batch Requests** - Group related queries
4. **Cache Results** - Reuse data when analyzing multiple aspects

### Security Considerations

1. **Permissions** - Agents respect Jira permissions
2. **Data Access** - Only authorized data is retrieved
3. **Audit Trail** - Agent actions are logged
4. **Privacy** - Sensitive data handling follows Jira policies

## Troubleshooting

### Skill Not Appearing

**Problem**: "Analyze Message Panel" skill doesn't show in the skills list.

**Solutions**:
- Ensure Message Panel app is installed
- Check that you have admin permissions
- Verify app is enabled in your Jira instance
- Try refreshing the skills list

### No Data Returned

**Problem**: Agent cannot retrieve panel data.

**Solutions**:
- Verify the issue key exists
- Check panel is configured for that issue
- Ensure user has permission to view the issue
- Confirm panel module is enabled

### Incomplete Information

**Problem**: Some fields or data are missing.

**Solutions**:
- Check panel field configuration
- Verify custom fields are accessible
- Ensure linked issues are visible
- Review panel context filters

## Next Steps

- [Configuration Guide](/docs/message-field-cloud/configuration/) - Set up panels for Rovo analysis
- [Dynamic Templates](/docs/message-field-cloud/dynamic-templates/) - Create rich panel content
- [Modules Guide](/docs/message-field-cloud/modules/) - Understand panel display locations
- [Atlassian Rovo Documentation](https://www.atlassian.com/software/rovo) - Learn more about Rovo

## Support

For questions about Rovo integration:
- [Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals) - Get help
- [Atlassian Community](https://community.atlassian.com/) - Ask the community
- [Rovo Documentation](https://www.atlassian.com/software/rovo/resources) - Rovo resources
