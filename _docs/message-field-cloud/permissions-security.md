---
title: Permissions & Security
key: message-field-cloud
excerpt: How Message Field handles permissions, data access, and security
category: administration
tags:
  - doc
  - cloud
  - permissions
  - security
  - administration
  - gdpr
---

* TOC
{:toc}

## Installation Permissions

| Action | Required Role |
|--------|---------------|
| **Install app** | Jira site administrator |
| **Uninstall app** | Jira site administrator |
| **Configure modules** | Jira site administrator |
| **Manage configurations** | Site admin, or project admin (with [delegation](delegation)) |
| **Configure delegation** | Jira site administrator |

---

## App Scopes

Message Field requests the following Jira API scopes:

| Scope | Purpose |
|-------|---------|
| **Read Jira project and issue data** | Read issue fields, project details, and issue types to render panel content |
| **Write Jira project and issue data** | Required for custom field value storage and UI Modifications |
| **Read user profile** | Access current user information for templates (`currentUser` variable) |
| **Read Jira Service Management data** | Access JSM portal, request type, and queue information for portal modules |
| **Manage UI Modifications** | Register and manage UIMs for JSM portal and create screen modules |
| **Storage** | Store panel configurations and settings using Forge storage |

The app only uses these scopes for the purposes described above. No data is sent to external services.

---

## Admin Access

### Site Administrators

Site administrators have full access to:
- All panel configurations (create, edit, delete, export, import)
- Module settings (enable/disable modules globally)
- Delegation policies (control which projects can self-manage)
- Actor configuration (set impersonation for JQL execution)
- Custom field management
- UIM management
- Audit information

### Project Administrators (with Delegation)

When [delegation](delegation) is enabled, project administrators can:
- Create, edit, and delete configurations **for their own projects**
- Manage custom field configurations for their projects
- Preview, duplicate, and export/import configurations
- Access project-specific settings via **Project Settings** → **Apps** → **Message Field Settings**

Project administrators **cannot**:
- Change the actor (impersonation) setting
- Edit configurations targeting multiple projects or all projects
- Access module settings or delegation policies
- See audit metadata (creation/modification timestamps and users)

---

## Data Access

### What Data the App Reads

| Data Type | When Accessed | Purpose |
|-----------|---------------|---------|
| **Issue fields** | Panel rendering | Populate template variables |
| **Linked issues** | Panel with Linked Issues data source | Display linked issue tables |
| **JQL results** | Panel with JQL data source | Display matching issues |
| **User profile** | Panel rendering | `currentUser` template variable |
| **Project metadata** | Configuration, context filters | Filter panels by project |
| **Issue type metadata** | Configuration, context filters | Filter panels by issue type |
| **Custom field metadata** | Custom field module | Map field contexts to configurations |
| **JSM portal/request type** | JSM portal modules | Filter and render portal panels |

### What Data the App Stores

- Panel configurations (in Forge storage)
- Module enable/disable settings
- Delegation policy settings
- Custom field configuration mappings
- UIM registrations

The app does **not** store copies of issue data, user data, or JQL results. All issue data is fetched in real-time when a panel is rendered.

---

## Actor (Impersonation)

The **Actor** setting controls which user's permissions are used when executing JQL queries and fetching issue data.

### How It Works

| Actor Setting | JQL Runs As | Use Case |
|---------------|-------------|----------|
| **Viewing user** (default) | The user viewing the issue | Results vary by user permissions |
| **App user** | The Forge app system user | Consistent results regardless of viewer |
| **Application user** | Service account for JSM unlicensed access | Portal panels where customers need data |

### Security Implications

- **Viewing user** is the most restrictive - users only see issues they have permission to browse
- **App user** can return issues the viewer may not normally have access to - use carefully
- **Application user** is designed for JSM portal contexts where customers need to see specific data
- Only **site administrators** can configure the actor setting (not project admins via delegation)

> **Important:** When using App user or Application user, be mindful of what data is exposed through panel templates. The panel content is visible to anyone who can see the panel.

---

## JQL Security

### Auto-Escaping

Template variables used in JQL are automatically sanitized to prevent JQL injection:

{% raw %}
- String values are properly quoted: `{{ issue.fields.summary }}` → `"escaped value"`
- Special JQL characters are escaped
- Null values resolve to empty strings (use `| default` filter for fallback values)
{% endraw %}

### JQL Permission Enforcement

- JQL execution respects Jira's permission model
- Users can only see results for issues they have **Browse Projects** permission on
- The actor setting determines whose permissions are used
- Invalid or unauthorized JQL queries fail gracefully (panel shows no data, not an error)

---

## Template Security

The template engine includes multiple security protections:

| Protection | Description |
|------------|-------------|
| **No eval/exec** | Templates cannot execute arbitrary JavaScript |
| **Iteration limit** | Maximum 10,000 loop iterations to prevent infinite loops |
| **Timeout** | 800ms execution timeout per template rendering |
| **Prototype pollution protection** | Template variables cannot access or modify JavaScript prototypes |
| **Sandboxed execution** | Templates run in a restricted environment |

Templates can only:
- Read issue data, user data, and linked issue data
- Apply filters and functions from the allowed list
- Use control flow (if/else, for loops, switch)
- Output text/HTML

Templates **cannot**:
- Make API calls
- Access the file system
- Execute shell commands
- Modify any data

---

## Portal Access

### Unlicensed User Access

JSM portal modules are designed for **customer portal** access. Customers interacting with the portal typically don't have Jira licenses.

- Portal modules use the `unlicensedAccess` flag to allow rendering without a Jira license
- The **Application user** actor option provides consistent data access for unlicensed users
- Panel content is rendered server-side and delivered to the portal

### Data Exposed to Portal Users

When configuring panels for JSM portals, consider what data is visible to customers:

- Message content is fully visible
- JQL results and linked issue data are visible if included in the template
- Use template conditions to filter sensitive information
- Customers can only see panels on their own requests (portal access controls apply)

---

## GDPR Compliance

### Personal Data

Message Field may display personal data from Jira (user names, email addresses, avatars) when template variables reference user fields. The app:

- Does **not** store personal data independently - all user data comes from Jira's API at render time
- Does **not** transfer data to external services
- Respects Jira's user anonymization - when a user is anonymized in Jira, templates referencing that user show anonymized data
- Supports Atlassian's personal data reporting APIs

### Data Retention

- Panel configurations are stored as long as the app is installed
- No issue data or user data is retained after rendering
- Uninstalling the app removes all stored configurations and settings

---

## Jira Permission Respect

Message Field respects Jira's native permission model:

| Permission | Effect |
|------------|--------|
| **Browse Projects** | Users can only see panel data from projects they can browse |
| **Administer Projects** | Required for project-level delegation access |
| **Jira Administrators** | Full access to all Message Field settings |
| **Service Desk Customer** | Can view JSM portal panels on their requests |

The app never elevates a user's permissions. If a user cannot see an issue in Jira, they cannot see its data through a panel.

---

## Next Steps

- [Delegation](delegation) - Project admin access control
- [Limits](limits) - System limits and constraints
- [Configuration Basics](configuration-basics) - Panel setup
- [FAQ](faq) - Security-related troubleshooting
