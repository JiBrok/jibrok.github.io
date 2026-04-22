---
title: Timer - Goal configuration
key: time-in-status-cloud-forge
excerpt: "How to configure timer goals - default goals and JQL-based conditional goals for SLA tracking."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, timer, goals, sla, configuration]
---

* TOC
{:toc}

---

## What is a goal?

A goal is the target time for a Timer field. When elapsed time exceeds the goal, the timer is marked as **Failed**. Goals let you define SLA deadlines - for example, "respond within 4 hours" or "resolve within 2 business days."

---

## Default goal

Every timer can have a **default goal** that applies to all issues unless overridden by a conditional goal.

| Field | Description |
|-------|-------------|
| **Time String** | A human-readable time expression. Supported units: `y` (years), `M` (months), `w` (weeks), `d` (days), `h` (hours), `m` (minutes), `s` (seconds). Examples: `4h`, `2d 4h`, `1w`, `30m`. |
| **Calendar** | Optional. Use a specific calendar for this goal's time calculation, overriding the field setting's default calendar. |
| **Calendar Field** | Optional. Use a Calendar Select field for per-issue calendar override within this goal. |

<!-- [Screenshot: tmr-goal-builder] -->

---

## Conditional goals (JQL-based)

You can define multiple goals with **JQL conditions**. The app evaluates goals in order and applies the **first matching** goal for each issue.

Each conditional goal has:

| Field | Description |
|-------|-------------|
| **Time String** | The goal time expression (same format as default goal). |
| **JQL** | A JQL condition that the issue must match for this goal to apply. |
| **Calendar** | Optional calendar override for this goal. |
| **Calendar Field** | Optional Calendar Select field for this goal. |

### How matching works

For each issue, the app checks conditional goals in order:

1. Evaluate Goal 1's JQL against the issue → if match, use Goal 1
2. Evaluate Goal 2's JQL against the issue → if match, use Goal 2
3. ... and so on
4. If no conditional goal matches, use the **default goal**

### Example: Priority-based SLA

| Goal | JQL | Time |
|------|-----|------|
| Goal 1 | `priority = Highest` | `1h` |
| Goal 2 | `priority = High` | `4h` |
| Goal 3 | `priority = Medium` | `8h` |
| Default | - | `24h` |

With this setup:
- Highest priority issues must be resolved within 1 hour
- High priority within 4 hours
- Medium within 8 hours
- Everything else within 24 hours

---

## Allow Change Goal

| Setting | Description |
|---------|-------------|
| **allowChangeGoal** | When **on**: the app re-evaluates goals during recalculation. If issue data changes (e.g., priority changes), the goal may change too. When **off**: the goal is locked at the time the timer first starts. |

---

## Tips

- **Goal order matters**: conditional goals are checked in order. Put more specific JQL conditions first and broader ones later.
- **Calendar per goal**: different goals can use different calendars. For example, Highest priority may use a 24x7 calendar while Normal priority uses business hours only.
- **Test goals**: after configuring, run a [recalculation](/docs/time-in-status-cloud-forge/recalculation) and check a few sample issues to verify the correct goal is applied.
- **JQL filter vs goal JQL**: the field setting's JQL Filter restricts which issues are processed at all. Goal JQL only determines which goal applies - the issue is still processed.
