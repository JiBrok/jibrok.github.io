---
layout: post
title: Plugin "Time in status field/Timer/Stopwatch/SLA" 
---
### What is the problem❓###

The issue (task, work) in the process of solving goes through various stages. It is necessary to take into account and control the time spent at each stage.

[![Plugin "Time in status field/Timer/Stopwatch/SLA" Marketplace](/images/time-in-status-field/time-in-status-plugin-image.png)](https://marketplace.atlassian.com/apps/1220908/time-in-status-field?hosting=server&tab=overview)

### 📃 Overview ###

To calculate time in different scenarios, the plugin provides a set of fields, functions for searching, reports and access to api.

### 🔧 Fields ###

For all fields, you can sort and search, connect a working calendar to calculate the time, configure the appearance, access rights and export format.

#### Time in status field ####

![Plugin "Time in status field/Timer/Stopwatch/SLA" time-in-status field demo](/images/time-in-status-field/time-in-status-demo1.png)

A field that shows the time spent in the selected statuses. The field counts time dynamically. Not tied to issue events. Those. will count time for both new and already created tasks. 

#### Stopwatch field ####

Tracks the time between events. Events can be as simple as creating a task, commenting. So are more complex ones - increasing priority, changing status to a specific, first appointment. Full list of events (link).

#### Timer field ####

![Plugin "Time in status field/Timer/Stopwatch/SLA" timer field demo](/images/time-in-status-field/timer-demo-line.png)

During startup, it is set for a certain time (5 minutes, 4 hours) and then shows the remaining time. Reacts to events (link). And depending on the settings, it starts the timer or stops. The initial time is determined by the jql condition.

### 🗓 Business calendar ###

The plugin can calculate the time according to the configured calendars. In fields and jql there are corresponding settings.


### 🔍 Tips and tricks ###

Search functions make it easy to find and sort tasks.
More info by link.

* (Time in status field) - Find tasks that spent too much time in status. Use to track work by status.
You don’t even need to create fields for this!
* (Timer field) - Sort tasks by the remaining time and complete them first. It helps to fine-tune the SLA and monitor its compliance.
* (Stopwatch field)
![Plugin "Time in status field/Timer/Stopwatch/SLA" stopwatch field demo sort on dashboard](/images/time-in-status-field/stopwatch-sort-dashboard.png)

### 📊 Reports (🛠Section at work🛠) ###
View and export task reports.
(Details on report settings)
For each project, you can configure which reports to display. Download reports in CSV or JSON formats. You can now create a report by JQL using (rest api).


### 💎 Configure where and how your field should be displayed ###
You can change the place and title of the display panels in the task.
(Panel configuration for fields.)


### 🔩 REST API || JAVA API ### 
If any scenarios cannot be covered with ready-made solutions. There are Rest and Java api for detailed settings.

### ❓ For any questions and problems you can contact 🐞 ###


* [Support](https://jibrok.atlassian.net/servicedesk/customer/portal/9)

### 📜 More information ###

[View on Atlassian Marketplace](https://marketplace.atlassian.com/apps/1220908/time-in-status-field?hosting=server&tab=overview)

[Documentation and Knowledge Base](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513441810/Plugin+Time+in+status+field+Timer+Stopwatch+SLA)

[Report a problem](https://jibrok.atlassian.net/servicedesk/customer/portals)
