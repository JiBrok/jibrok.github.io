---
title: All Message fields settings
key: message-field
excerpt: "Comprehensive settings overview for all Message fields including global configurations, permissions, and field management options."
---

The **All Message Fields Settings** page provides a comprehensive overview and management interface for all Message Field configurations across your Jira instance. This powerful tool allows administrators to view, filter, and manage multiple Message Field configurations from a single interface.

## Accessing All Message Fields Settings

To access the All Message Fields Settings page:

1. Navigate to **Administration** (<img src="/uploads/atlassian/cog_icon.webp" style="width:20px" loading="lazy"> in the top panel) → **Manage apps**
2. In the left menu, find the **Message Field** section 
3. Click **All Message fields settings**

<a href="/uploads/message-field/settings-for-all-message-fields.webp"><img src="/uploads/message-field/settings-for-all-message-fields.webp" style="width:100%;" loading="lazy"></a>

## Main Features

### Column Visibility Settings

Click **Show settings** to customize which columns are displayed in the overview table. The interface provides toggle switches organized into five main categories:

#### General Settings
- **Config Link**: Direct links to field configuration pages
- **Field Name**: Message Field names with IDs and links to field management
- **Context Name**: Field context names with management links
- **Screens with Field**: Lists all screens containing each field
- **Project**: Project associations (global or specific projects)
- **Issue Type**: Issue type contexts (all or specific types)
- **Title**: Message titles configured for each field
- **Use Template**: Whether Velocity templates are enabled
- **Body**: Message content/body text
- **Message Type**: Visual message type indicators (info, warning, error, etc.)
- **Show as Flag**: Whether messages display as flags or banners
- **View Version**: Display version and positioning settings
- **Selectors**: CSS selectors for different page contexts

#### Conditions
- **JQL Condition**: JQL queries that control message visibility
- **Screens**: Screen assignments and restrictions
- **Statuses**: Status conditions for displaying messages
- **Don't Show Statuses**: Status exclusions
- **Link**: Linked issue requirements
- **Link Types**: Specific link type conditions
- **Linked Statuses**: Status conditions for linked issues
- **Start**: Publication start dates/times
- **Stop**: Expiration dates/times

#### User Conditions
- **View For**: User visibility settings (all users, specific conditions)
- **Groups**: User groups that can see messages
- **Roles**: Project roles that can see messages
- **Don't Show Groups**: User group exclusions
- **Don't Show Roles**: Project role exclusions

#### JavaScript
- **Code**: Custom JavaScript code for each configuration
- **Contexts**: JavaScript execution contexts
- **Run JS on Update**: Whether JavaScript runs on issue updates

#### Delegated Settings
- **Is Delegated**: Whether configuration management is delegated
- **Delegated Roles**: Project roles with configuration permissions
- **Delegated Groups**: User groups with configuration permissions
- **Delegated Users**: Individual users with configuration permissions

### Filtering Options

#### Filter by Fields
- **Select Fields**: Choose specific Message Fields to display
- Leave empty to show configurations for all Message Fields
- Multi-select dropdown with field names and IDs

#### Filter by Screens
- **Select Screens**: Filter configurations by screen associations
- Option to show fields "Without Screens" to identify unused configurations
- Multi-select dropdown with screen names and IDs

### Smart Data Display

#### Field Information
- **Quick Links**: Direct access to field configuration and context management pages
- **Visual Indicators**: Message type previews with actual styling
- **Screen Lists**: Complete lists of screens where fields appear
- **Project Details**: Project names, keys, and avatars for easy identification

#### Context Details
- **Global vs. Project-Specific**: Clear indication of configuration scope
- **Issue Type Icons**: Visual representation of applicable issue types
- **Status Badges**: Color-coded status indicators matching Jira's native styling

#### Advanced Features
- **URL Parameters**: Filters are preserved in URLs for bookmarking and sharing
- **Pagination**: Large datasets are split into manageable pages (20 rows per page)
- **Responsive Layout**: Table adapts to different screen sizes
- **License Validation**: Automatic license checking with error messages

## Usage Scenarios

### Configuration Audit
- Review all Message Field configurations across your instance
- Identify fields without screen associations
- Find unused or redundant configurations
- Verify consistent settings across projects

### Bulk Management
- Compare settings across multiple fields
- Identify configuration patterns and standards
- Plan configuration changes across multiple contexts

### Troubleshooting
- Quickly locate specific field configurations
- Verify JQL conditions and their complexity
- Check delegation settings and permissions
- Review JavaScript implementations

### Documentation and Compliance
- Export configuration details for documentation
- Audit user access and permission settings
- Review message content for compliance

## Best Practices

### Column Selection
- Enable only necessary columns to avoid information overload
- Your column preferences are automatically saved
- Start with general settings, then add specific categories as needed

### Filtering Strategy
- Use field filtering to focus on specific configurations
- Combine field and screen filters for targeted views
- Bookmark frequently used filter combinations

### Regular Reviews
- Periodically review all configurations for consistency
- Check for fields without screen associations
- Verify delegation settings align with current team structure
- Monitor JavaScript code for performance and maintainability

## Technical Notes

### Performance Considerations
- Large instances with many configurations may take longer to load
- Filtering helps improve performance by reducing displayed data
- Column visibility settings affect rendering speed

### Data Refresh
- Data is loaded fresh each time the page is accessed
- Changes made in individual field configurations appear immediately
- Filter selections persist across browser sessions

### Integration Features
- Direct links to native Jira configuration pages
- Seamless navigation between overview and detailed settings
- URL parameter support for deep linking and bookmarking

The All Message Fields Settings interface provides administrators with complete visibility and control over their Message Field configurations, making it easier to maintain consistency and manage complex deployments across large Jira instances.