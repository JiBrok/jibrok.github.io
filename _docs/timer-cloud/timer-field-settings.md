---
title: Timer - field configuration
key: timer-cloud
excerpt: "Configure Timer field settings including goal time limits, events, display modes, calendars, and JQL conditions for optimal tracking."
---

All settings:<br>
<p style="text-align: center;"><a href="/uploads/timer-cloud/timer-create-field.webp" target="_blank"><img src="/uploads/timer-cloud/timer-create-field.webp" style="width:100%;" loading="lazy"></a></p>

### General settings ### 

1. Name - Name is needed for easy navigation in settings. A custom field of the same name will be created. After rename will be created new custom field. 
2. Is active - For a disabled setting, all data updates will be disabled. Once the setting is enabled, the data in the fields will be updated automatically.
3. Context - This is analogous to the context for custom fields. Issues are set for which you need to track the stopwatch.
 
## Timer config ##

4. Calculate type - When restarting, save the value in the archive or overwrite the current value?

### Events ###

As a trigger, you can select release system events, change of status, change of status from a specific status or to a specific status, change of field values and others.

5. Start events - Starts the timer or resumes its work after a pause. 
6. Restart events - Restarts the timer after stopping. The previous timer value is archived.
7. Pause events - Pauses the timer. The timer will start after the start event.
8. Stop events - Stop the timer. The timer will start after the restart event
   

### Display settings ###
9. Display mode - The field contains a lot of information for searching and sorting (see JQL). You can choose which data to display to the user in the field. It does not affect search or sort conditions. But it affects the value displayed in the field. This value will also be used for export.
10. [Time format](/tis-cloud/time-formats) - format for outputting time in a field. If you need a new format, please write in support.
   
### Time settings ###

11. Default calendar - The time will be calculated according to the work schedule specified in the calendar. The default is a 24x7 work calendar.
12. Allow change goal - When the start event is triggered for the first time, the initial goal time is set in timer. In the future, the issue can be edited and it may no longer meet the conditions of the original goal. If this setting is activated, then the goal will always be refined in accordance with the current data in the Issue. If this setting is deactivated, then the timer will always work with the original goal.
13. Goals:
    1. Goals allow you to set the timer at different times depending on the data in Issue.
    2. Conditions for goals are defined using JQL conditions. If none of the goal conditions match, then the default goal will be applied.
    3. If goal has no time set or is equal to 0, then the timer is not started.
    4. Goal Time option:
    * Time - You can specify the time manually. After the start, the timer will be set to the specified time.
    * Date time field - The timer will count down the time from the start to the date in the specified issue field.
    * Preset options:
      * NBD (Next business day) - The timer will count down the time from the moment of the start to the end of the next working day.
    * An example of a combination of different conditions:
       <p style="text-align: center;"><a href="/uploads/timer-cloud/step-by-step/timer-config-example.webp" target="_blank"><img src="/uploads/timer-cloud/step-by-step/timer-config-example.webp" alt="" width="100%" loading="lazy"></a></p>

14. After saving, all timers will be updated with the new settings. Timers work both for new issues and for already created ones. Data for calculations is drilled from the issue history. 
  