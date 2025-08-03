---
title: Performance settings - JQL
key: time-in-status
excerpt: Configure JQL performance settings including function access controls, cache settings, and count limits to optimize Time in Status plugin queries.
---

**{baseUrl}/secure/jibrokJqlConfig!default.jspa**

or from admin search

gg + jql config

<p style="text-align: center;"><a href="/uploads/time-in-status/performance-config-jql/performance-config-jql.webp" target="_blank">
<img src="/uploads/time-in-status/performance-config-jql/performance-config-jql.webp" alt="screenshot" width="50%" loading="lazy"></a></p>


All settings:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/performance-config-jql/performance-config-jql-2.webp" target="_blank">
<img src="/uploads/time-in-status/performance-config-jql/performance-config-jql-2.webp" alt="screenshot" width="50%" loading="lazy"></a></p>


### The search uses two mechanisms for working with counter values. ###
* The first works with indexes. It is fast on any amount of data. But this data is current at the time the indexes were created. In the case of running time counters, a difference appears between the value stored in the index and the real one.
* The second mechanism works with real data. It is noticeably slower than working with indexes. It is artificially limited in the amount of processed data. But it works with real, relevant data now. Where possible, but works with indexes.

These settings include restrictions for functions that are calculated in real time(2).

### Function access ###
Allows specified users access to functions. If you leave the fields empty, then all users will have access. The function does not disappear from the selection, but when executed returns an IMG warning


* **issue in timeInStatus("statuses", "condition", "time")** - Find issues that have spent the specified time in statuses.
* **issue in timeInStatusByJql("jql", "statuses", "condition", "time")** - Find issues from a jql request that have spent the specified time in statuses.
* **issue in timeInStatusByJqlAndWorkCalendar("jql", "statuses", "condition", "time", "calendar")** - Find issues from a jql request that spent the specified working time in statuses. Working hours will be calculated according to the specified calendar.

These functions are presented in [user help](/docs/time-in-status/user-help-info/).

### Cache ###

The flag connects caching to the field and panel. It will not affect the display speed of the field. But it significantly accelerates the work with the field via the JQL, in the case of repeated request for data within one minute. When this option is enabled, the time is displayed accurate to the minute.

### Count limit - optimally in the region of 10-30 thousand (for 1 thread) ###

Max count jql functions (global and field queries) For real-time functions, sets a limit. The maximum number of tasks that are calculated according to the condition specified in the function.<br>
This setting is closely related to [multithreading settings](/docs/time-in-status/performance-config-multithreading/).

### Ignore count limit ###

Users for whom restriction is ignored. It may come in handy if jql is run through scripts, system users, data collection systems and reporting.