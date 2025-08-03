---
title: Stopwatch - JQL
key: time-in-status
excerpt: Complete JQL function reference for stopwatch fields including time searches, state queries, date range filters, and real-time data access.
---

## Functions take the following parameters. ##

* condition - one of the characters <, <=, => =,>. For example: ">".
* calendar - the name or id of the calendar. For example: "Support" or "1". [How to view calendars?](/docs/time-in-status/work-calendar/)
* stopwatch config id and stopwatch scheme id - number. Jira admin can view it.
* time - time string corresponding to one of the patterns.

<div class="uk-alert-note" data-uk-alert="">
"5h35m12s" - 5 hours 35 minutes 12 seconds<br>
"5h12s" - 5 hours 12 seconds<br>
3000m - 3000 minutes<br>
"0", "0s" ... - time is zero.
</div>


Search works through the field. Therefore, all JQLs begin with the field name.

## Search functions in the "Stopwatch" field. ##

Work when search engine is connected [Search Templates](https://confluence.atlassian.com/adminjiraserver/configuring-a-custom-field-938847235.html)

<p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-field-jql/stopwatch-searcher.png"><img src="/uploads/time-in-status/stopwatch-field-jql/stopwatch-searcher.png" style="width:100%" loading="lazy"></a></p>


## JQL Functions ##


<p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-field-jql/stopwatch-jql-functions.png"><img src="/uploads/time-in-status/stopwatch-field-jql/stopwatch-jql-functions.png" style="width:50%" loading="lazy"></a></p>


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

### "Stopwatch field" in pauseTime("condition", "time") ###
* Returns tasks for which the stopwatch has already counted the specified time. 

### "Stopwatch field" in realPauseTime("condition", "time") ###
* Returns tasks for which the stopwatch has already counted the specified time. 
* The function works in real time.
* It has a limit on the size of the issue. JQL config
* The function is suitable for sampling active counters. Real-time reporting, work queues of tasks with reference to reaction time, execution ...


### Search by date ###
* **"field name" in startInDay("number")** - Search for issues by the day when the stopwatch was first started.
* **"field name" in startInWeek("number")** - Search for issues by the week when the stopwatch was first started.
* **"field name" in startInMonth("number")** - Search for issues by the month when the stopwatch was first started.

* **"field name" in stopInDay("number")** - Search for issues by the day when the stopwatch was stopped.
* **"field name" in stopInWeek("number")** - Search for issues by the week when the stopwatch was stopped.
* **"field name" in stopInMonth("number")** - Search for issues by the month when the stopwatch was stopped.

* **"field name" in pauseInDay("number")** - Search for issues by the day when the stopwatch was paused.
* **"field name" in pauseInWeek("number")** - Search for issues by the week when the stopwatch was paused.
* **"field name" in pauseInMonth("number")** - Search for issues by the month when the stopwatch was paused.

* **Examples:**
    * "First response" in startInDay() - find tasks for which the stopwatch has started today.
    * "First response" in startInDay("-1") - find tasks for which the stopwatch started yesterday (1 day ago).
    * "First response" in startInDay("-7") - find tasks for which a stopwatch started a week ago (7 days ago).


* **"field name" in searchByStartDate("condition", "date")** - Search for issues by the date when the stopwatch was first started.
* **"field name" in searchByPausedDate("condition", "date")** - Search for issues by the date when the stopwatch was last paused.
* **"field name" in searchByStopDate("condition", "date")** - Search for issues by the date when the stopwatch was stopped.


* date - date string in the format 'yyyy-MM-dd' or 'yyyy-MM-dd HH:mm'
* **Examples:**
    * "First response" in searchByStartDate(">", "2021-01-01") - issues for which stopwatch started after "2021-01-01"

* **"field name" in startInDateRange("date","date")** - Search for issues by the date when the stopwatch was started (duration).
* **"field name" in stopInDateRange("date","date")** - Search for issues by the date when the stopwatch was stopped (duration).


* **Examples:**
    * "First response" in stopInDateRange("2020-01-01", "2021-01-01") - issues for which stopwatch stopped during 2020 year.



### "Stopwatch field" in searchByCalendar(“calendarId”) ###
* Returns tasks whose stopwatch uses the specified attribute.

### "Stopwatch field" in searchByStopwatchConfig(“stopwatchConfigId”) ###
* Returns tasks whose stopwatch uses the specified attribute.
* Id can be found with Jira admin.

### "Stopwatch field" in searchByStopwatchScheme(“stopwatchSchemeId”) ###
* Returns tasks whose stopwatch uses the specified attribute.
* Id can be found with Jira admin.


