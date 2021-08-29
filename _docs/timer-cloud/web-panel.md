---
title: Web panel
key: timer-cloud
---

Enables the display of the "Timer" fields in the sidebar.

<table>
<tr>
<td><a href="/uploads/timer-cloud/web-panel-1.png"><img src="/uploads/timer-cloud/web-panel-1.png" /></a></td>
<td><a href="/uploads/timer-cloud/web-panel-2.png"><img src="/uploads/timer-cloud/web-panel-2.png" /></a></td>
</tr>
</table>


1. Open application "Timer field":<br>
   <ul>
      <li>Open from “Manage your app“:
      <p style="text-align: center;"><a href="/uploads/tis-cloud/open-admin-from-app-manage.png"><img src="/uploads/tis-cloud/open-admin-from-app-manage.png" style="width:100%"/></a></p>
      </li>
      <li>Or from “Apps“ menu:
       <p style="text-align: center;"><a href="/uploads/timer-cloud/step-by-step/open-plugin-menu.png"><img src="/uploads/timer-cloud/step-by-step/open-plugin-menu.png" alt="" width="100%"/></a></p>
      </li>
   </ul>
2. Open "Web panels" tab and click "Create"

You can create many panels with different settings.
<p style="text-align: center;"><a href="/uploads/timer-cloud/web-panel-create.png"><img src="/uploads/timer-cloud/web-panel-create.png" /></a></p>

### General settings ### 

* Web panel name - A panel with this name will be created in issues.
* Timer fields - The selected timers will be displayed in the panel with the settings specified below.
* Projects - The panel will be available for issues from the specified projects. Empty value - all projects.
* Issue types - The panel will be available for issues of the specified types. Empty value - all issue types.
* Time format - In the selected format, the time will be displayed in the panel.

### What is the new Jira issue view? ### 
* Location - Location in the application interface for this panel.
* Web panel weight - Set a positive integer.
    * Determines the order in which web panels appear. Web panels are displayed top to bottom or left to right in order of ascending weight. The "lightest" weight is displayed first, while the "heaviest" weights sink to the bottom.
    * Due to caching in Jira cloud, weight changes can be delayed in the issue.
