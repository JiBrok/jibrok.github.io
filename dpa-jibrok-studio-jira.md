---
layout: page
title: DPA - JiBrok Studio for Jira Cloud
permalink: /dpa-jibrok-studio-jira/
---

## Data Processing Agreement (DPA) — JiBrok Studio for Jira Cloud (Atlassian Forge)

**Effective date:**  [YYYY-MM-DD]

This Data Processing Agreement ("**DPA**") forms part of the agreement/terms governing a customer's use of the **JiBrok Studio for Jira Cloud** app by Jibrok, hosted on the Atlassian Marketplace and running entirely on **Atlassian Forge** (the "**App**").

> **Parties**
>
> - **Customer** (Controller): [Customer legal name], [address] ("Customer")
> - **Jibrok** (Processor): **Jibrok**, (EU), [], email: **support@jibrok.com** ("Jibrok")

---

## 1. Definitions

Terms such as **Personal Data**, **Processing**, **Controller**, **Processor**, **Data Subject**, and **Personal Data Breach** have the meanings given to them in the GDPR.

---

## 2. Roles

2.1 **Customer** is the **Controller** of Personal Data processed in connection with the App.

2.2 **Jibrok** acts as a **Processor** and processes Personal Data only on Customer's documented instructions, as described in **Annex 1**.

---

## 3. Scope and Customer instructions

3.1 Jibrok will process Personal Data solely to:

- provide the App's functionality;
- support/debug and improve reliability (using aggregated/de-identified signals where feasible);
- maintain security and prevent abuse.

3.2 Customer's instructions are provided via installation, configuration and use of the App.

3.3 **Free-text and user-authored content.** The App includes configuration fields that accept free text (e.g., script **name**, **description**, folder/label names, queue descriptions). In addition:

- **Scripts.** The App allows Jira administrators to author and execute scripts containing arbitrary user-defined code. Scripts may reference or manipulate Personal Data within the Customer's Jira instance (e.g., issue fields, user identifiers, comments). Customer is responsible for ensuring that scripts process Personal Data lawfully and in accordance with applicable data protection requirements.
- **Custom tables.** Customer may create data tables with user-defined schemas and arbitrary data (up to 5,000 rows per table). Customer determines whether any Personal Data is stored.
- **Message queues.** Customer may create message queues with arbitrary JSON payloads (up to 50,000 messages per queue). Customer determines whether any Personal Data is included.

3.4 **Jira data access (read and write).** The App can read and write Jira data on behalf of administrators through scripts. Write operations include creating/updating issues, adding comments, performing transitions, and assigning users. All Jira API access is constrained by:

- Atlassian permission scopes declared in the App manifest;
- administrator-configurable API whitelists and blacklists;
- a sandboxed script execution environment with resource limits;
- scripts execute only on administrator instruction (manual, scheduled, event-triggered, or automation-triggered).

---

## 4. Confidentiality

Jibrok ensures that any person authorized to process Personal Data is bound by confidentiality and accesses Personal Data only as necessary.

---

## 5. Security (GDPR Art. 32)

5.1 Jibrok implements appropriate technical and organizational measures described in **Annex 2**.

5.2 The App has **no external data egress** and uses only Atlassian Forge runtime and storage (no external services, no Forge Remote). The only outbound call is the weekly report of stored `accountId` identifiers to the **Atlassian Personal Data Reporting API**, as required by Atlassian's privacy compliance framework.

5.3 Jibrok maintains **SOC 2 Type II** for its organizational controls (evidence may be shared under NDA where appropriate).

5.4 **Script execution sandbox.** All user-authored scripts execute within a multi-layer sandbox engine (lexer - parser - evaluator - builtins) with resource guards (execution time, loop iterations, AST node count, string/collection size limits, API call limits), property access restrictions (`__proto__`, `constructor`, `prototype` and similar are forbidden), and API path restrictions via administrator-configurable whitelists/blacklists.

5.5 **PII redaction in logs.** The App implements automated PII redaction in all diagnostic logging. Sensitive fields (accountId, email, displayName, tokens, and others) are automatically replaced with placeholders. JWT tokens and email addresses are detected and redacted via pattern matching. Only error-level logs are emitted in production; debug/info logging is forbidden and enforced via automated tooling.

5.6 **Administrator-only access.** The App's interface is restricted to Jira administrators. Non-administrator users cannot access scripts, configurations, or data stored by the App.

---

## 6. Sub-processors

6.1 Customer authorizes Jibrok to use **Atlassian (Forge platform)** as a sub-processor for hosting/compute/storage required to run the App.

6.2 Jibrok does not use other sub-processors for this App.

---

## 7. Assistance with Data Subject requests

7.1 Jibrok will reasonably assist Customer in responding to Data Subject requests (access/erasure/rectification/restriction) to the extent applicable to data processed by the App and technically feasible.

7.2 **Atlassian accountId reporting/erasure.** Jibrok confirms it has implemented the Atlassian Personal Data Reporting/erasure workflow:

- **Weekly reporting:** The App reports all tracked `accountId` identifiers to the Atlassian Personal Data Reporting API on a weekly scheduled trigger.
- **Account closure handling:** Upon receiving a "closed" status for an accountId, the App automatically:
  - anonymizes `author_id` and `actor` fields across scripts and script versions (set to NULL);
  - anonymizes `account_id` in audit settings and audit execution records (set to NULL);
  - removes the account from the preconfigured users list;
  - removes the account from the account tracking table.
- **Account tracking:** The App tracks which accountIds interact with it (script creation, execution) solely for the purpose of personal data reporting compliance.

---

## 8. Personal Data Breach

Jibrok will notify Customer **without undue delay and in any event within 48 hours** after confirming a Personal Data Breach affecting Personal Data processed under this DPA. Jibrok will provide available information reasonably necessary for Customer's compliance obligations.

---

## 9. Return and deletion

9.1 Jibrok stores all App data within Atlassian Forge storage (Forge SQL and Forge Key-Value Storage) and does not keep separate copies outside Forge. The App applies automatic data retention limits (see Annex 1, Section H).

9.2 Upon uninstall/termination, deletion and retention of App-hosted data follow Atlassian Forge platform behavior. Where technically feasible, Jibrok will assist Customer with deletion requests relating to App-stored data.

---

## 10. Audit / information

Upon reasonable request, Jibrok will provide information necessary to demonstrate compliance with this DPA (typically via written responses and security documentation). Any audits will be subject to reasonable scope, confidentiality and avoidance of disproportionate burden.

---

## 11. Governing terms

If this DPA conflicts with the main agreement/terms, this DPA prevails only regarding personal data processing. Governing law and venue follow the main agreement/terms unless required otherwise by applicable law.

---

## Annex 1 — Processing details (GDPR Art. 28(3))

### A. Service

**JiBrok Studio for Jira Cloud** - Jira app on Atlassian Marketplace running on Atlassian Forge.

### B. Categories of Data Subjects

- Customer's Jira administrators who create, configure, and execute scripts.
- Customer's Jira users whose data may be accessed or modified by scripts (e.g., issue assignees, reporters, commenters).
- Customer's Jira users configured as "preconfigured users" for script execution impersonation.

### C. Personal Data processed

1. **Atlassian `accountId`** - stored in multiple contexts: as script author/actor (who created or executes a script), in audit settings and audit execution records, in the account tracking table (for GDPR data reporting), and in the preconfigured users list.
2. **User display name** - stored only in the preconfigured users list (optional field) for convenience in the administrator interface.
3. **Script source code and metadata** - administrator-authored scripts (name, source code, description, language). These are Customer-controlled inputs and may contain references to Personal Data (e.g., accountIds in JQL queries or logic that processes user data).
4. **Script execution history** - execution logs (up to 100 KB), results (up to 50 KB), inputs (up to 10 KB), context (up to 50 KB), issue keys, error text. May contain fragments of Jira data including Personal Data depending on what the script accesses. Auto-pruned: max 10 runs per script.
5. **Audit execution records** - script name, accountId of who triggered execution, trigger type, script source, issue key, success/error status, execution time. Auto-pruned: max 10,000 total records.
6. **Custom table data** - user-defined tables with arbitrary data structures (up to 50 tables, 5,000 rows per table, 100 KB per row). Content is entirely Customer-controlled; Customer determines whether any Personal Data is stored.
7. **Queue message data** - user-defined message queues with arbitrary JSON payloads (up to 50 queues, 50,000 messages per queue, 100 KB per message). Content is entirely Customer-controlled.
8. **Configuration metadata** - folder names/descriptions, label names/descriptions, trigger configurations, API whitelist/blacklist configurations. These are administrator-controlled and may contain references to Jira projects, issue types, or other identifiers.

### D. Jira data access (read and write)

The App accesses Jira data via the Jira REST API as instructed by scripts. Access modes:

- **As current user** - script executes with the permissions of the administrator who triggered it.
- **As specific user** - script executes impersonating a preconfigured user (requires explicit administrator opt-in).
- **As app** - script executes with app-level permissions (requires explicit administrator opt-in).

Read operations: issues, comments, users, projects, versions, components, boards, sprints, JQL search, custom fields.
Write operations: create/update issues, add comments, perform transitions, assign/unassign users.

The App does **not** persistently store the content of Jira issues, comments, or other Jira entities it accesses. Jira data may appear transiently in script execution logs and results (limited by size caps and auto-pruned).

### E. Diagnostic data (Forge logs)

- The App uses **Forge logs only** for error diagnostics.
- Automated PII redaction: accountId, email, displayName, tokens, JWT, and other sensitive fields are automatically redacted from all log output via pattern matching.
- Jibrok does not intentionally log Jira content or Personal Data; however, in rare cases technical error context might include fragments of data. Jibrok applies reasonable efforts to minimize/scrub such occurrences.

### F. Purpose

Provide App functionality; debugging; reliability improvements using aggregated/de-identified signals; security.

### G. Duration

While installed/active, plus any Atlassian Forge platform retention behavior after uninstall.

### H. Data retention and auto-pruning

The App enforces automatic data retention limits:

| Data category | Retention limit |
|---|---|
| Scripts | Max 1,000 |
| Script versions | Max 50 per script (oldest auto-pruned) |
| Script runs (execution history) | Max 10 per script (oldest auto-pruned) |
| Audit execution records | Max 10,000 total (oldest auto-pruned) |
| Custom table rows | Max 5,000 per table |
| Queue messages | Max 50,000 per queue; 200,000 total |
| Account tracking records | Removed on account closure via GDPR workflow |

---

## Annex 2 — Security measures (TOMs)

- **Platform isolation:** Runs entirely on Atlassian Forge; no external egress, no third-party analytics, no Forge Remote.
- **Administrator-only access:** All App functionality restricted to Jira administrators. Non-administrator users have no access.
- **Script sandbox security:** 4-layer sandbox (Lexer - Parser - Evaluator - Builtins) with resource limits (execution time, loop iterations, AST node count, string/collection size, API call limits), forbidden property access (`__proto__`, `constructor`, `prototype`), and whitelisted methods per data type.
- **API access controls:** Administrator-configurable API whitelists and blacklists restrict which Jira REST API paths scripts can access.
- **PII redaction in logging:** Automated redaction of accountId, email, displayName, tokens, JWT, and other sensitive field patterns. Log output truncated to 1,000 characters per entry. Only error/warn level permitted; debug/info logging forbidden and enforced via automated tooling.
- **GDPR data lifecycle:** Weekly personal data reporting to Atlassian API; automatic account closure anonymization across all tables; preconfigured user removal on account closure.
- **Data minimization:** `accountId` stored only for attribution and audit purposes; auto-pruning enforces retention limits; no persistent storage of Jira issue content.
- **Impersonation controls:** Running scripts as app-actor or as a specific user requires explicit administrator opt-in per trigger type.
- **Access controls:** Restricted administrative access, strong authentication, least privilege.
- **Organizational controls:** Supported by SOC 2 Type II (sharing under NDA when needed).

---

## Annex 3 — Sub-processors

- **Atlassian (Forge platform)** - hosting/compute/storage required to run the App.
