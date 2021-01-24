---
title: tis field settings
key: time-in-status
---

1. Create new custom field with type 'Time in status field' and set issue screens

2. After create open field config and click "Edit JBCF:Time in status field"
   
3. Select field context and click 'Edit Time in status field'

### General settings ### 

1. Calculate time in current status - if set "Yes" field will show time in current status of issue.
After change status field will show time in new status.
2. Calculate time in statuses - if the task was or is in the indicated status, then the field will calculate the time spent in this status.
3. Calculate average time - Total time divided by the number of transitions to the specified statuses.
If the "total time in statuses", it divides the total time by the total number of transitions. Else the average is considered separately for each status.
4. Calculate time after last move - if the task was transferred from another project, then the time will be counted from this moment.
5. Calculate first transition - it will only count the time the first transition to the specified status.
6. Calculate after last transition - it will only count the time after the last transition to the specified status.
7. Show in field - total time or status table. Does not affect the actual value returned by the field.
8. Field time format - format for outputting time in a field. If you need a new format, please write in support.
9. Show as panel - Enables the display of the "Time in status" field in the sidebar. The remaining fields with the selected setting will be selected in it. The field can be omitted from the issue viewing screen. The panel can be configured separately from the field.

10. Show as panel on Agile boards - Show field as panel on scrum or kanban boards in "Issue Detail View" section (The right panel that appears when you click on a task).
11. Show in panel - total time or status table.
12. Panel time format - format for outputting time in a field. If you need a new format, please write in support.
13. Show empty value - When set to "No" does not display zero time.
14. Sorting of statuses by - Sorts the statuses in the tabular display of the field and sidebar.
The bottom panel has a similar setting.
15. Work calendar - If you need to calculate only working hours, you can connect a working calendar.

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

Calculate time in statuses
Calculate time after last move
Calculate after last transition
Work calendar
