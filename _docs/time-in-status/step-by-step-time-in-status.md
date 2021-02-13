---
title: 📖 Step by step - Time in status
key: time-in-status
---

Функционал времени в статусе делится на две части.

Первая это общие поисковые функции для работы которых не требуется дополнительной настройки.
Они работают сразу после установки плагина.

#### Common #### 
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

Эти функции представлены в [пользовательской справке](/docs/time-in-status/user-help-info/).

Администратор Jira может настроить работу этих функций: настроить производительность и количество обрабатываемых значений в реальном времени. Так же можно настроить ограниченный доступ к этим поисковым функциям.
[Performance config JQL](/docs/time-in-status/performance-config-jql/)

Вторая часть это работа со временем через настроенные поля "Time in status". 

<p>
Каждое поле может считать сколько времени задача провела в указанных статусе или статусах. Статусы указываются в настройках поля.
Поля хранят промежуточные значения в индексах и быстрее обрабатываются при поиске в реальном времени.
В поле можно указать контексты выполнения, указать дополнительные опции для расчета времени, настроить отображение и доступ к значению.
По полям "Время в статусе" так же можно сортировать задачи, строить отчеты и экспортировать их.
</p>

* [About fields](/docs/time-in-status/about-fields/)
* [More about Time in status field](/docs/time-in-status/time-in-status-field/)


### 1. Создайте новое поле "Time in status", Then set contexts and screens. ###

* [Atlassian Guide: Adding a custom field](https://confluence.atlassian.com/adminjiraserver/adding-a-custom-field-938847222.html)
* [Atlassian Guide: Configuring a custom field](https://confluence.atlassian.com/adminjiraserver/configuring-a-custom-field-938847235.html)


### 2. После создания поля перейдите в его настройки: ###
1. <a href="/uploads/time-in-status/step-by-step-time-in-status/fields.png"><img src="/uploads/time-in-status/step-by-step-time-in-status/fields.png" alt="time in status fields" width="50%"/></a>
2. <a href="/uploads/time-in-status/step-by-step-time-in-status/field-config.png"><img src="/uploads/time-in-status/step-by-step-time-in-status/field-config.png" alt="time in status field config" width="50%"/></a>
3. <a href="/uploads/time-in-status/step-by-step-time-in-status/time-in-status-config.png"><img src="/uploads/time-in-status/step-by-step-time-in-status/time-in-status-config.png" alt="time in status field config" width="50%"/></a>


Укажите статусы в которых вы хотите посчитать время и сохраните настройки. Для работы поиска нужно так же запустить реиндкс для jira или для проекта. 
[Search indexing](https://confluence.atlassian.com/adminjiraserver/search-indexing-938847710.html)

После реиндекса будут доступны функции поиска для полей

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

Эти функции представлены в [пользовательской справке](/docs/time-in-status/user-help-info/). 