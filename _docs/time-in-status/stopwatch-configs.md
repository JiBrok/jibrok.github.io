---
title: Stopwatch config
key: time-in-status
excerpt: Configure stopwatch behavior algorithms including start/stop triggers, calculation types, working calendars, and JQL conditions for precise time tracking.
---

The configuration is responsible for the stopwatch operation algorithm When should he start the countdown, when should he stop, for what time should he be started, according to what working calendar should the time be counted.<br>
[⭐️Timers and Stopwatches - Schemes and configurations](/docs/time-in-status/timers-and-stopwatches-schemes-and-configurations/)

* Open {baseUrl}/secure/jibrokAllStopwatchConfigs.jspa <br>
Or<br>
**gg** + "**Stopwatch configs**"

* All stopwatch configs are available in this interface. From here you can create, edit and delete config.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-configs/all-configs.png"><img src="/uploads/time-in-status/stopwatch-configs/all-configs.png" style="width:100%"/></a></p>

* Click on button "Add stopwatch configuration"<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/stopwatch-configs/stopwatch-config.png"><img src="/uploads/time-in-status/stopwatch-configs/stopwatch-config.png" style="width:100%"/></a></p>

* Calculate type - after the timer stops, in the event of a restart. The timer will not start. It will restart and delete the previous value. It will be restarted and leave the previous values in the archive.
* Allow change goal after start - When the timer starts for the first time, it sets a target that is current at the current time. When subsequent events are triggered, the target will specify, which can lead to a re-calculation of time.
* Update goal with issue update - The timer will respond to all changes in the task and will refine the goal.
* Events - issue events to which the timer responds with a specific command. General information
* Throwable events - When a issue changes its state, the timer can generate a separate event.

[comment]: <> (TODO <div class="uk-alert-note" data-uk-alert="">)
[comment]: <> (When you fire an event, it can be caught by the Simple notification plugin. See more filters)
[comment]: <> (</div>)


* JQL - if no jql is specified, then the timer will start when start is triggered. Otherwise, it will only start if it matches at least one jql.


