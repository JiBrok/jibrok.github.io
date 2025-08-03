---
title: Timer config
key: time-in-status
excerpt: Configure timer behavior including calculation types, event triggers, goal management, and notification settings for comprehensive time tracking automation.
---

The configuration is responsible for the stopwatch operation algorithm When should he start the countdown, when should he stop, for what time should he be started, according to what working calendar should the time be counted.<br>
[⭐️Timers and Stopwatches - Schemes and configurations](/docs/time-in-status/timers-and-stopwatches-schemes-and-configurations/)

* Open {baseUrl}/secure/jibrokAllTimerConfigs.jspa <br>
  Or<br>
  **gg** + "**Timer configs**"
  
[comment]: <> (TODO tutorials)

* All timer configs are available in this interface. From here you can create, edit and delete config.<br>
  <p style="text-align: center;"><a href="/uploads/time-in-status/timer-configs/1.webp" target="_blank"><img src="/uploads/time-in-status/timer-configs/1.webp" style="width:100%" loading="lazy"></a></p>

* Click on button "Add timer configuration"<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/timer-configs/2.webp" target="_blank"><img src="/uploads/time-in-status/timer-configs/2.webp" style="width:100%" loading="lazy"></a></p>

* Name - for navigation
* Calculate type - after the timer stops, in the event of a restart. The timer will not start. It will restart and delete the previous value. It will be restarted and leave the previous values in the archive.
    * First start - The timer will be started only 1 time. It will not restart. After the timer stops, its value is completely fixed.
    The timer ignores restart events.
    * Last start - The timer after restarting deletes its previous value. The timer always has 1 value that indicates the time of the last start.
    * Calculate all start and create archive - The timer after each restart saves the current timer to the archive and starts a new countdown. If the timer is restarted several times, all values and resolutions of the timers are saved.
* Allow change goal after start - When the timer starts for the first time, it sets a target that is current at the current time. When subsequent events are triggered, the target will specify, which can lead to a re-calculation of time.
* Update goal with issue update - The timer will respond to all changes in the task and will refine the goal.
* Events - issue events to which the timer responds with a specific command. General information
* Throwable events - When a issue changes its state, the timer can generate a separate event.
* Notifications - the timer will send a notification when X% of the time has passed or X minutes left until the end.

[comment]: <> (TODO <div class="uk-alert-note" data-uk-alert="">)
[comment]: <> (When you fire an event, it can be caught by the Simple notification plugin. See more filters)
[comment]: <> (</div>)

