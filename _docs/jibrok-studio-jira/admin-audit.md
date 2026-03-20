---
title: Audit Logs
seo_title: "Script Audit Logs for Jira Cloud"
key: jibrok-studio-jira
excerpt: Settings audit, script runs audit, and version history tracking
category: administration
tags:
  - doc
  - cloud
  - admin
  - audit
  - logs
last_modified_at: 2026-03-16
date: 2026-03-16
seo:
  date_modified: 2026-03-16
---

* TOC
{:toc}

> Part of the [Administration](/docs/jibrok-studio-jira/admin-settings) reference.
> [API Restrictions](/docs/jibrok-studio-jira/admin-api-restrictions) | [Admin Tools](/docs/jibrok-studio-jira/admin-tools) | **Audit Logs**

## Audit logs

Three distinct audit log types are available in the Admin tab.

### Settings audit

Admin action log recording:

- Trigger type toggles
- API whitelist/blacklist changes
- Run As configuration changes
- UIM registrations
- Database migrations

### Script runs audit

Rolling log of all script executions across the site.

**Displayed fields:**

| Field | Description |
|-------|-------------|
| Script name | Which script ran |
| Actor | Who ran the script (account) |
| Trigger type | scheduled, event, etc. |
| Issue key | If applicable |
| Status | Success or error |
| Duration | Execution time in milliseconds |

**Filtering options:**

- By script (dropdown includes deleted scripts that still have audit records)
- By trigger type
- By success/error status
- By user (account ID)
- By date range (from/to)

<a href="/uploads/jibrok-studio-jira/admin-audit-script-runs.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/admin-audit-script-runs.png" alt="Script Runs audit log" style="width:100%;" loading="lazy"></a>

Records are stored in a rolling window - oldest entries are automatically deleted when the limit is reached. See [Limits](/docs/jibrok-studio-jira/limits) for the specific record count.

### Version history audit

Cross-script version history log showing all saved versions across the library.

**Filtering options:**

- By script ID
- By author (account ID)

---

## Next steps

- [Administration](/docs/jibrok-studio-jira/admin-settings) - Core settings overview
- [Admin Tools](/docs/jibrok-studio-jira/admin-tools) - Script usage, import/export, health check
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
