---
title: Delegation
key: message-field
---

**Delegation** allows Jira administrators to grant specific users, groups, or project roles the ability to modify Message Field configurations without requiring full Jira administration privileges. This feature enables distributed management of message content while maintaining security and control.

## Overview

The delegation feature provides a secure way to:
- **Empower project teams** to manage their own message content
- **Maintain administrative control** over delegation permissions
- **Restrict access** to specific Message Field configurations
- **Preserve security** by limiting scope to delegated configurations only

## How Delegation Works

### Administrator Setup
1. **Jira administrators** configure delegation settings in Message Field configurations
2. **Delegation permissions** are set per field configuration (context-specific)
3. **Delegated users** gain access only to the specific configurations they've been granted

### Delegated User Access
- Delegated users access Message Field configurations through **project-specific URLs**
- The link is also available on the **project administration page**
- They can modify message content, conditions, and display settings
- Administrative settings (delegation permissions, user conditions) remain read-only
- Changes are applied only to the configurations they have access to

## Setting Up Delegation

### For Administrators

To enable delegation for a Message Field configuration:

1. Navigate to the **Message Field configuration** page
2. Scroll to the **Delegation** section
3. Enable **"Delegate configuration"** checkbox
4. Configure delegation permissions:

#### Delegate to Project Roles
- Select project roles that can modify this configuration
- Roles are context-specific to the projects where the field is used
- Common roles: *Administrators*, *Developers*, *Project Managers*

#### Delegate to Groups  
- Choose Jira user groups with configuration access
- Groups work across all projects where the configuration applies
- Useful for cross-project teams

#### Delegate to Users
- Grant access to specific individual users
- Most granular control option
- Ideal for temporary access or specific use cases

### Best Practices for Delegation Setup

#### Security Considerations
- **Principle of least privilege**: Grant only necessary access
- **Regular review**: Periodically audit delegation permissions
- **Project context**: Consider which projects use each configuration

#### Organizational Alignment  
- **Role-based delegation**: Align with existing project role structure
- **Team boundaries**: Respect organizational team boundaries
- **Documentation**: Maintain records of delegation decisions

## Accessing Delegated Configurations

### For Delegated Users

Delegated users access configurations through project-specific URLs:

**URL Format:**
```
https://your-jira-instance.com/secure/jiraDelegatedMessageFieldConfiguration!default.jspa?projectKey=PROJECT_KEY&fieldConfigId=CONFIG_ID
```

### Navigation Methods

#### Through Project Context
1. Navigate to a project where you have delegated access
2. Access the delegated configuration interface
3. Select the Message Field configuration to modify

#### Direct Access
- Use bookmarked URLs for frequently accessed configurations
- URLs are project-specific and secure

## Delegated User Interface

### Available Settings
Delegated users can modify:
- **Message content** (title, body, message type)
- **Display settings** (view version, show as flag)
- **Conditions** (JQL, statuses, screens, linked issues)
- **JavaScript code** (if applicable)
- **Publishing schedule** (start/stop dates)

### Restricted Settings
Delegated users **cannot** modify:
- **Delegation permissions** (who else has access)
- **User visibility conditions** (view for settings)
- **Administrative settings**

### Global Configuration Warnings

When editing global configurations, delegated users see warning messages:

⚠️ **Warning**: "This field has a global configuration. The message will be changed not only in this project but also in all other projects where it is used."

⚠️ **Advisory**: "If you are unsure, please consult your Jira administrator."

## Permission Model

### Administrative Permissions
- **Jira System Administrators**: Full access to all features including delegation setup
- **Jira Administrators**: Full access to all features including delegation setup

### Delegated Permissions
- **Project Administrators**: Can access delegated configurations in their projects
- **Delegated Roles**: Access based on project role assignments
- **Delegated Groups**: Access based on Jira group membership  
- **Delegated Users**: Individual user access grants

### Permission Validation
- All access is validated in real-time
- Project context is enforced for security
- Invalid access attempts are blocked with security exceptions

## Use Cases

### Project-Specific Messages
- **Release notifications** managed by development teams
- **Process reminders** updated by project managers  
- **Status-specific guidance** maintained by workflow owners

### Organizational Efficiency
- **Reduced admin overhead** by distributing configuration tasks
- **Faster updates** without waiting for administrator availability
- **Domain expertise** leveraged from project teams


## Troubleshooting

### Common Issues

#### Access Denied
**Problem**: Delegated user cannot access configuration
**Solutions**:
- Verify user has correct project role/group membership
- Check that delegation is enabled for the specific configuration
- Ensure user is accessing the correct project context

#### Global Configuration Concerns
**Problem**: User unsure about global configuration impact
**Solutions**:
- Consult with Jira administrator before making changes
- Review project list where configuration applies
- Consider creating project-specific configurations if needed

#### Permission Changes
**Problem**: Previously delegated user loses access
**Solutions**:
- Check for project role or group membership changes
- Verify delegation settings haven't been modified
- Contact administrator to restore access

The delegation feature strikes a balance between administrative control and operational efficiency, enabling organizations to scale Message Field management across their teams while maintaining security and governance standards.