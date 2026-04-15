---
title: Feature Difference (Server/Data Center and Cloud)
key: time-in-status-cloud-forge
excerpt: Compare Time in Status Cloud features with Server/Data Center versions, including field configuration, work calendar, reports, and functionality differences.
category: migration
tags: [doc, cloud, time-in-status, forge, migration, field-creation, status-tracking, web-panels, business-calendar]
---

> **Draft: Forge version documentation - work in progress. Content is still being adapted from the Connect version.**



Due to differences in architecture and approaches, we will not be able to implement some features in the cloud version, while others will be implemented as standalone solutions. You can see all the news about plugin updates on the main page.

The application is being actively developed and updated daily.

<h3>"Time in status" field</h3>
<table>
<tr><th>Features</th><th>Server/Data Center</th><th>Cloud</th></tr>
<tbody>

<tr><td>Configured field name</td><td>✅</td><td>✅</td></tr>
<tr><td>Field contexts</td><td>✅<br/>Standard Jira custom field context</td><td>✅<br>Set in the application using JQL</td></tr>
<tr><td>Calculate time in selected statuses</td><td>✅</td><td>✅</td></tr>
<tr><td>Calculate time in all statuses</td><td>✅</td><td>✅</td></tr>
<tr><td>Calculate time in current status</td><td>✅</td><td>🛠</td></tr>
<tr><td>Calculate average time</td><td>✅</td><td>🛠</td></tr>
<tr><td>Calculate time after last move</td><td>✅</td><td>🛠</td></tr>
<tr><td>Calculate time first transition</td><td>✅</td><td>🛠</td></tr>
<tr><td>Calculate time of first transition</td><td>✅</td><td>🛠</td></tr>
<tr><td>Calculate time after last transition</td><td>✅</td><td>🛠</td></tr>
<tr><td>Display time formats</td><td>✅</td><td>✅ without day formats 🛠</td></tr>
<tr><td>Show as panel</td><td>✅</td><td>✅</td></tr>
<tr><td>Many fields can be created</td><td>✅</td><td>✅ Maximum of 25-100 depending on settings</td></tr>
<tr><td>Show as panel on Agile boards</td><td>✅</td><td>✅</td></tr>
<tr><td>Calculate time by Work calendar</td><td>✅</td><td>✅</td></tr>
<tr><td>Show field value permissions</td><td>✅</td><td>❌</td></tr>
<tr><td>Show state icon</td><td>✅</td><td>🛠</td></tr>
<tr><td>Show parent value in sub-tasks</td><td>✅</td><td>🛠</td></tr>
<tr><td>Sort by "Time in status" field</td><td>✅</td><td>✅</td></tr>
<tr><td>Search by "Time in status" field</td><td>✅</td><td>✅</td></tr>
<tr><td>Real-time search by "Time in status" field</td><td>✅ Data is calculated at the time of search</td><td>✅ Data is updated every 1-30 minutes (depending on time and settings)</td></tr>
<tr><td>Field export format</td><td>✅ Separate setting</td><td>✅ Set together with the time display format in the field</td></tr>
<tr><td>Field export to CSV, XML, Excel</td><td>✅</td><td>✅</td></tr>
<tr><td>Field export to eazyBi</td><td>✅</td><td>❓</td></tr>
<tr><td>Different styles of displaying time in the field</td><td>✅ </td><td>🛠</td></tr>
<tr><td>Customize display value</td><td>✅ Velocity</td><td>❌</td></tr>
<tr><td>Show breaktime with time zone</td><td>✅</td><td>🛠</td></tr>
<tr><td>Setting the location of the issue panel</td><td>✅</td><td>✅</td></tr>
</tbody>
</table>

<h3>Other fields</h3>
<table>
<tr><th>Features</th><th>Server/Data Center</th><th>Cloud</th></tr>
<tbody>
<tr><td>Timer field</td><td>✅</td><td>✅ Published for the cloud in a separate app: <a href="/docs/timer-cloud/featureDifferenceDocumentation/">more info</a></td></tr>
<tr><td>Stopwatch field</td><td>✅</td><td>✅ Published for the cloud in a separate app: <a href="/docs/stopwatch-cloud/featureDifferenceDocumentation/">more info</a> </td></tr>
</tbody>
</table>

<h4>Work calendar</h4>
<table>
<tr><th>Features</th><th>Server/Data Center</th><th>Cloud</th></tr>
<tbody>
<tr><td>Time zone</td><td>✅</td><td>✅</td></tr>
<tr><td>Customize work week</td><td>✅</td><td>✅</td></tr>
<tr><td>Break time intervals</td><td>✅</td><td>✅</td></tr>
<tr><td>Custom days</td><td>✅</td><td>✅</td></tr>
<tr><td>Repeatable custom days</td><td>✅</td><td>✅</td></tr>
<tr><td>Start date time(first day for calendar)</td><td>✅</td><td>✅</td></tr>
<tr><td>Work time settings for time formats</td><td>✅</td><td>🛠</td></tr>
</tbody>
</table>



<h4>Issue reports</h4>
<table>
<tr><th>Features</th><th>Server/Data Center</th><th>Cloud</th></tr>
<tbody>
<tr><td>Download reports from issue</td><td>✅</td><td>🛠</td></tr>
<tr><td>Issue report "Time in status"</td><td>✅</td><td>✅</td></tr>
<tr><td>Issue report "Time in status for transition history"</td><td>✅</td><td>🛠</td></tr>
<tr><td>Issue report "Time in status by assignee"</td><td>✅</td><td>🛠</td></tr>
<tr><td>Configure issue reports for projects</td><td>✅</td><td>✅</td></tr>
</tbody>
</table>


<h4>Other functions</h4>
<table>
<tr><th>Features</th><th>Server/Data Center</th><th>Cloud</th></tr>
<tbody>
<tr><td>Specified JQL functions with multiple params</td><td>✅</td><td>❌</td></tr>
<tr><td>Performance settings</td><td>✅</td><td>✅ Available by contacting support</td></tr>
<tr><td>JQL functions without fields</td><td>✅</td><td>❌</td></tr>
<tr><td>Auto worklog</td><td>✅</td><td>❌</td></tr>
<tr><td>Autotrack</td><td>✅</td><td>❌</td></tr>
<tr><td>Custom field calculation of the function by JQL</td><td>✅</td><td>🛠</td></tr>
<tr><td>Transition counter field</td><td>✅</td><td>❌</td></tr>
<tr><td>Is status field</td><td>✅</td><td>❌</td></tr>
<tr><td>Rest API</td><td>✅</td><td>❌</td></tr>
<tr><td>Java API</td><td>✅</td><td>❌</td></tr>
<tr><td>Reports</td><td>✅</td><td>🛠</td></tr>
<tr><td>Statistics</td><td>✅</td><td>🛠</td></tr>

</tbody>
</table>

