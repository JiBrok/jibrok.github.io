---
title: Performance settings - JQL
key: time-in-status
---

**{baseUrl}/secure/jibrokJqlConfig!default.jspa**

or from admin search

gg + jql config

<p style="text-align: center;"><a href="/uploads/time-in-status/performance-config-jql/performance-config-jql.png"><img src="/uploads/time-in-status/performance-config-jql/performance-config-jql.png" alt="" width="300"/></a></p>


All settings:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/performance-config-jql/performance-config-jql-2.png"><img src="/uploads/time-in-status/performance-config-jql/performance-config-jql-2.png" alt="" width="300"/></a></p>


### The search uses two mechanisms for working with counter values. ###
* The first works with indexes. It is fast on any amount of data. But this data is current at the time the indexes were created. In the case of running time counters, a difference appears between the value stored in the index and the real one.
* The second mechanism works with real data. It is noticeably slower than working with indexes. It is artificially limited in the amount of processed data. But it works with real, relevant data now. Where possible, but works with indexes.

These settings include restrictions for functions that are calculated in real time(2).

### Function access ###
Allows specified users access to functions. If you leave the fields empty, then all users will have access. The function does not disappear from the selection, but when executed returns an IMG warning


* **issue in timeInStatus("statuses", "condition", "time")** - Найти задачи которые провели в статусах указанное время.
* **issue in timeInStatusByJql("jql", "statuses", "condition", "time")** - Найти задачи из jql запроса которые провели в статусах указанное время.
* **issue in timeInStatusByJqlAndWorkCalendar("jql", "statuses", "condition", "time", "calendar")** - Найти задачи из jql запроса которые провели в статусах указанное рабочее время. Рабочее время будет рассчитанно по указанному календарю.

Эти функции представлены в [пользовательской справке](/docs/time-in-status/user-help-info/).

### Cache ###

The flag connects caching to the field and panel. It will not affect the display speed of the field. But it significantly accelerates the work with the field via the JQL, in the case of repeated request for data within one minute. When this option is enabled, the time is displayed accurate to the minute.

### Count limit - optimally in the region of 10-30 thousand (for 1 thread) ###

Max count jql functions (global and field queries) For real-time functions, sets a limit. The maximum number of tasks that are calculated according to the condition specified in the function.<br>
Эта настройка тесно связана с [настройками многопоточности](/docs/time-in-status/performance-config-multithreading/).

### Ignore count limit ###

Users for whom restriction is ignored. It may come in handy if jql is run through scripts, system users, data collection systems and reporting.