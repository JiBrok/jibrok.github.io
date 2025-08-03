---
title: Timer and Stopwatch custom events
tags: timer-cloud stopwatch-cloud
---

Custom events became available for timers and stopwatches.
Now with their help you can set up triggers for the timer (start, pause, restart, stop) that will work to a specific change in the field.
<p style="text-align: center;"><a href="/uploads/timer-cloud/customevents/custom-events-menu.webp" target="_blank">
<img src="/uploads/timer-cloud/customevents/custom-events-menu.webp" alt="custom-events-menu screenshot" style="width:100%" loading="lazy"></a></p>


For example, starting a timer when the priority is set to "High".

<p style="text-align: center;"><a href="/uploads/timer-cloud/customevents/custom-event-to-high-priority.webp" target="_blank">
<img src="/uploads/timer-cloud/customevents/custom-event-to-high-priority.webp" alt="custom-event-to-high-priority screenshot" style="width:100%" loading="lazy"></a></p>

Each event contains separate parameters responsible for triggering this event. 
* The field whose value change is to be tracked. It can be any issue field (system field or custom field).
* What action should be tracked with this field.
  * Field value changed from 'value'
  * Field value changed to 'value'
  * The field value has changed from 'value1' to 'value2'.
* Field values to trigger the event.

Values are set in string representation and have 2 parameters.

<p style="text-align: center;"><a href="/uploads/timer-cloud/customevents/values.webp" target="_blank">
<img src="/uploads/timer-cloud/customevents/values.webp" alt="values screenshot" style="width:100%" loading="lazy"></a></p>

The first parameter (from/to) contains technical information about the value of the field. For example, the id of an option from the select list.

The second parameter (fromString/toString) usually contains readable information about the value of the field. For example, the name of an option from the select list.

The parameter values used are best taken from [Jira Cloud Rest API - Get changelogs](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issues/#api-rest-api-3-issue-issueidorkey-changelog-get) or [Jira Rest API - get issue - changelog](https://docs.atlassian.com/software/jira/docs/api/REST/latest//#issue-getIssue)


Example from [Postman](https://www.postman.com/):
<p style="text-align: center;"><a href="/uploads/timer-cloud/customevents/rest-changelogs-example.webp" target="_blank">
<img src="/uploads/timer-cloud/customevents/rest-changelogs-example.webp" alt="rest-changelogs-example screenshot" style="width:100%" loading="lazy"></a></p>

The values obtained with it can be directly inserted into custom events.

<p style="text-align: center;"><a href="/uploads/timer-cloud/customevents/values-2.webp" target="_blank">
<img src="/uploads/timer-cloud/customevents/values-2.webp" alt="values-2 screenshot" style="width:100%" loading="lazy"></a></p>

You can also try to get the required value through the issue history view interface.

<p style="text-align: center;"><a href="/uploads/timer-cloud/customevents/history.webp" target="_blank">
<img src="/uploads/timer-cloud/customevents/history.webp" alt="history screenshot" style="width:100%" loading="lazy"></a></p>

* If both parameters are left blank, it will be treated as an empty value.
* If at least one of the parameters is filled in, then only it will compare.
* If both parameters are filled, then both parameters will be compared. Equality on one of them will be enough to trigger the event.
  * Trigger event if ('to' equals 'value from history') or ('toString' equals 'value from history').

We will soon add this feature to the server/DC version and our other applications.


