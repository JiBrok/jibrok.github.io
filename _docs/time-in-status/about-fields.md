---
title: Time Tracking Field Types Overview and Comparison
key: time-in-status
excerpt: "Overview of Time in Status, Stopwatch, and Timer fields with real-time calculation, work calendars, and comprehensive tracking capabilities."
category: advanced-configuration
tags: [doc, server, datacenter, time-tracking, time-in-status, timer, stopwatch, business-calendar, jql-functions, reporting, sla-tracking, performance-optimization, rest-api, java-api, worklog, field-panels, export, eazybi-integration]
---

Time calculation functionality is based on three field types: Time in status, Stopwatch, and Timer.

All these fields have the following functions: 
* Working with data in real time - searching and sorting.
* Perform calculations using the work calendar and time zones of users.
* Suitable for queuing, monitoring, dashboards.
* They can be used in reports, exports, integration, and can be used to perform additional calculations (e.g., average project time).
* All fields have appearance and permissions settings.
* An unlimited number of fields and contexts can be created.
* They can calculate their values based on the request history and can be used for both new/future and old issues. 
* Additionally, for fields, additional functions are available through auxiliary fields and field comparison.

Now about field differences:

### Time in status ###
<p>Calculate the time spent in the specified status, statuses, or status category. 
Serves for solving standard tasks of counting the time spent in the status.</p>

<p>It has simple configuration. For the field to start working, it is enough to specify the statuses and calendar for calculation after creation. However, the settings are sufficient to meet more complex requirements. 
</p>

* <a href="/uploads/time-in-status/overview/fields-example-2.webp" target="_blank">
<img src="/uploads/time-in-status/overview/fields-example-2.webp" alt="fields-example-2 screenshot" style="width:50%;" loading="lazy"></a>
* <a href="/uploads/time-in-status/about-fields/time-in-status-config.webp" target="_blank">
<img src="/uploads/time-in-status/about-fields/time-in-status-config.webp" alt="screenshot" width="50%" loading="lazy"></a>


* Suitable for simple conditions of counting time: time spent in status or statuses.
* Does not allow to stop or start time counting by events (comment, value in field...). Only if the task changes status at these events.


### Stopwatch ### 
<p>Calculate the time between events (actions) that occurred with the task . 
Very flexible settings allow you to calculate almost any time intervals in the life of the task. Fields can also be combined in calculations for extremely complex cases.
</p>


<p>
The settings are more complicated than for "time in status" field, but due to the flexibility and variety of settings, it allows you to calculate a huge number of scenarios.
</p>

<table>
<tr>
<td><a href="/uploads/time-in-status/about-fields/stopwatch-field-config.webp" target="_blank">
<img src="/uploads/time-in-status/about-fields/stopwatch-field-config.webp" alt="screenshot" width="100%" loading="lazy"></a></td>
<td><a href="/uploads/time-in-status/about-fields/stopwatch-config.webp" target="_blank">
<img src="/uploads/time-in-status/about-fields/stopwatch-config.webp" alt="screenshot" width="100%" loading="lazy"></a></td>
</tr>
</table>

* Calculates the time between events (issue creation, commenting, setting a value in fields, transition to a status ...)
  * For example, start the report when creating an issue and stop when creating a comment for the author or transition to a status 'in progress"
* Suitable for any time measurement. Large number of ready-to-use triggers available in the settings. Ability to start and stop stopwatches manually or via api.
* Can be configured to run with JQL condition. Runs automatically when a task matches a JQL request.
* Can send notifications on state change (on start, pause, ...).
* Allows you to work not only with the calculated time but also with time in a pause state.


### Timer ### 
The field is implemented on the basis of the **stopwatch** and supplemented with a countdown function.<br>
Limits are set on the basis of data in the task fields.
* You can specify that for an issue with a critical priority, the timer (for example, the reaction timer) should be set to 20 minutes. And for issues with a lower priority for 1 hour.<br>

Calculates the difference (time remaining) between the goal time (limit) and the time between events (like a stopwatch).
* The issue must be commented within 30 minutes after creation. The timer when creating an issue will be set for 30 minutes and at the same moment will start counting down. The timer will stop the countdown at the moment of creating a comment and fix the value. If more than 30 minutes pass, the timer will show a negative value.  
 

<table>
<tr>
<td><a href="/uploads/time-in-status/about-fields/timer-field-config.webp" target="_blank">
<img src="/uploads/time-in-status/about-fields/timer-field-config.webp" alt="screenshot" width="100%" loading="lazy"></a></td>
<td><a href="/uploads/time-in-status/about-fields/timer-config.webp" target="_blank">
<img src="/uploads/time-in-status/about-fields/timer-config.webp" alt="screenshot" width="100%" loading="lazy"></a></td>
</tr>
</table>


* Calculates time between events and shows how much time is left of the initial time(Goal time - time between events)
* Time limits (target time) are set by jql conditions.
* Allows to work not only with calculated time but also with the time in a pause state, remaining time and the time spent beyond the limits.



