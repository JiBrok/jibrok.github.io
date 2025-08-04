---
title: Stopwatch for Jira Cloud - Event Time Tracking
key: stopwatch-cloud
excerpt: "Stopwatch field for Jira Cloud enables flexible time tracking between events with customizable triggers, pause functionality, and JQL integration."
category: getting-started
tags: [doc, cloud, time-tracking, stopwatch, event-tracking, business-calendar, jql-functions, field-creation, migration, service-status, web-panels]
---


<p style="text-align: center;"><a href="https://marketplace.atlassian.com/apps/1225685/stopwatch-field?tab=overview&hosting=cloud" target="_blank">
<img src="/uploads/time-in-status/overview/marketplace.webp" alt="Message Field plugin on Atlassian Marketplace" style="width:100%;" loading="lazy"></a></p>

<p style="text-align: center;">View app on <a href="https://marketplace.atlassian.com/apps/1225685/stopwatch-field?tab=overview&hosting=cloud">Atlassian Marketplace</a></p>
## Welcome to Stopwatch for Jira Cloud!


The issue (task, work) during the resolution process goes through various stages. It is necessary to track and control the time spent at each stage.

The plugin provides fields, JQL functions for searching and reports.


### Stopwatch field ###
* The field keeps track of the time between issue events: issue created, issue commented, issue resolved, and many others including special events (priority changes, field value changes).<br>
  "How long has passed from the moment of creation to the first comment? How long did you work on the task (taking into account the complex workflow)?" and so on.

Fields have functions for finding information using JQL.
Fields can calculate their values both for new issues (based on issue events) and old issues (based on the history of issues).  
Fields have a large number of time formats for display.


### Business calendar: ###

The plugin can calculate time according to the configured calendars. In fields and JQL, there are corresponding settings.
You can create an unlimited number of calendars and use them in any contexts and projects.
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/calendar-example.webp" target="_blank">
<img src="/uploads/time-in-status/overview/calendar-example.webp" alt="calendar-example screenshot" style="width:100%;" loading="lazy"></a></p>

### Reports: ### 

The "Stopwatch" fields can be used like regular fields in the JQL navigator and exported, for example, to Excel.

<table>
<tr>
<td><a href="/uploads/tis-cloud/time-in-status-navigator.webp" target="_blank">
<img src="/uploads/tis-cloud/time-in-status-navigator.webp" alt="time-in-status-navigator screenshot" style="width:100%;" loading="lazy"></a></td>
<td><a href="/uploads/tis-cloud/time-in-status-excel.webp" target="_blank">
<img src="/uploads/tis-cloud/time-in-status-excel.webp" alt="time-in-status-excel screenshot" style="width:100%;" loading="lazy"></a></td>
</tr>
</table>

(🛠 New functionality for generating and downloading reports is coming soon)

---

## 📖 Complete Documentation

### 🚀 Getting Started
- **[Get Started Guide](/docs/stopwatch-cloud/get-started/)** - Quick setup and first steps
- **[Installation](/docs/stopwatch-cloud/install/)** - Install and configure the app

### ⚙️ Field Configuration
- **[Create Stopwatch Field](/docs/stopwatch-cloud/stopwatch-field-create/)** - Set up new stopwatch fields
- **[Stopwatch Field Settings](/docs/stopwatch-cloud/stopwatch-field-settings/)** - Configure field options and behavior

### 🔍 Search & JQL Functions
- **[Stopwatch JQL](/docs/stopwatch-cloud/stopwatch-jql/)** - Search and query functions

### 📅 Time Management
- **[Work Calendar](/docs/stopwatch-cloud/work-calendar/)** - Business hours configuration

### 🖥️ Interface & Display
- **[Web Panel](/docs/stopwatch-cloud/web-panel/)** - Display configuration options

### 📋 System Information
- **[Service Info](/docs/stopwatch-cloud/service-info/)** - System status and information
- **[Status Page](/docs/stopwatch-cloud/status-page/)** - Service status monitoring

### 🔄 Migration & Updates
- **[Migration Documentation](/docs/stopwatch-cloud/migrationDocumentation/)** - Version migration guide
- **[Feature Differences](/docs/stopwatch-cloud/featureDifferenceDocumentation/)** - Compare features across versions

### 💡 Additional Resources
- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Get help and submit feature requests

