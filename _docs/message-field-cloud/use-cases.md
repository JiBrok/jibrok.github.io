---
title: Use Cases
key: message-field-cloud
excerpt: Practical scenarios and configurations for different teams
category: guides
tags:
  - doc
  - cloud
  - use-cases
  - examples
  - scenarios
---

* TOC
{:toc}

Practical examples of how teams use Message Panel to solve real problems.

---

## Development Teams

### Blocking Issues Alert

Show issues that are blocking the current issue from progressing.

**Data Source**: Linked Issues
**Link Types**: "is blocked by" (inward)
**Display Module**: Issue Panel

{% raw %}
```html
{% if linkedIssues | len > 0 %}
<div style="padding: 12px; background: #FFEBE6; border-left: 4px solid #DE350B; margin-bottom: 12px;">
  <strong>Blocked by {{ linkedIssues | len }} issue(s)</strong>
</div>

<table style="width: 100%; border-collapse: collapse;">
  <tr style="background: #F4F5F7;">
    <th style="padding: 8px; text-align: left;">Issue</th>
    <th style="padding: 8px; text-align: left;">Status</th>
    <th style="padding: 8px; text-align: left;">Assignee</th>
  </tr>
  {% for blocker in linkedIssues %}
  <tr>
    <td style="padding: 8px;">{{ blocker | issueLink }}</td>
    <td style="padding: 8px;">{{ blocker.fields.status | statusBadge }}</td>
    <td style="padding: 8px;">{{ blocker.fields.assignee.displayName | default("Unassigned") }}</td>
  </tr>
  {% endfor %}
</table>
{% endif %}
```
{% endraw %}

---

### Epic Progress Dashboard

Display progress of child issues within an Epic.

**Data Source**: JQL Query
**Display Module**: Issue Panel
**Issue Types**: Epic
**JQL**: `"Epic Link" = {{issue.key}} OR parent = {{issue.key}}`

{% raw %}
```html
{% set total = linkedIssues | len %}
{% set done = linkedIssues | filter("fields.status.statusCategory.key", "done") | len %}
{% set inProgress = linkedIssues | filter("fields.status.statusCategory.key", "indeterminate") | len %}
{% set todo = total - done - inProgress %}
{% set percent = total > 0 ? ((done / total) * 100) | round : 0 %}

<div style="margin-bottom: 16px;">
  <strong>Epic Progress: {{ percent }}%</strong>
  <div style="background: #DFE1E6; border-radius: 4px; height: 8px; margin-top: 8px;">
    <div style="background: #00875A; width: {{ percent }}%; height: 100%; border-radius: 4px;"></div>
  </div>
</div>

<div style="display: flex; gap: 16px; margin-bottom: 16px;">
  <div><span style="color: #00875A;">Done:</span> {{ done }}</div>
  <div><span style="color: #0052CC;">In Progress:</span> {{ inProgress }}</div>
  <div><span style="color: #6B778C;">To Do:</span> {{ todo }}</div>
</div>

{% if linkedIssues | len > 0 %}
<details>
  <summary style="cursor: pointer; color: #0052CC;">View all {{ total }} issues</summary>
  <ul style="margin-top: 8px;">
  {% for child in linkedIssues | take(20) %}
    <li>{{ child | issueLink }} - {{ child.fields.status | statusBadge }}</li>
  {% endfor %}
  {% if total > 20 %}
    <li><em>...and {{ total - 20 }} more</em></li>
  {% endif %}
  </ul>
</details>
{% endif %}
```
{% endraw %}

---

### Code Review Checklist

Display a checklist for code review tasks.

**Data Source**: Empty (Message only)
**Display Module**: Issue Panel
**Issue Types**: Story, Task, Bug
**Display JQL**: `status = "Code Review"`

{% raw %}
```html
<div style="padding: 12px; background: #DEEBFF; border-left: 4px solid #0052CC;">
  <strong>Code Review Checklist</strong>
</div>

<div style="padding: 12px;">
  <p><strong>Before approving, verify:</strong></p>
  <ul style="list-style: none; padding-left: 0;">
    <li>[ ] Code follows team conventions</li>
    <li>[ ] Unit tests added/updated</li>
    <li>[ ] No security vulnerabilities</li>
    <li>[ ] Documentation updated</li>
    <li>[ ] No console.log or debug code</li>
  </ul>

  {% if issue.fields.customfield_10001 %}
  <p style="margin-top: 12px;"><strong>PR Link:</strong>
    <a href="{{ issue.fields.customfield_10001 }}" target="_blank">View Pull Request</a>
  </p>
  {% endif %}
</div>
```
{% endraw %}

---

### Sprint Scope Warning

Warn when issue is not assigned to a sprint.

**Data Source**: Empty (Message only)
**Display Module**: Issue Panel
**Display JQL**: `sprint is EMPTY AND status != Done AND type in (Story, Task, Bug)`

{% raw %}
```html
<div style="padding: 12px; background: #FFFAE6; border-left: 4px solid #FF8B00;">
  <strong>Sprint Planning Required</strong>
  <p style="margin: 8px 0 0 0;">
    This issue is not assigned to any sprint.
    {% if issue.fields.assignee %}
    <br>Assignee: {{ issue.fields.assignee.displayName }}
    {% else %}
    <br>No assignee - consider assigning this issue.
    {% endif %}
  </p>
</div>
```
{% endraw %}

---

## Support Teams

### Customer Information Panel

Display customer details from a linked customer ticket.

**Data Source**: Linked Issues
**Display Module**: Issue Panel
**Link Types**: "is caused by", "relates to"

{% raw %}
```html
<div style="padding: 12px; background: #F4F5F7; border-radius: 4px;">
  <strong>Customer Information</strong>

  {% if issue.fields.reporter %}
  <div style="margin-top: 12px;">
    <p><strong>Reporter:</strong> {{ issue.fields.reporter.displayName }}</p>
    {% if issue.fields.reporter.emailAddress %}
    <p><strong>Email:</strong> {{ issue.fields.reporter.emailAddress }}</p>
    {% endif %}
  </div>
  {% endif %}

  {% if issue.fields.customfield_10050 %}
  <div style="margin-top: 12px;">
    <p><strong>Company:</strong> {{ issue.fields.customfield_10050 }}</p>
  </div>
  {% endif %}

  {% if issue.fields.customfield_10051 %}
  <div style="margin-top: 12px;">
    <p><strong>Support Tier:</strong> {{ issue.fields.customfield_10051.value }}</p>
  </div>
  {% endif %}
</div>
```
{% endraw %}

---

### SLA Warning

Display SLA breach warnings for support tickets.

**Data Source**: Empty (Message only)
**Display Module**: Issue Panel
**Projects**: Support projects
**Display JQL**: `status != Done AND status != Closed`

{% raw %}
```html
{% set duedate = issue.fields.duedate %}

{% if duedate %}
  {% if isPast(duedate) %}
  <div style="padding: 12px; background: #FFEBE6; border-left: 4px solid #DE350B;">
    <strong>SLA BREACHED</strong>
    <p style="margin: 8px 0 0 0;">
      Due date was {{ duedate | fromNow }}
      <br>Immediate action required!
    </p>
  </div>
  {% elif dateDiff(now(), duedate, "hours") < 24 %}
  <div style="padding: 12px; background: #FFFAE6; border-left: 4px solid #FF8B00;">
    <strong>SLA At Risk</strong>
    <p style="margin: 8px 0 0 0;">
      Due {{ duedate | fromNow }}
      <br>Due date: {{ duedate | date("yyyy-MM-dd HH:mm") }}
    </p>
  </div>
  {% else %}
  <div style="padding: 12px; background: #E3FCEF; border-left: 4px solid #00875A;">
    <strong>SLA On Track</strong>
    <p style="margin: 8px 0 0 0;">Due {{ duedate | fromNow }}</p>
  </div>
  {% endif %}
{% endif %}
```
{% endraw %}

---

### Related Tickets

Show other tickets from the same customer or about the same topic.

**Data Source**: JQL Query
**Display Module**: Issue Panel
**JQL**: `reporter = "{{issue.fields.reporter.accountId}}" AND key != {{issue.key}} ORDER BY created DESC`
**Max Issues**: 10

{% raw %}
```html
{% if linkedIssues | len > 0 %}
<div style="padding: 12px; background: #F4F5F7; border-radius: 4px;">
  <strong>Other Tickets from this Customer</strong>

  <table style="width: 100%; border-collapse: collapse; margin-top: 12px;">
    {% for ticket in linkedIssues | take(5) %}
    <tr>
      <td style="padding: 6px 0;">
        {{ ticket | issueLink }}
        <span style="color: #6B778C; font-size: 12px;">
          {{ ticket.fields.created | fromNow }}
        </span>
      </td>
      <td style="padding: 6px 0; text-align: right;">
        {{ ticket.fields.status | statusBadge }}
      </td>
    </tr>
    {% endfor %}
  </table>

  {% if linkedIssues | len > 5 %}
  <p style="margin-top: 8px; color: #6B778C; font-size: 12px;">
    +{{ linkedIssues | len - 5 }} more tickets
  </p>
  {% endif %}
</div>
{% endif %}
```
{% endraw %}

---

### Resolution Guide

Display troubleshooting steps based on issue category.

**Data Source**: Empty (Message only)
**Display Module**: Issue Panel
**Display JQL**: `"Issue Category" = "Login Issues"`

{% raw %}
```html
<div style="padding: 12px; background: #DEEBFF; border-left: 4px solid #0052CC;">
  <strong>Resolution Guide: Login Issues</strong>
</div>

<div style="padding: 12px;">
  <p><strong>Common solutions:</strong></p>
  <ol>
    <li>Verify the user's email address is correct</li>
    <li>Check if the account is locked (Admin Console)</li>
    <li>Ask user to clear browser cache and cookies</li>
    <li>Try incognito/private browsing mode</li>
    <li>Check for any active maintenance windows</li>
  </ol>

  <p style="margin-top: 12px;">
    <strong>Escalation:</strong> If issue persists, escalate to Tier 2 with:
    <ul>
      <li>Browser and OS version</li>
      <li>Screenshot of error message</li>
      <li>HAR file if possible</li>
    </ul>
  </p>
</div>
```
{% endraw %}

---

## More Examples

- [Use Cases - Management & HR](use-cases-management) - Project managers, HR, and compliance examples
- [Use Cases - Portal & Simplified](use-cases-portal) - JSM portal examples and section message patterns

---

## Related Documentation

- [Configuration Basics](configuration-basics) - Create panels
- [Data Sources](data-sources) - JQL and linked issues
- [Templates](templates) - Template syntax reference
- [Context Filters](context-filters) - Visibility rules
