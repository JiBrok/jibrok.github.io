---
title: User JQL help
key: time-in-status
excerpt: "JQL help documentation for Time in Status users with function examples, search syntax, and field-specific query options."
---

Available JQL functions for working with time and examples of their use.

1. This help is available from jira’s help menu:
<p style="text-align: center;"><a href="/uploads/time-in-status/user-help-info/help-link.png"><img src="/uploads/time-in-status/user-help-info/help-link.png" alt="work calendars" width="50%"/></a></p>
   
2. You might need a work calendar. You can see their list in the system by following the link from the help menu or this link *{baseUrl}*/secure/jibrokAllCalendars!default.jspa:

<p style="text-align: center;"><a href="/uploads/time-in-status/user-help-info/work-calendars.png"><img src="/uploads/time-in-status/user-help-info/work-calendars.png" alt="work calendars" width="50%"/></a></p>

<hr>

## Arguments used in functions. ## 

<div class="uk-alert-note" data-uk-alert="">
<b>Time</b> - a string indicating the time, if the format is wrong, a message with help will be displayed.<br>
<br>
"5h35m12s" - 5 hours 35 minutes 12 seconds<br>
"5h12s" - 5 hours 12 seconds<br>
3000m - 3000 minutes<br>
"0", "0s" ... - time is zero.
</div>


<div class="uk-alert-note" data-uk-alert="">
<b>Condition</b> - condition for comparison of values. <br>
"<=", "<", "=", ">", ">=" 

</div>

<hr>

## *Common* ##

### Time in status ###
Functions for searching issues by time spent in statuses.
These functions are available by default. If not, please contact your Jira admin. 

* **issue in timeInStatus("statuses", "condition", "time")** - Find issues that spent the specified time in statuses.
    * Params:
    * statuses - name or id, Comma separated
* **issue in timeInStatusByJql("jql", "statuses", "condition", "time")** - Find issues from a jql request that spent the specified time in statuses.
    * Params: 
    * jql - query for filter tasks
    * statuses - name or id, Comma separated
* **issue in timeInStatusByJqlAndWorkCalendar("jql", "statuses", "condition", "time", "calendar")** - Find issues from a jql request that spent the specified working time in statuses. Working hours will be calculated according to the specified calendar.
    * Params:
    * jql - query for filter tasks
    * statuses - name or id, Comma separated
    * calendar - work calendar name or id for calculate work time


* **Examples:**
    * issue in timeInStatus("Done, In Progress", ">", "8h")
    * issue in timeInStatusByJqlAndWorkCalendar("project = TEST", "Done", ">", "3h", "General calendar")

* If several statuses are specified, the search is based on the sum of the time spent in the specified statues.
* Status names are case sensitive. If the name does not match, the function will prompt the correct spelling options for the status.
* Use "OR" and "AND" to search different statues: issue in timeInStatus("status A", ">", "time") or issue in timeInStatus("status B", ">", "time")
* If possible use functions with jql. They narrow the search and execute faster. 



### Compare fields ###
Functions that allow you to compare different fields with each other. The functions work with "number", "string" and "time" fields.
Returns issues whose fields satisfy the condition.

* **issue in compareFields("field 1", "condition", "field 2")** - Field comparison function. Finds tasks in which fields match a condition.
    * Params: 
    * "field 1" and "field 2"  - field name or field id
* **issue in compareFieldsByJql("jql", "field 1", "condition", "field 2")** -  Field comparison function. Finds tasks in which fields match a condition and jql.
    * Params:
    * jql - query for filter tasks
    * "field 1" and "field 2"  - field name or field id

* **Examples:**
    * issue in compareFields("Time in status New", ">", "Time in status In progress")
    * issue in compareFields("Number field", ">", "Another number field")
    * issue in compareFields("Project = TEST", "String field", ">", "Another number field")
    
* If possible use functions with jql. They narrow the search and execute faster.
* In the case of string fields, the function will try to convert the string to a number for correct comparison.

### Compare date from field and date by work calendar ###

The *comparisonDateFromFieldAndDateByWorkCalendar* function is used to compare a date from a specified field with a computed date based on a given relative time and a specified work calendar. The behavior of the function is as follows:


* **comparisonDateFromFieldAndDateByWorkCalendar("field", "condition", "time", "calendar")**
  * Params:
  * "field" - The name of the field to be searched and compared. It can be the name or ID of a system field or a custom field.
  * "condition" - The condition for comparing the date from the first field with the computed date. Possible values are <, <=, =, >=, >.
  * "time" - A string representing the time relative to the current time, entered in the format "-1h 30m", for example. This value is used to calculate the date based on the specified work calendar.
  * "calendar" - The name or ID of the work calendar. The computed date is calculated based on this calendar and the specified relative time.

Behavior:

* The function retrieves the value from the specified "field".
* The current date is computed based on the specified "work calendar" and the relative "time" relative to the current time. For example, if the current time is 9:00 AM and relativeTime is "-1h 30m" (one and a half working hours ago), the computed date will represent 7:30 AM of the current working day according to the specified calendar.
* The computed date is compared with the date from the specified "field" using the specified comparison operator ("condition"). For example, if "condition" is >, it checks if the date from the "field" is more than the computed date .

* **Examples**
    * issue in comparisonDateFromFieldAndDateByWorkCalendar("updated", ">", "-1h", "Calendar Name") - find all issues that have been updated for the last working hour(-1h) on the working calendar. Like: "updated > -1h", but -1h by work calendar.

### Autotrack ###

Works if the automatic time tracking function is enabled.  

* **issue in myAutoTrackTickets()** -  Returns user issues with configured automatic timers or stopwatches.

<hr>

## *Time in status (field)* ## 

If there is a configured field "Time in status", the following search functions are available for it.<br>
You can check the field type with the administrator <br>

#### Search by state ####
* **"field name" in active()** - Search by active time in status fields(issue in selected statuses)
* **"field name" in inactive()** - Search by inactive time in status fields(issue not in selected statuses)

#### Search by time ####
* **"field name" in time("condition", "time")** - Search by time in status fields(by total time in selected statuses)/Timer field. Time value from index.
* **"field name" in realTime("condition", "time")** - Search by time in status fields(by total time in selected statuses)/Timer field. Time value calculate realtime.
* **"field name" in realTimeBetween("time", "time")** - Search by realtime in status fields(by total time in selected statuses). Time value calculate realtime.

* **Examples:**
    * "Time in new" in realTime(">", "20m") AND "First reaction" in realTime("<", "1h")
    * "Time in new" in realTimeBetween("1h", "2h")

<hr>


## *Stopwatch* ##
If there is a configured "Stopwatch" field, the following search functions are available for it.<br>
You can check the field type with the administrator <br>

#### Search by state ####
* **"field name" in isRunning()** - Search issues by running stopwatch.
* **"field name" in isPaused()** - Search issues by paused stopwatch.
* **"field name" in isStopped()** - Search issues by stopped stopwatch.
* **"field name" in active()** - Returns issues that have a stopwatch is running. If the stopwatch uses a calendar, the field may indicate that it is not working hours. This does not affect the search if stopwatch is running.
* **"field name" in inactive()** - Returns issues that have a stopwatch is pause, stopped.

* **Examples:**
    * "First response" in isRunning()
    * "First response" in isStopped()

#### Search by date ####
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
    * "First response" in startInDay() - find the issues whose stopwatch has started today.
    * "First response" in startInDay("-1") - find the issues whose stopwatch started yesterday(1 day ago).
    * "First response" in startInDay("-7") - find the issues whose stopwatch started a week ago(7 days ago).


* **"field name" in searchByStartDate("condition", "date")** - Search for issues by the date when the stopwatch was first started.
* **"field name" in searchByPausedDate("condition", "date")** - Search for issues by the date when the stopwatch was last paused.
* **"field name" in searchByStopDate("condition", "date")** - Search for issues by the date when the stopwatch was stopped.


* date - date in 'yyyy-MM-dd' or 'yyyy-MM-dd HH:mm' format
* **Examples:**
    * "First response" in searchByStartDate(">", "2021-01-01") - issues for which stopwatch started after "2021-01-01"

* **"field name" in startInDateRange("date","date")** - Search for issues by the date when the stopwatch was started (duration).
* **"field name" in stopInDateRange("date","date")** - Search for issues by the date when the stopwatch was stopped (duration).


* **Examples:**
    * "First response" in stopInDateRange("2020-01-01", "2021-01-01") - issues for which stopwatch stopped during 2020.


#### Search by time ####

* **"field name" in timeSpent("condition","time")** - Search by time in timer fields(by total time spent). Time value from index.
* **"field name" in realTimeSpent("condition","time")** - Search by real time in timer fields(by total time spent). Time value calculate realtime.
* **"field name" in pauseTime("condition","time")** - Search by pause time in timer and stopwatch fields.
* **"field name" in realPauseTime("condition","time")** - Search by real pause time in timer and stopwatch fields.

* **Examples:**
    * "First response" in realTimeSpent(">", "20m")
    * "First response" in realPauseTime("<", "20m")

#### Other ####
* **"field name" in searchByRestartCount("condition","number")** - Search for issues by the stopwatch count of restart.
* **"field name" in searchByCalendar("number")** - Search issues by calendar id.
* **"field name" in searchByStopwatchConfig("number")** - Search issues by stopwatch config id.
* **"field name" in searchByStopwatchScheme("number")** - Search issues by stopwatch scheme id.

<hr>


## *Timer* ##
If there is a configured "Timer" field, the following search functions are available for it.<br>
You can check the field type with the administrator <br>

#### Search by state ####
* **"field name" in isRunning()** - Search issues by running timer.
* **"field name" in isPaused()** - Search issues by paused timer.
* **"field name" in isCompleted()** - Search issues by completed timer.
* **"field name" in isFailed()** - Search issues by failed timer.
* **"field name" in isFailedRealTime()** - Search issues by failed timer.
  * It takes into account not only the state of the timer after stopping(FAILED/COMPLETED), but also active timers that have run out of time but state is RUNNING.

* **Examples:**
    * "First response" in isFailed()
    * "First response" in isCompleted()

#### Search by date ####
* **"field name" in startInDay("number")** - Search for issues by the day when the timer was first started.
* **"field name" in startInWeek("number")** - Search for issues by the week when the timer was first started.
* **"field name" in startInMonth("number")** - Search for issues by the month when the timer was first started.

* **"field name" in stopInDay("number")** - Search for issues by the day when the timer was stopped.
* **"field name" in stopInWeek("number")** - Search for issues by the week when the timer was stopped.
* **"field name" in stopInMonth("number")** - Search for issues by the month when the timer was stopped.

* failInDay/week/month -  function shows even running timers, taking into account the estimated completion date. It also shows timers that have "failed" date +-N from the current day.
* **"field name" in failInDay("number")** - Search for issues by the day when the timer was failed.
* **"field name" in failInWeek("number")** - Search for issues by the week when the timer was failed.
* **"field name" in failInMonth("number")** - Search for issues by the month when the timer was failed.

* **"field name" in pauseInDay("number")** - Search for issues by the day when the timer was paused.
* **"field name" in pauseInWeek("number")** - Search for issues by the week when the timer was paused.
* **"field name" in pauseInMonth("number")** - Search for issues by the month when the timer was paused.

* **Examples:**
    * "First response" in failInDay() - find issues which time in "First response" timer run out or will run out today
    * "First response" in failInDay("-1") - find issues which time in "First response" timer run out yesterday (1 day ago)
    * "First response" in failInDay("-7") - find issues which time in "First response" timer run out a week ago(7 days ago)
    * "First response" in failInDay("7") - find issues which time in "First response" timer will run out in a week(in 7 days) 
    

* **"field name" in searchByStartDate("condition", "date")** - Search for issues by the date when the timer was first started.
* **"field name" in searchByPausedDate("condition", "date")** - Search for issues by the date when the timer was last paused.
* **"field name" in searchByStopDate("condition", "date")** - Search for issues by the date when the timer was stopped.
* **"field name" in searchByFailDate("condition", "date")** - Search for issues by the date when the timer was failed.

* date - date in 'yyyy-MM-dd' or 'yyyy-MM-dd HH:mm' format
* **Examples:**
    * "First response" in searchByStartDate(">", "2021-01-01") - issues for which timer started after "2021-01-01"

* **"field name" in startInDateRange("date","date")** - Search for issues by the date when the timer was started (duration).
* **"field name" in stopInDateRange("date","date")** - Search for issues by the date when the timer was stopped (duration).
* **"field name" in failInDateRange("date","date")** - Search for issues by the date when the timer was failed (duration).

* **Examples:**
    * "First response" in failInDateRange("2020-01-01", "2021-01-01") - issues for which the timer has exceeded its time during 2020.


#### Search by time ####

* **"field name" in pauseTime("condition","time")** - Search by pause time in timer and stopwatch fields.
* **"field name" in realPauseTime("condition","time")** - Search by real pause time in timer and stopwatch fields.
* **"field name" in timeLeft("condition","time")** - Search by time left in timer fields.
* **"field name" in timeSpent("condition","time")** - Search by time in timer fields(by total time spent). Time value from index.
* **"field name" in realTimeSpent("condition","time")** - Search by real time in timer fields(by total time spent). Time value calculate realtime.

* **Examples:**
    * "First response" in realTimeSpent(">", "20m")
    * "First response" in timeLeft("<", "20m")

#### Other ####
* **"field name" in searchByZeroGoalTime()** - Search for issues by zero goal time.
* **"field name" in searchByRestartCount("condition","number")** - Search for issues by the timer count of restart.
* **"field name" in searchByGoal("number")** - Search issues by timer goal id.
* **"field name" in searchByCalendar("number")** - Search issues by calendar id.
* **"field name" in searchByTimerConfig("number")** - Search issues by timer config id.
* **"field name" in searchByTimerScheme("number")** - Search issues by timer scheme id.






