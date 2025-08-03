---
title: Overview
key: timer-cloud
excerpt: "Timer field for Jira Cloud with countdown functionality, goal time limits, SLA tracking, and comprehensive time management features."
---

<p style="text-align: center;"><a href="https://marketplace.atlassian.com/apps/1225684/timer-field?tab=overview&hosting=cloud"><img src="/uploads/time-in-status/overview/marketplace.png" style="width:100%;"/></a></p>

<p style="text-align: center;">View app on <a href="https://marketplace.atlassian.com/apps/1225684/timer-field?tab=overview&hosting=cloud">Atlassian Marketplace</a></p>
## Welcome to Timer for Jira Cloud!


The issue (task, work) during the solving process goes through various stages. It is necessary to take it into account and control the time spent at each stage.

The plugin provides fields, JQL functions for searching and reports.


### Timer field ###
* The field keeps track of the time between issue events: issue created, issue commented, issue resolved and many others including special(up the priority, change the value in the field).<br>
  "How long has passed from the moment of creation to the first comment? How long did you work on the task (taking into account the complex workflow)?" and so on.

Fields have functions for finding information using jql.
Fields can calculate their values both for new(based on issue events) and old issues(based on the history of issues).  
Fields have a large number of time format for display.


### Business calendar: ###

The plugin can calculate the time according to the configured calendars. In fields and jql there are corresponding settings.
You can create an unlimited number of calendars and use it in any contexts and projects.
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/calendar-example.png"><img src="/uploads/time-in-status/overview/calendar-example.png" style="width:100%;"/></a></p>

### Reports: ### 

The "Timer" fields can be used like regular fields in the JQL navigator and exported, for example, to excel.

<table>
<tr>
<td><a href="/uploads/tis-cloud/time-in-status-navigator.png"><img src="/uploads/tis-cloud/time-in-status-navigator.png" style="width:100%;"/></a></td>
<td><a href="/uploads/tis-cloud/time-in-status-excel.png"><img src="/uploads/tis-cloud/time-in-status-excel.png" style="width:100%;"/></a></td>
</tr>
</table>

(🛠 New functionality for generating and downloading reports is coming soon)

[Get started](/docs/timer-cloud/get-started/)