---
title: Refined for Jira | Sites & Themes
key: message-field
---

**Message field** by default may not be displayed with Jira Service Desk portal created by <a href="https://marketplace.atlassian.com/apps/1216711/refined-for-jira-sites-themes?hosting=server&tab=overview" target="_blank">Refined for Jira | Sites & Themes</a>.

To fix it you need to disable a couple of resources and enable global ones instead of them.

* Click the **Administration** icon on the top right-hand corner of the screen.
* Go to **Manage apps**.

    <a href="/uploads/message-field/install/manage-apps.png"><img src="/uploads/message-field/install/manage-apps.png" alt="open manage apps" width="500"/></a>
* Find **Message field** in the plugins list. Click on its section. Then click on the button **17 of 19 modules enabled**(the number of modules may change over time) displaying plug-in modules(it is located in the right column).
  
    <a href="/uploads/message-field/plugin-modules.png"><img src="/uploads/message-field/plugin-modules.png" alt="plugin modules" width="500"/></a>
    
* Right from each module there will be a button - **enable** or **disable** (they are displayed when you hover over the module).
    * You need to **disable** modules: **general**, **view-servicedesk**
    * You need to **enable** modules: **general-global**, **view-servicedesk-global**
  
{% include alert.html style="warning" text="Please do not leave all resources enabled this will lead to the duplication of messages and other problems with displaying the messages." %}

After replacing the resources all messages should be displayed correctly in all interfaces - Jira standard interfaces and **Refined for Jira**.


