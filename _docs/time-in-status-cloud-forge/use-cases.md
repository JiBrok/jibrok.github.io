---
title: Use cases and recipes
key: time-in-status-cloud-forge
excerpt: "Practical configuration examples for common scenarios - SLA tracking, cycle time, response time, escalation monitoring, and more."
category: getting-started
tags: [doc, cloud, time-in-status, forge, use-cases, recipes, sla, cycle-time, examples]
---

* TOC
{:toc}

---

## Overview

This page provides ready-to-use configuration recipes for common time-tracking scenarios. Each recipe includes the field type, settings, events, and goals needed to implement the use case.

---

## Response Time SLA

**Goal:** Track how long it takes to respond to a customer request, with different SLA targets based on priority.

**Field type:** Timer

**Configuration:**

| Setting | Value |
|---------|-------|
| **Start Events** | STATUS_TO: "Open" or ISSUE_CREATED |
| **Stop Events** | CREATE_FIRST_PUBLIC_COMMENT |
| **Pause Events** | STATUS_TO: "Waiting for Customer" |
| **Calendar** | Business Hours (e.g., Mon-Fri 9:00-18:00) |
| **Display Mode** | LEFT_TIME_AND_FAILED_DATE_ICON |

**Goals (JQL-based):**

| Priority | JQL | Goal |
|----------|-----|------|
| Highest | `priority = Highest` | `1h` |
| High | `priority = High` | `4h` |
| Medium | `priority = Medium` | `8h` |
| Default | - | `24h` |

**How it works:** The timer starts when the issue is created and counts down toward the priority-based goal. When a public comment is posted, the timer stops. If the response takes longer than the goal, the issue is marked as Failed.

**JQL to find breached SLAs:**
```sql
"Response SLA[StateValue]" = "Failed"
```

---

## Resolution Time SLA

**Goal:** Track total time from issue creation to resolution, with SLA targets.

**Field type:** Timer

**Configuration:**

| Setting | Value |
|---------|-------|
| **Start Events** | ISSUE_CREATED |
| **Stop Events** | RESOLUTION_SET |
| **Restart Events** | RESOLUTION_REMOVED |
| **Pause Events** | STATUS_TO: "Waiting for Customer" |
| **Calendar** | Business Hours |
| **Display Mode** | TIME_SPENT_AND_GOAL_TIME_ICON |
| **Allow Restart from Any State** | On |

**Goals:**

| Priority | JQL | Goal |
|----------|-----|------|
| Highest | `priority = Highest` | `4h` |
| High | `priority = High` | `1d` |
| Default | - | `3d` |

**How it works:** Starts at issue creation, pauses when waiting for the customer, stops when resolved. If the resolution is removed (issue reopened), the timer restarts. Goals vary by priority.

---

## Development Cycle Time

**Goal:** Measure how long issues spend in active development (from "In Progress" to "Done").

**Field type:** Stopwatch

**Configuration:**

| Setting | Value |
|---------|-------|
| **Start Events** | STATUS_CATEGORY_TO: "In Progress" |
| **Stop Events** | STATUS_CATEGORY_TO: "Done" |
| **Pause Events** | STATUS_TO: "Blocked", STATUS_TO: "In Review" |
| **Calculate Type** | ALL_STARTS |
| **Calendar** | Business Hours |
| **Display Mode** | TIME_SPENT_ICON |

**How it works:** The stopwatch starts when the issue enters any "In Progress" category status and stops when it reaches "Done." Time spent in "Blocked" or "In Review" is excluded via pause events.

**JQL to find slow issues:**
```sql
"Cycle Time[TimeInHoursValue]" > 40 AND "Cycle Time[StateValue]" = "Stopped"
```

---

## Time to First Response

**Goal:** Track how long until someone first responds to an issue (any comment).

**Field type:** Stopwatch

**Configuration:**

| Setting | Value |
|---------|-------|
| **Start Events** | ISSUE_CREATED |
| **Stop Events** | FIRST_COMMENT |
| **Calculate Type** | ONLY_FIRST_START |
| **Calendar** | Business Hours |
| **Display Mode** | TIME_SPENT |

**How it works:** Starts when the issue is created, stops at the first comment. Uses ONLY_FIRST_START to ensure the value is fixed after the first response.

---

## Created to Resolved

**Goal:** Show total elapsed time from issue creation to resolution.

**Field type:** Time Between Dates

**Configuration:**

| Setting | Value |
|---------|-------|
| **Start Field** | Created (system field) |
| **End Field** | Resolved (system field) |
| **Calendar** | Business Hours (or 24x7 for total elapsed time) |
| **Display Mode** | TIME_SPENT |
| **Use Absolute Value** | On |

**How it works:** Calculates working time between the Created and Resolved dates. If the issue is not yet resolved, the field shows time from creation until now (if `currentDateTime` is used as end field).

---

## SLA by Customer Tier

**Goal:** Apply different SLA calendars based on a customer's support tier (e.g., Gold customers get 24x7 support, Silver gets business hours).

**Setup:**

1. **Create calendars:**
   - "Gold - 24x7" (every hour counts)
   - "Silver - Business Hours" (Mon-Fri 9:00-18:00)
   - "Bronze - Extended Hours" (Mon-Fri 8:00-20:00)

2. **Create a Calendar Select field** called "SLA Calendar"
   - Available calendars: Gold, Silver, Bronze
   - Default: Silver

3. **Create a Timer field** "SLA Timer"
   - Calendar Field: "SLA Calendar"
   - Start/Stop/Pause events as needed
   - Default goal: `8h`

**How it works:** When an agent sets the Calendar Select field to "Gold - 24x7" on a VIP customer's issue, the timer uses 24x7 hours for calculation. Regular issues use the default "Silver" calendar.

See [Calendar Select field](/docs/time-in-status-cloud-forge/calendar-select-field) for setup details.

---

## Escalation Tracking

**Goal:** Track time since an issue was escalated (priority increased to Highest), and restart tracking on each new escalation.

**Setup:**

1. **Create a Custom Event** named "Escalated to Highest":
   - Field: Priority
   - Action: CHANGE_TO
   - Value To: Highest

2. **Create a Stopwatch field** "Escalation Time":
   - Start Events: CUSTOM_EVENT (select "Escalated to Highest")
   - Stop Events: RESOLUTION_SET
   - Restart Events: CUSTOM_EVENT (select "Escalated to Highest")
   - Allow Restart from Any State: On
   - Calculate Type: ONLY_LAST_START
   - Calendar: 24x7

**How it works:** Each time the priority is changed to Highest, the stopwatch restarts and tracks time from the latest escalation. Uses ONLY_LAST_START to show time since the most recent escalation, not cumulative time.

See [Custom Events](/docs/time-in-status-cloud-forge/custom-events) for setup details.

---

## Waiting Time Tracking

**Goal:** Track total time an issue spends waiting for a customer response.

**Field type:** Stopwatch

**Configuration:**

| Setting | Value |
|---------|-------|
| **Start Events** | STATUS_TO: "Waiting for Customer" |
| **Stop Events** | STATUS_FROM: "Waiting for Customer" |
| **Calculate Type** | ALL_STARTS |
| **Calendar** | 24x7 (waiting time counts 24/7) |
| **Display Mode** | TIME_SPENT |

**How it works:** Every time the issue moves to "Waiting for Customer," the stopwatch starts. When it leaves that status, the stopwatch stops. ALL_STARTS accumulates time across all waiting periods.

---

## Tips for building your own recipes

- **Start simple**: begin with a single start and stop event. Add pause and restart events only when needed.
- **Test with one issue**: configure the field, run recalculation for a single issue, and verify the result before rolling out to all projects.
- **Use the Activity panel**: the [Activity panel](/docs/time-in-status-cloud-forge/activity-panels) R2 (Transition History) report shows exactly what changelog events happened on an issue - useful for verifying that your triggers match.
- **Calendar choice matters**: use a business-hours calendar when you want to exclude non-working time. Use 24x7 when total elapsed time matters (e.g., customer waiting time).
- **Combine fields**: you can have multiple time-tracking fields on the same issue. For example, one timer for Response SLA and another for Resolution SLA.
