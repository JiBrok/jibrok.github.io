---
title: Timer - JQL
key: time-in-status
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


## Search functions in the "Timer" field. ##

Work when search engine is connected [Search Templates](https://confluence.atlassian.com/adminjiraserver/configuring-a-custom-field-938847235.html)

<p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-jql/timer-field-searcher.png"><img src="/uploads/time-in-status/timer-field-jql/timer-field-searcher.png" style="width:100%"/></a></p>

## JQL Functions ##


<p style="text-align: center;"><a href="/uploads/time-in-status/timer-field-jql/timer-field-jqls.png"><img src="/uploads/time-in-status/timer-field-jql/timer-field-jqls.png" style="width:50%"/></a></p>

### “Timer field“ in active() ###

* Returns tasks that have a timer is running

* If the timer uses a calendar, the field may indicate that it is not working hours. This does not affect the search if timer is running.

### “Timer field“ in inactive() ###

* Returns tasks that have a timer is pause, failed or completed.

### “Timer field“ in isCompleted() ###

* Returns tasks that have a timer is completed. Those the timer is stopped and the time has not yet ended.

### “Timer field“ in isFailed() ###

* Returns tasks that have a timer is failed. Those the timer is stopped and the time has ended.

### “Timer field“ in isPaused() ###

* Returns tasks that have a timer is paused. Breaks in the work calendar are not considered a pause. But can be displayed in the field as a pause.

### “Timer field“ in isRunning() ###

* Returns tasks that have a timer is running. A break in the working calendar does not affect the search. The timer may be in state running, but at the same time the field will be displayed as a pause state.

### "Timer field" in timeSpent("condition", "time") ###

* Returns tasks for which the timer has already counted the specified time. Those. The timer was active(in state Running) for the specified time.

### "Timer field" in realTimeSpent("condition", "time") ###

* Returns tasks for which the timer has already counted the specified time. Those. The timer was active(in state Running) for the specified time.
* The function works in real time.
* It has a limit on the size of the issue.
* The function is suitable for sampling active counters. Real-time reporting, work queues of tasks with reference to reaction time, execution ...

### "Timer field" in timeLeft("condition", "time") ###

* Returns tasks for which the remaining timer time matches the condition.
* The function works in real time.
* It hasn’t a limit on the size of the issue.
* The function is suitable for sampling active counters. Real-time reporting, work queues of tasks with reference to reaction time, execution ...

### Search by date ###
* **"field name" in startInDay("number")** - Search for issues by the day when the timer was first started.
* **"field name" in startInWeek("number")** - Search for issues by the week when the timer was first started.
* **"field name" in startInMonth("number")** - Search for issues by the month when the timer was first started.

* **"field name" in stopInDay("number")** - Search for issues by the day when the timer was stopped.
* **"field name" in stopInWeek("number")** - Search for issues by the week when the timer was stopped.
* **"field name" in stopInMonth("number")** - Search for issues by the month when the timer was stopped.

* **"field name" in failInDay("number")** - Search for issues by the day when the timer was failed.
* **"field name" in failInWeek("number")** - Search for issues by the week when the timer was failed.
* **"field name" in failInMonth("number")** - Search for issues by the month when the timer was failed.

* **"field name" in pauseInDay("number")** - Search for issues by the day when the timer was paused.
* **"field name" in pauseInWeek("number")** - Search for issues by the week when the timer was paused.
* **"field name" in pauseInMonth("number")** - Search for issues by the month when the timer was paused.

* **Examples:**
    * "First response" in failInDay() - найти задачи у которых вышло или выйдет время по таймеру "First response" сегодня
    * "First response" in failInDay("-1") - найти задачи у которых вышло время по таймеру "First response" вчера(1 день назад)
    * "First response" in failInDay("-7") - найти задачи у которых вышло время по таймеру "First response" неделю назад(7 день назад)
    * "First response" in failInDay("7") - найти задачи у которых вышло или выйдет время по таймеру "First response" через неделю(через 7 дней)


* **"field name" in searchByStartDate("condition", "date")** - Search for issues by the date when the timer was first started.
* **"field name" in searchByPausedDate("condition", "date")** - Search for issues by the date when the timer was last paused.
* **"field name" in searchByStopDate("condition", "date")** - Search for issues by the date when the timer was stopped.
* **"field name" in searchByFailDate("condition", "date")** - Search for issues by the date when the timer was failed.

* date - строка с датой в формате 'yyyy-MM-dd' or 'yyyy-MM-dd HH:mm'
* **Examples:**
    * "First response" in searchByStartDate(">", "2021-01-01") - задачи у которых таймер запустился после "2021-01-01"

* **"field name" in startInDateRange("date","date")** - Search for issues by the date when the timer was started (duration).
* **"field name" in stopInDateRange("date","date")** - Search for issues by the date when the timer was stopped (duration).
* **"field name" in failInDateRange("date","date")** - Search for issues by the date when the timer was failed (duration).

* **Examples:**
    * "First response" in failInDateRange("2020-01-01", "2021-01-01") - задачи у которых таймер превысил свое время в течении 2020-го года.


### "Timer field" in searchByCalendar(“calendarId”) ###

* Returns tasks whose timer uses the specified attribute.

### "Timer field" in searchByGoal(“goalId”) ###

* Returns tasks whose timer uses the specified attribute.
* Id can be found with Jira admin.
  
### "Timer field" in searchByTimerConfig(“timerConfigId”) ###
* Returns tasks whose timer uses the specified attribute.
* Id can be found with Jira admin.

### "Timer field" in searchByTimerScheme(“timerSchemeId”) ###

* Returns tasks whose timer uses the specified attribute.
* Id can be found with Jira admin.