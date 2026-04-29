---
title: JSM Create Modules
key: message-field-cloud
excerpt: Display panels on request creation forms before the issue is created
category: advanced
tags:
  - doc
  - cloud
  - jsm
  - service-management
  - portal
  - create
---

* TOC
{:toc}

Display panels on the **request creation form** - before the customer submits their request.

---

## How Create Modules Work

Create modules use Forge UI Modifications (UIM) to access form data. Unlike regular JSM modules that work with existing issues, create modules work with form field values as the user fills them in.

| Data Source | Regular JSM Modules | Create Modules |
|-------------|---------------------|----------------|
| Issue fields | `issue.fields.*` | Not available |
| Form values | Not available | `fields.*` |
| Current user | `currentUser.*` | `currentUser.*` |
| Request type | From issue | From context |

---

## Portal Subheader (Create)

**Location**: Below the title on the request creation form

### Configuration

1. Create new configuration
2. Select **JSM Portal Subheader (Create)** as Display Module
3. Select at least one portal (required)
4. Configure request types filter (optional)
5. Add message content
6. Save

### Use Cases

- Pre-submission instructions
- Request type specific guidance
- Important notices before submission

### Example

{% raw %}
```html
<div style="padding: 12px; background: #DEEBFF; border-left: 4px solid #0052CC;">
  <strong>Before You Submit:</strong>
  <ul>
    <li>Provide a clear, detailed description</li>
    <li>Include screenshots if applicable</li>
    <li>Check our <a href="/kb">Knowledge Base</a> first</li>
  </ul>
</div>
```
{% endraw %}

---

## Portal Footer (Create)

**Location**: Bottom of the request creation form, above submit button

### Configuration

1. Create new configuration
2. Select **JSM Portal Footer (Create)** as Display Module
3. Select at least one portal (required)
4. Configure request types filter (optional)
5. Add message content
6. Save

### Use Cases

- Terms and conditions
- Submission agreements
- Legal notices

### Example

{% raw %}
```html
<div style="padding: 12px; background: #F4F5F7; border-radius: 4px; font-size: 12px;">
  By submitting this request, you agree to our
  <a href="/terms">Terms of Service</a> and
  <a href="/privacy">Privacy Policy</a>.
</div>
```
{% endraw %}

---

## Create Module Constraints

JSM Create modules have specific limitations:

| Feature | Available | Notes |
|---------|-----------|-------|
| **Display JQL** | No | No issue exists yet |
| **User Fields Filter** | No | No issue fields to check |
| **Issue Data** | No | Use `fields.*` for form values |
| **Portals Filter** | **Required** | Must select at least one portal |
| **Request Type Filter** | Yes | Filter by request types |
| **Display Condition** | Yes | Use `fields.*` for form values |
| **Linked Issues** | No | No issue to link from |
| **JQL Data Source** | No | Use Message Only |

---

## Platform Limitations

The following limitations come from the Forge UI Modifications platform itself and apply to all Forge apps that use UIM on the JSM Customer Portal, not just Message Field.

### Radio button custom fields are not supported

Custom fields of type **Radio buttons** are not exposed by the Forge UI Modifications platform on the JSM Customer Portal Request Create view. The platform's field registry does not include radio buttons, and no events are fired when customers select a radio option.

Other field types on the same form (Select, Summary, Description, etc.) work correctly. You can verify this is platform-wide by checking with any other Forge app that uses UI Modifications on the JSM Customer Portal.

**Workaround:** change the field type from **Radio buttons** to **Select List (single choice)** in your Jira custom field administration. The data shape is identical (`{id, value}`), and your existing message templates referencing the field (e.g. `{% raw %}{{ fields.customfield_XXXXX.value }}{% endraw %}`) will start populating correctly with no other changes needed.

### Forge custom fields are not supported

UI Modifications does not currently support custom fields created by other Forge apps. This is a platform limitation by Atlassian, not specific to Message Field.

---

## Using Form Data in Templates

Access form field values as the user fills them:

{% raw %}
```
{% if fields.summary %}
<p><strong>Summary:</strong> {{ fields.summary }}</p>
{% endif %}

{% if fields.description %}
<p><strong>Description preview:</strong></p>
<div>{{ fields.description | truncate(200) }}</div>
{% endif %}

{% if fields.priority %}
<p><strong>Priority:</strong> {{ fields.priority.name }}</p>
{% endif %}
```
{% endraw %}

> **Note:** Field values update dynamically as the user types.

---

## Display Conditions for Create Modules

Use `fields.*` instead of `issue.fields.*`:

{% raw %}
```
{# Show only when priority is High #}
{{ fields.priority.name == 'High' }}

{# Show only when specific label is added #}
{{ 'urgent' in fields.labels }}

{# Show when summary contains keyword #}
{{ 'password' in fields.summary | lower }}
```
{% endraw %}

---

## Practical Examples

### Request Type Guidance

Show instructions specific to the selected request type.

**Module**: Portal Subheader (Create)
**Portals**: IT Support Portal

{% raw %}
```html
<section-message appearance="info" title="Helpful Tips">
  {% if fields.summary and ('password' in fields.summary | lower) %}
    For password issues, try the self-service reset first at /reset-password
  {% elif fields.summary and ('vpn' in fields.summary | lower) %}
    Include your location and VPN client version in the description
  {% else %}
    Please provide as much detail as possible to help us resolve your issue quickly
  {% endif %}
</section-message>
```
{% endraw %}

### Priority Warning

Alert when high priority is selected.

![Priority Warning Example](/uploads/message-field-cloud/configuration/example%20jsm%20create%20priority.png)

**Module**: Portal Subheader (Create)
**Display Condition**: {% raw %}`{{ fields.priority.name == 'High' or fields.priority.name == 'Highest' }}`{% endraw %}

{% raw %}
```html
<section-message appearance="warning" title="High Priority Request">
  High priority requests require manager approval and may incur additional charges.
  Please ensure this truly requires urgent attention.
</section-message>
```
{% endraw %}

### Terms Acceptance

Display terms at the bottom of the form.

**Module**: Portal Footer (Create)
**Portals**: All support portals

{% raw %}
```html
<div style="padding: 16px; background: #F4F5F7; border-radius: 4px; margin-top: 16px;">
  <p style="margin: 0 0 8px 0; font-size: 12px; color: #6B778C;">
    By clicking "Send", you confirm that:
  </p>
  <ul style="margin: 0; padding-left: 20px; font-size: 12px; color: #6B778C;">
    <li>The information provided is accurate</li>
    <li>You have reviewed our <a href="/kb">Knowledge Base</a></li>
    <li>You agree to our <a href="/terms">Terms of Service</a></li>
  </ul>
</div>
```
{% endraw %}

---

## Next Steps

- [JSM Integration](/docs/message-field-cloud/jsm-integration/) - Main JSM documentation
- [Context Filters](/docs/message-field-cloud/context-filters/) - Filter by request types and portals
- [Display Conditions](/docs/message-field-cloud/display-conditions/) - Dynamic visibility conditions
- [Templates](/docs/message-field-cloud/templates/) - Template syntax reference
- [Use Cases - Portal](/docs/message-field-cloud/use-cases-portal/) - More JSM portal examples
