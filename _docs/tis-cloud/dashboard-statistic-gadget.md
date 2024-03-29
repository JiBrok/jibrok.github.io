---
title: Dashboard gadget - Calculated functions for time in status (Beta)
key: tis-cloud
---

Gadget for the dashboards. It allows you to calculate any statistics by time in status for any issues.
This is a small report in which two columns are configured. The first is the heading, the second is the value calculated in accordance with the settings.

Example:
<p style="text-align: center;"><a href="/uploads/tis-cloud/dashboard-gadget-calculate-statistic-example.png"><img src="/uploads/tis-cloud/dashboard-gadget-calculate-statistic-example.png" style="width:100%;"></a></p>

Settings:
<p style="text-align: center;"><a href="/uploads/tis-cloud/dashboard-gadget-calculate-statistic-add-and-settings.png"><img src="/uploads/tis-cloud/dashboard-gadget-calculate-statistic-add-and-settings.png" style="width:100%;"></a></p>

* You can add an unlimited number of lines.
* For each line, queries are indicated on the basis of which it is necessary to calculate the value of the function and the function itself. You can specify arbitrary statuses and JQL, or select one of the contexts of existing "time in status" fields.
* The gadget is still in Beta version and does not support "personal appeal" - requests like assignee = currentUser () do not work, but you can specify a specific user.

[More about time statistic](/Time-statistic(Time-in-status-Cloud)/)