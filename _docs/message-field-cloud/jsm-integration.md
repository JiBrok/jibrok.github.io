---
title: JSM Integration
key: message-field-cloud
excerpt: Display panels on Jira Service Management customer portal
category: advanced
tags:
  - doc
  - cloud
  - jsm
  - service-management
  - portal
---

# JSM Integration
{:.no_toc}

* TOC
{:toc}

Display information panels on the customer-facing Jira Service Management portal.

## Overview

Message Panel supports three JSM portal locations:

| Module | Location | Visibility |
|--------|----------|------------|
| **Portal Request Detail Panel** | Request details page | Customers viewing requests |
| **Portal Footer** | Bottom of portal pages | All portal visitors |
| **Portal Subheader** | Below portal header | All portal visitors |

---

## Enabling JSM Modules

1. Go to **Apps** → **Message Panel Settings**
2. Click **Module Settings** tab
3. Enable JSM modules:
   - JSM Portal Panel
   - JSM Portal Footer
   - JSM Portal Subheader
4. Click **Save**

---

## Portal Request Detail Panel

Displays on the request details page when customers view their requests.

### Configuration

1. Create new configuration
2. Select **JSM Portal Panel** as Display Module
3. Configure data source and message
4. Set context filters (request types, projects)
5. Save

### Use Cases

**Customer Instructions:**
{% raw %}
```
Thank you for your request!

We typically respond within {{ issue.fields.customfield_10001 | default("24") }} hours.

Please ensure you've provided:
- Detailed description of the issue
- Screenshots if applicable
- Contact information for follow-up
```
{% endraw %}

**Related Articles:**
{% raw %}
```html
<div style="padding: 12px; background: #F4F5F7; border-radius: 4px;">
  <strong>Helpful Resources:</strong>
  <ul>
    <li><a href="https://support.example.com/faq">FAQ</a></li>
    <li><a href="https://support.example.com/status">System Status</a></li>
  </ul>
</div>
```
{% endraw %}

**Request Status Info:**
{% raw %}
```
**Current Status**: {{ issue.fields.status.name }}

{% if issue.fields.status.name == "Waiting for customer" %}
We need more information from you. Please check the comments and respond.
{% elif issue.fields.status.name == "In Progress" %}
Our team is working on your request.
{% elif issue.fields.status.name == "Resolved" %}
This request has been resolved. Please reopen if you need further assistance.
{% endif %}
```
{% endraw %}

---

## Portal Footer

Displays at the bottom of all portal pages.

### Configuration

1. Create new configuration
2. Select **JSM Portal Footer** as Display Module
3. Add your footer content
4. Save

### Use Cases

**Contact Information:**
{% raw %}
```html
<div style="text-align: center; padding: 16px; color: #666;">
  <p>Need urgent help? Call us at <strong>1-800-SUPPORT</strong></p>
  <p>Business hours: Monday-Friday, 9AM-5PM EST</p>
</div>
```
{% endraw %}

**Legal Links:**
{% raw %}
```html
<div style="text-align: center; font-size: 12px; color: #999;">
  <a href="/privacy">Privacy Policy</a> |
  <a href="/terms">Terms of Service</a> |
  <a href="/contact">Contact Us</a>
</div>
```
{% endraw %}

---

## Portal Subheader

Displays below the portal header, visible prominently on all pages.

### Configuration

1. Create new configuration
2. Select **JSM Portal Subheader** as Display Module
3. Add announcement content
4. Save

### Use Cases

**Service Announcement:**
{% raw %}
```html
<div style="padding: 12px; background: #FFFAE6; border-left: 4px solid #FF8B00; margin: 8px 0;">
  <strong>Scheduled Maintenance:</strong>
  Our systems will be offline on Saturday, March 15 from 2AM-6AM EST for upgrades.
</div>
```
{% endraw %}

**Holiday Notice:**
{% raw %}
```html
<div style="padding: 12px; background: #DEEBFF; border-left: 4px solid #0052CC;">
  <strong>Holiday Hours:</strong>
  Support will be limited December 24-26. Response times may be longer than usual.
</div>
```
{% endraw %}

**Emergency Alert:**
{% raw %}
```html
<div style="padding: 12px; background: #FFEBE6; border-left: 4px solid #DE350B;">
  <strong>Known Issue:</strong>
  We are experiencing elevated response times. Our team is working to resolve this.
  <a href="/status">View status page</a>
</div>
```
{% endraw %}

---

## Filtering by Request Type

Show panels only for specific request types.

### Configuration

1. Edit your JSM panel configuration
2. Go to **Context** tab
3. Find **Show only for request types**
4. Select request types from your service desks

### Example

Filter for "IT Help" and "Hardware Request" → Panel only appears for those request types.

---

## JSM-Specific Templates

### Request Type Information

{% raw %}
```
{# Field ID varies by installation - use Download Issue Data to find yours #}
{% if issue.fields["Request Type"] %}
Request Type: {{ issue.fields["Request Type"].requestType.name }}
{% endif %}
```
{% endraw %}

### SLA Status (if available)

{% raw %}
```
{# SLA field ID varies by installation #}
{% set sla = issue.fields["Time to resolution"] %}
{% if sla %}
SLA Status: {{ sla.ongoingCycle.breached ? "Breached" : "On Track" }}
{% endif %}
```
{% endraw %}

### Customer-Friendly Status

{% raw %}
```
{% switch issue.fields.status.name %}
  {% case "Open" %}
    Your request has been received and is in our queue.
  {% case "In Progress" %}
    An agent is actively working on your request.
  {% case "Waiting for customer" %}
    We need additional information from you.
  {% case "Pending" %}
    Your request is waiting for internal approval.
  {% case "Resolved" %}
    Your request has been resolved.
  {% default %}
    Status: {{ issue.fields.status.name }}
{% endswitch %}
```
{% endraw %}

---

## Examples

### IT Support Panel

**Module**: Portal Request Detail Panel
**Request Types**: IT Help, Software Request

{% raw %}
```html
<div style="padding: 16px; background: #F4F5F7; border-radius: 8px;">
  <h4 style="margin-top: 0;">IT Support Information</h4>

  {% if issue.fields.status.name == "Waiting for customer" %}
  <div style="padding: 8px; background: #FFFAE6; border-radius: 4px; margin-bottom: 12px;">
    Action Required: Please provide the requested information in comments.
  </div>
  {% endif %}

  <p><strong>Need immediate help?</strong></p>
  <ul>
    <li>Password resets: <a href="/self-service">Self-service portal</a></li>
    <li>Urgent issues: Call ext. 1234</li>
  </ul>
</div>
```
{% endraw %}

### Hardware Request Panel

**Module**: Portal Request Detail Panel
**Request Types**: Hardware Request

{% raw %}
```
## Hardware Request Status

{% switch issue.fields.status.name %}
  {% case "Open" %}
    Your request is pending manager approval.
  {% case "Waiting for approval" %}
    Awaiting approval from your manager.
  {% case "In Progress" %}
    Your hardware has been ordered and is being prepared.
  {% case "Pending" %}
    Waiting for hardware delivery from supplier.
  {% case "Resolved" %}
    Your hardware is ready for pickup or has been delivered.
{% endswitch %}

**Typical processing time**: 5-7 business days

For questions, contact procurement@company.com
```
{% endraw %}

### Global Service Announcement

**Module**: Portal Subheader
**Projects**: All JSM projects

{% raw %}
```html
{% set hour = now() | date("HH") %}
{% if hour >= "17" or hour < "09" %}
<div style="padding: 10px; background: #DEEBFF; text-align: center;">
  Our support team is currently offline. We'll respond to your request during business hours (9AM-5PM).
</div>
{% endif %}
```
{% endraw %}

---

## Best Practices

### For Portal Panel

- Keep messages concise and customer-friendly
- Avoid technical jargon
- Provide actionable information
- Include self-service links when possible

### For Footer

- Keep footer content minimal
- Include essential contact information
- Use consistent styling

### For Subheader

- Use sparingly for important announcements
- Remove outdated announcements promptly
- Use appropriate colors for message severity

### General

- Test how panels appear in the customer portal
- Consider mobile users
- Use HTML format for better styling control

---

## Troubleshooting

### Panel Not Showing on Portal

1. Check that JSM module is enabled globally
2. Verify the panel targets correct request types
3. Ensure project filter includes JSM projects
4. Log in as a customer to test visibility

### Panel Shows for Wrong Requests

1. Review request type filter
2. Check project filter settings
3. Verify Display JQL condition

---

## Next Steps

- [Context Filters](context-filters) - Filter by request types
- [Message Formats](message-formats) - HTML formatting for portal
- [Templates](templates) - Dynamic content syntax
