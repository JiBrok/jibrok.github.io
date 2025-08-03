---
title: Field panels config
key: time-in-status
excerpt: "Customize Time in Status field panel layouts in Jira interface with global configuration settings for optimal display."
---

### You can change the layout of the panels in the Jira interface. Settings are set globally for all projects.

<table>
<tr>
<td>
Timer panel config 1:<br>
<a href="/uploads/time-in-status/field-panel-configs/time-tracking-style.webp" target="_blank">
<img src="/uploads/time-in-status/field-panel-configs/time-tracking-style.webp" alt="time-tracking-style screenshot" style="width:50%" loading="lazy"></a>
</td>
<td>Timer panel config 2(Example at the bottom of the screenshot):<br>
<a href="/uploads/time-in-status/field-panel-configs/panels-reordering.webp" target="_blank">
<img src="/uploads/time-in-status/field-panel-configs/panels-reordering.webp" alt="panels-reordering screenshot" style="width:50%" loading="lazy"></a>
</td>
</tr>
</table>


**{baseUrl}/secure/jibrokFieldPanelsConfig!default.jspa**<br>
gg(admin search) + "Field Panels config"
* You can change the column for the panel - specify the right or left.
* And you can set higher or lower should be located panel relative to others.
* You can set arbitrary text as the title bar.

<p style="text-align: center;"><a href="/uploads/time-in-status/field-panel-configs/field-panels-settings.webp" target="_blank">
<img src="/uploads/time-in-status/field-panel-configs/field-panels-settings.webp" alt="field-panels-settings screenshot" style="width:100%;" loading="lazy"></a></p>


## Time in status ## 

The "Time in status" fields with the  "Show as panel" setting enabled in the sidebar are displayed in the following order.
1. Fields showing the time in the current status.
2. Fields showing time in the same status. These fields are sorted according to the steps of their statuses in workflow.
3. Other fields

<table>
<tr>
<td><a href="/uploads/time-in-status/field-panel-configs/field-panel-status-ordering.webp" target="_blank">
<img src="/uploads/time-in-status/field-panel-configs/field-panel-status-ordering.webp" alt="field-panel-status-ordering screenshot" style="width:50%" loading="lazy"></a></td>
<td><a href="/uploads/time-in-status/field-panel-configs/field-settings-show-as-panel.webp" target="_blank">
<img src="/uploads/time-in-status/field-panel-configs/field-settings-show-as-panel.webp" alt="field-settings-show-as-panel screenshot" style="width:50%" loading="lazy"></a></td>
<td><a href="/uploads/time-in-status/field-panel-configs/worklfow-step-ordering.webp" target="_blank">
<img src="/uploads/time-in-status/field-panel-configs/worklfow-step-ordering.webp" alt="worklfow-step-ordering screenshot" style="width:50%" loading="lazy"></a></td>
</tr>
</table>