---
title: Autotrack settings
key: time-in-status
excerpt: "Configure automatic timer and stopwatch start/stop based on user login status, idle time, and JQL conditions for seamless time tracking."
---

As a Jira administrator, you can configure to automatically stop and start timers or stopwatches when a user logs in or out.

<p style="text-align: center;"><a href="/uploads/time-in-status/autotrack/1.webp"><img src="/uploads/time-in-status/autotrack/1.webp" style="width:100%;" loading="lazy"></a></p>

It works as follows.

The settings indicate:
* Users
* JQL (including sorting!).
* Fields(Timers and Stopwatches) to be stopped or started.
* Idle time in minutes.
* and other settings.


<p style="text-align: center;"><a href="/uploads/time-in-status/autotrack/2.webp"><img src="/uploads/time-in-status/autotrack/2.webp" style="width:50%" loading="lazy"></a></p>

Further:
* When a user logs into Jira, a JQL issue search is performed. The **first task is taken (sorting is important)** in it timers and stopwatches are started on behalf of the user.
* When a user has been inactive in Jira for more than a time or logged out, JQL Issues are searched again. No more than 20 first tasks are taken from the result and timers and stopwatches are paused.






