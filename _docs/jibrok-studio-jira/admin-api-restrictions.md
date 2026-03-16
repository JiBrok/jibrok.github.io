---
title: API Restrictions
key: jibrok-studio-jira
excerpt: Global and per-script whitelist/blacklist for Jira REST API endpoints
category: administration
tags:
  - doc
  - cloud
  - admin
  - security
  - api
---

* TOC
{:toc}

> Part of the [Administration](/docs/jibrok-studio-jira/admin-settings) reference.
> **API Restrictions** | [Admin Tools](/docs/jibrok-studio-jira/admin-tools) | [Audit Logs](/docs/jibrok-studio-jira/admin-audit)

## API whitelist/blacklist

Control which Jira REST API endpoints scripts can access.

### Global whitelist

- **Disabled by default** (all endpoints allowed)
- Enable to enforce pattern-based URL restrictions
- Patterns use **glob syntax** (e.g., `/rest/api/3/issue/**`)
- **API Catalog** for quickly adding common endpoint groups
- **Reset to defaults** restores the original whitelist

<a href="/uploads/jibrok-studio-jira/admin-api-whitelist.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-api-whitelist.png" alt="Global API whitelist configuration" style="width:100%;" loading="lazy"></a>

### Global blacklist

- **Disabled by default** (nothing blocked)
- Enable to block matching patterns
- Blacklist is checked **before** whitelist
- Useful for blocking sensitive endpoints while allowing everything else

<a href="/uploads/jibrok-studio-jira/admin-api-blacklist.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-api-blacklist.png" alt="Global API blacklist configuration" style="width:100%;" loading="lazy"></a>

### Custom API restrictions

Create named whitelist/blacklist profiles for per-script restrictions:

- **Custom Whitelists** - named profiles with endpoint patterns, assigned to specific scripts in their Config tab. A script must pass both the global whitelist AND its custom whitelist.
- **Custom Blacklists** - named profiles assigned to specific scripts. Blacklist checked before whitelist at the script level.
- See [Limits](/docs/jibrok-studio-jira/limits) for profile and entry limits

<a href="/uploads/jibrok-studio-jira/admin-script-whitelists.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-script-whitelists.png" alt="Custom API restriction profiles" style="width:100%;" loading="lazy"></a>

---

## Next steps

- [Administration](/docs/jibrok-studio-jira/admin-settings) - Core settings overview
- [Admin Tools](/docs/jibrok-studio-jira/admin-tools) - Script usage, import/export, health check
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
