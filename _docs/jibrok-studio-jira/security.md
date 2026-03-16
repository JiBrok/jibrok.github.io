---
title: Security
key: jibrok-studio-jira
excerpt: Security model - sandboxed execution, API access control, audit, and platform protection
category: administration
tags:
  - doc
  - cloud
  - security
  - sandbox
  - permissions
---

* TOC
{:toc}

## Overview

JiBrok Studio for Jira Cloud is built on [Atlassian Forge](https://developer.atlassian.com/platform/forge/) and uses multiple layers of protection to keep your Jira data safe. Scripts run in an isolated sandbox with no access to external networks, filesystems, or browser APIs. The only way scripts interact with data is through the Jira REST API - filtered through a multi-level access control system.

This page provides a high-level overview. For detailed configuration, see the linked sub-pages.

---

## Admin-only access

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

---

## Rovo AI: delegated access

When Rovo AI integration is enabled, admins can selectively expose scripts to non-admin users through the Rovo chat interface. This follows a **delegation by design** model:

1. **Admin decides** which scripts are available by enabling a Rovo trigger on each script
2. **Regular users** can only discover and run pre-approved scripts through Rovo chat
3. **Scripts execute with the calling user's permissions** - not the admin's. The user can only affect data they already have access to in Jira
4. **Standard execution limits** apply to all Rovo-triggered runs

This ensures admins retain full control over what scripts are exposed, while users can safely use them within their existing Jira permissions.

See [Rovo AI Agent Integration](/docs/jibrok-studio-jira/rovo) for setup details.

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
| Code generation | No `eval()`, `Function()`, `import()` |
| Prototype chain | Prototype manipulation blocked |
| Timers | No `setTimeout`, `setInterval`, `requestAnimationFrame` |
| Module system | No `require()`, `import`, `module.exports` |

---

## API access control

Scripts can only call the Jira REST API - no other network access is possible. API access is filtered through multiple validation levels:

- **Path validation** - blocks path traversal attacks and encoding bypasses
- **Read-only enforcement** - scripted fields and UI modifications are restricted to read-only operations
- **Dangerous endpoint blocking** - sensitive endpoints are permanently blocked (webhooks, app properties, audit logs, server configuration, user emails, bulk operations, and more)
- **Actor restrictions** - destructive operations and admin configuration require user context
- **Hardcoded whitelist** - only pre-approved endpoint groups are allowed
- **Admin-configurable restrictions** - whitelist/blacklist at global and per-script levels

A request must pass **all** levels to proceed. Blacklists always take priority over whitelists at the same level.

See [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) for configuration details.

---

## Execution identity

Scripts can run under different identities, controlled by the admin:

| Mode | Description |
|------|-------------|
| **Current User** (default) | Script runs with the triggering user's Jira permissions |
| **Application** | Script runs with app-level permissions (must be explicitly enabled) |
| **Pre-configured Users** | Admin defines a list of users (up to 20) that scripts can run as |
| **Specific User** | Script runs as a specific Jira user selected by the admin |

By default, only **Current User** mode is available. All other modes must be explicitly enabled by an admin in the [Administration](/docs/jibrok-studio-jira/admin-settings) panel.

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

## Forge platform security

JiBrok Studio runs on Atlassian Forge, which provides additional platform-level protections:

- **App isolation** - each Forge app runs in its own isolated environment, separate from other apps and from Jira itself
- **OAuth scopes** - the app requests only the scopes it needs (Jira read/write, Software boards, JSM requests)
- **Data residency** - data is stored in the same region as your Atlassian Cloud site
- **Encryption** - all data at rest and in transit is encrypted by the Forge platform
- **GDPR compliance** - personal data reporting and deletion are supported through the Forge platform
- **No external network access** - Forge apps cannot make arbitrary outbound network calls

---

## Next steps

- [Administration](/docs/jibrok-studio-jira/admin-settings) - Global configuration and trigger controls
- [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) - Configure endpoint access rules
- [Audit Logs](/docs/jibrok-studio-jira/admin-audit) - View execution and settings history
- [Compliance & Drift Monitoring](/docs/jibrok-studio-jira/admin-compliance) - Baselines and integrity checks
- [Limits](/docs/jibrok-studio-jira/limits) - Complete resource limits reference
- [Rovo AI Agent](/docs/jibrok-studio-jira/rovo) - Delegated script access for non-admin users
