---
title: Use Cases - Portal & Simplified
key: message-field-cloud
excerpt: JSM portal examples and simplified section message patterns
category: guides
tags:
  - doc
  - cloud
  - use-cases
  - examples
  - jsm
  - portal
  - section-message
---

* TOC
{:toc}

JSM portal examples and simplified patterns using section messages.

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

- [Use Cases](use-cases) - Development and support team examples
- [Use Cases - Management](use-cases-management) - PM, HR, and compliance examples
- [Configuration Basics](configuration-basics) - Create panels
- [Templates](templates) - Template syntax reference
