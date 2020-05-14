---
layout: post
title: Timer field - JQL functions 
---

The following JQL functions will help organize dashboards, filters, and reports with Plugin "Time in status field/Timer/Stopwatch/SLA"

[Documentation and Knowledge Base](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513441810/Plugin+Time+in+status+field+Timer+Stopwatch+SLA)

Functions take the following parameters.

* **condition** - one of the characters <, <=, => =,>. For example: ">".
* **time** - time string corresponding to one of the patterns.
	* "5h35m12s" - 5 hours 35 minutes 12 seconds 
	* "5h12s" - 5 hours 12 seconds 
	* 3000m - 3000 minutes 
	* "0", "0s" ... - time is zero.
* **calendar** - the name or id of the calendar. For example: "Support" or "1". How to view calendars?
* **timer config id** and **timer scheme id** - number. Jira admin can view it.


### Search works through the field. Therefore, all JQLs begin with the field name. ###

![Plugin "Time in status field/Timer/Stopwatch/SLA" time-in-status field demo](/images/time-in-status-field/timer-jql-functions.png)


* The functions works with indexes
* More info about timer states: [⭐️Timers and Stopwatches - General information](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513441891)

<hr>

* **“Timer field“ in active()**
	* Returns tasks that have a timer is running
	* If the timer uses a calendar, the field may indicate that it is not working hours. This does not affect the search if timer is running. 

* **“Timer field“ in inactive()**
	* Returns tasks that have a timer is pause, failed or completed.

* **“Timer field“ in isCompleted()**
	* Returns tasks that have a timer is completed. Those the timer is stopped and the time has not yet ended. 

* **“Timer field“ in isFailed()** 
	* Returns tasks that have a timer is failed. Those the timer is stopped and the time has ended.

* **“Timer field“ in isPaused()** 
	* Returns tasks that have a timer is paused. Breaks in the work calendar are not considered a pause. But can be displayed in the field as a pause.

* **“Timer field“ in isRunning()**
	* Returns tasks that have a timer is running. A break in the working calendar does not affect the search. The timer may be in state running, but at the same time the field will be displayed as a pause state.

* **"Timer field" in timeSpent("condition", "time")**
	* Returns tasks for which the timer has already counted the specified time. Those. The timer was active(in state Running) for the specified time.

* **"Timer field" in realTimeSpent("condition", "time")**
	* Returns tasks for which the timer has already counted the specified time. Those. The timer was active(in state Running) for the specified time.
	* The function works in real time.
	* It has a limit on the size of the issue.
	* The function is suitable for sampling active counters. Real-time reporting, work queues of tasks with reference to reaction time, execution ...

* **"Timer field" in timeLeft("condition", "time")**
	* Returns tasks for which the remaining timer time matches the condition.
	* The function works in real time.
	* It hasn’t a limit on the size of the issue.
	* The function is suitable for sampling active counters. Real-time reporting, work queues of tasks with reference to reaction time, execution ...

* **"Timer field" in searchByCalendar(“calendarId”)**
	* Returns tasks whose timer uses the specified attribute.

* **"Timer field" in searchByGoal(“goalId”)**
	* Returns tasks whose timer uses the specified attribute.
	* Id can be found with Jira admin.

* **"Timer field" in searchByTimerConfig(“timerConfigId”)**
	* Returns tasks whose timer uses the specified attribute.
	* Id can be found with Jira admin.

* **"Timer field" in searchByTimerScheme(“timerSchemeId”)**
	* Returns tasks whose timer uses the specified attribute.
	* Id can be found with Jira admin.

	
### 📜 More information ###

[View on Atlassian Marketplace](https://marketplace.atlassian.com/apps/1220908/time-in-status-field?hosting=server&tab=overview)

[Documentation and Knowledge Base](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513441810/Plugin+Time+in+status+field+Timer+Stopwatch+SLA)

[Report a problem or ask a question](https://jibrok.atlassian.net/servicedesk/customer/portals)
