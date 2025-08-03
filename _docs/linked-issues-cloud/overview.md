---
title: Overview
key: linked-issues-cloud
excerpt: "Display linked issues in Jira Cloud with enhanced visualization, custom filtering, and improved issue relationship management."
---

<a href="https://marketplace.atlassian.com/apps/1223203"><img src="/uploads/linked-issues-cloud/marketplace.png" style="width:100%;"/></a>

View app on [Atlassian Marketplace](https://marketplace.atlassian.com/apps/1223203)
## Welcome to Display linked issues for Jira Cloud! 

This application provides the ability to display any problems associated with the task. These can be tasks related to "issue links" or tasks that correspond to a JQL request. In a JQL query, you can use parameters to get information from the original problem. For example: priority=${priority.id}.

The list of fields to be displayed is also configured. These can be any fields, both system and custom.

### Configuration ###

After installing the application, go to the plugin admin page. You can go to the page either through the top panel or through the menu with all applications
* <a href="/uploads/linked-issues-cloud/open-config-1.png"><img src="/uploads/linked-issues-cloud/open-config-1.png" style="width:100%;"/></a>
* <a href="/uploads/linked-issues-cloud/open-config-2.png"><img src="/uploads/linked-issues-cloud/open-config-2.png" style="width:100%;"/></a>

First thing you need to do is create a config for related tasks. It will contain information about which tasks to display, which fields and additional information.

You can display the created configs in different places of the Jira interface. Currently WebPanels are available.

* To configure the config of related tasks, you need to go to the "Configs" tab:
<a href="/uploads/linked-issues-cloud/open-config-3.png"><img src="/uploads/linked-issues-cloud/open-config-3.png" style="width:100%;"/></a>

* Then click the **create** button:
<a href="/uploads/linked-issues-cloud/create-config.png"><img src="/uploads/linked-issues-cloud/create-config.png" style="width:100%;"/></a>

In the window that opens, specify the parameters:
<a href="/uploads/linked-issues-cloud/config-screen.png"><img src="/uploads/linked-issues-cloud/config-screen.png" style="width:100%;"/></a>

For example, to display tasks with the same priority, you can use the following parameters:
<a href="/uploads/linked-issues-cloud/config-with-data.png"><img src="/uploads/linked-issues-cloud/config-with-data.png" style="width:100%;"/></a>

* Click the **save** button

### Web panel ###

Next, you need to choose where you want to display the created configuration. Currently, only the WebPanel is available. In the future we will add mapping in JSM and in fields.

* To configure the web panels of linked issues, you need to go to the "Web panels" tab:
<a href="/uploads/linked-issues-cloud/webpanel-config.png"><img src="/uploads/linked-issues-cloud/webpanel-config.png" style="width:100%;"/></a>

* Then click the **create** button.

In the window that opens, specify the parameters:
<a href="/uploads/linked-issues-cloud/webpanels-settings.png"><img src="/uploads/linked-issues-cloud/webpanels-settings.png" style="width:100%;"/></a>

specify which configuration to display, in which projects and for which types of issues.

* Click the **save** button

### Result ###

Web panels are displayed in issues in the browser and in the application:
* <a href="/uploads/linked-issues-cloud/result-1.png"><img src="/uploads/linked-issues-cloud/result-1.png" style="width:100%;"/></a>
* <a href="/uploads/linked-issues-cloud/result-2.png"><img src="/uploads/linked-issues-cloud/result-2.png" style="width:100%;"/></a>
* <a href="/uploads/linked-issues-cloud/result-3.png"><img src="/uploads/linked-issues-cloud/result-3.png" style="width:100%;"/></a>

---

## 📖 Documentation

### 💡 Additional Resources
- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Get help and submit feature requests










