---
title: Audit Log and Change Tracking
key: message-field
excerpt: "Track all changes to Message Field configurations with comprehensive audit logging. Monitor who made changes, when they were made, and view detailed before/after comparisons."
category: analytics-monitoring
tags: [doc, server, datacenter, messaging, audit-log, change-tracking, configuration-history, admin-monitoring, compliance]
---

The **Audit Log** page provides comprehensive tracking of all changes made to Message Field configurations across your Jira instance. This powerful monitoring tool helps administrators maintain oversight, ensure compliance, and troubleshoot configuration issues.

## Accessing Audit Log

To access the Audit Log page:

1. Navigate to **Jira Administration** > **Manage apps**
2. Find **Message Field** in the installed apps list
3. Click **Audit Log** in the Message Field section

⚠️ **Note**: Audit Log page requires Jira System Administrator or Jira Administrator permissions and a valid Message Field license.

## What is Tracked

The audit log captures all configuration changes including:

### Field Configuration Changes
- Message content modifications
- Conditional logic updates (JQL, field conditions)
- Display settings changes (colors, styles, positioning)
- Template modifications (Velocity templates, HTML/CSS)
- Visibility and permission updates

### Administrative Actions
- Field creation and deletion
- Context configuration changes
- Permission delegation modifications
- Template imports/exports

### User Information
- **Who**: User who made the change
- **When**: Exact timestamp of the modification
- **What**: Detailed description of what was changed
- **Where**: Field and context information

## Audit Log Features

### Comprehensive Change History
View all configuration changes with:
- **User Information**: Username and display name of the person who made changes
- **Timestamp**: Exact date and time of modifications
- **Change Description**: Clear description of what was modified
- **Context Details**: Which field and configuration context was affected

### Detailed Diff View
For each change, view:
- **Before/After Comparison**: Side-by-side view of old vs new values
- **Field-by-Field Changes**: Granular tracking of individual setting modifications
- **Configuration Context**: Which project, issue type, or screen was affected

### Advanced Filtering
Filter audit entries by:
- **Date Range**: Specific time periods
- **User**: Changes made by specific administrators
- **Field**: Changes to particular Message Fields
- **Change Type**: Different types of modifications
- **Project Context**: Changes affecting specific projects

### Pagination and Search
- **Paginated Results**: Navigate through large change histories efficiently
- **Search Functionality**: Find specific changes quickly
- **Sort Options**: Order by date, user, or change type
- **Export Options**: Download audit data for external analysis

## Using Audit Log for Compliance

### Security Monitoring
1. **Track Administrative Access**: Monitor who is making configuration changes
2. **Identify Unauthorized Changes**: Spot unexpected modifications quickly
3. **Compliance Reporting**: Generate reports for security audits
4. **Change Attribution**: Link all changes to specific users and timestamps

### Troubleshooting
1. **Configuration Issues**: Identify when problems were introduced
2. **Change History**: Understand the evolution of field configurations
3. **Rollback Information**: Reference previous working configurations
4. **Impact Analysis**: See what was affected by specific changes

### Best Practices
- **Regular Reviews**: Periodically review audit logs for unexpected changes
- **Documentation**: Use audit logs to document configuration evolution
- **Training**: Identify areas where users need additional training
- **Compliance**: Maintain audit trails for regulatory requirements

## Technical Details

### Data Retention
- Audit logs are stored permanently (unless manually purged)
- No automatic cleanup of historical data
- Administrators can configure retention policies if needed

### Performance
- Audit logging has minimal impact on system performance
- Change tracking operates asynchronously
- Large audit histories are paginated for optimal loading

### Security
- Only Jira Administrators can access audit logs
- All access to audit logs is itself audited
- Sensitive configuration data is handled securely
- User permissions are respected in all audit operations

## Audit Log Data Structure

### Change Records Include:
- **ID**: Unique identifier for each change
- **Timestamp**: ISO format date/time of change
- **User**: Username and display name of person making change
- **Action**: Type of change (create, update, delete)
- **Field**: Message Field that was modified
- **Context**: Configuration context affected
- **Before**: Previous configuration values
- **After**: New configuration values
- **Description**: Human-readable change description

### Change Types:
- **Field Created**: New Message Field created
- **Field Updated**: Existing field configuration modified
- **Field Deleted**: Message Field removed
- **Context Added**: New configuration context created
- **Context Modified**: Existing context updated
- **Context Removed**: Configuration context deleted
- **Permission Changed**: Delegation or access permissions modified

## Troubleshooting

### Common Issues
- **Missing Changes**: Ensure proper admin permissions are assigned
- **Slow Loading**: Large audit histories may take time to load
- **Export Issues**: Check browser download permissions

### Tips
- Use date range filters to improve performance on large datasets
- Regular exports help maintain offline records
- Consider archiving very old audit data if storage is a concern
- Use specific filters to find relevant changes quickly

The Audit Log is an essential tool for maintaining security, compliance, and operational oversight of your Message Field configurations across your Jira instance.