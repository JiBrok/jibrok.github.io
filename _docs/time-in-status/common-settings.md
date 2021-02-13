---
title: Common settings
key: time-in-status
---

В этом меню собраны общие настройки плагина которые влияют на большое количество функционала.

All settings:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/common-settings/common-settings.png"><img src="/uploads/time-in-status/common-settings/common-settings.png" alt="" width="50%"/></a></p>
### System user ###

Некоторые функции в плагине выполняются в фоновом режиме. 
По умолчанию эти действия выполняются анонимно.
Здесь вы можете опционально установить пользователя который будет фигурировать как автор действий.

* Timer notifications - от имени указанного пользователя будут приходить уведомления.
* [Autotrack](/docs/time-in-status/autotrack/) - запуск и остановка таймеров. Пользователь записывается в истории изменений issue.

### Notifications ###

Плагин умеет отправлять уведомления при срабатывании тригеров у таймеров и секундомеров, когда заканчивается время у таймера и в других ситуациях. 
Разные типы событий обрабатываются по разному, это зависит от реализации обработчика. Так например Листенеры в ScriptRunner и Automation for Jira работают по разному.
Чтобы события(уведомления) из плагина могли обрабатываться любым плагином, он(плагин) реализует два механизма отправки событий:
* IssueEvent - ScriptRunner, MyGroovy, some plugins.
* IssueEventBundle - Send email notifications, Automation for Jira, Slack, some plugins.

Вы можете включить оба механизма, они потребляют не очень большое количество ресурсов.





