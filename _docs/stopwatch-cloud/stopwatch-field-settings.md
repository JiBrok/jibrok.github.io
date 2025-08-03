---
title: Stopwatch - field configuration
key: stopwatch-cloud
excerpt: "Configure Stopwatch field settings including events, display modes, time formats, calendars, and module quotas for optimal performance."
---

All settings:<br>
<p style="text-align: center;"><a href="/uploads/stopwatch-cloud/stopwatch-create-field.webp"><img src="/uploads/stopwatch-cloud/stopwatch-create-field.webp" style="width:100%;" loading="lazy"></a></p>

### General settings ### 

1. Name - Name is needed for easy navigation in settings. A custom field of the same name will be created. After rename will be created new custom field. 
2. Is active - For a disabled setting, all data updates will be disabled. Once the setting is enabled, the data in the fields will be updated automatically.
2. Context - This is analogous to the context for custom fields. Issues are set for which you need to track the stopwatch.
 
### Events ###
3. Calculate type - When restarting, save the value in the archive or overwrite the current value?
4. Start events - Starts the timer or resumes its work after a pause. 
5. Restart events - Restarts the timer after stopping. The previous timer value is archived.
6. Pause events - Pauses the timer. The timer will start after the start event.
7. Stop events - Stop the timer. The timer will start after the restart event
   

### Display settings ###
8. Display mode
9. [Time format](/tis-cloud/time-formats) - format for outputting time in a field. If you need a new format, please write in support.
   
### Stopwatch configs ###

10. Default calendar - The time will be calculated according to the work schedule specified in the calendar. The default is a 24x7 work calendar.
11. Allow change config
12. Jql configs - For what tasks will the stopwatch be launched?





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