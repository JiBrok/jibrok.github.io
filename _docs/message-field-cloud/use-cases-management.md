---
title: Use Cases - Management & HR
key: message-field-cloud
excerpt: Panel examples for project managers, HR, and compliance teams
category: guides
tags:
  - doc
  - cloud
  - use-cases
  - examples
  - management
  - hr
  - compliance
---

* TOC
{:toc}

Examples for project managers, HR teams, and compliance/legal workflows.

---

## Project Managers

### Dependency Tracker

Show issues that depend on this one.

**Data Source**: Linked Issues
**Link Types**: "blocks" (outward)
**Display Module**: Issue Panel

{% raw %}
```html
{% set dependents = linkedIssues %}
{% set blockedCount = dependents | filter("fields.status.statusCategory.key", "!=", "done") | len %}

{% if dependents | len > 0 %}
<div style="padding: 12px; background: {% if blockedCount > 0 %}#FFFAE6{% else %}#E3FCEF{% endif %}; border-left: 4px solid {% if blockedCount > 0 %}#FF8B00{% else %}#00875A{% endif %};">
  <strong>{{ dependents | len }} Issue(s) Depend on This</strong>
  {% if blockedCount > 0 %}
  <p style="margin: 4px 0 0 0; font-size: 12px;">{{ blockedCount }} waiting for this issue</p>
  {% endif %}
</div>

<table style="width: 100%; border-collapse: collapse; margin-top: 12px;">
  <tr style="background: #F4F5F7;">
    <th style="padding: 8px; text-align: left;">Issue</th>
    <th style="padding: 8px; text-align: left;">Status</th>
    <th style="padding: 8px; text-align: left;">Due</th>
  </tr>
  {% for dep in dependents %}
  <tr>
    <td style="padding: 8px;">{{ dep | issueLink }}</td>
    <td style="padding: 8px;">{{ dep.fields.status | statusBadge }}</td>
    <td style="padding: 8px;">
      {% if dep.fields.duedate %}
        {{ dep.fields.duedate | date("MM-dd") }}
      {% else %}
        -
      {% endif %}
    </td>
  </tr>
  {% endfor %}
</table>
{% endif %}
```
{% endraw %}

---

### Deadline Warning

Alert when due date is approaching.

**Data Source**: Empty (Message only)
**Display Module**: Issue Panel
**Display JQL**: `duedate <= endOfWeek() AND status != Done`

{% raw %}
```html
{% set due = issue.fields.duedate %}
{% set daysUntil = dateDiff(now(), due, "days") %}

<div style="padding: 12px; background: {% if daysUntil < 0 %}#FFEBE6{% elif daysUntil <= 2 %}#FFFAE6{% else %}#DEEBFF{% endif %}; border-left: 4px solid {% if daysUntil < 0 %}#DE350B{% elif daysUntil <= 2 %}#FF8B00{% else %}#0052CC{% endif %};">
  {% if daysUntil < 0 %}
  <strong>OVERDUE</strong>
  <p style="margin: 4px 0 0 0;">Due date was {{ due | fromNow }}</p>
  {% elif daysUntil == 0 %}
  <strong>Due Today!</strong>
  <p style="margin: 4px 0 0 0;">{{ due | date("yyyy-MM-dd") }}</p>
  {% elif daysUntil == 1 %}
  <strong>Due Tomorrow</strong>
  <p style="margin: 4px 0 0 0;">{{ due | date("yyyy-MM-dd") }}</p>
  {% else %}
  <strong>Due in {{ daysUntil }} days</strong>
  <p style="margin: 4px 0 0 0;">{{ due | date("yyyy-MM-dd") }}</p>
  {% endif %}
</div>
```
{% endraw %}

---

### Team Workload

Show how many issues are assigned to the same person.

**Data Source**: JQL Query
**Display Module**: Issue Panel
**Display JQL**: `assignee is not EMPTY`
**JQL**: `assignee = "{{issue.fields.assignee.accountId}}" AND status != Done`

{% raw %}
```html
{% set assignee = issue.fields.assignee %}
{% set workload = linkedIssues | len %}

{% if assignee %}
<div style="padding: 12px; background: #F4F5F7; border-radius: 4px;">
  <div style="display: flex; align-items: center; gap: 8px;">
    {{ assignee | avatar(24) }}
    <strong>{{ assignee.displayName }}'s Workload</strong>
  </div>

  <div style="margin-top: 12px;">
    <p><strong>{{ workload }}</strong> active issues</p>

    {% if workload > 10 %}
    <p style="color: #DE350B; font-size: 12px; margin-top: 4px;">
      High workload - consider reassigning
    </p>
    {% elif workload > 5 %}
    <p style="color: #FF8B00; font-size: 12px; margin-top: 4px;">
      Moderate workload
    </p>
    {% else %}
    <p style="color: #00875A; font-size: 12px; margin-top: 4px;">
      Capacity available
    </p>
    {% endif %}
  </div>
</div>
{% endif %}
```
{% endraw %}

---

## HR / Onboarding

### New Employee Checklist

Display onboarding tasks for new employee setup issues.

**Data Source**: Empty (Message only)
**Display Module**: Issue Panel
**Issue Types**: "New Employee", "Onboarding"

{% raw %}
```html
<div style="padding: 12px; background: #DEEBFF; border-left: 4px solid #0052CC;">
  <strong>New Employee Onboarding Checklist</strong>
</div>

<div style="padding: 12px;">
  <p><strong>Day 1 Tasks:</strong></p>
  <ul>
    <li>Create Active Directory account</li>
    <li>Set up email and calendar</li>
    <li>Issue laptop and peripherals</li>
    <li>Add to required Slack channels</li>
  </ul>

  <p style="margin-top: 12px;"><strong>Week 1 Tasks:</strong></p>
  <ul>
    <li>Complete security training</li>
    <li>Set up VPN access</li>
    <li>Add to relevant Jira projects</li>
    <li>Schedule intro meetings with team</li>
  </ul>

  {% if issue.fields.customfield_10100 %}
  <p style="margin-top: 12px;">
    <strong>Start Date:</strong> {{ issue.fields.customfield_10100 | date("yyyy-MM-dd") }}
    {% if isFuture(issue.fields.customfield_10100) %}
    ({{ issue.fields.customfield_10100 | fromNow }})
    {% endif %}
  </p>
  {% endif %}
</div>
```
{% endraw %}

---

## Compliance / Legal

### Approval Requirements

Show approval status and requirements.

**Data Source**: Empty (Message only)
**Display Module**: Issue Panel
**Display JQL**: `"Requires Approval" = Yes`

{% raw %}
```html
{% set approver = issue.fields.customfield_10200 %}
{% set approvalStatus = issue.fields.customfield_10201 %}

<div style="padding: 12px; background: {% if approvalStatus.value == 'Approved' %}#E3FCEF{% elif approvalStatus.value == 'Rejected' %}#FFEBE6{% else %}#FFFAE6{% endif %}; border-left: 4px solid {% if approvalStatus.value == 'Approved' %}#00875A{% elif approvalStatus.value == 'Rejected' %}#DE350B{% else %}#FF8B00{% endif %};">
  <strong>Approval Status: {{ approvalStatus.value | default("Pending") }}</strong>
</div>

<div style="padding: 12px;">
  {% if approver %}
  <p><strong>Approver:</strong> {{ approver.displayName }}</p>
  {% else %}
  <p style="color: #DE350B;"><strong>No approver assigned!</strong></p>
  {% endif %}

  <p style="margin-top: 12px;"><strong>Requirements:</strong></p>
  <ul>
    <li>Budget impact assessment complete</li>
    <li>Legal review if > $10,000</li>
    <li>Security review for external vendors</li>
  </ul>

  {% if approvalStatus.value == 'Pending' %}
  <p style="margin-top: 12px; color: #6B778C; font-size: 12px;">
    Waiting for approval before work can proceed
  </p>
  {% endif %}
</div>
```
{% endraw %}

---

### Data Privacy Notice

Show GDPR/privacy notice for issues containing personal data.

**Data Source**: Empty (Message only)
**Display Module**: Issue Panel
**Display JQL**: `labels = "contains-pii" OR labels = "gdpr"`

{% raw %}
```html
<div style="padding: 12px; background: #FFEBE6; border-left: 4px solid #DE350B;">
  <strong>Data Privacy Notice</strong>
</div>

<div style="padding: 12px;">
  <p>This issue may contain personally identifiable information (PII).</p>

  <p style="margin-top: 12px;"><strong>Requirements:</strong></p>
  <ul>
    <li>Do not share outside the organization</li>
    <li>Minimize PII in descriptions and comments</li>
    <li>Delete PII when issue is resolved</li>
    <li>Report any data breaches immediately</li>
  </ul>

  <p style="margin-top: 12px;">
    <a href="https://company.com/data-policy" target="_blank">View Data Handling Policy</a>
  </p>
</div>
```
{% endraw %}

---

## Related Documentation

- [Use Cases](use-cases) - Development and support team examples
- [Use Cases - Portal](use-cases-portal) - JSM portal and simplified examples
- [Templates](templates) - Template syntax reference
- [Context Filters](context-filters) - Visibility rules
