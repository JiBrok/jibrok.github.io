---
title: Auto worklog settings
key: time-in-status
---

Эта настройка позволяет автоматически записывать время таймеров и секундомеров в worklog задачи.<br>
Администратор Jira указывает какой комментарий писать к фиксируемому времени и для какого пользователя.<br>
Опционально указывается нотификация о записи в worklog.<br>
Далее нужно будет подключить эту настройку в конфигурации таймера или секундомера.<br>

All settings:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/worklog-settings/1.png"><img src="/uploads/time-in-status/worklog-settings/1.png" style="width:100%"/></a></p>
<br>

Auto worklog settings:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/worklog-settings/2.png"><img src="/uploads/time-in-status/worklog-settings/2.png" style="width:100%"/></a><br></p>

Работает это следующим образом.<br>
Когда таймер или секундомер останавливаются(STOP or PAUSE) рассчитывается время с последнего запуска счетчика и это время записывается в worklog.
