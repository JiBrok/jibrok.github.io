---
title: Overview
key: time-in-status
---

<p style="text-align: center;"><a href="https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=datacenter&tab=overview"><img src="/uploads/time-in-status/overview/marketplace.png" style="width:100%;"/></a></p>

<p style="text-align: center;">View app on <a href="https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=datacenter&tab=overview">Atlassian Marketplace</a></p>
## Welcome to Time in status | SLA | Timer | Stopwatch!


The issue (task, work) during the solving process goes through various stages. It is necessary to take it into account and control the time spent at each stage.

To calculate time in different scenarios, the plugin provides a set of fields, functions for searching, reports and access to api.


### Fields: ###
* Time in status field
    * A field that shows the time spent in the selected statuses. It's easy to use and serves to solve typical problems - calculating the time in status.<br>
      "How long has the task been open? How long was the task in work? How long did it wait for the reaction?" and so on.
* Stopwatch field
    * Tracks the time between events. Events can be as simple as creating a task, commenting. So are more complex ones - increasing priority, changing status to a specific, first appointment. The field is very flexible in the settings and allows to know the time between practically any actions with the task. 
* Timer field
    * Based on stopwatch and complemented by countdown functions. 
    * During startup, it is set for a certain time (5 minutes, 4 hours) and then shows the remaining time. Reacts to events (TODO). Depending on the settings, it starts the timer or stops. The initial time is determined by the jql condition.
    * You can send a notification in advance or when the time expires.

All fields have a large number of functions for finding information using jql in real time.
All fields can calculate their values both for new(based on issue events) and old issues(based on the history of issues).  
All fields have a large number of settings for display and access rights.

<table>
<tr>
<td><a href="/uploads/time-in-status/overview/fields-example-2.png"><img src="/uploads/time-in-status/overview/fields-example-2.png" style="width:100%;"/></a></td>
<td><a href="/uploads/time-in-status/overview/fields-example-1.png"><img src="/uploads/time-in-status/overview/fields-example-1.png" style="width:100%;"/></a></td>
</tr>
</table>

### Business calendar: ###

The plugin can calculate the time according to the configured calendars. In fields and jql there are corresponding settings.
You can create an unlimited number of calendars and use it in any contexts and projects. 
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/calendar-example.png"><img src="/uploads/time-in-status/overview/calendar-example.png" style="width:100%;"/></a></p>

### Reports: ###
In each task detailed reports are available on time, transitions between statues and performers. They can be downloaded directly from the task interface. 
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/issue-report.png"><img src="/uploads/time-in-status/overview/issue-report.png" style="width:100%;"/></a></p>

Create jql reports grouped by any fields or jql conditions. Various functions are available in reports for calculating values (average, percentiles ...).
The reports will be available for viewing via the link.

<table>
<tr>
<td><a href="/uploads/time-in-status/overview/reports-example-2.png"><img src="/uploads/time-in-status/overview/reports-example-2.png" style="width:100%;"/></a></td>
<td><a href="/uploads/time-in-status/overview/reports-example-1.png"><img src="/uploads/time-in-status/overview/reports-example-1.png" style="width:100%;"/></a></td>
</tr>
</table>


### Others ###
* Performance/access rights/display settings.
* Supporting tools for integration with other plugins or data export.
* Automatic time records in worklog.
* Functions to compare fields in jql.
* Others


[Get started](/docs/time-in-status/get-started/)