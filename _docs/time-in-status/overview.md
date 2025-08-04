---
title: Time in Status - Complete Time Tracking Solution
key: time-in-status
excerpt: "Complete Time in Status overview for Jira Server/Data Center with field types, features, and comprehensive time tracking capabilities."
category: getting-started
tags: [doc, server, datacenter, time-tracking, time-in-status, timer, stopwatch, business-calendar, jql-functions, reporting, sla-tracking, performance-optimization, rest-api, java-api, worklog, field-panels, export, eazybi-integration]
---

<p style="text-align: center;"><a href="https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=datacenter&tab=overview" target="_blank">
<img src="/uploads/time-in-status/overview/marketplace.webp" alt="Message Field plugin on Atlassian Marketplace" style="width:100%;" loading="lazy"></a></p>

<p style="text-align: center;">View app on <a href="https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=datacenter&tab=overview">Atlassian Marketplace</a></p>
## Welcome to Time in status | SLA | Timer | Stopwatch!


An issue (task, work item) goes through various stages during the resolution process. It is necessary to track and control the time spent at each stage.

To calculate time in different scenarios, the plugin provides a set of fields, search functions, reports, and API access.


### Fields: ###
* Time in status field
    * A field that shows the time spent in selected statuses. It's easy to use and solves typical problems related to calculating time in status.<br>
      "How long has the task been open? How long was the task in progress? How long did it wait for a response?" and so on.
* Stopwatch field
    * Tracks the time between events. Events can be as simple as creating a task or adding a comment, or more complex ones such as increasing priority, changing to a specific status, or first assignment. The field is very flexible in its settings and allows you to measure the time between practically any actions on the task. 
* Timer field
    * Based on stopwatch and complemented by countdown functions. 
    * During startup, it is set for a certain duration (5 minutes, 4 hours) and then shows the remaining time. It reacts to issue events (create issue, create comment, etc.). Depending on the settings, it starts or stops the timer. The initial time is determined by JQL conditions.
    * You can send a notification in advance or when the time expires.

All fields have a large number of functions for finding information using jql in real time.
All fields can calculate their values both for new issues (based on issue events) and old issues (based on issue history).  
All fields have a large number of settings for display and access rights.

<table>
<tr>
<td><a href="/uploads/time-in-status/overview/fields-example-2.webp" target="_blank">
<img src="/uploads/time-in-status/overview/fields-example-2.webp" alt="fields-example-2 screenshot" style="width:100%;" loading="lazy"></a></td>
<td><a href="/uploads/time-in-status/overview/fields-example-1.webp" target="_blank">
<img src="/uploads/time-in-status/overview/fields-example-1.webp" alt="fields-example-1 screenshot" style="width:100%;" loading="lazy"></a></td>
</tr>
</table>

### Business calendar: ###

The plugin can calculate the time according to the configured calendars. In fields and jql there are corresponding settings.
You can create an unlimited number of calendars and use them in any contexts and projects. 
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/calendar-example.webp" target="_blank">
<img src="/uploads/time-in-status/overview/calendar-example.webp" alt="calendar-example screenshot" style="width:100%;" loading="lazy"></a></p>

### Reports: ###
Detailed reports are available for each task showing time, transitions between statuses, and assignees. They can be downloaded directly from the task interface. 
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/issue-report.webp" target="_blank">
<img src="/uploads/time-in-status/overview/issue-report.webp" alt="issue-report screenshot" style="width:100%;" loading="lazy"></a></p>

Create JQL reports grouped by any fields or JQL conditions. Various functions are available in reports for calculating values (average, percentiles, etc.).
The reports will be available for viewing and export via a link.

<table>
<tr>
<td><a href="/uploads/time-in-status/overview/reports-example-2.webp" target="_blank">
<img src="/uploads/time-in-status/overview/reports-example-2.webp" alt="reports-example-2 screenshot" style="width:100%;" loading="lazy"></a></td>
<td><a href="/uploads/time-in-status/overview/reports-example-1.webp" target="_blank">
<img src="/uploads/time-in-status/overview/reports-example-1.webp" alt="reports-example-1 screenshot" style="width:100%;" loading="lazy"></a></td>
</tr>
</table>


### Others ###
* Performance/access rights/display settings.
* Supporting tools for integration with other plugins or data export.
* Automatic time records in worklog.
* Functions to compare fields in jql.
* Others

---

## 📖 Complete Documentation

### 🚀 Getting Started
- **[Get Started Guide](/docs/time-in-status/get-started/)** - Quick setup and first steps
- **[Installation](/docs/time-in-status/install/)** - Install and configure the plugin
- **[Step-by-Step: Time in Status](/docs/time-in-status/step-by-step-time-in-status/)** - Configure time tracking
- **[Step-by-Step: Timer](/docs/time-in-status/step-by-step-timer/)** - Set up countdown timers
- **[Step-by-Step: Stopwatch](/docs/time-in-status/step-by-step-stopwatch/)** - Track time between events

### 📊 Field Types & Configuration

#### Time in Status Fields
- **[Time in Status Field](/docs/time-in-status/time-in-status-field/)** - Basic time tracking configuration
- **[Time in Status Field Settings](/docs/time-in-status/time-in-status-field-settings/)** - Advanced field options
- **[Time in Status All Fields](/docs/time-in-status/time-in-status-all/)** - Complete field reference
- **[Time in Status JQL](/docs/time-in-status/time-in-status-jql/)** - Search and query functions

#### Timer Fields  
- **[Timer Field](/docs/time-in-status/timer-field/)** - Countdown timer setup
- **[Timer Field Settings](/docs/time-in-status/timer-field-settings/)** - Timer configuration options
- **[Timer All Fields](/docs/time-in-status/timer-field-all/)** - Complete timer reference
- **[Timer Configs](/docs/time-in-status/timer-configs/)** - Timer scheme configuration
- **[Timer Schemes](/docs/time-in-status/timer-schemes/)** - Advanced timer workflows

#### Stopwatch Fields
- **[Stopwatch Field](/docs/time-in-status/stopwatch-field/)** - Event-based time tracking  
- **[Stopwatch Field Settings](/docs/time-in-status/stopwatch-field-settings/)** - Stopwatch configuration
- **[Stopwatch All Fields](/docs/time-in-status/stopwatch-field-all/)** - Complete stopwatch reference
- **[Stopwatch Configs](/docs/time-in-status/stopwatch-configs/)** - Stopwatch scheme setup
- **[Stopwatch Schemes](/docs/time-in-status/stopwatch-schemes/)** - Advanced stopwatch workflows

### 🔍 Search & JQL Functions
- **[JQL Function Field](/docs/time-in-status/jql-function-field/)** - Basic JQL functions
- **[JQL Function Field All](/docs/time-in-status/jql-function-field-all/)** - Complete JQL reference
- **[Timer Field JQL](/docs/time-in-status/timer-field-jql/)** - Timer search functions
- **[Stopwatch Field JQL](/docs/time-in-status/stopwatch-field-jql/)** - Stopwatch queries

### 📈 Reports & Analytics
- **[Report Create](/docs/time-in-status/report-create/)** - Build custom reports
- **[Report Table](/docs/time-in-status/report-table/)** - Tabular reporting
- **[Reports All](/docs/time-in-status/reports-all/)** - Complete reporting guide
- **[Reports Permissions](/docs/time-in-status/reports-permissions/)** - Access control for reports
- **[Report Assignee Status](/docs/time-in-status/report-assignee-status/)** - Track assignee time
- **[Report Status Assignee](/docs/time-in-status/report-status-assignee/)** - Status-based assignee reports

### ⚙️ Advanced Configuration
- **[Common Settings](/docs/time-in-status/common-settings/)** - Global configuration
- **[Performance Config JQL](/docs/time-in-status/performance-config-jql/)** - Optimize JQL performance
- **[Performance Config Multithreading](/docs/time-in-status/performance-config-multithreading/)** - Threading optimization
- **[Work Calendar](/docs/time-in-status/work-calendar/)** - Business hours configuration
- **[Available Events](/docs/time-in-status/available-events/)** - Trigger event reference
- **[About Fields](/docs/time-in-status/about-fields/)** - Field architecture overview
- **[Autotrack](/docs/time-in-status/autotrack/)** - Automatic time tracking

### 🔧 Integration & Export
- **[REST API](/docs/time-in-status/rest-api/)** - Programmatic access
- **[Java API](/docs/time-in-status/java-api/)** - Developer integration
- **[Export Fields](/docs/time-in-status/export-fields/)** - Data export options
- **[Export to EazyBI](/docs/time-in-status/export-to-eazybi/)** - Business intelligence integration
- **[Worklog Settings](/docs/time-in-status/worklog-settings/)** - Automatic worklog creation

### 🎨 Display & Customization
- **[Field Panel Configs](/docs/time-in-status/field-panel-configs/)** - Panel display options
- **[Bottom Panel Configs](/docs/time-in-status/bottom-panel-configs/)** - Issue bottom panel setup
- **[Templates for Field Value](/docs/time-in-status/templates-for-field-value/)** - Custom field templates
- **[Time Formats](/docs/time-in-status/time-formats/)** - Display formatting options

### 💡 Additional Resources
- **[User Help Info](/docs/time-in-status/user-help-info/)** - End-user guidance
- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Get help and submit requests