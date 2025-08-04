---
title: Timer for Jira Cloud - Countdown & SLA Tracking
key: timer-cloud
excerpt: "Timer field for Jira Cloud with countdown functionality, goal time limits, SLA tracking, and comprehensive time management features."
category: getting-started
tags: [doc, cloud, timer, countdown, sla-tracking, goal-time, business-calendar, jql-functions, field-creation, migration, service-status, web-panels]
---

<p style="text-align: center;"><a href="https://marketplace.atlassian.com/apps/1225684/timer-field?tab=overview&hosting=cloud" target="_blank">
<img src="/uploads/time-in-status/overview/marketplace.webp" alt="Message Field plugin on Atlassian Marketplace" style="width:100%;" loading="lazy"></a></p>

<p style="text-align: center;">View app on <a href="https://marketplace.atlassian.com/apps/1225684/timer-field?tab=overview&hosting=cloud">Atlassian Marketplace</a></p>
## Welcome to Timer for Jira Cloud!


Issues (tasks, work items) go through various stages during the resolution process. It is necessary to track and control the time spent at each stage.

The plugin provides fields, JQL functions for searching, and reports.


### Timer field ###
* The field keeps track of the time between issue events: issue created, issue commented, issue resolved, and many others including special events (priority changes, field value changes).<br>
  "How long has passed from the moment of creation to the first comment? How long did you work on the issue (taking into account the complex workflow)?" and so on.

Fields have functions for finding information using JQL.
Fields can calculate their values both for new issues (based on issue events) and old issues (based on the history of issues).
Fields have a large number of time formats for display.


### Business calendar: ###

The plugin can calculate time according to the configured calendars. Fields and JQL have corresponding settings.
You can create an unlimited number of calendars and use them in any contexts and projects.
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/calendar-example.webp" target="_blank">
<img src="/uploads/time-in-status/overview/calendar-example.webp" alt="calendar-example screenshot" style="width:100%;" loading="lazy"></a></p>

### Reports: ### 

The "Timer" fields can be used like regular fields in the JQL navigator and exported, for example, to Excel.

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
- **[Get Started Guide](/docs/timer-cloud/get-started/)** - Quick setup and first steps
- **[Installation](/docs/timer-cloud/install/)** - Install and configure the app
- **[Step-by-Step: Timer](/docs/timer-cloud/step-by-step-timer/)** - Complete timer setup guide

### ⚙️ Field Configuration
- **[Create Timer Field](/docs/timer-cloud/timer-field-create/)** - Set up new timer fields
- **[Timer Field Settings](/docs/timer-cloud/timer-field-settings/)** - Configure field options and behavior

### 🔍 Search & JQL Functions
- **[Timer JQL](/docs/timer-cloud/timer-jql/)** - Search and query functions

### 📅 Time Management
- **[Work Calendar](/docs/timer-cloud/work-calendar/)** - Business hours configuration

### 🖥️ Interface & Display
- **[Web Panel](/docs/timer-cloud/web-panel/)** - Display configuration options

### 📋 System Information
- **[Service Info](/docs/timer-cloud/service-info/)** - System status and information
- **[Status Page](/docs/timer-cloud/status-page/)** - Service status monitoring

### 🔄 Migration & Updates
- **[Migration Documentation](/docs/timer-cloud/migrationDocumentation/)** - Version migration guide
- **[Feature Differences](/docs/timer-cloud/featureDifferenceDocumentation/)** - Compare features across versions

### 💡 Additional Resources
- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Get help and submit feature requests