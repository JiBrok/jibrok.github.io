---
title: stopwatch config
key: time-in-status
---


baseUrl}/secure/jibrokAllStopwatchConfigs.jspa
gg + "All stopwatch configs"
All stopwatch configs are available in this interface. From here you can create, edit and delete config.

The configuration is responsible for the stopwatch operation algorithm When should he start the countdown, when should he stop, for what time should he be started, according to what working calendar should the time be counted
Click on button "Add stopwatch configuration"





* Calculate type - after the timer stops, in the event of a restart. The timer will not start. It will restart and delete the previous value. It will be restarted and leave the previous values in the archive.
* Allow change goal after start - When the timer starts for the first time, it sets a target that is current at the current time. When subsequent events are triggered, the target will specify, which can lead to a re-calculation of time.
* Update goal with issue update - The timer will respond to all changes in the task and will refine the goal.
* Events - issue events to which the timer responds with a specific command. General information
* Throwable events - When a issue changes its state, the timer can generate a separate event.

<div class="uk-alert-note" data-uk-alert="">
When you fire an event, it can be caught by the Simple notification plugin. See more filters
</div>


* JQL - if no jql is specified, then the timer will start when start is triggered. Otherwise, it will only start if it matches at least one jql.
