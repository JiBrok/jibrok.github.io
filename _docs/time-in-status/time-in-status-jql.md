---
category: search-jql
tags: [doc, server, datacenter, time-tracking, time-in-status, jql-functions]
title: Time in status - JQL (common)
key: time-in-status
excerpt: Common JQL functions for Time in Status queries including timeInStatus, timeInStatusByJql, and working calendar functions with real-time search capabilities.
---

## Functions take the following parameters ## 

* jql - a string with a valid search query. For example: "Project = TEST and created < startOfWeek()"
* statuses - the name or ID of the statuses, separated by commas. For example: "Open" or "Open, 10000, 10001".
* condition - one of the characters <, <=, =, >=, >. For example: ">".
* time - time string corresponding to one of the patterns.

<div class="uk-alert-note" data-uk-alert="">
"5h35m12s" - 5 hours 35 minutes 12 seconds<br>
"5h12s" - 5 hours 12 seconds<br>
3000m - 3000 minutes<br>
"0", "0s" ... - time is zero.
</div>

* calendar - the name or ID of the calendar. For example: "Support" or "1". [How to view calendars?](/docs/time-in-status/user-help-info/)

## Common functions ## 

General functions work without reference to the "Time in status" field.
* issue in timeInStatus ("statuses", "condition", "time")
* issue in timeInStatusByJql ("jql", "statuses", "condition", "time")
* issue in timeInStatusByJqlAndWokCalendar ("jql", "statuses", "condition", "time", "calendar")

Or their replacement counterparts, in case of functions of the same name in other plugins.
* issue in timeInStatus_jb ("statuses", "condition", "time")
* issue in timeInStatusByJql_jb ("jql", "statuses", "condition", "time")
* issue in timeInStatusByJqlAndWokCalendar_jb ("jql", "statuses", "condition", "time", "calendar")

If you want to use both plugins, go to "Manage Plugins", then expand the modules for either plugin, and selectively enable or disable the JQL function modules for those functions. For example, in "Time in status", the module providing jql-functions is displayed as:

### issue in timeInStatus ("statuses", "condition", "time") ### 
* Returns issues that spent a certain time in the indicated statuses.
* The function works in real time.
* The function takes issues matching the query "status was in (statuses)" and additionally filters them by condition.

### issue in timeInStatusByJql ("jql", "statuses", "condition", "time") ###
* It returns issues from the JQL request that spent a certain time in the indicated statuses.
* The function works in real time.
* The fewer JQL issues, the faster the function works.

### issue in timeInStatusByJqlAndWokCalendar ("jql", "statuses", "condition", "time", "calendar") ###
* It returns issues from the JQL request that spent a certain time in the indicated statuses. Time calculation is done according to the specified calendar.
* The function works in real time.
* The fewer JQL issues, the faster the function works.

## Examples ## 
* issue in timeInStatus ("NEW", ">", "1h")
* issue in timeInStatus ("10000", ">", "1h")
* issue in timeInStatus ("10000, 10001", "<", "1h5m")
* issue in timeInStatusByJql ("project = TEST", "10000, 10001", "<", "1h5m")