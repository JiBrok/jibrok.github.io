---
title: Limits & Performance
key: message-field-cloud
excerpt: System limits, constraints, and performance optimization tips
category: administration
tags:
  - doc
  - cloud
  - limits
  - performance
  - administration
---

* TOC
{:toc}

## Configuration Limits

| Setting | Limit |
|---------|-------|
| **Configuration name** | Max 100 characters |
| **Description** | Max 5,000 characters |
| **Message content** | Max 20,000 characters |
| **JQL query** | Max 5,000 characters |
| **Display condition** | Max 2,000 characters |
| **Configuration size** | Max 100 KB (total serialized size) |

---

## Data Limits

| Setting | Limit | Default |
|---------|-------|---------|
| **Max Issues** (JQL / Linked Issues) | 1-1,000 | 50 |
| **Rows Per Page** | 1-100 | 10 |
| **Table fields** per configuration | Max 50 | — |
| **Display fields** per configuration | Max 50 | — |
| **Projects** per context filter | Max 1,000 | — |
| **Issue types** per context filter | Max 1,000 | — |

---

## Template Engine Limits

| Constraint | Limit |
|------------|-------|
| **Loop iterations** | Max 10,000 total iterations per render |
| **Execution timeout** | 800ms per template rendering |
| **Prototype access** | Blocked — templates cannot access JavaScript prototypes |
| **Eval / exec** | Not available — no arbitrary code execution |

If a template exceeds the iteration limit or timeout, it stops execution and returns an error message.

---

## UIM Limits

| Setting | Limit |
|---------|-------|
| **Contexts per UIM registration** | Max 100 |

UI Modifications (UIMs) are used for JSM portal modules and custom field create screen display. Each UIM registration supports up to 100 contexts (project + issue type combinations). Configurations targeting more combinations are split across multiple UIMs automatically.

---

## Caching

Message Panel uses a 3-level caching strategy to optimize performance:

| Level | Storage | TTL | Purpose |
|-------|---------|-----|---------|
| **KVS (Forge Storage)** | Server-side | Persistent | Configuration data, module settings |
| **IndexedDB** | Browser | 4 hours | Cached configuration lookups |
| **localStorage** | Browser | Session | Quick access for active configurations |

### Cache Invalidation

- Saving a configuration immediately invalidates the server-side cache
- Browser caches refresh after the TTL expires
- Users can force a refresh by hard-reloading the page (Ctrl/Cmd + Shift + R)
- The **Reregister All** operation in UIM Management clears UIM-related caches

---

## Performance Tips

### Optimize Max Issues

| Use Case | Recommended Max Issues |
|----------|------------------------|
| Overview panels (badges, counts) | 25-50 |
| Standard issue tables | 50 |
| Comprehensive lists | 100-200 |
| Large datasets (use sparingly) | 500-1,000 |

Higher Max Issues values mean more API calls and longer rendering times. Start low and increase only when users need to see more data.

### Optimize JQL Queries

- **Use indexed fields** in JQL: `project`, `status`, `assignee`, `priority`, `issuetype`, `created`, `updated`
- **Avoid text searches** on large datasets: `text ~ "keyword"` is expensive
- **Be specific** with project and issue type filters — narrower queries are faster
- **Use ORDER BY** to ensure the most relevant issues appear first (especially with low Max Issues)

### Optimize Templates

- **Avoid nested loops** — they multiply iteration counts rapidly
- **Use `| take(N)`** to limit items processed in loops
- **Minimize filter chains** — each filter adds processing time
- **Pre-compute values** with {% raw %}`{% set %}`{% endraw %} variables instead of repeating expressions
- **Keep conditional logic simple** — deeply nested if/else blocks are harder to debug and slower to execute

### Optimize Field Selection

- Select only the **table fields** you actually display — each field adds to the data transfer
- Use **display fields** sparingly — they add additional field rendering per panel
- For message-only panels (Empty data source), no field selection overhead applies

### Reduce Panel Count

- Each visible panel makes independent API calls
- Consider combining related information into a single panel with sections
- Use conditional display (Display JQL, Display Conditions) to prevent unnecessary panel rendering
- Disable panels that are no longer needed rather than leaving them active

---

## Next Steps

- [Configuration Basics](configuration-basics) - Panel setup
- [Data Sources](data-sources) - Configure queries and limits
- [Templates](templates) - Template syntax and optimization
- [FAQ](faq) - Performance troubleshooting
- [Permissions & Security](permissions-security) - Security constraints
