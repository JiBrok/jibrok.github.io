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

## JSM Portal Examples

### Customer Welcome Message

Display a welcome message on the customer portal.

**Data Source**: Empty (Message only)
**Display Module**: JSM Portal Panel
**Request Types**: All

{% raw %}
```html
<div style="padding: 16px; background: #F4F5F7; border-radius: 8px;">
  <h4 style="margin-top: 0;">Thank you for contacting support!</h4>

  <p>Your request <strong>{{ issue.key }}</strong> has been received.</p>

  {% switch issue.fields.status.name %}
    {% case "Open" %}
      <p>We're reviewing your request and will respond shortly.</p>
    {% case "In Progress" %}
      <p>A support agent is working on your request.</p>
    {% case "Waiting for customer" %}
      <p style="color: #FF8B00;"><strong>We need more information from you.</strong> Please check the comments below.</p>
    {% case "Resolved" %}
      <p style="color: #00875A;">Your request has been resolved. Please reopen if you need further assistance.</p>
  {% endswitch %}

  <p style="margin-top: 16px; font-size: 12px; color: #6B778C;">
    Average response time: 4 business hours
  </p>
</div>
```
{% endraw %}

---

### Service Announcement (Portal Subheader)

Display service announcements across all portal pages.

**Data Source**: Empty (Message only)
**Display Module**: JSM Portal Subheader

{% raw %}
```html
<div style="padding: 12px; background: #DEEBFF; border-left: 4px solid #0052CC; text-align: center;">
  <strong>Scheduled Maintenance:</strong>
  Our systems will be offline on Saturday, January 15 from 2AM-6AM EST for upgrades.
  <a href="/status">View status page</a>
</div>
```
{% endraw %}

---

## Simplified Examples with Section Messages

These examples use the `<section-message>` tag or **Message Type** setting for cleaner, no-CSS-required styling.

### Quick Warning Message

**Using Message Type setting (no HTML required):**
- **Message Type:** Warning
- **Message Title:** Sprint Planning Required
- **Render Type:** Plain Text
- **Message:** `This issue is not assigned to any sprint.`

**Or using HTML with section-message:**

{% raw %}
```html
<section-message appearance="warning" title="Sprint Planning Required">
  This issue is not assigned to any sprint.
  {% if issue.fields.assignee %}
  Assignee: {{ issue.fields.assignee.displayName }}
  {% else %}
  No assignee - consider assigning this issue.
  {% endif %}
</section-message>
```
{% endraw %}

---

### Blocking Issues Alert (Simplified)

{% raw %}
```html
{% if linkedIssues | len > 0 %}
<section-message appearance="error" title="Blocked">
  This issue is blocked by {{ linkedIssues | len }} unresolved issue(s).
  Blockers: {% for blocker in linkedIssues %}{{ blocker.key }}{% if not loop.last %}, {% endif %}{% endfor %}
</section-message>
{% endif %}
```
{% endraw %}

---

### Code Review Reminder (Simplified)

{% raw %}
```html
<section-message appearance="info" title="Code Review Checklist">
  Before approving: code follows conventions, tests added, no security issues, docs updated.
  {% if issue.fields.customfield_10001 %}
  PR: {{ issue.fields.customfield_10001 }}
  {% endif %}
</section-message>
```
{% endraw %}

---

### SLA Status (Simplified)

{% raw %}
```html
{% set duedate = issue.fields.duedate %}
{% if duedate %}
  {% if isPast(duedate) %}
  <section-message appearance="error" title="SLA Breached">
    Due date was {{ duedate | fromNow }}. Immediate action required!
  </section-message>
  {% elif dateDiff(now(), duedate, "hours") < 24 %}
  <section-message appearance="warning" title="SLA At Risk">
    Due {{ duedate | fromNow }} ({{ duedate | date("yyyy-MM-dd HH:mm") }})
  </section-message>
  {% else %}
  <section-message appearance="success" title="SLA On Track">
    Due {{ duedate | fromNow }}
  </section-message>
  {% endif %}
{% endif %}
```
{% endraw %}

---

### Service Announcement (Simplified)

{% raw %}
```html
<section-message appearance="info" title="Scheduled Maintenance">
  Our systems will be offline on Saturday, January 15 from 2AM-6AM EST for upgrades.
</section-message>
```
{% endraw %}

---

### Data Privacy Notice (Simplified)

{% raw %}
```html
<section-message appearance="error" title="Data Privacy Notice">
  This issue may contain PII. Do not share outside the organization.
  Delete personal data when resolved. Report any breaches immediately.
</section-message>
```
{% endraw %}

---

## Tips & Best Practices

### Using Section Messages

The `<section-message>` tag provides Atlassian-styled message boxes without custom CSS:

{% raw %}
```html
<section-message appearance="info|warning|error|success|change" title="Optional Title">
  Message content here
</section-message>
```
{% endraw %}

**Available appearances:**
- `info` - Blue informational
- `warning` - Yellow warning
- `error` - Red error
- `success` - Green success
- `change` - Purple change/discovery

Alternatively, use the **Message Type** setting in configuration to wrap your entire message without writing any HTML.

### Display JQL Examples

```jql
# Show for high priority bugs only
priority in (High, Highest) AND type = Bug

# Show for overdue issues
duedate < now() AND status != Done

# Show for issues in specific sprint
sprint in openSprints() AND assignee = currentUser()

# Show for issues without estimate
"Story Points" is EMPTY AND type = Story
```

### User Field Visibility

- **Assignee Only**: Shows panel only to the person assigned to fix
- **Reporter Only**: Shows panel only to the person who reported
- **Watchers**: Shows panel to anyone watching the issue
- **Custom Field**: Shows to users in a custom user picker field

### Combining Filters

For maximum precision, combine:
1. **Project Filter**: Target specific projects
2. **Issue Type Filter**: Target specific issue types
3. **Display JQL**: Dynamic conditions
4. **User Field**: Audience-specific visibility

### Color Reference

Use these colors for consistent styling:

| Purpose | Background | Border |
|---------|------------|--------|
| Info | `#deebff` | `#0052cc` |
| Success | `#e3fcef` | `#00875a` |
| Warning | `#fffae6` | `#ff8b00` |
| Error | `#ffebe6` | `#de350b` |
| Neutral | `#f4f5f7` | `#dfe1e6` |

### Performance Tips

- Start with **Max Issues = 100**, increase only if needed
- Use indexed fields in JQL: `project`, `status`, `assignee`
- Avoid `text ~ "keyword"` on large datasets
- Limit loops with `| take(10)` filter

### Always Handle Null Values

{% raw %}
```
{{ issue.fields.assignee.displayName | default("Unassigned") }}

{% if issue.fields.duedate %}
  Due: {{ issue.fields.duedate | date("MM-dd") }}
{% endif %}
```
{% endraw %}

---

## Related Documentation

- [Configuration Basics](configuration-basics) - Create panels
- [Data Sources](data-sources) - JQL and linked issues
- [Templates](templates) - Template syntax reference
- [Context Filters](context-filters) - Visibility rules

