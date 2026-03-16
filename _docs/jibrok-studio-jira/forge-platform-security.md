---
title: Forge Platform & Security Architecture
key: jibrok-studio-jira
excerpt: Why Forge-native matters - tenant isolation, custom interpreter, data residency, and zero external infrastructure
category: getting-started
tags:
  - doc
  - cloud
  - security
  - forge
  - architecture
---

* TOC
{:toc}

## What is Atlassian Forge?

[Atlassian Forge](https://developer.atlassian.com/platform/forge/) is a cloud-native development platform that replaces the older Connect model (iframe + external server). Unlike Connect apps, Forge apps run **inside Atlassian infrastructure** - no external hosting required.

Key characteristics of the Forge platform:

| Property | Description |
|----------|-------------|
| **Serverless runtime** | Functions execute on demand within Atlassian's cloud, not on vendor-owned servers |
| **Built-in storage** | SQL database and key-value storage managed by Atlassian |
| **Declarative permissions** | All scopes declared upfront and reviewed by Atlassian before Marketplace publication |
| **Automatic updates** | A single deployment reaches all installations simultaneously |
| **App review** | Every app version passes Atlassian's security review before it becomes available on the Marketplace |

JiBrok Studio for Jira Cloud is built entirely on Forge. There are no external servers, databases, companion apps, or third-party services involved.

---

## Tenant isolation

Your Jira site gets its own isolated Forge runtime. Every installation operates in a **per-site isolated environment**:

- **Separate execution contexts** - there is no shared memory, shared process, or shared filesystem between tenants
- **Scoped storage** - Forge SQL databases are per-installation. One tenant cannot query or access another tenant's data
- **Identity via platform context** - all identity operations use Forge platform-guaranteed context, eliminating IDOR vulnerabilities at the architectural level
- **No shared state** - there is no global variable, cache, or queue that spans multiple tenants

### Why this matters

With Forge, cross-tenant risk is **architecturally eliminated** - the platform itself enforces isolation boundaries, not the app code. There is no shared memory, process, or database between tenants that could be exploited.

---

## Custom interpreter

User scripts in JiBrok Studio are processed through a **custom interpreter** with a multi-layer security pipeline. There is no `eval()`, no `new Function()`, and scripts never become native JavaScript bytecode.

The security pipeline validates, analyzes, and executes code with strict safety checks at every stage:

- **Input validation** - scripts are validated against structural and size limits before processing
- **Static analysis** - dangerous code patterns are detected and blocked before execution begins
- **Runtime guards** - every operation is checked in real time with scope isolation, resource limits, and safe type handling
- **Method whitelisting** - only explicitly approved methods are available per data type

### Blocked by design

- Common sandbox escape techniques are blocked at multiple stages
- Dangerous constructors cannot be instantiated or referenced
- Internal type metadata is inaccessible from within the sandbox
- Security violations terminate the script immediately and cannot be caught with `try/catch`

---

## Data residency and storage

All data in JiBrok Studio is stored within **Atlassian-managed infrastructure**:

- **Forge SQL** - scripts, execution history, configuration, custom tables, message queues, audit logs, compliance baselines
- **Forge KV** - key-value storage for app settings and lightweight data
- **No external databases** - there is no Amazon RDS, S3 bucket, MongoDB, or any third-party data store
- **Atlassian data residency** - your data is subject to the same [data residency policies](https://www.atlassian.com/trust/privacy/data-residency) as your Jira Cloud site

Scripts, their source code, execution results, and all associated metadata never leave Atlassian's infrastructure.

---

## No external infrastructure

JiBrok Studio operates with **zero external infrastructure**:

- No vendor-hosted servers
- No companion apps or satellite services
- No proxy servers or API gateways
- No third-party monitoring, logging, or analytics services

The app manifest does not declare `external:` permissions - there are no outbound HTTP requests from the app to any external URL. The only network communication from scripts is `requestJira()`, which routes through the Forge proxy to the Jira REST API of the current site.

### What this eliminates

| Threat | Status |
|--------|--------|
| Server-side compromise | No server to compromise |
| SSRF (Server-Side Request Forgery) | No outbound network access |
| Data exfiltration via callbacks | Scripts cannot call external URLs |
| DNS-based attacks | No DNS resolution from scripts |
| Supply chain attacks on infrastructure | No infrastructure dependencies |
| DDoS attack surface | No public-facing endpoints (except Forge-managed webtriggers) |

---

## Scoped permissions

JiBrok Studio uses a **declarative permission model**:

- All permissions are declared upfront and reviewed by Atlassian before each Marketplace release
- **Impersonation scopes** - scripts execute API calls with the permissions of the configured user (current user, application, or a specific user). Scripts cannot escalate beyond the actor's Jira permissions
- **API whitelist/blacklist** - admins can restrict which Jira REST API endpoints scripts are allowed to call. Restrictions use glob-pattern matching at both global and per-script levels (see [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions))
- **No cross-site data sharing** - each Jira site's data is completely isolated, with no shared storage between installations

---

## Automatic updates

Forge apps use a **single-deployment model**:

- One deployment automatically becomes available to all installations
- No manual upgrade process for end users
- No version fragmentation across sites
- Security patches reach every installation simultaneously

Updates include backward-compatible data migrations that run automatically, ensuring zero-downtime upgrades.

---

## Egress controls

Forge blocks outbound network requests by default. JiBrok Studio does not override this:

- The app manifest does not declare `external:` permissions
- Scripts cannot call `fetch()`, `XMLHttpRequest`, or any HTTP client - these do not exist in the sandbox
- The only network access from scripts is `requestJira()`, which is routed through the Forge proxy to the Jira REST API of the **current site only**
- There is no way to exfiltrate data to external URLs, set up callback endpoints, or perform SSRF attacks

---

## Built-in admin controls

JiBrok Studio provides a comprehensive set of admin controls on top of the Forge platform security:

| Control | Description | Details |
|---------|-------------|---------|
| **API Restrictions** | Whitelist/blacklist Jira REST API endpoints per script or globally | [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) |
| **Trigger Type Controls** | Enable/disable each trigger type (scheduled, event, UIM, webhook, etc.) globally | [Administration](/docs/jibrok-studio-jira/admin-settings) |
| **Run As Controls** | Control which execution identities are available (current user, application, specific user) | [Administration](/docs/jibrok-studio-jira/admin-settings) |
| **Audit Logs** | Full execution history and settings change log | [Audit Logs](/docs/jibrok-studio-jira/admin-audit) |
| **Compliance & Drift** | Configuration baselines with SHA-256 integrity hashes and drift detection | [Compliance](/docs/jibrok-studio-jira/admin-compliance) |
| **Resource Limits** | Per-trigger execution time, API call, loop iteration, and memory limits | [Limits](/docs/jibrok-studio-jira/limits) |

---

## Next steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language syntax and sandbox details
- [Limits](/docs/jibrok-studio-jira/limits) - Complete resource limits reference
- [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) - Configure endpoint access rules
- [Compliance & Drift Monitoring](/docs/jibrok-studio-jira/admin-compliance) - Baselines and integrity checks
- [FAQ](/docs/jibrok-studio-jira/faq) - Frequently asked questions
- [Getting Started](/docs/jibrok-studio-jira/getting-started) - Install the app and run your first script
