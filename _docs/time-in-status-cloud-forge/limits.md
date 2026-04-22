---
title: Technical limits
key: time-in-status-cloud-forge
excerpt: "Technical limitations and quotas for the Time in Status (Forge) app - module limits, rate limits, update frequency, and other constraints."
category: system-information
tags: [doc, cloud, time-in-status, forge, limits, quotas, performance, rate-limits]
---

* TOC
{:toc}

---

## Module quotas

Atlassian Forge apps have a limit of **100 modules** per app installation. Each field and panel counts toward this quota:

| Module type | Quota per instance |
|-------------|-------------------|
| Custom field (Time in Status, Stopwatch, Timer, Time Between Dates, Calendar Select) | 1-4 modules each |
| Web panel (Time in Status, Stopwatch, Timer) | 1 module each |
| Issue context panel (sidebar) | 1 module each |
| Activity panel | 1 module |
| Admin page | 1 module |

With 100 modules available, you can create approximately **25-100 working fields** depending on the field type.

---

## Update frequency

Field values are updated through multiple mechanisms:

| Mechanism | Frequency | Description |
|-----------|-----------|-------------|
| Event-driven | Immediate | Issue create/update events trigger recalculation via event queue |
| Frequent scheduled refresh | Every 5 minutes | Picks up stale records that need periodic refresh |
| Slow scheduled refresh | Every hour | Handles less time-sensitive updates |

The further into the future a field's next update is needed, the less frequently it refreshes. Active fields (running stopwatches, active timers) refresh more often than static fields.

### Estimated capacity

On average, the app can process **500,000 - 1,000,000 field value updates per day** across all fields. This depends on:

- Your Jira instance load
- Number of active fields and contexts
- Rate limiting from Atlassian

If you have fewer than **5,000 issues** in tracking statuses at any time, there should be no performance issues.

---

## Function timeouts

| Function type | Timeout |
|--------------|---------|
| Interactive (admin UI, event processing) | 25 seconds |
| Background batch processing | 55 seconds |

---

## Rate limits

The app respects [Atlassian's rate limits](https://developer.atlassian.com/cloud/jira/platform/rate-limiting/) for Jira Cloud API calls. When rate limits are reached:

- Updates continue but are slowed down
- No data is lost - updates are queued and retried
- The app self-throttles to avoid impacting your Jira instance

---

## Input limits

| Parameter | Limit |
|-----------|-------|
| JQL filter in field settings | 4,000 characters |
| JQL filter - ORDER BY clause | Not allowed |
| Field setting name | 150 characters |
| Calendar name | 150 characters |
| Calendar description | 500 characters |
| Import file size | 5 MB |

---

## Naming restrictions

Field setting, web panel, calendar, and custom event names cannot contain the following characters:

```
\ / > < & %
```

Names must be unique within their type (e.g., two calendars cannot have the same name, but a calendar and a field setting can).

---

## Tips

- **Monitor via Recalculation tab**: the [Recalculation tab](/docs/time-in-status-cloud-forge/recalculation) shows freshness statistics and processing status, helping you understand if limits are being reached.
- **Optimize JQL filters**: narrow JQL filters reduce the number of issues to process, improving performance.
- **Contact support**: if you need higher update rates or are hitting limits consistently, contact support for individual limit adjustments.
