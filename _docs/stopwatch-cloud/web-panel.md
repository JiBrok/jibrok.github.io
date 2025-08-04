---
title: Web panel
key: stopwatch-cloud
excerpt: "Create Stopwatch field sidebar panels in Jira Cloud with customizable locations, time formats, and project-specific configurations."
category: display-customization
tags: [doc, cloud, time-tracking, stopwatch, web-panels, sidebar, display, interface-customization]
---

Enables the display of the "stopwatch" fields in the sidebar.

<table>
<tr>
<td><a href="/uploads/timer-cloud/web-panel-1.webp" target="_blank">
<img src="/uploads/timer-cloud/web-panel-1.webp" alt="web-panel-1 screenshot" loading="lazy"></a></td>
<td><a href="/uploads/timer-cloud/web-panel-2.webp" target="_blank">
<img src="/uploads/timer-cloud/web-panel-2.webp" alt="web-panel-2 screenshot" loading="lazy"></a></td>
</tr>
</table>


1. Open the "Timer field" application:<br>
   <ul>
      <li>Open from “Manage your app“:
      <p style="text-align: center;"><a href="/uploads/tis-cloud/open-admin-from-app-manage.webp" target="_blank">
<img src="/uploads/tis-cloud/open-admin-from-app-manage.webp" alt="open-admin-from-app-manage screenshot" style="width:100%" loading="lazy"></a></p>
      </li>
      <li>Or from “Apps“ menu:
       <p style="text-align: center;"><a href="/uploads/timer-cloud/step-by-step/open-plugin-menu.webp" target="_blank">
<img src="/uploads/timer-cloud/step-by-step/open-plugin-menu.webp" alt="screenshot" width="100%" loading="lazy"></a></p>
      </li>
   </ul>
2. Open the "Web panels" tab and click "Create"

You can create many panels with different settings.
<p style="text-align: center;"><a href="/uploads/timer-cloud/web-panel-create.webp" target="_blank">
<img src="/uploads/timer-cloud/web-panel-create.webp" alt="web-panel-create screenshot" loading="lazy"></a></p>

### General settings ### 

* Web panel name - A panel with this name will be created in issues.
* Stopwatch fields - The selected stopwatches will be displayed in the panel with the settings specified below.
* Projects - The panel will be available for issues from the specified projects. Empty value = all projects.
* Issue types - The panel will be available for issues of the specified types. Empty value = all issue types.
* Time format - Time will be displayed in the panel using the selected format.

### New Jira issue view ### 
* Location - The location in the application interface for this panel.
* Web panel weight - Set a positive integer.
    * Determines the order in which web panels appear. Web panels are displayed from top to bottom or left to right in order of ascending weight. The "lightest" weight is displayed first, while the "heaviest" weights sink to the bottom.
    * Due to caching in Jira Cloud, weight changes can be delayed in the issue.
