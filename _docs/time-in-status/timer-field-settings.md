---
title: Timer - field configuration
key: time-in-status
excerpt: Configure timer fields with schemes, display formats, panel views, manual controls, access permissions, and history logging for comprehensive timer management.
---

<div class="uk-alert-note" data-uk-alert="">
This field is used to display information about the timer. Timer rules are set in the timer configuration. Timer schemas associate projects and issue types with timer configurations. The field displays the result of the associated configuration.
</div>


For the field to work, you need to configure the configurations and schemes by which timers will work. Then you need to connect the scheme to a new or existing field.

<div class="uk-alert-warning" data-uk-alert="">
Schemes and configs only work if they are connected to the field. 
</div>

0. Common info: [⭐️Timers and Stopwatches - Schemes and configurations](docs/time-in-status/timers-and-stopwatches-schemes-and-configurations/)
1. [Create timer configurations](/docs/time-in-status/timer-configs/)
2. [Create timer scheme and associate projects, issues types and timer configs](/docs/time-in-status/timer-schemes/)
3. Create timer field
4. Set timer scheme in timer field settings

## Step 3 - Create timer field ##
Adding a custom field<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-settings/timer-field.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field.webp" style="width:400px" loading="lazy"></a></p>

After create open field settings and click "Edit Timer field":<br>
* <a href="/uploads/time-in-status/timer-field-settings/timer-field-config.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field-config.webp" style="width:50%" loading="lazy"></a>
* <a href="/uploads/time-in-status/timer-field-settings/timer-field-config2.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field-config2.webp" style="width:50%" loading="lazy"></a>


A window will open for you to configure the field.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-settings/timer-field-settings.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field-settings.webp" style="width:100%" loading="lazy"></a></p>

* Timer field scheme - Set the scheme according to which the field will work(created in step 2). The field is used to display the timer. But a scheme without a field will not work.
* Field time format - responsible for the format of the display of time in the fields.<br>
* Show as panel - Displays the field value in the issue panel.<br>
  <p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-settings/timer-field-panel.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field-panel.webp" style="width:50%" loading="lazy"></a></p>
* Show as panel on agile board - Displays the field value in the issue panel on Agile board.
* Panel time format - The timer value can be displayed in different ways in the field and in the panel.
* Sequence - If a issue has several timers displayed in the panel, they will be sorted in ascending order of this parameter.
* Field view mode and Panel view mode - In the current version, several options for displaying the value are available for the timer.
    * Time - just shows the time in accordance with the format.
      If the calendar is not working hours, then a pause icon and the date of the next working day will be indicated.
    * Time and icon - Same thing as time. An icon is added which indicates the current state of the timer. 
    * Time tracking: <br>
      <p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-settings/timer-field-time-tracker-view.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field-time-tracker-view.webp" style="width:50%" loading="lazy"></a></p>
    
* Manual control - You can grant rights to users to manually manage timers.
  The timer will continue to work according to the scheme, but there will be the possibility of manual control.
  The menu for manual control is available only in the panel on the task viewing screen.<br>
  <p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-settings/timer-field-manual.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field-manual.webp" style="width:200px" loading="lazy"></a></p>

* Show field value for next users - You can restrict access to the field value. The restrictions apply to fields and panels.
* Create change log for timer  - Changing the timer state (Running -> Paused) will be recorded in the issue history.
* Add timer time in issue history - only affects new entries in history.
  * Yes<br>
    <p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-settings/timer-field-history-with-time.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field-history-with-time.webp" style="width:50%" loading="lazy"></a></p>
  * No <br>
    <p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-settings/timer-field-history-without-time.webp"><img src="/uploads/time-in-status/timer-field-settings/timer-field-history-without-time.webp" style="width:50%" loading="lazy"></a></p>
* Sub-tasks - Child tasks can display parent timers. And don't start your timers.
