---
title: Webhook Trigger
key: jibrok-studio-jira
category: core-features
tags:
  - doc
  - cloud
  - triggers
  - webhook
---

* TOC
{:toc}

## Webhook trigger

Trigger scripts via external HTTP requests. One per script (singleton).

Webhook triggers allow external systems, CI/CD pipelines, monitoring tools, and other services to execute scripts by sending HTTP requests to a unique URL with Basic Auth credentials.

### Configuration

| Setting | Description |
|---------|-------------|
| `methods` | Allowed HTTP methods (GET, POST, PUT, DELETE). All allowed by default |
| `description` | Optional description (up to 2,000 characters) |

---

## Authentication

Each webhook trigger has a unique token managed through the script's Config tab. Authentication uses Basic Auth:

```
Authorization: Basic base64(webhookId:token)
```

Where `webhookId` is the trigger's unique identifier and `token` is the generated secret.

---

## Token management

- **Generate** - creates a new token (replaces existing if any)
- **Revoke** - deletes the token, disabling the webhook
- One token per script maximum
- Token is displayed once on generation - store it securely

---

## Rate limiting

Webhooks are rate-limited per webhook. See [Limits](/docs/jibrok-studio-jira/limits) for the specific rate.

Exceeding the limit returns HTTP 429 (Too Many Requests). Requests beyond the limit are rejected without executing the script.

---

## Context variables

The `webhook` variable is available in the script:

| Property | Type | Description |
|----------|------|-------------|
| `webhook.method` | string | HTTP method (GET, POST, PUT, DELETE) |
| `webhook.path` | string | Request path |
| `webhook.headers` | object | Request headers (lowercase keys, Authorization header removed) |
| `webhook.body` | object/string | Parsed JSON body, or raw string if not JSON |
| `webhook.query` | object | Query parameters |
| `webhook.rawBody` | string | Raw request body string |

### Example

```js
// Log request details
log("Method:", webhook.method)
log("Path:", webhook.path)
log("Query:", JSON.stringify(webhook.query))

// Process JSON body
if (webhook.body && webhook.body.issueKey) {
  const issue = Issues.get(webhook.body.issueKey)
  issue.addComment("Processed via webhook")
  return { status: "ok", issue: issue.key }
}

return { status: "no issue key provided" }
```

---

## HTTP responses

| Status | Description |
|--------|-------------|
| 200 | Script executed successfully |
| 401 | Missing or invalid credentials |
| 403 | Trigger type disabled or script disabled |
| 404 | Script or trigger not found |
| 405 | HTTP method not allowed |
| 429 | Rate limit exceeded |
| 500 | Internal error |

---

## Limits

See [Limits](/docs/jibrok-studio-jira/limits) for execution time, API call, and rate limits for webhook triggers.

Scripts run with the **actor configured on the script** (defaults to application).

---

## Notes

- The Webtrigger trigger type is **disabled by default** and must be enabled in [Administration](/docs/jibrok-studio-jira/admin-settings) before use
- Both the script and the trigger must be enabled for the webhook to accept requests
- The script must have a generated token - without a token, the webhook URL exists but returns 401
- Webhook triggers are singleton - only one per script

---

## See also

- [Triggers Overview](/docs/jibrok-studio-jira/triggers) - All trigger types at a glance
- [Scheduled Triggers](/docs/jibrok-studio-jira/triggers-scheduled) - Run scripts on a schedule
- [Async Events](/docs/jibrok-studio-jira/triggers-async) - Trigger scripts asynchronously
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
- [Administration](/docs/jibrok-studio-jira/admin-settings) - Global trigger type controls
