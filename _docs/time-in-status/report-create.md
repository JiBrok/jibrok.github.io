---
title: Create report
key: time-in-status
excerpt: Learn how to create custom reports in Time in Status plugin with options for table reports, grouping, custom formulas, and scheduling.
---

The reporting rights are controlled by the system administrator. [More](/docs/time-in-status/reports-permissions/) 

If the user has rights to create new reports, then in the menu with reports he will have the corresponding button on the right side of the screen - "Create report".

<p style="text-align: center;"><a href="/uploads/time-in-status/reports-all/2.webp" target="_blank"><img src="/uploads/time-in-status/reports-all/2.webp" style="width:100%;" loading="lazy"></a></p>

When clicked, the user opens an interface for creating reports.

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

<p style="text-align: center;"><a href="/uploads/time-in-status/reports-all/4.webp" target="_blank"><img src="/uploads/time-in-status/reports-all/4.webp" style="width:100%;" loading="lazy"></a></p>

## More details ##

* Name - Specified to search for a report and navigate between them.
* Type - Report type, other report settings depend on it.
    * Table - Table report that allows you to specify any fields, formulas and grouping in the report.
      <p style="text-align: center;"><a href="/uploads/time-in-status/report-create/1.webp" target="_blank"><img src="/uploads/time-in-status/report-create/1.webp" style="width:50%;" loading="lazy"></a></p>
    * Time in status - a report showing the time spent by tasks in status with a breakdown by executor.
      <p style="text-align: center;"><a href="/uploads/time-in-status/report-create/2.webp" target="_blank"><img src="/uploads/time-in-status/report-create/2.webp" style="width:50%;" loading="lazy"></a></p>
    * Time in status by assignee - shows the time spent by tasks on different executors, broken down by status.
      <p style="text-align: center;"><a href="/uploads/time-in-status/report-create/3.webp" target="_blank"><img src="/uploads/time-in-status/report-create/3.webp" style="width:50%;" loading="lazy"></a></p>
* JQL - tasks for which you need to build a report.
* Schedule expression - reports are generated and save their data until the next generation. You can update (generate) reports manually or specify a schedule for automatic data updates.
    * specify the number N in minutes - every N minutes the report will be updated.
    * Specify a cron expression. Simple service for generating cron expressions http://www.cronmaker.com/
* Permissions - all users or only specified ones (individual users or groups) can have access to the report *
    * view - users are only allowed to view the report
    * edit - users are allowed to view the report and edit.
#### Table ####
**Group** - according to this condition, tasks from JQL will be grouped. You can choose a system field or any other. It is also possible to group by JQL conditions.
* System field:
  * Versions and components are grouped for each value separately. If the issue has two versions specified, it will fall into the groups for both versions.
* JQLs - issues are counted only in the first matching jql. The issue will fall into only 1 group.
* JQLs - issues are counted in all jqls. The issue will fall into all matching groups.
  * You can drag and drop the order of JQL conditions.
  <p style="text-align: center;"><a href="/uploads/time-in-status/report-create/4.webp" target="_blank"><img src="/uploads/time-in-status/report-create/4.webp" style="width:50%;" loading="lazy"></a></p>


  
**Columns**
  <p style="text-align: center;"><a href="/uploads/time-in-status/report-create/5.webp" target="_blank"><img src="/uploads/time-in-status/report-create/5.webp" style="width:50%;" loading="lazy"></a></p>
* Column title - the title will be displayed in the table.
* Field - what data to show in the column. Depending on the selected field, a list of additional functions for calculating the value will be offered.
  * The value is calculated for the entire group.
    * If grouping by issue key. Then the column will display the value of the selected field.
    * If grouping by project. Then the column will display the value calculated for all tasks from JQL included in project.
* Function - a function that calculates the value of a field for a group. Depends on the selected field.
* Velocity - An editor that allows you to customize the display of a value in a cell (HTML). <a href="https://velocity.apache.org/engine/1.7/user-guide.html"> velocity </a>
* You can change the order of columns by dragging and dropping.

* **Custom calculated field (html)** 
  <p style="text-align: center;"><a href="/uploads/time-in-status/report-create/6.webp" target="_blank"><img src="/uploads/time-in-status/report-create/6.webp" style="width:50%;" loading="lazy"></a></p>

A special type of field. Using <a href="https://velocity.apache.org/engine/1.7/user-guide.html"> velocity </a> you can not only customize the display of the value (HTML) but also perform additional calculations. This field allows you to refer to any cells in the report and perform calculations based on them (like excel).

<p style="text-align: center;"><a href="/uploads/time-in-status/report-create/7.webp" target="_blank"><img src="/uploads/time-in-status/report-create/7.webp" style="width:50%;" loading="lazy"></a></p>

**Example**:

<p style="text-align: center;"><a href="/uploads/time-in-status/report-create/8.webp" target="_blank"><img src="/uploads/time-in-status/report-create/8.webp" style="width:50%;" loading="lazy"></a></p>


1 field: 

        #set($value = $row + $column)
        $value

2 field:

        #set($value = $row + $column)
        $value

3 field:

        #set($value = $report.rows.get($row).get(1).rawValue + $report.rows.get($row).get(2).rawValue)
        $value

4 field: 

        #set($value = $report.rows.get($row).get(3).rawValue * 2)
        $value



## Save ##

* **Demo** - While customizing the report, you can click **Demo** to view the interim result of the report. A report will be generated and displayed based on the first 50 tasks from JQL.

* **Save and generate** - reports are generated on schedule. If you want to start generating immediately after saving the report, click this button. After saving, the report will be sent to the non-generation queue. Further update of the report will take place on schedule.

* **Save** - saves the report. The report will be available for viewing after generation, which will happen on schedule.