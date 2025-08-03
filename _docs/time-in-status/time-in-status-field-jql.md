---
title: Time in status - JQL (field)
key: time-in-status
excerpt: JQL search functions for Time in Status fields including indexed and real-time queries, active/inactive status searches, and sorting capabilities.
---

## The search uses two mechanisms for working with counter values. ##
1. The first works with indexes. It is fast on any amount of data. But this data is current at the time the indexes were created. In the case of running time counters, a difference appears between the value stored in the index and the real one.
2. The second mechanism works with real data. It is noticeably slower than working with indexes. It is artificially limited in the amount of processed data (limits are set in the JQL settings). But it works with real, relevant data now. Where possible, but works with indexes.

## Functions take the following parameters. ## 

* jql - a string with a valid search query. For example: "Project = TEST and created < startOfWeek()"
* statuses - the name or id of the statuses, separated by commas. For example: "Open" or "Open, 10000, 10001".
* condition - one of the characters <, <=, => =,>. For example: ">".
* calendar - the name or id of the calendar. For example: "Support" or "1". [How to view calendars?](/docs/time-in-status/user-help-info/)
* time - time string corresponding to one of the patterns.

<div class="uk-alert-note" data-uk-alert="">
"5h35m12s" - 5 hours 35 minutes 12 seconds<br>
"5h12s" - 5 hours 12 seconds<br>
3000m - 3000 minutes<br>
"0", "0s" ... - time is zero.
</div>


## Search functions in the "Time in status" field. ##

Work when search engine is connected [Search Templates](https://confluence.atlassian.com/adminjiraserver/configuring-a-custom-field-938847235.html)


<p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-jql/time-in-status-field-searcher.webp"><img src="/uploads/time-in-status/time-in-status-field-jql/time-in-status-field-searcher.webp" style="width:100%" loading="lazy"></a></p>


### "Time in status" in active () ###
* Returns tasks that have a counter running. those. They are in the statuses specified in the field settings.
* It looks like status was in (open) where open is the status from the field settings.
* The function works with indexes.

### "Time in status" in inactive () ###
* Returns tasks for which the counter is not running. those. They are not in the statuses specified in the field settings.
* It looks like status not in (open) where open is the status from the field settings.
* The function works with indexes.

### "Time in status" in time ("condition", "time") ###
* Returns tasks whose value fields correspond to the condition.
* The function works with indexes.

### "Time in status" in realTime ("condition", "time") ###
* The task returns the real value of the field which corresponds to the condition.
* The function works in real time.
* It has a limit on the size of the issue.
* The function is suitable for sampling active counters. Real-time reporting, work queues of tasks with reference to reaction time, execution ...

### "Time in status" in realTimeBetween ("time", "time") ###
* The task returns the real value of the field which is in the specified range.
* The function works in real time.
* It has a limit on the size of the issue.
* The function is suitable for sampling active counters. Real-time reporting, work queues of tasks with reference to reaction time, execution ...
* It works in some cases faster than "in realTime" because limits the range requiring calculation on both sides.

## Sorting ##
By the field “Time in status” it is possible to sort. Sorting takes place according to data calculated in real time. Therefore, in large volumes, the request can be processed for a sufficiently long time. If sorting does not occur, you may not have the appropriate rights.

* [JQL config](/docs/time-in-status/performance-config-jql/)
* Access to value and sort by "Time in status" field

## Examples ## 
* "Time in status" in time (">", "1h")
* "Time in status" in realTime ("<", "1h")
* "Time in status" in realTimeBetween ("1h", "2h")


## Reserve ##
JQL Functions may not be available if their names conflict with functions from other plugins. For this case, each function has a spare with the "_jb" postfix.

In case of conflict, you need to turn off the module with the main function and turn on the spare: <br>
<p style="text-align: center;"><a href="/uploads/time-in-status/time-in-status-field-jql/time-in-status-field-jql-reserve.webp"><img src="/uploads/time-in-status/time-in-status-field-jql/time-in-status-field-jql-reserve.webp" style="width:100%" loading="lazy"></a></p>