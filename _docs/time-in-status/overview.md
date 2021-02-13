---
title: Overview
key: time-in-status
---

<p style="text-align: center;"><a href="https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=datacenter&tab=overview"><img src="/uploads/time-in-status/overview/marketplace.png" style="width:600px;"/></a></p>

<p style="text-align: center;">View app on <a href="https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=datacenter&tab=overview">Atlassian Marketplace</a></p>
## Welcome to Time in status | SLA | Timer | Stopwatch!


The issue (task, work) in the process of solving goes through various stages. It is necessary to take into account and control the time spent at each stage.

To calculate time in different scenarios, the plugin provides a set of fields, functions for searching, reports and access to api.


### Fields: ###
* Time in status field
    * A field that shows the time spent in the selected statuses. Оно простое в использовании и служит для решения типичных проблем - подсчет времени в статусе - Сколько времени задача была открыта? Сколько времени задача была в работе? Сколько времени она ожидала реакции? ...  
* Stopwatch field
    * Tracks the time between events. Events can be as simple as creating a task, commenting. So are more complex ones - increasing priority, changing status to a specific, first appointment. Поле очень гибкое в настройках и позволяет узнать время между практически любыми событиями с задачей. 
* Timer field
    * Основано на секундомере и дополнено функциями обратного отсчета.
    * During startup, it is set for a certain time (5 minutes, 4 hours) and then shows the remaining time. Reacts to events (TODO). And depending on the settings, it starts the timer or stops. The initial time is determined by the jql condition.
    * Доступа отправка уведомления заранее или по истечению времени.

У всех полей большое количество функций для поиска информации с помощью jql в реальном времени.
Все поля умеют считать как новые данные, так и рассчитывать время на основе истории запросов.  
Все поля имеют большое количество настроек для отображения и прав доступа.

<table>
<tr>
<td><a href="/uploads/time-in-status/overview/fields-example-2.png"><img src="/uploads/time-in-status/overview/fields-example-2.png" style="width:600px;"/></a></td>
<td><a href="/uploads/time-in-status/overview/fields-example-1.png"><img src="/uploads/time-in-status/overview/fields-example-1.png" style="width:600px;"/></a></td>
</tr>
</table>

### Business calendar: ###

The plugin can calculate the time according to the configured calendars. In fields and jql there are corresponding settings.
Вы можете создавать неограниченное количество календарей и использовать в любых контекстах и проектах. 
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/calendar-example.png"><img src="/uploads/time-in-status/overview/calendar-example.png" style="width:600px;"/></a></p>

### Отчеты: ###
В каждой задаче доступны детальные отчеты о времени, переходах между статусами и исполнителях. Их можно скачивать прямо из интерфейса задачи. 
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/issue-report.png"><img src="/uploads/time-in-status/overview/issue-report.png" style="width:600px;"/></a></p>

Создавайте отчеты по jql с группировкой по любым полям или jql запросам. В отчетах доступы различные функции для расчета значений(среднее, перцентили...).
Отчеты будут доступны для просмотра по ссылке.

<table>
<tr>
<td><a href="/uploads/time-in-status/overview/reports-example-2.png"><img src="/uploads/time-in-status/overview/reports-example-2.png" style="width:600px;"/></a></td>
<td><a href="/uploads/time-in-status/overview/reports-example-1.png"><img src="/uploads/time-in-status/overview/reports-example-1.png" style="width:600px;"/></a></td>
</tr>
</table>


### И другое ###
* Настройка производительности, прав доступа, отображения.
* Вспомогательные инструменты для интеграции с другими плагинами или экспорта данных.
* Автоматические записи времени в worklog
* Функции для сравнения полей в jql
* ...


[Get started](/docs/time-in-status/get-started/)