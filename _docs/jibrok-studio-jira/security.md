---
title: Security Overview
key: jibrok-studio-jira
excerpt: Permissions, API restrictions, sandbox, execution identity, audit, and platform protection
category: getting-started
tags:
  - doc
  - cloud
  - security
  - sandbox
  - permissions
seo_title: Security - Sandbox, Permissions, Audit
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Overview

JiBrok Studio for Jira Cloud is built on [Atlassian Forge](https://developer.atlassian.com/platform/forge/) and uses multiple layers of protection to keep your Jira data safe:

- **Admin-only** - only Jira site administrators can access the app, write scripts, or change settings
- **Admin-reviewed** - every script is intentionally created, configured, and reviewed by an administrator before it runs. Scripts do not appear or execute on their own
- **Sandboxed execution** - scripts run in an isolated interpreter with no access to external networks, filesystems, or browser APIs
- **Jira REST API only** - the only way scripts interact with data is through the Jira REST API, filtered through a multi-level access control system
- **No external infrastructure** - no vendor servers, databases, or third-party services

For Forge platform-level protections (tenant isolation, data residency, egress controls), see [Forge Platform & Security Architecture](/docs/jibrok-studio-jira/forge-platform-security).

---

## Why does the app need these permissions?

JiBrok Studio requires **45 OAuth scopes** across 9 categories. This number reflects Atlassian's requirement for fine-grained scopes - instead of a single "full access" permission, each capability needs its own scope.

These permissions allow scripts to programmatically manage issues, projects, fields, workflows, sprints, CMDB objects, and other aspects of Jira - automating, formalizing, and systematizing administration tasks that would otherwise require repetitive manual work.

All scopes are declared in the app manifest and reviewed by Atlassian before each Marketplace release.

| Category | Count | Features | Impersonation |
|----------|:-----:|----------|:-------------:|
| App Internal | 4 | Storage, UIM registration, GDPR, licensing | No |
| Issue Data | 10 | Console scripts, triggers, scripted fields, automation | Yes |
| Project Data | 3 | Project info, components, versions in scripts | Yes |
| Jira Software | 4 | Boards, sprints, epics | Mixed |
| JSM | 1 | Service desk request types for UIM config | No |
| JSM Assets/CMDB | 7 | CMDB objects, schemas, types in scripts | Yes |
| Field/Screen Config | 13 | Scripted custom fields module | No |
| Rovo | 1 | Rovo AI agent integration | No |
| Jira Administration | 2 | UIM registration, project config | No |

### Why so many scopes?

Atlassian enforces a granular permission model. For example:

- **Issue Data** requires 10 separate scopes because reading issues, issue types, statuses, priorities, labels, and users each need their own scope
- **Field/Screen Config** uses 13 scopes because the Scripted Custom Fields module needs to read and write field configurations, screen schemes, and screen tabs - each a separate scope
- **JSM Assets/CMDB** needs 7 scopes for reading schemas, types, attributes, icons, and performing CRUD operations on objects

### What is impersonation?

Scopes marked with "Yes" in the Impersonation column support running API calls **as a specific user** rather than as the app. This means:

- The script executes with that user's Jira permissions - it cannot access data the user cannot access
- Actions are attributed to that user in Jira's audit trail
- Permission checks happen at the Jira level, not just in the app

See [Execution identity](#execution-identity) for details on how admins control this.

---

## What restrictions exist on REST API requests?

Scripts can only call the Jira REST API - no other network access is possible. Every API call passes through a 6-level security pipeline. A request must pass **all** levels to proceed.

### Security check order

| Level | Check | Fail behavior |
|:-----:|-------|---------------|
| 1 | **Read-only mode** - scripted fields and UI modifications allow only GET requests | Block with error |
| 2 | **Permanent blacklist** - sensitive endpoints always blocked (see below) | Block with error |
| 3 | **App actor restrictions** - destructive/admin operations blocked for Application actor (see below) | Block with error |
| 4 | **Hardcoded API whitelist** - only a curated set of pre-approved endpoint groups are allowed | Block with error |
| 5 | **Global blacklist** - admin-configurable blocked patterns | Block with error |
| 6 | **Global whitelist** - admin-configurable allowed patterns | Block with error |

Blacklists always take priority over whitelists at the same level. See [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) for configuring levels 5-6.

### API access model - whitelist-first

Scripts operate on a **whitelist-first** model: only a curated set of pre-approved endpoint groups are allowed, and everything else is blocked by default. This means scripts can only access Jira APIs that have been explicitly reviewed and approved - there is no way to "discover" an unprotected endpoint.

On top of this, a **permanent blacklist** provides an additional safety layer - ensuring that sensitive endpoints remain blocked even if the whitelist is expanded in the future. Permanently blocked categories include security-sensitive operations, privacy-related endpoints, platform-internal APIs, and system configuration endpoints.

### Application actor restrictions

When a script runs as **Application**, additional restrictions apply on top of the permanent blacklist. The goal: destructive and administrative operations require a real user context for proper Jira permission checks and correct audit trail attribution.

**Blocked for Application actor:**

| Category | Blocked operations | Why user context is required |
|----------|-------------------|------------------------------|
| All DELETE operations | `DELETE /rest/**` (catch-all) | Jira applies permission checks per-user; audit trail must show who deleted |
| Issue types | Create, update | Admin-only configuration, needs user attribution |
| Priorities | Create, update | Admin-only configuration |
| Resolutions | Create, update | Admin-only configuration |
| Statuses | Create, update (both new and legacy endpoints) | Admin-only configuration |
| Issue link types | Create, update | Admin-only configuration |
| Custom fields | Create, update | Admin-only configuration |
| Groups | Create group, add user to group | Security-sensitive group membership |
| Workflow schemes | Create, update | Admin-only configuration |
| Screens | Create, update | Admin-only configuration |
| Screen schemes | Create, update | Admin-only configuration |
| Issue type schemes | Create, update | Admin-only configuration |
| Issue type screen schemes | Create, update | Admin-only configuration |
| Field configurations | Create, update | Admin-only configuration |
| Field config schemes | Create, update | Admin-only configuration |
| Permission schemes | Create, update | Security-critical permissions |
| Notification schemes | Create, update | Communication configuration |
| Priority schemes | Create, update | Admin-only configuration |
| Roles | Create, update | Security-sensitive roles |
| Project categories | Create, update | Admin-only configuration |
| Issue notifications | Send notification (`POST .../notify`) | Requires user identity for notification attribution |

**Allowed for Application actor:**

- All GET requests (reading data)
- Creating and updating issues, comments, transitions, issue links
- Creating and updating components, versions, filters

**Error on violation:** `"API call blocked: {METHOD} {PATH} - this operation is not allowed when running as app. Run the script as the current user instead."`

---

## Who can access the app?

JiBrok Studio is available to **Jira site administrators only**. Non-admin users cannot access the app interface, write scripts, or change any settings.

| Action | Jira Admin | Regular User |
|--------|:----------:|:------------:|
| Install and configure the app | Yes | No |
| Write and edit scripts | Yes | No |
| Manage triggers and automation | Yes | No |
| Configure API restrictions | Yes | No |
| View audit logs and compliance reports | Yes | No |
| Interact with scripted fields (read computed values) | Yes | Yes |
| Interact with UI modifications (form changes) | Yes | Yes |
| Run pre-approved scripts via Rovo AI | Yes | Yes |

Regular users only see the **results** of scripts - computed field values, modified forms, or Rovo responses. They never see or modify the scripts themselves.

### Rovo AI: delegated access

When Rovo AI integration is enabled, admins can selectively expose scripts to non-admin users through the Rovo chat interface. This follows a **delegation by design** model:

1. **Admin decides** which scripts are available by enabling a Rovo trigger on each script
2. **Regular users** can only discover and run pre-approved scripts through Rovo chat
3. **Scripts execute with the calling user's permissions** - not the admin's. The user can only affect data they already have access to in Jira
4. **Standard execution limits** apply to all Rovo-triggered runs

See [Rovo AI Agent Integration](/docs/jibrok-studio-jira/rovo) for setup details.

---

## Execution identity

Scripts can run under different identities, controlled by the admin:

| Mode | Description |
|------|-------------|
| **Current User** (default) | Script runs with the triggering user's Jira permissions |
| **Application** | Script runs with app-level permissions (must be explicitly enabled) |
| **Pre-configured Users** | Admin defines a list of users that scripts can run as |
| **Specific User** | Script runs as a specific Jira user selected by the admin |

By default, only **Current User** mode is available. All other modes must be explicitly enabled by an admin in the [Administration](/docs/jibrok-studio-jira/admin-settings) panel.

---

## What access does the app have to the platform?

- **No external network requests** - the app manifest does not declare `external:` permissions. Scripts cannot call `fetch()`, `XMLHttpRequest`, or any HTTP client
- **Jira REST API only** - the only network access from scripts is `requestJira()`, routed through the Forge proxy to the Jira REST API of the current site
- **Hardcoded API whitelist** - only a curated set of pre-approved endpoint groups are allowed. If an endpoint is not in this list, it is blocked regardless of any configuration
- **Data residency** - all data is stored within Atlassian-managed infrastructure and subject to the same [data residency policies](https://www.atlassian.com/software/data-residency) as your Jira Cloud site

See [Forge Platform & Security Architecture](/docs/jibrok-studio-jira/forge-platform-security) for details on tenant isolation, egress controls, and zero external infrastructure.

---

## Script sandbox

Every script passes through multiple layers of security validation before and during execution:

- **Input validation** - script size limits, safe regex patterns, and input sanitization
- **Static analysis** - detects and blocks dangerous code patterns before execution begins
- **Runtime guards** - resource limits enforced in real time: execution time, loop iterations, call stack depth, string/collection sizes, and API call counts. See [Limits](/docs/jibrok-studio-jira/limits)
- **Method whitelisting** - only explicitly approved methods are available per data type; global objects are frozen and cannot be modified

### What scripts cannot access

| Blocked Category | Examples |
|------------------|----------|
| Filesystem | No file read/write, no path access |
| Network | No HTTP requests, no sockets, no external connections |
| Browser APIs | No `window`, `document`, `fetch`, `XMLHttpRequest` |
| Node.js | No `require`, `process`, `Buffer`, `child_process` |
| Code generation | No `Function()`, `import()`. `eval(uuid)` is available only for including saved scripts by ID |
| Prototype chain | Prototype manipulation blocked |
| Timers | No `setTimeout`, `setInterval`, `requestAnimationFrame` |
| Module system | No `require()`, `import`, `module.exports` |

---

## Resource limits

Every script execution is bounded by resource limits that prevent runaway scripts from affecting system performance. Limits vary by trigger type to match expected workloads.

See [Limits](/docs/jibrok-studio-jira/limits) for the complete reference.

---

## Webhook security

[Webhook triggers](/docs/jibrok-studio-jira/triggers-webhook) include dedicated security measures:

- **Authentication** - Basic Auth with a unique token per webhook
- **Token encryption** - tokens are encrypted at rest in Forge secure storage
- **Timing-safe validation** - token validation is protected against timing attacks
- **Rate limiting** - per-webhook request throttling (sliding window)

---

## Audit and compliance

All actions in JiBrok Studio are tracked:

- **Script Runs Audit** - every script execution is logged with script name, trigger type, user, issue key, status, and duration (rolling)
- **Settings Audit** - all configuration changes are recorded (trigger toggles, API restriction changes, Run As configuration, and more)
- **Version History** - every script save creates a version record with automatic cleanup of old versions
- **Compliance Baselines** - point-in-time snapshots of configuration with SHA-256 integrity hashes
- **Drift Detection** - automated comparison of current state against baselines to detect unauthorized changes

See [Audit Logs](/docs/jibrok-studio-jira/admin-audit) and [Compliance & Drift Monitoring](/docs/jibrok-studio-jira/admin-compliance) for details.

---

## Next steps

- [Forge Platform & Security Architecture](/docs/jibrok-studio-jira/forge-platform-security) - Tenant isolation, data residency, egress controls
- [Administration](/docs/jibrok-studio-jira/admin-settings) - Global configuration and trigger controls
- [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) - Configure endpoint access rules
- [Audit Logs](/docs/jibrok-studio-jira/admin-audit) - View execution and settings history
- [Compliance & Drift Monitoring](/docs/jibrok-studio-jira/admin-compliance) - Baselines and integrity checks
- [Limits](/docs/jibrok-studio-jira/limits) - Complete resource limits reference
- [Rovo AI Agent](/docs/jibrok-studio-jira/rovo) - Delegated script access for non-admin users
- [FAQ](/docs/jibrok-studio-jira/faq) - Common security questions answered
