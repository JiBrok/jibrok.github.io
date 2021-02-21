---
title: Reports
key: time-in-status
---


## Common ##
<div class="uk-alert-note" data-uk-alert="">
So far, only tabular reports are available in the plugin. The functionality of reports will be improved and expanded in new versions. <br>
Reports can work with any fields. Both with system fields and with fields from third-party applications. The correctness of the work in the report depends on the specific type of field. For questions or concerns, please contact <a href="https://jibrok.atlassian.net/servicedesk/customer/portals"> support </a>.
</div>

* Reports can group data by one attribute. It can be any field or a set of jql conditions to include a query in a group.
* Reports can display any fields. Additional functions for calculating values will be available depending on the type of data in the field.
  * For the fields from this application ("Time in status", "Timer", "Stopwatch"), various functions are available - median time and percintiles, average pause time, number of restarts, etc.
  * For numeric fields, mathematical functions are available - calculation of percintiles, sum, average, maximum and other values.
* You can also display cells with a custom formula and display, such cells also have access to data from other cells (like excel).
* For each report, access rights and a schedule for updating data are set separately.
* Reports can be exported to csv and available via direct link.

[Read more in the section on creating a report.](/docs/time-in-status/report-create/)
    

<p style="text-align: center;"><a href="/uploads/time-in-status/reports-all/4.png"><img src="/uploads/time-in-status/reports-all/4.png" style="width:100%;"/></a></p>


## All reports ##

Users have access to a menu to view all reports available to them. The reports menu is located at the top of the "Reports" screen.

<p style="text-align: center;"><a href="/uploads/time-in-status/reports-all/1.png"><img src="/uploads/time-in-status/reports-all/1.png" style="width:100%;"/></a></p>



This interface will present all reports to which the user has access.
The user can have read-only or read and edit rights to the report. Depending on the user's right, different actions with the report will be available.

If the user has rights to create new reports, the corresponding button on the right side of the screen will be available - "Create report".

<p style="text-align: center;"><a href="/uploads/time-in-status/reports-all/2.png"><img src="/uploads/time-in-status/reports-all/2.png" style="width:100%;"/></a></p>

Reports are generated at a specific point in time. After that, the finished report is saved and available for viewing. In the report settings, you can specify a schedule for data refresh. Or update the data manually as needed.

* View - Opens the generated report for viewing. The report has a permalink and you can save it for quick navigation.
* Edit - Opens the report for editing. The button is available only if you have edit rights.
* Delete - Deletes the report. The button is available only if you have edit rights.
* Generate - Starts updating the data in the report. Reports are able to independently update on a schedule. But you can start updating it manually.


<div class="uk-alert-note" data-uk-alert="">
Jira admin can disable this menu via module "jibrok-all-reports-user-link"
<p style="text-align: center;"><a href="/uploads/time-in-status/reports-all/3.png"><img src="/uploads/time-in-status/reports-all/3.png" style="width:100%;"/></a></p>
</div>




