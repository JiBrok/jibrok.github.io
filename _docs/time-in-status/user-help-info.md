---
title: user-help-info
key: time-in-status
---

Данная справка доступа из jira
Возможно вам понадобится рабочий календарь. Их список в системе можно посмотреть по ссылке 

Common
issue in timeInStatus("","","") - Search issues by time in status. Params: statuses(name or id, Comma separated), condition, time
issue in timeInStatusByJql("","","","") - Search issues by time in status. Params: jql, statuses(name or id, Comma separated), condition, time
issue in timeInStatusByJqlAndWorkCalendar("","","","","") - Search issues by time in status. Params: jql, statuses(name or id, Comma separated), condition, time, workCalendar(name or id)

Compare fields
issue in compareFields("","","") - Field comparison function. Finds tasks in which fields match a condition.
issue in compareFieldsByJql("","","","") -  Field comparison function. Finds tasks in which fields match a condition and jql.

autotrack
issue in myAutoTrackTickets() -  Возвращает задачи пользователя с настроенным автоматическим запуском таймеров или секундомеров.

time in status 
in active() - Search by active time in status fields(issue in selected statuses)
in inactive() - Search by inactive time in status fields(issue not in selected statuses)
in time("","") - Search by time in status fields(by total time in selected statuses)/Timer field. Time value from index.
in realTime("","") - Search by time in status fields(by total time in selected statuses)/Timer field. Time value calculate realtime.
in realTimeBetween("","") - Search by realtime in status fields(by total time in selected statuses). Time value calculate realtime.

timer
in searchByZeroGoalTime() - Search for issues by zero goal time.
in searchByRestartCount("","") - Search for issues by the timer count of restart. 

in startInDay("") - Search for issues by the day when the timer was first started.
in startInWeek("") - Search for issues by the week when the timer was first started.
in startInMonth("") - Search for issues by the month when the timer was first started.

in stopInDay("") - Search for issues by the day when the timer was stopped.
in stopInWeek("") - Search for issues by the week when the timer was stopped.
in stopInMonth("") - Search for issues by the month when the timer was stopped.

in failInDay("") - Search for issues by the day when the timer was failed.
in failInWeek("") - Search for issues by the week when the timer was failed.
in failInMonth("") - Search for issues by the month when the timer was failed.

in pauseInDay("") - Search for issues by the day when the timer was paused.
in pauseInWeek("") - Search for issues by the week when the timer was paused.
in pauseInMonth("") - Search for issues by the month when the timer was paused.

in searchByStartDate() - Search for issues by the date when the timer was first started.
in searchByPausedDate() - Search for issues by the date when the timer was last paused.
in searchByStopDate() - Search for issues by the date when the timer was stopped.
in searchByFailDate() - Search for issues by the date when the timer was failed.

in startInDateRange("","") - Search for issues by the date when the timer was started (duration).
in stopInDateRange("","") - Search for issues by the date when the timer was stopped (duration).
in failInDateRange("","") - Search for issues by the date when the timer was failed (duration).

in isRunning() - Search issues by running timers.
in isPaused() - Search issues by paused timers.
in isStopped() - Search issues by stopped timers.
in isCompleted() - Search issues by completed timers.
in isFailed() - Search issues by failed timers.

in searchByGoal("") - Search issues by timer goal id.

in pauseTime("","") - Search by pause time in timer and stopwatch fields.
in realPauseTime("","") - Search by real pause time in timer and stopwatch fields.
in timeLeft("","") - Search by time left in timer fields.
in timeSpent("","") - Search by time in timer fields(by total time spent). Time value from index.
in timeSpent("","") - Search by time in timer fields(by total time spent). Time value from index.
in realTimeSpent("","") - Search by real time in timer fields(by total time spent). Time value calculate realtime.
in searchByCalendar("") - Search issues by calendar id.
in searchByTimerConfig("") - Search issues by timer config id.
in searchByStopwatchConfig("") - Search issues by Stopwatch config id.
in searchByTimerScheme("") - Search issues by timer scheme id.
in searchByStopwatchScheme("") - Search issues by stopwatch scheme id.



Time seracher
in searchByTime("","")
in searchByTimeBetween("","")




В зависимости от поля в нем будут доступен один из слудющих списков посиковых функций

Для Time in status
Для Stopwatch
Для Timer






