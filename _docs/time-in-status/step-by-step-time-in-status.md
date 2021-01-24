---
title: step-by-step-time-in-status
key: time-in-status
---

Функционал времени в статусе делится на две части.
Первая это общие поисковые функции для работы которых не требуется дополнительной настройки.
Они работают сразу после установки плагина.

Common
issue in timeInStatus("","","") - Search issues by time in status. Params: statuses(name or id, Comma separated), condition, time
issue in timeInStatusByJql("","","","") - Search issues by time in status. Params: jql, statuses(name or id, Comma separated), condition, time
issue in timeInStatusByJqlAndWorkCalendar("","","","","") - Search issues by time in status. Params: jql, statuses(name or id, Comma separated), condition, time, workCalendar(name or id)

Эти функции представлены в пользовательской справке. TODO

Администратор Jira может настроить работу этих функций: настроить производительность и количество обрабатываемых значений в реальном времени. Так же можно настроить ограниченный доступ к этим поисковым функциям.

Вторая часть это работа со временем через настроенные поля. 
Каждое поле может считать сколько времени задача провела в указанных статусе или статусах. Статусы указываются в настройках поля.
Поля хранят промежуточные значения в индексах и быстрее обрабатываются при поиске в реальном времени.
В поле можно указать контексты выполнения, указать дополнительные опции для расчета времени, настроить отображение и доступ к значению.
По полям "Время в статусе" так же можно сортировать задачи, строить отчеты и экспортировать их.

Создайте новое поле "Time in status", Then set contexts and screens.

TODO
* [Atlassian Guide: Adding a custom field](https://confluence.atlassian.com/adminjiraserver/adding-a-custom-field-938847222.html)
* [Atlassian Guide: Configuring a custom field](https://confluence.atlassian.com/adminjiraserver/configuring-a-custom-field-938847235.html)


После создания поля перейдите в его настройки 

Укажите статусы в которых вы хотите посчитать время. Сохраните настройки. Для работы поиска нужно так же запустить реиндкс для jira или для проекта. 
Детальнее про настройки поля.

После реиндекса будут доступны функции поиска для полей

time in status
in active() - Search by active time in status fields(issue in selected statuses)
in inactive() - Search by inactive time in status fields(issue not in selected statuses)
in time("","") - Search by time in status fields(by total time in selected statuses)/Timer field. Time value from index.
in realTime("","") - Search by time in status fields(by total time in selected statuses)/Timer field. Time value calculate realtime.
in realTimeBetween("","") - Search by realtime in status fields(by total time in selected statuses). Time value calculate realtime.

Эти функции представлены в пользовательской справке. TODO