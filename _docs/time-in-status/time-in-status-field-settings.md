---
title: Time in status - field configuration
key: time-in-status
---

1. Create new custom field with type 'Time in status field' and set issue screens.<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field.png"><img src="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field.png" style="width:50%"/></a></p>

2. After create open field config.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-config.png"><img src="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-config.png" style="width:50%"/></a></p>
3. Select field context and click 'Edit Time in status field'<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-config2.png"><img src="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-config2.png" style="width:50%"/></a></p>
   
All settings:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/about-fields/time-in-status-config.png"><img src="/uploads/time-in-status/about-fields/time-in-status-config.png" style="width:100%;"></a></p>

### General settings ### 

1. Calculate mode - Поле может считать "Time in specified statuses", "Time in current status" or "Time in status categories".
2. Calculate time in statuses - if the task was or is in the indicated status, then the field will calculate the time spent in this status.
3. Calculate time after last move - if the task was transferred from another project, then the time will be counted from this moment.
4. Calculate first transition - it will only count the time the first transition to the specified status.
5. Calculate after last transition - it will only count the time after the last transition to the specified status.
6. Calculate average time - Total time divided by the number of transitions to the specified statuses.
       If the "total time in statuses", it divides the total time by the total number of transitions. Else the average is considered separately for each status.
7. Work calendar - If you need to calculate only working hours, you can connect a working calendar.
8. Show in field - total time or status table. Does not affect the actual value returned by the field.
9. Field time format - format for outputting time in a field. If you need a new format, please write in support.
10. Show as panel - Enables the display of the "Time in status" field in the sidebar. The remaining fields with the selected setting will be selected in it. The field can be omitted from the issue viewing screen. The panel can be configured separately from the field.<br>
    <p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-panel-demo.png"><img src="/uploads/time-in-status/time-in-status-field-settings/time-in-status-field-panel-demo.png" style="width:200px"/></a></p>
11. Show as panel on Agile boards - Show field as panel on scrum or kanban boards in "Issue Detail View" section (The right panel that appears when you click on a task).
12. Show in panel - total time or status table.
13. Panel time format - format for outputting time in a field. If you need a new format, please write in support.
14. Show empty value - When set to "No" does not display zero time.
15. Sorting of statuses by - Sorts the statuses in the tabular display of the field and sidebar.
The bottom panel has a similar setting.


### Show field value for next users ###
This section allows you to configure the users who will see the field. Users without permissions will not see the value of the field.Only work when anonymous access is "No".

If you leave these fields empty, then "Time in status field" will be shown to everyone who has access to the issue.

If it’s "No", it will only be shown to users who have logged in Jira.

If yes, it will be shown to everyone. The above restrictions are ignored.

### Show state icon ###
If the task is in one of the indicated statuses, an activity icon will be displayed.

If a work calendar is connected, then the task in the status and during non-working hours will show a pause icon indicating the date and time of the start of the next working day.

It is configured separately for the field and panel.

### Sub-tasks ### 
Show parent value in sub-tasks - If the option is enabled, then in the subtask the field value from the parent task will be displayed.

### Cache ### 
The flag connects caching to the field and panel.
It will not affect the display speed of the field. But it significantly accelerates the work with the field via the JQL, in the case of repeated request for data within one minute.
When this option is enabled, the time is displayed accurate to the minute.

### Access to value and sort by "Time in status" field ###
Real-time sorting can be resource intensive and can take a long time. You can restrict access to field sorting through JQL.
Anoniumous - If yes, access to value will be shared to everyone. The above restrictions are ignored.

### Reindex ### 
If you have changed the following fields, then for the search to work correctly, you need to run the reindex.
