---
title: Timer and Stopwatch - Public versions soon
tags: tis-cloud
---

We have submitted two new applications for Atlassian approval. We expect the apps to be available within 2 weeks.

* **Stopwatch** 
  * [link on server config](https://jibrok.com/docs/time-in-status/stopwatch-configs/) - it looks a lot like the cloud version
  * Calculate the time between events (actions) that occurred with the task. Very flexible settings allow you to calculate almost any time intervals in the life of the task. Fields can also be combined in calculations for extremely complex cases.
  * The settings are more complicated than for ["time in status"](https://jibrok.com/docs/tis-cloud/overview/) field, but due to the flexibility and variety of settings, it allows you to calculate a huge number of scenarios.
    * Calculates the time between events (issue creation, commenting, setting a value in fields, transition to a status …)
        * For example, start the report when creating an issue and stop when creating a comment for the author or transition to a status ‘in progress”
  * Suitable for any time measurement. Large number of ready-to-use triggers available in the settings. Ability to start and stop stopwatches manually or via api.
  * Can be configured to run with JQL condition. Runs automatically when a task matches a JQL request.
  * Allows you to work not only with the calculated time but also with time in a pause state.

* **Timer** 
  * [link on server config](https://jibrok.com/docs/time-in-status/timer-configs/) - it looks a lot like the cloud version
  * The field is implemented on the basis of the **stopwatch** and supplemented with a countdown function.
    Limits are set on the basis of data in the task fields.
    * You can specify that for an issue with a critical priority, the timer (for example, the reaction timer) should be set to 20 minutes. And for issues with a lower priority for 1 hour.
  * Calculates the difference (time remaining) between the goal time (limit) and the time between events (like a stopwatch).
    * The issue must be commented within 30 minutes after creation. The timer when creating an issue will be set for 30 minutes and at the same moment will start counting down. The timer will stop the countdown at the moment of creating a comment and fix the value. If more than 30 minutes pass, the timer will show a negative value.
  * Calculates time between events and shows how much time is left of the initial time(Goal time - time between events)
  * Time limits (target time) are set by jql conditions.
  * Allows to work not only with calculated time but also with the time in a pause state, remaining time and the time spent beyond the limits.

* [Timers and Stopwatches - General information](https://jibrok.com/docs/time-in-status/timers-and-stopwatches-general-information/)