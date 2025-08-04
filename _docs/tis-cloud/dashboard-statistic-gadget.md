---
title: Dashboard gadget - Calculated functions for time in status (Beta)
key: tis-cloud
excerpt: "Beta dashboard gadget for Time in Status with calculated functions, statistical analysis, and customizable reporting widgets."
category: reports-analytics
tags: [doc, cloud, time-in-status, dashboard-gadgets, statistics, reporting, beta, customizable-reports]
---

A gadget for dashboards that allows you to calculate any statistics by time in status for any issues.
This is a small report with two configured columns: the first is the heading, and the second is the value calculated according to the settings.

Example:
<p style="text-align: center;"><a href="/uploads/tis-cloud/dashboard-gadget-calculate-statistic-example.webp" target="_blank">
<img src="/uploads/tis-cloud/dashboard-gadget-calculate-statistic-example.webp" alt="dashboard-gadget-calculate-statistic-example screenshot" style="width:100%;" loading="lazy"></a></p>

Settings:
<p style="text-align: center;"><a href="/uploads/tis-cloud/dashboard-gadget-calculate-statistic-add-and-settings.webp" target="_blank">
<img src="/uploads/tis-cloud/dashboard-gadget-calculate-statistic-add-and-settings.webp" alt="Dashboard gadget statistics configuration" style="width:100%;" loading="lazy"></a></p>

* You can add an unlimited number of lines.
* For each line, queries are specified based on which the function value needs to be calculated, along with the function itself. You can specify arbitrary statuses and JQL, or select one of the contexts from existing "time in status" fields.
* The gadget is still in Beta version and does not support "personal context" - queries like assignee = currentUser() do not work, but you can specify a specific user.

[More about time statistic](/Time-statistic(Time-in-status-Cloud)/)