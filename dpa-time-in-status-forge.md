---
layout: page
title: DPA - Time in Status for Jira Cloud (Forge)
permalink: /dpa-time-in-status-forge/
excerpt: "Data Processing Agreement for Time in Status for Jira Cloud (Atlassian Forge). GDPR compliant."
last_modified_at: 2026-04-16
---

## Data Processing Agreement (DPA) - Time in Status for Jira Cloud (Forge)

Effective date: April 16, 2026

This Data Processing Agreement ("**DPA**") forms part of the agreement/terms governing a customer's use of the **Time in Status for Jira Cloud (Forge)** app by JiBrok, hosted on the Atlassian Marketplace and running entirely on **Atlassian Forge** (the "**App**").

> **Parties**
>
> - **Customer** (Controller): [Customer legal name], [address] ("Customer")
> - **JiBrok** (Processor): **JiBrok**, Nicosia, Republic of Cyprus, email: **support@jibrok.com** ("JiBrok")

---

## 1. Definitions

Terms such as **Personal Data**, **Processing**, **Controller**, **Processor**, **Data Subject**, and **Personal Data Breach** have the meanings given to them in the GDPR.

---

## 2. Roles

2.1 **Customer** is the **Controller** of Personal Data processed in connection with the App.

2.2 **JiBrok** acts as a **Processor** and processes Personal Data only on Customer's documented instructions, as described in **Annex 1**.

---

## 3. Scope and Customer instructions

3.1 JiBrok will process Personal Data solely to:

- provide the App's functionality;
- support/debug and improve reliability (using aggregated/de-identified signals where feasible);
- maintain security and prevent abuse.

3.2 Customer's instructions are provided via installation, configuration and use of the App.

3.3 **Free-text and configuration fields.** The App includes configuration items that may accept free text (e.g., field setting **names** and **descriptions**, **work calendar** definitions, **JQL filters**, **custom event** trigger definitions, **panel** and **activity panel** configurations). Customer is responsible for ensuring that any Personal Data included in such fields is lawful and necessary.

3.4 **Jira data access.** The App reads Jira issue data (statuses, changelog, assignees, custom fields, projects, workflows, field contexts) through Atlassian API scopes granted at installation, and writes calculated metric values back to the App's own Jira custom fields. All access is constrained by Atlassian Forge permission scopes and administrator-configured field contexts.

---

## 4. Confidentiality

JiBrok ensures that any person authorized to process Personal Data is bound by confidentiality and accesses Personal Data only as necessary.

---

## 5. Security (GDPR Art. 32)

5.1 JiBrok implements appropriate technical and organizational measures described in **Annex 2**.

5.2 The App has **no external data egress** and uses only Atlassian Forge runtime and storage (Forge SQL, App Storage, Jira REST API). No third-party services, no Forge Remote.

5.3 JiBrok maintains **SOC 2 Type II** certification for its organizational controls (evidence may be shared under NDA where appropriate).

5.4 The App implements automated PII redaction in all diagnostic logging. Only error-level logs are emitted in production.

5.5 The App's administration interface is restricted to Jira administrators. Non-administrator users cannot access configuration screens or data stored by the App.

---

## 6. Sub-processors

6.1 Customer authorizes JiBrok to use **Atlassian (Forge platform)** as a sub-processor for hosting/compute/storage required to run the App.

6.2 JiBrok does not use other sub-processors for this App.

---

## 7. International Data Transfers

7.1 JiBrok does not independently transfer Personal Data outside the European Economic Area (EEA). All App data is processed within the Atlassian Forge platform.

7.2 Atlassian, as sub-processor, determines the geographic location of data processing based on the Customer's Atlassian cloud instance configuration. Any international transfers by Atlassian are governed by Atlassian's own Data Processing Addendum and transfer safeguards (including Standard Contractual Clauses where applicable).

7.3 If Customer requires information about the location of its data processing, Customer should consult Atlassian's documentation on data residency and Forge data handling.

---

## 8. Assistance with Data Subject requests

8.1 JiBrok will reasonably assist Customer in responding to Data Subject requests (access/erasure/rectification/restriction) to the extent applicable to data processed by the App and technically feasible.

8.2 **Atlassian accountId reporting/erasure.** The App declares the Atlassian `report:personal-data` scope and will respond to applicable Atlassian Personal Data Reporting and erasure workflows for stored `accountId` identifiers as required by the Atlassian privacy compliance framework.

---

## 9. Personal Data Breach

JiBrok will notify Customer **without undue delay and in any event within 48 hours** after confirming a Personal Data Breach affecting Personal Data processed under this DPA. JiBrok will provide available information reasonably necessary for Customer's compliance obligations, including the nature of the breach, categories of data subjects affected, likely consequences, and measures taken or proposed to mitigate the breach. JiBrok will cooperate with Customer's notification obligations under GDPR Articles 33 and 34, and will document all Personal Data Breaches in accordance with GDPR Article 33(5).

---

## 10. Return and deletion

10.1 JiBrok stores App configuration data, calculated values, and identifiers only within Atlassian Forge storage and does not keep separate copies outside Forge.

10.2 Upon uninstall/termination, deletion and retention of App-hosted data follow Atlassian Forge platform behavior. Where technically feasible, JiBrok will assist Customer with deletion requests relating to App-stored data.

---

## 11. Audit / information

Upon reasonable written request (no more than once per calendar year), JiBrok will provide information necessary to demonstrate compliance with this DPA, typically via written responses, SOC 2 reports, and security documentation. If Customer requires an audit beyond documentation review, such audit shall be: (a) conducted at Customer's expense; (b) preceded by at least thirty (30) days' written notice; (c) limited to records and processes relevant to this DPA; and (d) subject to reasonable confidentiality obligations. JiBrok may satisfy audit requests by providing its most recent SOC 2 Type II report and answering supplemental written questions.

---

## 12. Governing terms

If this DPA conflicts with the main agreement/terms, this DPA prevails only regarding personal data processing. Governing law and venue follow the main agreement/terms unless required otherwise by applicable law.

---

## Annex 1 - Processing details (GDPR Art. 28(3))

### A. Service

**Time in Status for Jira Cloud (Forge)** - Jira app on the Atlassian Marketplace running entirely on Atlassian Forge. The App provides time-in-status, stopwatch, countdown timer, time-between-dates and work-calendar custom field types, together with issue panels and activity reports that visualize status transition history and time metrics.

### B. Categories of Data Subjects

- Customer's Jira administrators who configure field settings, work calendars, panels, custom events and trigger recalculations.
- Customer's Jira users whose issue changelog data (status transitions, assignees, commenters, authors) is accessed by the App for time calculations, reports and panel rendering.

### C. Personal Data processed (minimal)

1. **Atlassian `accountId`** - stored as `createdBy`/`updatedBy` on configuration items (field settings, work calendars, web panels, custom events, activity panel configurations) and as the initiator on batch recalculation jobs. Also used for GDPR personal data reporting compliance.
2. **App configurations** - free-text fields (field setting names and descriptions, work calendar names and definitions, JQL filters, custom event trigger definitions, panel and activity panel settings). These are Customer-controlled inputs; Customer determines whether any Personal Data is entered.
3. **Calculated/derived values** - time-in-status, stopwatch, timer and time-between-dates metrics. These values are written back to Jira as the App's own custom field values and may contain references to status names and workflow timestamps derived from Customer configurations.

### D. Jira data access

- **Read access:** issues, statuses, transitions, issue changelog, custom fields, users (assignees, authors, commenters), projects, workflows, field contexts (for calculations, reports and panel rendering).
- **Write access:** the App updates its own custom field values with calculated results via the Atlassian `write:app-data:jira` scope.
- The App does **not** persistently store full Jira issue content. Jira data is transiently accessed during calculations and rendering; only the derived metric values and Customer-authored configurations are persisted.

### E. Diagnostic data (Forge logs)

- The App uses **Forge logs only** for error diagnostics.
- A custom logger applies automated PII redaction to all diagnostic output (accountId, email, display name, author/assignee/reporter identifiers, JWT patterns). Debug and info level logging is suppressed in production.
- JiBrok does not intentionally log Jira content or Personal Data; in rare cases technical error context might include fragments of data, and JiBrok applies reasonable efforts to minimize/scrub such occurrences.

### F. Purpose

Provide App functionality (time tracking, calculation, reports, panels); debugging; reliability improvements using aggregated/de-identified signals; security.

### G. Duration

While installed/active, plus any Atlassian Forge platform retention behavior after uninstall.

---

## Annex 2 - Security measures (TOMs)

- **Platform isolation:** runs entirely on Atlassian Forge; no external data egress, no third-party services, no Forge Remote.
- **Administrator-only configuration:** the admin interface and all mutating operations are gated by the Forge `user_is_admin` condition and by server-side administrator checks performed on every resolver invocation.
- **Least privilege scopes:** only the Jira scopes strictly necessary for time calculations and for writing calculated custom field values are requested.
- **Input validation:** configuration inputs, work calendars and JQL filters are validated before persistence.
- **Automated PII redaction:** sensitive fields (accountId, email, display name, author/assignee/reporter, JWT patterns) are redacted from all diagnostic logs; only error-level logs are emitted in production.
- **Minimal data storage:** `accountId` for attribution, Customer-controlled configurations and calculated metric values stored in Forge SQL and App Storage; no persistent storage of full Jira issue content.
- **Personal data scope declared:** the `report:personal-data` scope is declared to support Atlassian's GDPR personal data reporting framework.
- **Organizational controls:** supported by SOC 2 Type II certification (evidence may be shared under NDA when appropriate).

---

## Annex 3 - Sub-processors

- **Atlassian (Forge platform)** - hosting, compute and storage (Forge SQL, App Storage), Jira REST API, events and scheduled triggers required to run the App.
