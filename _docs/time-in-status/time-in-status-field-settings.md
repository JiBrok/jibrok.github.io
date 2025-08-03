---
title: Time in status - field configuration
key: time-in-status
excerpt: Comprehensive guide to configuring Time in Status fields including status tracking, calendars, display formats, visibility controls, and performance settings.
category: field-configuration
tags: [doc, server, datacenter, time-tracking, time-in-status, timer, stopwatch, business-calendar, jql-functions, reporting, sla-tracking, performance-optimization, rest-api, java-api, worklog, field-panels, export, eazybi-integration]
---

1. Create new custom field with type 'Time in status field' and set issue screens.<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field.webp" target="_blank">
<img src="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field.webp" alt="time-in-status-field screenshot" style="width:50%" loading="lazy"></a></p>

2. After create open field config.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-config.webp" target="_blank">
<img src="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-config.webp" alt="time-in-status-field-config screenshot" style="width:50%" loading="lazy"></a></p>
3. Select field context and click 'Edit Time in status field'<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-config2.webp" target="_blank">
<img src="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-config2.webp" alt="time-in-status-field-config2 screenshot" style="width:50%" loading="lazy"></a></p>

[//]: # (All settings:<br>)
[//]: # (<p style="text-align: center;"><a href="/uploads/time-in-status/about-fields/time-in-status-config.webp" target="_blank">
<img src="/uploads/time-in-status/about-fields/time-in-status-config.webp" alt="time-in-status-config screenshot" style="width:100%;" loading="lazy"></a></p>)

## General Settings

### Status Tracking
This setting determines how time is calculated for an issue's statuses. You have the following options:

- Time spent in specified statuses: Shows the duration the issue has remained in selected statuses. It provides information on the accumulated time in those specific statuses.
- Time spent in current status: Displays the duration the issue has stayed in its current status. The field automatically updates whenever the status changes.
- Time spent in statuses from corresponding categories: Tracks the time the issue has spent in statuses belonging to selected categories. It allows monitoring the accumulated time in categorized statuses.

### Calculate Time in Statuses
This field shows the duration of time the issue has spent in the selected status or statuses.

### Calculate Status Categories
If left empty, it calculates the time spent in the current status. Alternatively, you can select status categories to calculate the time spent in statuses belonging to those categories.

### Calculate Time After Last Move
This field determines how time is calculated for common statuses when an issue is moved between projects. You have two options:

- Yes: Calculates the total time spent in common statuses across all projects.
- No: Calculates only the time spent in common statuses after the last project change.

### Time Calculation for Repeated Status Transitions
For situations where an issue transitions to the same status multiple times, this field allows you to specify how the time should be counted. You have the following options:

- Calculate time for all transitions to selected statuses: Considers the cumulative time for every transition to the selected statuses, including repeated entries.
- Calculate the time of the first stay in the statuses only: Only accounts for the time spent during the initial occurrence of the issue in the selected statuses. Subsequent entries are excluded.
- Calculate time for last transitions to selected statuses only: Calculates the time only for the most recent transition to the selected statuses, ignoring previous entries.

### Average Duration per Transition
This field calculates the average time by dividing the total time spent in the specified statuses by the number of transitions made to those statuses.

## Calendar

### Work Calendar
Determines how time is calculated according to working hours. You have the following options:

- All Calendars: Time is calculated based on working hours defined in [all calendars](/docs/time-in-status/work-calendar/).
- 24x7: Considers all hours as working hours without any days off.

### Calendar Field
Allows you to choose the calendar field to use. The selected field's calendar will be prioritized. If the issue calendar field is empty, the configuration calendar will be used.

### Calculation Start Date Time
Sets the reference point for all calculations. Any time prior to this date is considered non-working. You can configure this date in the calendar settings.

## Field View

### Field Display Format
Choose how to display the calculated time in the field. You have the following options:

- Total time in statuses: Displays the total time spent in the selected statuses.
- Table status-time: Shows a list of selected statuses and the time spent in each of them.
- Custom template: Allows using a user-configured display template.

### Time Value Format
Select the format in which the value will be displayed. This format determines how the time value appears. Note that the ID value will not be displayed, and the format may vary during exporting or when used in third-party applications. Refer to the provided "Time formats" link for more information.

### Icon Display in Field
Allows displaying an icon in the field based on certain conditions.

## Panel View

<p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-panel-demo.webp" target="_blank">
<img src="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-panel-demo.webp" alt="time-in-status-field-panel-demo screenshot" style="width:200px" loading="lazy"></a></p>

### Display in Panel
Determines whether to display the calculated time in a panel instead of adding a separate field to the issue view screen. Here's some information about it:

- When enabled, the calculated time will be shown in the panel, eliminating the need for an additional field.
- Panel settings can be configured in the Field Panels config page.
- Selecting "Yes" will show the calculated value in the panel.
- The panel can display data from various fields and will be customized and displayed in the task if there is at least one value to show.

### Display in Agile Board Panel
Configures the display of calculated values in a separate panel when viewing an issue on Agile boards. This setting is specific to each board and allows customization of how the calculated value is shown.

### Panel Display Format
Choose the display format for the calculated time in the panel. You have the following options:

- Total time in statuses: Shows the total time spent in the selected statuses.
- Table status-time: Displays a list of the selected statuses and the corresponding time spent in each of them.
- Custom template: Allows using a custom template for displaying the calculated time in the panel.

### Panel Time Value Format
Select the format in which the value will be displayed in the panel. This format determines how the time value appears. Note that the ID value will not be displayed, and the format may vary when exporting the field value or when used in third-party applications. Refer to the provided "Time formats" link for more information.

### Icon Display in Panel
Allows displaying an icon in the panel based on certain conditions.

## Common View

### Display Empty Value
Determines whether to display an empty value. An empty value is defined as null, 0, or any value smaller than the minimum allowed for the chosen display format. You have the following options:

- Yes: Displays an empty value if there is no data or if the calculated time is zero.
- No: Does not display an empty value.

### Status Sort Criteria
Specifies the criteria for sorting statuses when they are displayed in tabular format or custom templates.

### Share Parent Value with Subtasks
Enables sharing the calculated time value between the task and its subtasks.

## Visibility Conditions
These settings allow controlling the visibility of the "Time in Status" field. By default, it is visible to all users with access to the issue. Additional options are available to further limit the display of values. Jira Administrators always have visibility of the value.

### Value Display JQL Filter
Defines additional criteria to determine which tasks should display values. Tasks that do not meet this JQL condition will not show the values but will still be counted.

### Visible to Users in Roles
Users assigned to the specified roles will be able to see the values when viewing the task.

### Visible to Users in Groups
Users belonging to the specified groups will be able to see the values when viewing the task.

### Visible to Specific Users
Selected users will be able to see the values when viewing the task.

### Visible to Anonymous Users
Determines whether anonymous users with access to the task can view the values. You have the following options:

- Yes: All users (logged in and anonymous) with access to the task can view and sort the values in real-time, regardless of the above restrictions.
- No: Anonymous users with access to the task cannot sort the values in real-time.

## Performance
Sorting in JQL is based on real-time data, which may impact execution time and server resources. It is recommended to use the field for display purposes only. Calculations for sorting will be performed only for specified users. Access to the field is also required for exporting in certain plugins.

### Enable Cache
Enabling the cache feature temporarily stores the calculated time results for faster subsequent data requests. The displayed time will be accurate to the minute.

### Role-Based Access
Users assigned to the specified roles will have the ability to sort issues in JQL based on real-time calculated values.

### Group-Based Access
Users belonging to the specified groups will have the ability to sort issues in JQL based on real-time calculated values.

### User-Based Access
Selected users will have the ability to sort issues in JQL based on real-time calculated values.

### Anonymous User Access
Determines whether anonymous users with access to the issue can sort issues in real-time. You have the following options:

- Yes: All users (logged in and anonymous) with access to the issue can sort issues in JQL based on real-time calculated data, regardless of the above restrictions.
- No: Anonymous users with access to the issue cannot sort issues in real-time.

## Export

### Export Format
Specifies the format used for exporting the field. The format choice may affect the value representation and the value.toString() function in scripts. Time formats are available for export, but note that any values in parentheses (ID) will not be displayed. Refer to the provided "Time formats" link for more information.

### Export Empty Value
Determines how empty values are handled during export. An empty value is considered null, 0, or any value smaller than the minimum allowed for the chosen display format. You have the following options:

- Yes: An empty value will be included in the export if there is no data or if the calculated time is zero.
- No: Empty values will not be exported.

### Value for Gadget Statistics
Specifies the value used for gathering statistics in gadgets based on this field. If you need statistics for two values simultaneously, you can use an additional custom field called "JBCF:Time in Status Helper - Statistic".

### Time Ranges
Defines the boundaries for time ranges used for grouping values. Ranges are structured as follows: [< 1min], [1min - 10min], [10min - 1h], [1h <]. These ranges help group values for statistics.

### Extra Actions
Provides additional actions such as links to export field configuration, documentation for REST, and deleting the configuration.

## Reindex ## 
If you have changed the following fields, then for the search to work correctly, you need to run the reindex.

- Status Tracking
- Calculate Time in Statuses
- Calculate Status Categories
- Work Calendar
- Calendar Field
- Calculation Start Date Time