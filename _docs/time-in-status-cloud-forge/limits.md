---
title: Technical limits
key: time-in-status-cloud-forge
excerpt: "Technical limits for the Time in Status (Forge) app - update scheduling, batch sizes, input limits, and rate limits."
category: system-information
tags: [doc, cloud, time-in-status, forge, limits, performance, rate-limits]
---

* TOC
{:toc}

---

## Update scheduling

Field values refresh on two mechanisms: immediate event-driven updates and a periodic scheduler.

| Mechanism | Interval | Purpose |
|-----------|----------|---------|
| Jira webhook (issue created / updated, comment created) | Immediate | Recalculate affected issues |
| Scheduled stale sweep | Every 5 minutes | Requeue issues whose `DateNextUpdate` is in the past |
| Hourly reconciliation | Every hour | Catch issues missed by webhooks (recently changed Inactive issues, issues with no value yet) |

### Dynamic refresh interval

Running fields (Active Time in Status, Running Stopwatch/Timer, Active Time Between Dates) do **not** refresh on a fixed timer. Each field schedules its own next refresh by writing `DateNextUpdate` to its entity property. The step grows with elapsed time so fresh issues update frequently and old issues update rarely:

| Time in current state | Next-update step |
|-----------------------|------------------|
| 0 – 10 min | 1 min |
| 10 – 20 min | 2 min |
| 20 – 60 min | 4 min |
| 1 – 2 hours | 10 min |
| 2 – 12 hours | 15 min |
| 12 – 24 hours | 30 min |
| 1 – 2 days | 1 hour |
| 2 – 4 days | 2 hours |
| 4 – 7 days | 4 hours |
| 7 – 14 days | 8 hours |
| 14 – 28 days | 16 hours |
| 28 – 56 days | 1 day |
| 56 – 84 days | 2 days |
| 84 – 168 days | 4 days |
| 168 – 364 days | 1 week |
| > 1 year | 2 weeks |

Because the scheduler sweeps only every 5 minutes, the practical minimum latency for any refresh is ~5 minutes — steps shorter than that are capped by the sweep interval.

### Sweep sizes

Each scheduled pass is bounded per field mapping (field × context):

| Phase | Runs | Max issues per mapping |
|-------|------|------------------------|
| Stale refresh (Active / Running with `DateNextUpdate < now()`) | Every 5 min | 500 |
| Inactive reconciliation (recently changed Inactive issues) | Every hour | 200 |
| Unprocessed sweep (issues with no field value yet) | Every hour | 100 |

If more issues match than the sweep limit, the remainder is picked up on subsequent runs.

---

## Batch processing

Manual recalculation jobs (started from the [Recalculation tab](/docs/time-in-status-cloud-forge/recalculation)) run in Forge's async-consumer queue.

| Parameter | Value |
|-----------|-------|
| Issues per JQL page | 50 |
| Concurrent issue calculations per invocation | 5 |
| Background consumer timeout | 55 s |
| Event consumer timeout | 25 s |
| Time budget per invocation | ~47 s (55 s minus 8 s safety margin) |

Each invocation processes one page (up to 50 issues) and enqueues the next page. Overall throughput is bounded by [Forge platform invocation limits](https://developer.atlassian.com/platform/forge/runtime-reference/), which vary by license tier.

---

## Rate limits

The app respects [Atlassian's rate limits](https://developer.atlassian.com/cloud/jira/platform/rate-limiting/) for Jira Cloud APIs. When limits are hit:

- Requests retry with exponential backoff (up to 2 retries, max 5 s delay).
- Batch jobs pause and resume automatically — `InvocationLimitReachedError` is caught and the job is requeued from its last cursor on the next 5-minute sweep.
- No data is lost. Queued updates are processed once capacity returns.

---

## Input limits

| Parameter | Limit |
|-----------|-------|
| Field setting / web panel / custom event / calendar name | 150 characters |
| Calendar description | 500 characters |
| JQL filter (field settings) | 4,000 characters |
| JQL filter — `ORDER BY` clause | Not allowed |
| Import JSON file size | 5 MB |
| Manifest bindings per import | 1,000 |

### Forbidden characters in names

Names cannot contain: `\ / > < & %`

Names must be unique within their type (two calendars cannot share a name, but a calendar and a field setting can).

---

## Tips

- **Monitor via the Recalculation tab** — see [Recalculation and data freshness](/docs/time-in-status-cloud-forge/recalculation) for freshness statistics and processing state.
- **Narrow the JQL filter** in field settings — fewer issues in scope means faster sweeps and fewer API calls.
- **Set `Issue date limit`** — an oldest-date cutoff prevents re-scanning historical issues.
- **Contact support** if you consistently see backlog or missed updates in large deployments.
