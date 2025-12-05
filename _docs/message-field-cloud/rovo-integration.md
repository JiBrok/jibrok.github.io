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

**Key Features**:
- **Instruction-Driven Analysis** - Define analysis workflows in panel messages that Rovo agents execute automatically
- **Recursive Queries** - Automatically analyze linked issues across multiple levels, building complete dependency graphs
- **Structured Data Access** - Retrieve work item data, custom fields, and relationships in a format optimized for AI analysis

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
- **Execute instructions/prompts** defined in panel message templates
- Analyze linked issues with **recursive/nested queries**
- Process related work items automatically
- Answer questions about panel content
- Make intelligent recommendations based on panel instructions

## Message Panel Agent

Message Panel includes a pre-built Rovo agent that's ready to use out of the box. This agent is automatically available after installing the app (note: the agent may take up to 24 hours to appear after installation).

![Message Panel Agent](/uploads/message-field-cloud/configuration/rovo%20agent%20Message%20Panel%20Agent.png)

### Agent Details

**Name**: Message Panel Agent

**Description**: Provides access to Message Panel data: custom messages, instructions, work item fields, and related items via link types or JQL queries. Supports nested queries for analysis.

**Icon**: Custom Message Panel icon

### Conversation Starters

The agent comes with predefined conversation starters to help users get started:
- "Analyze linked issues for this configuration"
- "Show me the relationship tree for this issue"
- "What are the dependencies for this issue?"
- "Analyze impact of changes to this issue"
- "Find all blocked issues in this chain"
- "Show me the complete issue hierarchy"

### Available Actions

The Message Panel Agent uses the **Analyze Message Panel** action (see the [Skill Details](#skill-details) section below for full documentation of this action).

### Agent Prompt

The agent uses the following base prompt that defines its behavior:

```
Provides access to Message Panel data: custom messages, instructions, work item fields, and related items via link types or JQL queries. Supports nested queries for analysis.

You are a specialized agent for analyzing linked issues and their relationships in Jira.

## Your primary responsibilities:
1. **Execute user requests** - Perform the specific analysis or task requested by the user
2. **Follow response guidance** - Execute any instructions provided in response.description
3. **Display panel messages** - ALWAYS render the actual HTML content from response.message as formatted text. Do NOT describe what it contains - show the actual content by converting HTML to readable markdown format
4. **Analyze linked issues** - Use response.linkedIssues data which contains related issues with pre-configured important fields for analysis
5. **Utilize field values** - Leverage response.fieldValues for key analytical insights

## Critical: HTML Message Rendering
When you receive response.message containing HTML:
- Convert HTML tags to markdown equivalents (e.g., `<strong>` to **bold**, `<em>` to *italic*, `<h1>` to # heading)
- Display the actual content, not descriptions like "Panel message includes formatting tips"
- Preserve formatting structure and readability
- Show the complete message content to the user

## Data collection workflow:
- **Required inputs**: Issue key (from user or current screen context) and config/panel name
- **API interaction**: Call getLinkedIssuesPanel action with these parameters
- **Response processing**: Handle JSON response containing linkedIssues, fieldValues, message, and description
- **Deep analysis**: If needed, make additional API calls to get detailed information for discovered issues
- **Recursive exploration**: For comprehensive analysis, call the same action with the same config for all discovered linked issues to build a relationship graph/tree of desired depth

## Context awareness:
- Extract issue key from conversation context or current Jira screen if not explicitly provided
- Use the specified config/panel name for consistent analysis scope
- Maintain context across recursive calls for building issue relationship maps

## Output format:
- Start with the rendered panel message (converted from HTML to markdown)
- Provide clear, structured analysis based on the data received
- Present insights in a readable format
- Highlight important relationships and patterns found in the linked issues
- Include visual representations of issue hierarchies when relevant

Always start by calling the getLinkedIssuesPanel action with the available issue key and config name.
```

> **Note**: The agent may not appear immediately after app installation. It can take up to 24 hours for the agent to become available in your Rovo interface.

### Using the Agent

#### Step 1: Configure Panel Description with Commands

![Panel Description with Agent Commands](/uploads/message-field-cloud/configuration/rovo%20description%20example.png)

In the panel configuration, you can add commands in the **Description** field that the agent will execute when analyzing this panel. These instructions guide the agent's analysis behavior — for example, you can specify what aspects to focus on, how to format the output, or what recommendations to provide.

**Example description:**
```
When you're asked to analyze the Panel, please say "Hello, user!" (use user name), mention today's date, and state whether there are all linked issues related to the current one being issue.
```

#### Step 2: Request Analysis from the Agent

![Chat Command Example](/uploads/message-field-cloud/configuration/rovo%20chat%20command%20example.png)

To start the analysis, send a message to the agent with the **panel name** and **issue key**. The agent will use the Analyze Message Panel action to retrieve data and execute the commands defined in the panel description.

#### Step 3: Review the Analysis Results

![Agent Response Example](/uploads/message-field-cloud/configuration/rovo%20respopnse%20example.png)

The agent returns a comprehensive analysis based on your panel configuration and the commands specified in the description. The response includes rendered panel messages, linked issue data, field values, and insights generated according to your instructions.

---

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

**Description**: Retrieves Message Panel information for a Jira issue, including custom messages, instructions, work item data, and related work items (via link types or JQL queries). Supports nested queries and returns structured data for comprehensive analysis.

**Required Parameters**:

1. **Issue Key** (`issueKey`)
   - Type: String
   - Required: Yes
   - Description: The Jira issue key to analyze (e.g., `PROJ-123`, `IP-19509`)
   - Example: `"TEST-123"`

2. **Panel Configuration Name** (`panelName`)
   - Type: String
   - Required: Yes
   - Description: The name of the message panel configuration that defines which linked issues and fields to analyze
   - Example: `"Blockers Dashboard"`, `"Epic Progress"`

**Capabilities**:
- Access panel data for specific issue keys
- **Retrieve and execute custom messages and instructions** from panel templates
- Analyze work item data and custom field values
- Query related work items via link types (e.g., "is blocked by", "relates to")
- Execute JQL queries defined in panel configurations
- **Support recursive/nested queries** for analyzing linked issues automatically
- Follow relationship chains across multiple levels
- Return structured data with comprehensive issue information

**Advanced Features**:

**Panel Instructions/Prompts**:
The panel message field can contain instructions or prompts that guide the AI agent's analysis. When Rovo retrieves panel data, it can read and execute these instructions automatically.

Example panel message:
```
Analyze the priority and status of this issue.
If any blocking issues exist, check their resolution progress.
Recommend next actions based on current state.
```

**Recursive Queries**:
The skill supports nested/recursive queries to automatically analyze linked issues. When a panel shows related work items (via link types or JQL), Rovo can:
- Retrieve the main issue data
- Automatically query each linked issue
- Analyze the linked issues recursively
- Build a complete dependency graph
- Provide comprehensive multi-level analysis

## Example Use Cases

### 1. Automated Issue Analysis

**Scenario**: Automatically analyze blockers and dependencies when an issue is updated.

**Panel Configuration**: Create a panel named "Blockers Dashboard" that shows linked issues with link type "is blocked by"

**Agent Instructions**:
```
When an issue is mentioned, use the "Analyze Message Panel" skill to:
1. Call the skill with issueKey (e.g., "PROJ-123") and panelName "Blockers Dashboard"
2. Retrieve panel data including all blocking issues
3. Identify any blocking issues and their status
4. Analyze priority and severity
5. Suggest next actions based on blocker status

Example call:
- Issue Key: "PROJ-123"
- Panel Name: "Blockers Dashboard"
```

### 2. Smart Reporting

**Scenario**: Generate intelligent reports based on panel data.

**Panel Configuration**: Create a panel named "Epic Progress" with JQL query `"Epic Link" = {{ key }}`

**Agent Instructions**:
```
Use "Analyze Message Panel" to generate reports:
1. For each epic, call the skill with:
   - Issue Key: The epic key (e.g., "EPIC-100")
   - Panel Name: "Epic Progress"
2. Collect data from all child issues
3. Identify patterns and trends (status distribution, blockers)
4. Calculate completion percentage
5. Create summary reports with key metrics
6. Highlight critical issues and risks
```

### 3. Dependency Tracking with Recursive Analysis

**Scenario**: Track and alert on issue dependencies using recursive queries.

**Panel Configuration**:
- Panel Name: "Dependencies"
- Linked Issues: Shows "is blocked by", "depends on", "relates to"
- Message Template:
  ```
  Check all blocking issues recursively.
  Identify the full dependency chain.
  Calculate total estimated effort across all dependencies.
  Flag any high-priority blockers in the chain.
  ```

**Agent Instructions**:
```
For each issue, use "Analyze Message Panel" with recursive analysis:
1. Call the skill with:
   - Issue Key: Current issue key
   - Panel Name: "Dependencies"
2. The skill will automatically:
   - Retrieve all linked issues (first level)
   - Recursively query linked issues of those issues (nested levels)
   - Build complete dependency graph
   - Execute the panel message instructions
3. Analyze the results:
   - Identify unresolved dependencies at all levels
   - Calculate total scope including nested dependencies
   - Flag potential blockers in the entire chain
   - Recommend resolution order from deepest dependencies
4. Alert if critical dependencies are not resolved at any level
```

**Result**: The agent provides a complete multi-level dependency analysis without needing multiple manual queries.

## Agent Configuration Examples

### Basic Panel Analyzer

```
You are a Jira panel analyzer. When users ask about issue details:

1. Ask the user for the issue key (e.g., "PROJ-123")
2. Ask which panel they want to analyze (or use default "Message Panel")
3. Use "Analyze Message Panel" skill with:
   - Issue Key: [provided by user]
   - Panel Name: [panel name provided or default]
4. Summarize the panel information including:
   - Custom messages and instructions
   - Work item data (status, priority, assignee, etc.)
   - Related work items from link types or JQL queries
5. Highlight important fields and values
6. Explain any linked issues and their relationships

Always provide clear, concise answers based on the panel data.

Example: When user asks "Analyze TEST-123 using Blockers Dashboard panel"
- Call skill with issueKey: "TEST-123", panelName: "Blockers Dashboard"
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

### Instruction-Driven Analyzer

```
You are an instruction-driven analysis agent that follows panel-defined prompts.

When analyzing an issue:
1. Use "Analyze Message Panel" skill with the issue key and panel name
2. **Read the panel message/instructions** - this contains specific analysis guidance
3. **Execute the instructions** provided in the panel message
4. Follow any specific directives (e.g., "check priority", "analyze blockers recursively")
5. Return results based on the panel's instructions

Example panel message you might receive:
"Analyze all linked issues recursively. Calculate total story points.
Check if any high-priority blockers exist in the dependency chain.
Recommend which issues to prioritize based on blocking relationships."

Your response should follow these instructions exactly, providing:
- Recursive analysis of all linked issues
- Total story points calculation
- List of high-priority blockers
- Prioritization recommendations

This allows panel creators to define custom analysis workflows without changing agent configuration.
```

## Best Practices

### Effective Agent Instructions

1. **Be Specific** - Clearly define when and how to use the skill
2. **Set Context** - Explain what information to prioritize
3. **Define Output** - Specify how to present results
4. **Handle Errors** - Include instructions for missing or incomplete data
5. **Leverage Panel Instructions** - Let panel messages guide analysis workflow
6. **Use Recursive Queries** - Enable automatic linked issue analysis for complex scenarios

### Using Panel Instructions Effectively

**Create Reusable Analysis Workflows**:
Instead of hardcoding analysis logic in agent instructions, define it in panel messages. This allows:
- Different panels for different analysis types
- Easy updates without changing agent configuration
- Context-specific analysis based on panel purpose

**Example Panel Message Templates**:

For Blocker Analysis:
```
Analyze all blocking issues recursively.
Check status and priority of each blocker.
Identify blockers that are also blocked (nested dependencies).
Calculate estimated time to resolve all blockers.
Flag any blockers assigned to unavailable team members.
```

For Epic Progress:
```
Calculate completion percentage of child issues.
Identify issues at risk (high priority, past due date).
Check for unassigned issues.
Analyze velocity trends based on completed issues.
Recommend which issues to focus on next.
```

### Optimizing Recursive Queries

1. **Set Appropriate Depth** - Use recursive queries for dependency chains, not flat lists
2. **Filter Early** - Configure panels to show only relevant linked issues
3. **Use Specific Link Types** - Target exact relationships (e.g., "is blocked by" vs. "relates to")
4. **Combine with JQL** - Use panel JQL filters to limit scope before recursion

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

### Panel Instructions Not Executed

**Problem**: Agent doesn't follow instructions from panel message.

**Solutions**:
- Verify panel message field contains clear instructions
- Check agent configuration mentions reading panel instructions
- Ensure instructions are actionable and specific
- Test panel message with simple, direct commands first

### Recursive Queries Too Slow

**Problem**: Recursive analysis takes too long or times out.

**Solutions**:
- Limit link types to essential relationships only
- Use JQL filters to reduce initial result set
- Consider limiting recursion depth for very large graphs
- Break analysis into multiple targeted queries
- Cache results for frequently accessed issue chains

### Recursive Queries Missing Data

**Problem**: Some linked issues not included in recursive analysis.

**Solutions**:
- Verify all required link types are configured in panel
- Check user permissions for all issues in the chain
- Ensure panel module is enabled for all relevant issue types
- Review JQL filters that might exclude linked issues

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
