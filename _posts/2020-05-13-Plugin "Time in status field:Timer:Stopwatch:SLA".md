---
layout: post
title: Plugin for Jira - "Time in status field/Timer/Stopwatch/SLA" 
---

The issue (task, work) in the process of solving goes through various stages. It is necessary to take into account and control the time spent at each stage.
[![Plugin "Time in status field/Timer/Stopwatch/SLA" Marketplace](/images/time-in-status-field/time-in-status-plugin-image.png)](https://marketplace.atlassian.com/apps/1220908/time-in-status-field?hosting=server&tab=overview)

### 📃 Overview ###

To calculate time in different scenarios, the plugin provides a set of fields, functions for searching, reports and access to api.

### 🔧 Fields ###

For all fields, you can sort and search, connect a working calendar to calculate the time, configure the appearance, access rights and export format.

#### Time in status field ####

![Plugin "Time in status field/Timer/Stopwatch/SLA" time-in-status field demo](/images/time-in-status-field/time-in-status-demo1.png)

A field that shows the time spent in the selected statuses. The field counts time dynamically. Not tied to issue events. Those. will count time for both new and already created tasks. 

* [How to create or edit "Time in status" field](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/512885041)
* [Settings for all fields (time in status)](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/512917566)
* [JQL functions (time in status)](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513277970)

#### Stopwatch field ####

Tracks the time between events. Events can be as simple as creating a task, commenting. So are more complex ones - increasing priority, changing status to a specific, first appointment. Full list of events (link).

#### Timer field ####

![Plugin "Time in status field/Timer/Stopwatch/SLA" timer field demo](/images/time-in-status-field/timer-demo-line.png)

During startup, it is set for a certain time (5 minutes, 4 hours) and then shows the remaining time. Reacts to events (link). And depending on the settings, it starts the timer or stops. The initial time is determined by the jql condition.

* [⭐️Timers and Stopwatches - General information](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513441891)
* [⭐️Timers and Stopwatches - Scheme and configurations](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513015898)
* [📖 How to create Timer and configure it step-by-step](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/560332801/How+to+create+Timer+and+configure+it+step-by-step)


### 🗓 Business calendar ###

The plugin can calculate the time according to the configured calendars. In fields and jql there are corresponding settings.

* [How to create work calendar?](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513507383/How+to+create+work+calendar)


### 🔍 Tips and tricks ###

Search functions make it easy to find and sort tasks.
More info by link.

* (Time in status field) - Find tasks that spent too much time in status. Use to track work by status.
You don’t even need to create fields for this!
* (Timer field) - Sort tasks by the remaining time and complete them first. It helps to fine-tune the SLA and monitor its compliance.
* (Stopwatch field)
![Plugin "Time in status field/Timer/Stopwatch/SLA" stopwatch field demo sort on dashboard](/images/time-in-status-field/stopwatch-sort-dashboard.png)
* [Timer JQL functions](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513507494/Timer+JQL+functions)
* [JQL functions (time in status)](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513277970/JQL+functions+time+in+status)

### 📊 Reports (🛠Section at work🛠) ###
View and export task reports.
(Details on report settings)
For each project, you can configure which reports to display. Download reports in CSV or JSON formats. You can now create a report by JQL using (rest api).

* [Issue panel with reports (bottom)](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513376358/Issue+panel+with+reports+bottom)


### 💎 Configure where and how your field should be displayed ###
You can change the place and title of the display panels in the task.
(Panel configuration for fields.)

* [Field panels config](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513015970/Field+panels+config)

### 🔩 REST API || JAVA API ### 
If any scenarios cannot be covered with ready-made solutions. There are Rest and Java api for detailed settings.

* [REST API](https://jibrok.com/jira/plugins/time-in-status/doc/rest/)
* [Java API](https://jibrok.com/jira/plugins/time-in-status/doc/java/)
	* [Groovy examples](https://github.com/JiBrok/time-in-status-field)

### ❓ For any questions and problems you can contact 🐞 ###


* [Support](https://jibrok.atlassian.net/servicedesk/customer/portal/9)

### 📜 More information ###

[View on Atlassian Marketplace](https://marketplace.atlassian.com/apps/1220908/time-in-status-field?hosting=server&tab=overview)

[Documentation and Knowledge Base](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513441810/Plugin+Time+in+status+field+Timer+Stopwatch+SLA)

[Report a problem](https://jibrok.atlassian.net/servicedesk/customer/portals)
