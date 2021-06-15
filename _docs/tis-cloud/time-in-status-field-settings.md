---
title: Time in status - field configuration
key: tis-cloud
---

All settings:<br>
<p style="text-align: center;"><a href="/uploads/tis-cloud/create-field.png"><img src="/uploads/tis-cloud/create-field.png" style="width:100%;"></a></p>

### General settings ### 

1. Name - Name is needed for easy navigation in settings. A custom field of the same name will be created. After rename will be created new custom field.
2. JQL(context) - This is analogous to the context for custom fields. Using JQL, issues are set for which you need to track the time spent in the following statuses.
3. Statuses - if the task was or is in the indicated status, then the field will calculate the time spent in this status.
4. Work calendar - If you need to calculate only working hours, you can connect a working calendar.ld.
5. [Time format](/tis-cloud/time-formats) - format for outputting time in a field. If you need a new format, please write in support.
6. Is active - For a disabled setting, all data updates will be disabled. Once the setting is enabled, the data in the fields will be updated automatically.
7. Use rounding for display - The time will be rounded when displayed in the field. 21:37 -> 21:30 (use intervals)

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