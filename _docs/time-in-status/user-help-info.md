---
title: User JQL help
key: time-in-status
---

Доступные JQL функции для работы со временем и примеры их использования.

1. Данная справка доступа из jira из меню помощи:
<p style="text-align: center;"><a href="/uploads/time-in-status/user-help-info/help-link.png"><img src="/uploads/time-in-status/user-help-info/help-link.png" alt="work calendars" width="150"/></a></p>
   
2. Возможно вам понадобится рабочий календарь. Их список в системе можно посмотреть по ссылке из меню помощи или по ссылке *{baseUrl}*/secure/jibrokAllCalendars!default.jspa:

<p style="text-align: center;"><a href="/uploads/time-in-status/user-help-info/work-calendars.png"><img src="/uploads/time-in-status/user-help-info/work-calendars.png" alt="work calendars" width="150"/></a></p>

<hr>

## Аргументы используемые в функциях. ## 

<div class="uk-alert-note" data-uk-alert="">
<b>Time</b> - строка указывающая время, в случае неверного формата будет выведено сообщение с подсказками.<br>
<br>
"5h35m12s" - 5 hours 35 minutes 12 seconds<br>
"5h12s" - 5 hours 12 seconds<br>
3000m - 3000 minutes<br>
"0", "0s" ... - time is zero.
</div>


<div class="uk-alert-note" data-uk-alert="">
<b>Condition</b> - условие для сравнения величин. <br>
"<=", "<", "=", ">", ">=" 

</div>

<hr>

## *Common* ##

### Time in status ###
Функции для поиска задач по времени проведенном в статусах.
Эти функции, как правило, доступны всегда. Если нет, пожалуйста, обратитесь в администратору Jira. 

* **issue in timeInStatus("statuses", "condition", "time")** - Найти задачи которые провели в статусах указанное время.
    * Params:
    * statuses - name or id, Comma separated
* **issue in timeInStatusByJql("jql", "statuses", "condition", "time")** - Найти задачи из jql запроса которые провели в статусах указанное время.
    * Params: 
    * jql - query for filter tasks
    * statuses - name or id, Comma separated
* **issue in timeInStatusByJqlAndWorkCalendar("jql", "statuses", "condition", "time", "calendar")** - Найти задачи из jql запроса которые провели в статусах указанное рабочее время. Рабочее время будет рассчитанно по указанному календарю.
    * Params:
    * jql - query for filter tasks
    * statuses - name or id, Comma separated
    * calendar - work calendar name or id for calculate work time


* **Examples:**
    * issue in timeInStatus("Done, In Progress", ">", "8h")
    * issue in timeInStatusByJqlAndWorkCalendar("project = TEST", "Done", ">", "3h", "General calendar")

* Если указывается несколько статусов, то поиск происходит по сумме времени проведенном в указанных статусах.
* Название статусов чувствительно к регистру. В случае не соответствия названия функция подскажет правильные варианты написания статуса.
* Для поиска по разным статусам используйте условия "OR" и "AND": issue in timeInStatus("status A", ">", "time") or issue in timeInStatus("status B", ">", "time")
* По возможности используйте функции с jql. Они сужают поиск и быстрее выполняются. 



### Compare fields ###
Функции позволяющие сравнивать разные поля между собой. Функция работает с "числовыми", "строковыми" и "временными" полями.
Возвращает задачи поля которых удовлетворяют условию.

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
    
* По возможности используйте функции с jql. Они сужают поиск и быстрее выполняются.
* В случае строковых полей функция попытается привести строку к числу для корректного сравнения.


### Autotrack ###

Работает если для вас подключена функция автоматического трекинга времени.  

* **issue in myAutoTrackTickets()** -  Возвращает задачи пользователя с настроенным автоматическим запуском таймеров или секундомеров.

<hr>

## *Time in status (field)* ## 

Если есть настроенное поле "Time in status", то для него доступны следующие поисковые функции.<br>
Тип поля вы можете уточнить у администратора <br>

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
Если есть настроенное поле "Stopwatch", то для него доступны следующие поисковые функции.<br>
Тип поля вы можете уточнить у администратора <br>

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
    * "First response" in startInDay() - найти задачи у которых сегодня запустился секундомер.
    * "First response" in startInDay("-1") - найти задачи у которых вчера(1 день назад) запустился секундомер.
    * "First response" in startInDay("-7") - найти задачи у которых неделю назад(7 день назад) запустился секундомер.


* **"field name" in searchByStartDate("condition", "date")** - Search for issues by the date when the stopwatch was first started.
* **"field name" in searchByPausedDate("condition", "date")** - Search for issues by the date when the stopwatch was last paused.
* **"field name" in searchByStopDate("condition", "date")** - Search for issues by the date when the stopwatch was stopped.


* date - строка с датой в формате 'yyyy-MM-dd' or 'yyyy-MM-dd HH:mm'
* **Examples:**
    * "First response" in searchByStartDate(">", "2021-01-01") - задачи у которых stopwatch запустился после "2021-01-01"

* **"field name" in startInDateRange("date","date")** - Search for issues by the date when the stopwatch was started (duration).
* **"field name" in stopInDateRange("date","date")** - Search for issues by the date when the stopwatch was stopped (duration).


* **Examples:**
    * "First response" in stopInDateRange("2020-01-01", "2021-01-01") - задачи у которых stopwatch остановился в течении 2020-го года.


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
Если есть настроенное поле "Timer", то для него доступны следующие поисковые функции.<br>
Тип поля вы можете уточнить у администратора <br>

#### Search by state ####
* **"field name" in isRunning()** - Search issues by running timer.
* **"field name" in isPaused()** - Search issues by paused timer.
* **"field name" in isCompleted()** - Search issues by completed timer.
* **"field name" in isFailed()** - Search issues by failed timer.

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






