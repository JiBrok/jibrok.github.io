---
title: Stopwatch - field configuration
key: time-in-status
excerpt: Configure stopwatch fields with schemes, display formats, panel views, manual controls, access permissions, and sub-task inheritance options.
---

<div class="uk-alert-note" data-uk-alert="">
This field is used to display information about stopwatches. Stopwatch operating rules are set in the stopwatch configuration. Stopwatch circuits associate projects and issue types with stopwatch configurations. The field displays the result of the associated configuration.
</div>

For the field to work, you need to configure the configurations and schemes by which stopwatches will work. Then you need to connect the scheme to a new or existing field.

<div class="uk-alert-warning" data-uk-alert="">
Schemes and configs only work if they are connected to the field. 
</div>

0. Common info: [⭐️Timers and Stopwatches - Schemes and configurations](docs/time-in-status/timers-and-stopwatches-schemes-and-configurations/)
1. [Create stopwatch configurations](/docs/time-in-status/stopwatch-configs/)
2. [Create stopwatch scheme and associate projects, issues types and stopwatch configs](/docs/time-in-status/stopwatch-schemes/)
3. Create stopwatch field
4. Set stopwatch scheme in stopwatch field settings

### Step 3 - Create stopwatch field ###

Adding a custom field:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-field-settings/stopwatch-field.webp"><img src="/uploads/time-in-status/stopwatch-field-settings/stopwatch-field.webp" style="width:400px" loading="lazy"></a></p>
After create open field configure and click "Edit stopwatch field":<br>
* <a href="/uploads/time-in-status/stopwatch-field-settings/stopwatch-field-config.webp"><img src="/uploads/time-in-status/stopwatch-field-settings/stopwatch-field-config.webp" style="width:50%" loading="lazy"></a>
* <a href="/uploads/time-in-status/stopwatch-field-settings/stopwatch-field-config2.webp"><img src="/uploads/time-in-status/stopwatch-field-settings/stopwatch-field-config2.webp" style="width:50%" loading="lazy"></a>


A window will open for you to configure the field.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-field-settings/stopwatch-field-settings.webp"><img src="/uploads/time-in-status/stopwatch-field-settings/stopwatch-field-settings.webp" style="width:100%" loading="lazy"></a></p>

* Stopwatch scheme - Set the scheme according to which the field will work(created in step 2). The field is used to display the stopwatch. But a scheme without a field will not work.
* Field time format - responsible for the format of the display of time in the fields.
* Show as panel - Displays the field value in the issue panel.<br>
  <p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-field-settings/stopwatch-view.webp"><img src="/uploads/time-in-status/stopwatch-field-settings/stopwatch-view.webp" style="width:50%" loading="lazy"></a></p>
* Show as panel on agile board - Displays the field value in the issue panel on Agile board.
* Panel time format - The stopwatch value can be displayed in different ways in the field and in the panel.
* Sequence - If a issue has several stopwatches displayed in the panel, they will be sorted in ascending order of this parameter.
* Field view mode and Panel view mode - In the current version, several options for displaying the value are available for the stopwatch.
    * Time - just shows the time in accordance with the format. 
      If the calendar is not working hours, then a pause icon and the date of the next working day will be indicated.
    * Time and icon - Same thing as time. An icon is added which indicates the current state of the stopwatch
* Manual control - You can grant rights to users to manually manage stopwatches.
  The stopwatch will continue to work according to the scheme, but there will be the possibility of manual control.
  The menu for manual control is available only in the panel on the task viewing screen.<br>
  <a href="/uploads/time-in-status/stopwatch-field-settings/stopwatch-manual.webp"><img src="/uploads/time-in-status/stopwatch-field-settings/stopwatch-manual.webp" style="width:200px" loading="lazy"></a>
* Show field value for next users - You can restrict access to the field value. The restrictions apply to fields and panels.
* Create change log for stopwatch  - Changing the stopwatch state (Running -> Paused) will be recorded in the issue history.
* Add time of stopwatch in issue history - only affects new entries in history.
  * Yes<br>
    <p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-field-settings/stopwatch-history-with-time.webp"><img src="/uploads/time-in-status/stopwatch-field-settings/stopwatch-history-with-time.webp" style="width:50%" loading="lazy"></a></p>
  * No <br>
    <p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-field-settings/stopwatch-history-without-time.webp"><img src="/uploads/time-in-status/stopwatch-field-settings/stopwatch-history-without-time.webp" style="width:50%" loading="lazy"></a></p>
* Sub-tasks - Child tasks can display parent stopwatches. And don't start your stopwatches.  




