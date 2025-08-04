---
title: Web panel
key: tis-cloud
excerpt: Configure and customize Time in Status web panels in Jira sidebar with status filtering, project settings, statistics, and flexible display options.
category: display-customization
tags: [doc, cloud, time-in-status, web-panels, status-tracking, dashboard-gadgets, field-creation]
---

Enables the display of "Time in Status" in the sidebar.

<table>
<tr>
<td><a href="/uploads/tis-cloud/web-panel-1.webp" target="_blank">
<img src="/uploads/tis-cloud/web-panel-1.webp" alt="web-panel-1 screenshot" loading="lazy"></a></td>
<td><a href="/uploads/tis-cloud/web-panel-2.webp" target="_blank">
<img src="/uploads/tis-cloud/web-panel-2.webp" alt="web-panel-2 screenshot" loading="lazy"></a></td>
</tr>
</table>

   



You can create many panels with different settings.
<p style="text-align: center;"><a href="/uploads/tis-cloud/web-panel-create.webp" target="_blank">
<img src="/uploads/tis-cloud/web-panel-create.webp" alt="web-panel-create screenshot" loading="lazy"></a></p>

### General settings ### 

* Web panel name - A panel with this name will be created in issues.
* Statuses - The panel will display the time only for the indicated statuses. Empty value - all issue statuses.
* Projects - The panel will be available for issues from the specified projects. Empty value - all projects.
* Issue types - The panel will be available for issues of the specified types. Empty value - all issue types.
* Calendar - The time will be calculated according to the work schedule specified in the calendar. The default is a 24x7 work calendar.
* Time format - In the selected format, the time will be displayed in the panel.
* Use rounding for display - The time will be rounded when displayed in the field. 21:37 → 21:30 (uses intervals)
* Show zero value - Show status in the panel when the time spent in it is equal to zero


### Statistic settings ###

<p style="text-align: center;"><a href="/uploads/tis-cloud/web-panel-statistic-settings.webp" target="_blank">
<img src="/uploads/tis-cloud/web-panel-statistic-settings.webp" alt="Web panel statistics configuration interface" style="width:100%;" loading="lazy"></a></p>

If you have selected in "Display mode" the display of the values of one of the functions (average time, for example), then in this section you can customize the data for calculating the value of this function in more detail.
The function value will be displayed in a separate column. Each panel calculates and uses values independently for each of the selected statuses.
For the calculation, issues from the specified projects and types are used. (Beta) Soon we will add the ability to count separately for each project and issue type.
The data will be recalculated at least once a day. (Beta) Updates will occur more frequently in the future. Updating the data in the web panels will also take some time.

* Limit
  * Issues from context are used to calculate values. You can limit the number of issues used to calculate the values. The limit indicates how many issues from the context to use for calculating the values, taking into account sorting by creation date (ORDER BY created). The first N issues are used. If 0 is specified, then all issues are used.
* Only resolved (resolution is not empty)
  * If this option is enabled, then only issues with a set resolution will be used for calculating values. If the option is disabled, then all issues from the context will be used.
* Created last days (created > startOfDay(-N))
  * Issues from context are used to calculate values. You can limit the selection of issues by creation date. Only issues created in the last N days will be used. If 0 is specified then this filter is ignored.
* Resolved last days (resolved > startOfDay(-N))
  * Issues from context are used to calculate values. You can limit the selection of issues by the date the issue was resolved. Only issues resolved in the last N days will be used. If 0 is specified, then this filter is ignored.


<p style="text-align: center;"><a href="/uploads/tis-cloud/web-panel-statistic-demo.webp" target="_blank">
<img src="/uploads/tis-cloud/web-panel-statistic-demo.webp" alt="web-panel-statistic-demo screenshot" loading="lazy"></a></p>

[More about time statistic](/Time-statistic(Time-in-status-Cloud)/)  


### New Jira issue view settings ### 
* Location - Location in the application interface for this panel.
* Web panel weight - Set a positive integer.
    * Determines the order in which web panels appear. Web panels are displayed top to bottom or left to right in order of ascending weight. The "lightest" weight is displayed first, while the "heaviest" weights sink to the bottom.
    * Due to caching in Jira cloud, weight changes can be delayed in the issue.
