---
title: Display Linked Issues for Jira Cloud
key: linked-issues-cloud
excerpt: "Display linked issues in Jira Cloud with enhanced visualization, custom filtering, and improved issue relationship management."
category: getting-started
tags: [doc, cloud, linked-issues, issue-relationships, jql-integration, web-panels, field-display, configuration-management]
---

<a href="https://marketplace.atlassian.com/apps/1223203" target="_blank">
<img src="/uploads/linked-issues-cloud/marketplace.webp" alt="Message Field plugin on Atlassian Marketplace" style="width:100%;" loading="lazy"></a>

View app on [Atlassian Marketplace](https://marketplace.atlassian.com/apps/1223203)
## Welcome to Display Linked Issues for Jira Cloud! 

This application provides the ability to display any issues associated with a task. These can be issues related through "issue links" or issues that correspond to a JQL query. In a JQL query, you can use parameters to get information from the original issue. For example: priority=${priority.id}.

The list of fields to be displayed is also configured. These can be any fields, both system and custom.

### Configuration ###

After installing the application, go to the plugin admin page. You can access the page either through the top panel or through the menu with all applications:
* <a href="/uploads/linked-issues-cloud/open-config-1.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/open-config-1.webp" alt="open-config-1 screenshot" style="width:100%;" loading="lazy"></a>
* <a href="/uploads/linked-issues-cloud/open-config-2.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/open-config-2.webp" alt="open-config-2 screenshot" style="width:100%;" loading="lazy"></a>

The first thing you need to do is create a configuration for related issues. It will contain information about which issues to display, which fields, and additional information.

You can display the created configurations in different places within the Jira interface. Currently, WebPanels are available.

* To configure the settings for related issues, you need to go to the "Configs" tab:
<a href="/uploads/linked-issues-cloud/open-config-3.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/open-config-3.webp" alt="open-config-3 screenshot" style="width:100%;" loading="lazy"></a>

* Then click the **create** button:
<a href="/uploads/linked-issues-cloud/create-config.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/create-config.webp" alt="create-config screenshot" style="width:100%;" loading="lazy"></a>

In the window that opens, specify the parameters:
<a href="/uploads/linked-issues-cloud/config-screen.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/config-screen.webp" alt="config-screen screenshot" style="width:100%;" loading="lazy"></a>

For example, to display issues with the same priority, you can use the following parameters:
<a href="/uploads/linked-issues-cloud/config-with-data.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/config-with-data.webp" alt="config-with-data screenshot" style="width:100%;" loading="lazy"></a>

* Click the **save** button

### Web panel ###

Next, you need to choose where you want to display the created configuration. Currently, only WebPanels are available. In the future, we will add mapping in JSM and in fields.

* To configure the web panels for linked issues, you need to go to the "Web panels" tab:
<a href="/uploads/linked-issues-cloud/webpanel-config.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/webpanel-config.webp" alt="webpanel-config screenshot" style="width:100%;" loading="lazy"></a>

* Then click the **create** button.

In the window that opens, specify the parameters:
<a href="/uploads/linked-issues-cloud/webpanels-settings.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/webpanels-settings.webp" alt="webpanels-settings screenshot" style="width:100%;" loading="lazy"></a>

Specify which configuration to display, in which projects, and for which types of issues.

* Click the **save** button

### Result ###

Web panels are displayed in issues both in the browser and in the application:
* <a href="/uploads/linked-issues-cloud/result-1.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/result-1.webp" alt="result-1 screenshot" style="width:100%;" loading="lazy"></a>
* <a href="/uploads/linked-issues-cloud/result-2.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/result-2.webp" alt="result-2 screenshot" style="width:100%;" loading="lazy"></a>
* <a href="/uploads/linked-issues-cloud/result-3.webp" target="_blank">
<img src="/uploads/linked-issues-cloud/result-3.webp" alt="result-3 screenshot" style="width:100%;" loading="lazy"></a>

---

## 📖 Documentation

### 💡 Additional Resources
- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Get help and submit feature requests










