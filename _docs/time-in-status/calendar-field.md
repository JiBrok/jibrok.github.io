---
title: Calendar field
key: time-in-status
excerpt: Configure working calendar fields for time tracking in Jira, with options to select calendars for status fields, timers, stopwatches, and reports.
---

A field that allows you to select one of the working calendars. This field can be set as the work calendar source for various application functions:
* For the "time in status" field - set in the field configuration
* For timers - set in the timer configuration
* For stopwatches - set in stopwatch configuration
* For reports - set in the settings of the bottom reports

In the calendar field settings you can set:
* Which working calendars from the general list will be available for selection. You can select all calendars or just the ones you need.
* Default value.

<div class="uk-alert-note" data-uk-alert="">
    In the name of the calendar, you can use the name of your locations/offices.
</div>


#### Calendar selection priority ####

##### Time in status field #####

1. Calendar from the specified field. The field for choosing a calendar is specified in the settings of the "time in status" field.
2. The calendar specified in the settings of the "time in status" field.

##### Timer field/Stopwatch field #####

1. Calendar from the field specified in the current goal of the timer/jql stopwatch condition. If there is no field or there is no selected calendar, then the calendar is selected further.
2. The calendar specified in the current goal of the timer/jql condition of the stopwatch.
3. Default calendar field from configurations.
4. Default work calendar from configurations.

##### Reports #####

1. Calendar from the specified field. The field for choosing a calendar is specified in the report settings.
2. The calendar specified in the report settings.