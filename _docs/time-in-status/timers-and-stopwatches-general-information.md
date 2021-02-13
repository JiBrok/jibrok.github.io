---
title: ⭐️Timers and Stopwatches - General information
key: time-in-status
---


Fields and settings for tracking time in a task.

* Timer - during startup, it is set for a certain time (5 minutes, 4 hours) and then shows the remaining time.
* Stopwatch - during start, it is set to zero, and then it shows the elapsed time since the start.

Both types work in a similar way and are needed for a visual representation of the operating time.

Timers and stopwatch are controlled by the following commands:

* START - starts a new countdown or starts a paused one.
* RESTART - restarts the count again. Depending on the settings, the old value will either be erased or archived.
* PAUSE - pauses the countdown. The countdown will resume after the start action
* STOP - stops the countdown. The time value after the stop is considered final. After this command, the countdown can only be restarted with the RESTART command

Commands can be sent automatically (for example, when changing status), from api or manually.

<div class="uk-alert-warning" data-uk-alert="">
When a condition is triggered for a command that does not actually change the state (PAUSE to PAUSE), all other triggers will be ignored.

For example: trigger START when “change status from STATUS1" and  trigger PAUSE when “change status to STATUS1". When the transition from STATUS1 to STATUS1(the same) then the state will remain the same (PAUSE).
</div>

<div class="uk-alert-note" data-uk-alert="">
Recommendation: Simultaneous use of the "FROM STATUS" and "TO STATUS" events can lead to collisions. Try using only "TO STATUS".
</div>


## Timer ## 

Timer may be in the following states:
* RUNNING - is running and there is a countdown.
* PAUSE - the countdown has been suspended by the PAUSE command or the current calendar is not working hours.
* FAILED - the countdown is stopped and the counted time has exceeded the originally set.
* COMPLETED - the countdown is stopped and the timer has not reached zero.

<div class="uk-alert-warning" data-uk-alert="">
If two triggers fire simultaneously, then only the first one is executed in accordance with the order of the commands: Start > Restart > Pause > Stop

For example: When changing status to InProgress, there is a Stop command. And on the set of the assignee is the Start command. If the transition to InProgress is performed with the installation of the assignee, the Start command will be executed.
</div>

<p style="text-align: center;"><a href="/uploads/time-in-status/timers-and-stopwatches-general-information/timer-states.png"><img src="/uploads/time-in-status/timers-and-stopwatches-general-information/timer-states.png" style="width:600px"/></a></p>


## Stopwatch ## 
Stopwatch may be in the following states:
* RUNNING - is running and there is a countdown.
* PAUSE - the countdown has been suspended by the PAUSE command or the current calendar is not working hours.
* STOP - Countdown stopped.

<div class="uk-alert-warning" data-uk-alert="">
If two triggers fire simultaneously, then only the first one is executed in accordance with the order of the commands: Start > Pause > Stop  
</div>

<p style="text-align: center;"><a href="/uploads/time-in-status/timers-and-stopwatches-general-information/stopwatch-states.png"><img src="/uploads/time-in-status/timers-and-stopwatches-general-information/stopwatch-states.png" style="width:600px"/></a></p>
