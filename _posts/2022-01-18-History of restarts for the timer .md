---
title: History of restarts for the timer (Cloud)
tags: timer-cloud
---

The timer has a history of previous start-stop-restart cycles.

In the current version, it has several limitations:
* History is calculated based on current timer settings.
* Change of goal is not taken into account in history. The goal is always taken based on the current data in the issue and the timer settings.

We do not yet display the history in the interface, this will be in the next releases.
You can get the history of the timer through [JIRA REST API (Issue properties)](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-properties/).

Timer data is stored in properties with the name of your timer.
For example, information about the "TEST TIMER FIELD" timer can be obtained from the following URL: {jira cloud base url}/rest/api/3/issue/{issue key}/properties/TEST TIMER FIELD

The response will be in the following format:
<script src="https://gist.github.com/JiBrok/629f0b84691ffd3d1f9950f14b2a17a7.js"></script>

The "history" field lists the previous timers in order. From the first, to the current value.    