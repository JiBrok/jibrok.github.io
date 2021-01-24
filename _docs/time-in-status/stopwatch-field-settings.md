---
title: stopwatch field settigs
key: time-in-status
---

For the field to work, you need to configure the configurations and schemes by which stopwatches will work. Then you need to connect the scheme to a new or existing field.
1. Create stopwatch configurations
2. Create stopwatch scheme and associate projects, issues types and stopwatch configs
3. Create stopwatch field
4. Set stopwatch scheme in stopwatch field settings

### Step 3 - Create stopwatch field ###
Adding a custom field
After create open field settings and click "Edit stopwatch field"



A window will open for you to configure the field.

* Stopwatch field scheme - Set the scheme according to which the field will work(created in step 2). The field is used to display the stopwatch. But a scheme without a field will not work.
* Field time format - responsible for the format of the display of time in the fields.
* Show as panel - Displays the field value in the issue panel.
* Show as panel on agile board - Displays the field value in the issue panel on Agile board.
* Panel time format - The timer value can be displayed in different ways in the field and in the panel.
* Sequence - If a issue has several timers displayed in the panel, they will be sorted in ascending order of this parameter.
* Field view mode and Panel view mode - In the current version, several options for displaying the value are available for the stopwatch.
    * Time - just shows the time in accordance with the format. 
      If the calendar is not working hours, then a pause icon and the date of the next working day will be indicated.
    * Time and icon - Same thing as time. An icon is added which indicates the current state of the stopwatch
* Manual control - You can grant rights to users to manually manage timers.
  The timer will continue to work according to the scheme, but there will be the possibility of manual control.
  The menu for manual control is available only in the panel on the task viewing screen.
* Show field value for next users - You can restrict access to the field value. The restrictions apply to fields and panels.
* Create change log for stopwatch  - Changing the stopwatch state (Running -> Paused) will be recorded in the issue history.
* Add timer stopwatch in issue history - only affects new entries in history.
* Sub-tasks - Child tasks can display parent stopwatches. And don't start your stopwatches.  