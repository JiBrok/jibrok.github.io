---
title: Web panel
key: tis-cloud
---

Enables the display of the "Time in status" in the sidebar.

<table>
<tr>
<td><a href="/uploads/tis-cloud/web-panel-1.png"><img src="/uploads/tis-cloud/web-panel-1.png" /></a></td>
<td><a href="/uploads/tis-cloud/web-panel-2.png"><img src="/uploads/tis-cloud/web-panel-2.png" /></a></td>
</tr>
</table>

   



You can create many panels with different settings.
<p style="text-align: center;"><a href="/uploads/tis-cloud/web-panel-create.png"><img src="/uploads/tis-cloud/web-panel-create.png" /></a></p>

### General settings ### 

* Web panel name - A panel with this name will be created in issues.
* Statuses - The panel will display the time only for the indicated statuses. Empty value - all issue statuses.
* Projects - The panel will be available for issues from the specified projects. Empty value - all projects.
* Issue types - The panel will be available for issues of the specified types. Empty value - all issue types.
* Calendar - The time will be calculated according to the work schedule specified in the calendar. The default is a 24x7 work calendar.
* Time format - In the selected format, the time will be displayed in the panel.
* Use rounding for display - The time will be rounded when displayed in the field. 21:37 -> 21:30 (use intervals)
* Show zero value - Show status in the panel when the time spent in it is equal to zero


### Statistic settings ###

<p style="text-align: center;"><a href="/uploads/tis-cloud/web-panel-statistic-settings.png"><img src="/uploads/tis-cloud/web-panel-statistic-settings.png" style="width:100%;"></a></p>

If you have selected in "Display mode" the display of the values of one of the functions (Average time for example), then in this section you can customize the data for calculating the value of this function in more detail.
The function value will be displayed in a separate column. Each panel calculates and uses values independently for each of the selected status.
For the calculation, issues from the specified projects and types are taken.(Beta) Soon we will add the ability to count separately for each project and type of request.
The data will be recalculated at least once a day. (Beta) Updates will occur more frequently in the future. Updating the data in the web panels will also take some time.

* Limit
  * Issues from context are used to calculate values. You can limit the number of issues used to calculate the values. The limit indicates how much the issues from the context to take to calculate the values, taking into account sorting by creation date (ORDER BY created). The first N issues are used. If 0 is specified then all issues are used.
* Only resolved (resolution is not empty)
  * If this option is enabled, then only issues with a set resolution will be used for calculating values. If the option is disabled, then all issues from the context will be used.
* Created last days (created > startOfDay(-N))
  * Issues from context are used to calculate values. You can limit the selection of issues by creation date. Only issues created in the last N days will be used. If 0 is specified then this filter is ignored.
* Resolved last days (resolved > startOfDay(-N))
  * Issues from context are used to calculate values. You can limit the selection of issues by the date the request was resolved. Only issues solved in the last N days will be used. If 0 is specified then this filter is ignored.


<p style="text-align: center;"><a href="/uploads/tis-cloud/web-panel-statistic-demo.png"><img src="/uploads/tis-cloud/web-panel-statistic-demo.png" /></a></p>

[More about time statistic](/Time-statistic(Time-in-status-Cloud)/)  


### What is the new Jira issue view? ### 
* Location - Location in the application interface for this panel.
* Web panel weight - Set a positive integer.
    * Determines the order in which web panels appear. Web panels are displayed top to bottom or left to right in order of ascending weight. The "lightest" weight is displayed first, while the "heaviest" weights sink to the bottom.
    * Due to caching in Jira cloud, weight changes can be delayed in the issue.
