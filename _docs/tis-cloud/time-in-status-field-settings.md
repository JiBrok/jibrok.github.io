---
title: Time in Status - Field Configuration
key: tis-cloud
excerpt: "Configure Time in Status field settings including status selection, display modes, time formats, and advanced options."
category: field-configuration
tags: [doc, cloud, time-in-status, field-creation, status-tracking, business-calendar, jql-functions, dashboard-gadgets]
---

All settings:<br>
<p style="text-align: center;"><a href="/uploads/tis-cloud/create-field.webp" target="_blank">
<img src="/uploads/tis-cloud/create-field.webp" alt="create-field screenshot" style="width:100%;" loading="lazy"></a></p>

### General settings ### 

1. Name - The name is needed for easy navigation in settings. A custom field of the same name will be created. After renaming, a new custom field will be created.
2. JQL(context) - This is analogous to the context for custom fields. Using JQL, issues are set for which you need to track the time spent in the following statuses.
3. Statuses - If the issue was or is in the indicated status, then the field will calculate the time spent in this status.
4. Work calendar - If you need to calculate only working hours, you can connect a work calendar.
5. [Time format](/tis-cloud/time-formats) - Format for outputting time in a field. If you need a new format, please contact support.
6. Display setting - Select an option to display in the field. Below you can customize the calculation of statistical values. 
    <p style="text-align: center;"><a href="/uploads/tis-cloud/display-settings.webp" target="_blank">
<img src="/uploads/tis-cloud/display-settings.webp" alt="Field display configuration options" style="width:100%;" loading="lazy"></a></p>
  
7. Is active - For a disabled setting, all data updates will be disabled. Once the setting is enabled, the data in the fields will be updated automatically.
8. Use rounding for display - The time will be rounded when displayed in the field. 21:37 → 21:30 (uses intervals)

### Statistic settings ###

The field, in addition to its main value, also calculates additional values: average time, maximum and minimum value, various percentiles. These values are calculated for each context separately. To calculate the default values, data from all issues will be used (for each context separately). In this section, you can slightly change the selection of issues for calculating statistical values.
The calculated values are common for all issues from the context (contexts are indicated above).
The calculated values are used:
* When displaying a value - if the corresponding option is selected in the "Display settings" section
* In JQL search. For example, you can find all issues that have a longer than average time. (JQL examples on the start page)
* In the dashboard gadget, to display statistics for the field and context specified in the gadget settings.
* In the gadget, you can also select other settings for display, which will be calculated regardless of the field settings.

The data will be recalculated at least once a day. (Beta) Updates will occur more frequently in the future. Updating the data in the fields will also take some time.

* Limit
  * Issues from context are used to calculate values. You can limit the number of issues used to calculate the values. The limit indicates how much the issues from the context to take to calculate the values, taking into account sorting by creation date (ORDER BY created). The first N issues are used. If 0 is specified then all issues are used.
* Only resolved (resolution is not empty)
  * If this option is enabled, then only issues with a set resolution will be used for calculating values. If the option is disabled, then all issues from the context will be used.
* Created last days (created > startOfDay(-N))
  * Issues from context are used to calculate values. You can limit the selection of issues by creation date. Only issues created in the last N days will be used. If 0 is specified then this filter is ignored.
* Resolved last days (resolved > startOfDay(-N))
  * Issues from context are used to calculate values. You can limit the selection of issues by the date the request was resolved. Only issues solved in the last N days will be used. If 0 is specified then this filter is ignored.


Field view example: 
<p style="text-align: center;"><a href="/uploads/tis-cloud/field-view-average-time-example.webp" target="_blank">
<img src="/uploads/tis-cloud/field-view-average-time-example.webp" alt="field-view-average-time-example screenshot" style="width:100%;" loading="lazy"></a></p>

##### JQL for statistic #####
On the start page, we have added examples of JQL queries for working with statistics. Functions work according to the logic of comparing the time value in the task with the value of the specified function. (Each function value is calculated for each context separately)

<p style="text-align: center;"><a href="/uploads/tis-cloud/jql-statistic-examples.webp" target="_blank">
<img src="/uploads/tis-cloud/jql-statistic-examples.webp" alt="jql-statistic-examples screenshot" style="width:100%;" loading="lazy"></a></p>

[More about time statistic](/Time-statistic(Time-in-status-Cloud)/)

### Modules settings ### 
You can disable redundant modules to free the module quota. Free quotas can be used to create other fields and panels.

* Issue Property
    * The main module.
    * Requires 1 quota of modules.
    * Stores data and provides a search engine (JQL). Doesn't require other modules to work, but it is needed for other modules to work.
    * With the option disabled: nothing will work. The settings will be saved.
    * With the option enabled: the data will be updated and search through properties will be available.
* Create field
    * Requires 1 quota of modules.
    * When this option is enabled, creates a custom field. The field can be added to screens, dashboards, reports. The field is available for export.
    * The field creates search functions for easy searching in JQL.
    * When disabled, deletes the existing custom field.
* Fast update data after create issue
    * Requires 1 quota of modules.
    * Provides fast data refresh after creating a issue. If the option is disabled, the data will be updated with delays.
* Fast update data after update issue
    * Requires 1 quota of modules.
    * Provides fast data refresh after update a issue. If the option is disabled, the data will be updated with delays.