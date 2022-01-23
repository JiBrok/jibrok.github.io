---
title: Restore timer and stopwatch by issue history
key: time-in-status
---

You can restore or recalculate the value of timers and stopwatches based on the issue history.
Timers and stopwatches process events (triggers) in real time and record changes.

This utility analyzes the history of requests and finds a match between the entry in the history and the trigger from the timer or stopwatch configuration.
And based on this analysis, it gives the current value of the counter based on the history of the issue. Further, this counter will work as before - process triggers in real time.

<p style="text-align: center;"><a href="/uploads/time-in-status/restore-by-history/1.png"><img src="/uploads/time-in-status/restore-by-history/1.png" alt="" width="100%"/></a></p>

The administrator specifies the JQL and fields for validation. Then one of three actions is performed:
* Find tasks whose data does not match the history. The reasons for the differences can be very different: errors, problems with the server, incorrect configuration, etc. As a result, requests with "incorrect" values will be shown and the error will be indicated.
* Find tasks with an error in the data and immediately replace the current values with new ones.
* Or, without analysis, simply calculate and set a new value. For example, if there was never a value in the task.







