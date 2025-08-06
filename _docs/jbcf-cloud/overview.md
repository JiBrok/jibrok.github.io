---
title: JiBrok Calculated Fields for Jira Cloud
key: jbcf-cloud
category: getting-started
tags: [doc, cloud, calculated-fields, custom-fields, overview]
excerpt: JBCF Cloud provides calculated custom fields for Jira Cloud including comments, user info, status history, link counts, and sorting.
---

<a href="https://marketplace.atlassian.com/apps/1221055/calculated-and-other-custom-fields-jbcf?hosting=datacenter&tab=overview" target="_blank">
<img src="/uploads/jbcf/marketplace.webp" alt="Message Field plugin on Atlassian Marketplace" style="width:100%;;" loading="lazy"></a>

View app on [Atlassian Marketplace](https://marketplace.atlassian.com/apps/1221055/calculated-and-other-custom-fields-jbcf?hosting=cloud&tab=overview)
## Welcome to JiBrok Calculated Fields (JBCF)!


### Collection of calculated custom fields:

* Number of comments
  * Number of comments in the issue.
* Last comment
  * The text of the last comment.
* Commented users
  * List of users(names) who have commented on the issue.
* User last commented
  * Last comment author(name).
* Date of last comment
  * Date of last comment.
* Is author of last comment assignee
  * Is the last comment in the task from the assignee? Values: 'true'/'false'.
* Is author of last comment reporter
  * Is the last comment in the task from the reporter? Values: 'true'/'false'.
* First comment
  * The text of the first comment.
* First comment Author
  * First comment author(name).
* First comment Date
  * Date of first comment.
* Is author of first comment assignee
  * The first comment in the task from the assignee? Values: 'true'/'false'.
* Is author of first comment reporter
  * Is the first comment in the task from the reporter? Values: 'true'/'false'.
* Previous status
  * Previous status name.
* Previous assignee
  * Previous assignee(name).
* Last change status Author
  * User(name) who last updated the issue status.
* Number of links
  * Number of links in the issue.
* Number of subtasks
  * Number of subtasks in the issue.
* Number of inward links
  * The number of incoming links in the issue.
* Number of outward links
  * The number of outgoing links in the issue.
* Sort by parent ASK
  * Field for sorting issues by parent issue key. Subtasks will be sorted in ascending key order.  
* Sort by parent DESK
  * Field for sorting issues by parent issue key. Subtasks will be sorted in descending key order.
* Sort by epic ASK
  * Field for sorting issues by epic key. Issues under the epic will be sorted in ascending key order.
* Sort by epic DESK
  * Field for sorting issues by epic key. Issues under the epic will be sorted in descending key order.
* Sort by epic rank
  * Field for sorting issues by epic rank. Issues under the epic will be sorted in ascending rank order.
* User resolver
  * The last User(name) to set the resolution in the issue.
* User last updater
  * The last User(name) updated the issue.
* Component leads
  * List of users(names) who are leaders of the components specified in the issue.
* Who was assignee
  * List of users(name) who was the assignee.
* User project lead
  * Project leader(name).

---

## 📖 Complete Documentation

### ⚙️ Field Configuration
- **[Create JBCF Field](/docs/jbcf-cloud/jbcf-field-create/)** - Set up calculated custom fields

### 📋 System Information
- **[Service Info](/docs/jbcf-cloud/service-info/)** - System status and information
- **[Status Page](/docs/jbcf-cloud/status-page/)** - Service status monitoring

### 🔄 Migration & Updates
- **[Migration Documentation](/docs/jbcf-cloud/migrationDocumentation/)** - Version migration guide
- **[Feature Differences](/docs/jbcf-cloud/featureDifferenceDocumentation/)** - Compare features across versions

### 💡 Additional Resources
- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Get help and submit feature requests