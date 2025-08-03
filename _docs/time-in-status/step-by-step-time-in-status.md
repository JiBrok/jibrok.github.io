---
title: 📖 Step by step - Time in status
key: time-in-status
excerpt: Complete step-by-step guide to setting up Time in Status fields and JQL functions for tracking issue time in different statuses with indexing and search capabilities.
---

The time functionality in the status is divided into two parts.

The first is general search functions for which no additional configuration is required.
They work right after installing the plugin.

#### Common #### 
* **issue in timeInStatus("statuses", "condition", "time")** - Find tasks that have spent the specified time in statuses.
  * Params:
  * statuses - name or id, Comma separated
* **issue in timeInStatusByJql("jql", "statuses", "condition", "time")** - Find tasks from a jql request that have spent the specified time in statuses.
  * Params:
  * jql - query for filter tasks
  * statuses - name or id, Comma separated
* **issue in timeInStatusByJqlAndWorkCalendar("jql", "statuses", "condition", "time", "calendar")** - Find tasks from a jql request that spent the specified working time in statuses. Working hours will be calculated according to the specified calendar.
  * Params:
  * jql - query for filter tasks
  * statuses - name or id, Comma separated
  * calendar - work calendar name or id for calculate work time

These functions are presented in [user help](/docs/time-in-status/user-help-info/).

The Jira administrator can customize how these functions work: adjust performance and the number of processed values in real time. You can also configure limited access to these search functions.
[Performance config JQL](/docs/time-in-status/performance-config-jql/)

The second part is working with time through the configured "Time in status" fields.

<p>
Each field can count how much time the task spent in the specified status or statuses. The statuses are specified in the field settings.
Fields store intermediate values in indexes and are faster processed in real-time searches.
In the field, you can specify execution contexts, specify additional options for timing, customize the display and access to the value.
By the "Time in status" fields, you can also sort tasks, build reports and export them.
</p>

* [About fields](/docs/time-in-status/about-fields/)
* [More about Time in status field](/docs/time-in-status/time-in-status-field/)


### 1. Create a new field "Time in status", Then set contexts and screens. ###

* [Atlassian Guide: Adding a custom field](https://confluence.atlassian.com/adminjiraserver/adding-a-custom-field-938847222.html)
* [Atlassian Guide: Configuring a custom field](https://confluence.atlassian.com/adminjiraserver/configuring-a-custom-field-938847235.html)


### 2. After creating the field, go to its settings: ###
1. <a href="/uploads/time-in-status/step-by-step-time-in-status/fields.webp" target="_blank"><img src="/uploads/time-in-status/step-by-step-time-in-status/fields.webp" alt="time in status fields" width="50%" loading="lazy"></a>
2. <a href="/uploads/time-in-status/step-by-step-time-in-status/field-config.webp" target="_blank"><img src="/uploads/time-in-status/step-by-step-time-in-status/field-config.webp" alt="time in status field config" width="50%" loading="lazy"></a>
3. <a href="/uploads/time-in-status/step-by-step-time-in-status/time-in-status-config.webp" target="_blank"><img src="/uploads/time-in-status/step-by-step-time-in-status/time-in-status-config.webp" alt="time in status field config" width="50%" loading="lazy"></a>


Specify the statuses in which you want to count the time and save the settings. For the search to work, you also need to run the reindx for jira or for the project.
[Search indexing](https://confluence.atlassian.com/adminjiraserver/search-indexing-938847710.html)

After re-indexing, search functions for fields will be available

#### Search by state ####
* **"field name" in active()** - Search by active time in status fields(issue in selected statuses)
* **"field name" in inactive()** - Search by inactive time in status fields(issue not in selected statuses)

#### Search by time ####
* **"field name" in time("condition", "time")** - Search by time in status fields(by total time in selected statuses)/Timer field. Time value from index.
* **"field name" in realTime("condition", "time")** - Search by time in status fields(by total time in selected statuses)/Timer field. Time value calculate realtime.
* **"field name" in realTimeBetween("time", "time")** - Search by realtime in status fields(by total time in selected statuses). Time value calculate realtime.

* **Examples:**
    * "Time in new" in realTime(">", "20m") AND "First reaction" in realTime("<", "1h")
    * "Time in new" in realTimeBetween("1h", "2h")

These functions are presented in [user help](/docs/time-in-status/user-help-info/). 