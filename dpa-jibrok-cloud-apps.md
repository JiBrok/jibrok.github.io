---
layout: page
title: DPA - JiBrok Cloud Apps
permalink: /dpa-jibrok-cloud-apps/
excerpt: "Data Processing Agreement for JiBrok Cloud Apps (Time in Status, Timer, Stopwatch, JBCF, Display Linked Issues, Fields Panel for JSM)."
last_modified_at: 2026-03-21
---

## Data Processing Agreement (DPA) - JiBrok Cloud Apps (Atlassian Forge)

Effective date: March 21, 2026

This Data Processing Agreement ("**DPA**") forms part of the agreement/terms governing a customer's use of the following JiBrok Cloud apps hosted on the Atlassian Marketplace and running entirely on **Atlassian Forge** (each, an "**App**"):

* **Time in Status / SLA / Timer / Stopwatch (Cloud)**
* **Timer field**
* **Stopwatch field**
* **Calculated and other custom fields (JBCF)**
* **Display Linked Issues**
* **Fields panel for Jira Service Management (JSM)**

For JiBrok Studio for Jira Cloud and Message Field for Jira Cloud, see the respective individual DPAs at [jibrok.com/dpa-jibrok-studio-jira/](/dpa-jibrok-studio-jira/) and [jibrok.com/dpa-message-field-cloud/](/dpa-message-field-cloud/).

> **Parties**
>
> - **Customer** (Controller): [Customer legal name], [address] ("Customer")
> - **JiBrok** (Processor): **JiBrok**, Nicosia, Republic of Cyprus, email: **support@jibrok.com** ("JiBrok")

---

## 1. Definitions

Terms such as **Personal Data**, **Processing**, **Controller**, **Processor**, **Data Subject**, and **Personal Data Breach** have the meanings given to them in the GDPR.

---

## 2. Roles

2.1 **Customer** is the **Controller** of Personal Data processed in connection with the Apps.

2.2 **JiBrok** acts as a **Processor** and processes Personal Data only on Customer's documented instructions, as described in **Annex 1**.

---

## 3. Scope and Customer instructions

3.1 JiBrok will process Personal Data solely to:

- provide the Apps' functionality;
- support/debug and improve reliability (using aggregated/de-identified signals where feasible);
- maintain security and prevent abuse.

3.2 Customer's instructions are provided via installation, configuration and use of the Apps.

3.3 **Free-text and configuration fields.** The Apps include configuration fields that may accept free text (e.g., field **names**, **descriptions**, **JQL queries**, **SLA definitions**, **timer configurations**, **calculated field formulas**, **display settings**). Customer is responsible for ensuring that any Personal Data included in such fields is lawful and necessary.

3.4 **Calculated and derived data.** The Apps calculate values based on Jira data (e.g., time-in-status metrics, SLA calculations, computed field values). Results may be stored in Atlassian Forge storage and may contain references to issue keys, status names, or user identifiers depending on the calculation context.

---

## 4. Confidentiality

JiBrok ensures that any person authorized to process Personal Data is bound by confidentiality and accesses Personal Data only as necessary.

---

## 5. Security (GDPR Art. 32)

5.1 JiBrok implements appropriate technical and organizational measures described in **Annex 2**.

5.2 The Apps have **no external data egress** and use only Atlassian Forge runtime and storage (no external services, no Forge Remote).

5.3 JiBrok maintains **SOC 2 Type II** for its organizational controls (evidence may be shared under NDA where appropriate).

5.4 The Apps implement automated PII redaction in diagnostic logging. Only error-level logs are emitted in production.

---

## 6. Sub-processors

6.1 Customer authorizes JiBrok to use **Atlassian (Forge platform)** as a sub-processor for hosting/compute/storage required to run the Apps.

6.2 JiBrok does not use other sub-processors for these Apps.

---

## 7. International Data Transfers

7.1 JiBrok does not independently transfer Personal Data outside the European Economic Area (EEA). All App data is processed within the Atlassian Forge platform.

7.2 Atlassian, as sub-processor, determines the geographic location of data processing based on the Customer's Atlassian cloud instance configuration. Any international transfers by Atlassian are governed by Atlassian's own Data Processing Addendum and transfer safeguards (including Standard Contractual Clauses where applicable).

7.3 If Customer requires information about the location of its data processing, Customer should consult Atlassian's documentation on data residency and Forge data handling.

---

## 8. Assistance with Data Subject requests

8.1 JiBrok will reasonably assist Customer in responding to Data Subject requests (access/erasure/rectification/restriction) to the extent applicable to data processed by the Apps and technically feasible.

8.2 **Atlassian accountId reporting/erasure.** JiBrok confirms it has implemented the Atlassian Personal Data Reporting/erasure workflow for stored `accountId` identifiers across all covered Apps and will process applicable "erase/refresh" actions as required.

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

### A. Services

The following JiBrok Cloud apps on the Atlassian Marketplace, all running on Atlassian Forge:

* [Time in Status / SLA / Timer / Stopwatch (Cloud)](https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=cloud&tab=overview)
* [Timer field](https://marketplace.atlassian.com/apps/1225684/timer-field?tab=overview&hosting=cloud)
* [Stopwatch field](https://marketplace.atlassian.com/apps/1225685/stopwatch-field?tab=overview&hosting=cloud)
* [Calculated and other custom fields (JBCF)](https://marketplace.atlassian.com/apps/1221055/calculated-and-other-custom-fields-jbcf?hosting=cloud&tab=overview)
* [Display Linked Issues](https://marketplace.atlassian.com/apps/1223203)
* [Fields panel for Jira Service Management (JSM)](https://marketplace.atlassian.com/apps/1226586/fields-panel-for-jira-service-management-jsm)

### B. Categories of Data Subjects

- Customer's Jira administrators who configure the Apps.
- Customer's Jira users whose data is accessed by the Apps for display and calculation purposes (e.g., issue assignees, reporters, commenters).

### C. Personal Data processed (minimal)

1. **Atlassian `accountId`** - stored as `createdBy` / `updatedBy` (and any similar creator/updater linkage fields) solely to attribute who created or updated a configuration item. Also used for GDPR personal data reporting compliance.
2. **App configurations** - free-text fields (names, descriptions, JQL queries, SLA definitions, timer configurations, calculated field formulas, display settings). These are Customer-controlled inputs; Customer determines whether any Personal Data is entered.
3. **Calculated/derived values** - time-in-status metrics, SLA calculations, computed field values. May contain references to issue keys, status names, or user identifiers depending on the calculation context. These values are derived from Jira data based on Customer configurations.

### D. Jira data access

- **Read access:** issues, statuses, transitions, custom fields, users, projects, workflows, boards, sprints (for calculations, display, and configuration).
- **Write access:** updating custom field values with calculated results (e.g., computed time-in-status values, SLA metrics, calculated field outputs).
- The Apps do **not** persistently store full Jira issue content. Jira data may be transiently accessed during calculations and rendering.

### E. Diagnostic data (Forge logs)

- The Apps use **Forge logs only** for error diagnostics.
- JiBrok does not intentionally log Jira content or Personal Data; however, in rare cases technical error context might include fragments of data. JiBrok applies reasonable efforts to minimize/scrub such occurrences.

### F. Purpose

Provide App functionality; debugging; reliability improvements using aggregated/de-identified signals; security.

### G. Duration

While installed/active, plus any Atlassian Forge platform retention behavior after uninstall.

---

## Annex 2 - Security measures (TOMs)

- **Platform isolation:** Runs entirely on Atlassian Forge; no external egress, no third-party analytics.
- **Minimal data:** `accountId` for attribution + configuration + calculated values stored in Forge storage.
- **Access controls:** Restricted administrative access, strong authentication, least privilege.
- **Logging:** Error-focused; avoidance of user content; scrubbing/minimization practices.
- **Organizational controls:** Supported by SOC 2 Type II (sharing under NDA when needed).

---

## Annex 3 - Sub-processors

- **Atlassian (Forge platform)** - hosting/compute/storage required to run the Apps.
