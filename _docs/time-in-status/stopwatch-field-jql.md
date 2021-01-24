---
title: stopwatch field jql
key: time-in-status
---

📌 Work when search engine is connected (Search template)
https://confluence.atlassian.com/adminjiraserver/configuring-a-custom-field-938847235.html

## Functions take the following parameters. ##

* condition - one of the characters <, <=, => =,>. For example: ">".
* time - time string corresponding to one of the patterns.

<div class="uk-alert-note" data-uk-alert="">
"5h35m12s" - 5 hours 35 minutes 12 seconds<br>
"5h12s" - 5 hours 12 seconds<br>
3000m - 3000 minutes<br>
"0", "0s" ... - time is zero.
</div>

* calendar - the name or id of the calendar. For example: "Support" or "1". How to view calendars?
* timer config id and timer scheme id - number. Jira admin can view it.


Search works through the field. Therefore, all JQLs begin with the field name.


### “Stopwatch field“ in active() ###
* Returns tasks that have a stopwatch is running
* If the stopwatch uses a calendar, the field may indicate that it is not working hours. This does not affect the search if stopwatch is running.

### “Stopwatch field“ in inactive() ###
* Returns tasks that have a stopwatch is pause, stopped.

### “Stopwatch field“ in isPaused() ###
* Returns tasks that have a stopwatch is paused. Breaks in the work calendar are not considered a pause. But can be displayed in the field as a pause.

### “Stopwatch field“ in isRunning() ###
* Returns tasks that have a stopwatch is running. A break in the working calendar does not affect the search. The stopwatch may be in state running, but at the same time the field will be displayed as a pause state.

### “Stopwatch field“ in isStopped() ###
* Returns tasks that have a stopwatch is stopped.

### "Stopwatch field" in timeSpent("condition", "time") ###
* Returns tasks for which the stopwatch has already counted the specified time. Those. The stopwatch was active(in state Running) for the specified time.

### "Stopwatch field" in realTimeSpent("condition", "time") ###
* Returns tasks for which the stopwatch has already counted the specified time. Those. The stopwatch was active(in state Running) for the specified time.
* The function works in real time.
* It has a limit on the size of the issue. JQL config
* The function is suitable for sampling active counters. Real-time reporting, work queues of tasks with reference to reaction time, execution ...

### "Stopwatch field" in searchByCalendar(“calendarId”) ###
* Returns tasks whose stopwatch uses the specified attribute.

### "Stopwatch field" in searchByStopwatchConfig(“stopwatchConfigId”) ###
* Returns tasks whose stopwatch uses the specified attribute.
* Id can be found with Jira admin.

### "Stopwatch field" in searchByStopwatchScheme(“stopwatchSchemeId”) ###
* Returns tasks whose stopwatch uses the specified attribute.
* Id can be found with Jira admin.