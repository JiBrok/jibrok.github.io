---
layout: page
title: DPA - JiBrok Studio for Jira Cloud
permalink: /dpa-jibrok-studio-jira/
---

## Data Processing Agreement (DPA) - JiBrok Studio for Jira Cloud (Atlassian Forge)

**Version 1.2** - Effective date: 2026-03-19

This Data Processing Agreement ("**DPA**") forms part of the agreement/terms governing a customer's use of the **JiBrok Studio for Jira Cloud** app by Jibrok, hosted on the Atlassian Marketplace and running entirely on **Atlassian Forge** (the "**App**").

> **Parties**
>
> - **Customer** (Controller): [Customer legal name], [address] ("Customer")
> - **Jibrok** (Processor): **JiBrok**, Nicosia, Republic of Cyprus, email: **support@jibrok.com** ("Jibrok")

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

3.3 The App allows administrators to author scripts, store data in custom tables, and configure automation triggers. These features may process Personal Data at Customer's discretion. Customer is responsible for ensuring lawful processing of any Personal Data through these features.

3.4 The App can read and write Jira data on behalf of administrators through scripts. All Jira API access is constrained by Atlassian permission scopes, administrator-configurable access controls, and a sandboxed execution environment. Scripts execute only on administrator instruction (manual, scheduled, event-triggered, or automation-triggered).

---

## 4. Confidentiality

Jibrok ensures that any person authorized to process Personal Data is bound by confidentiality and accesses Personal Data only as necessary.

---

## 5. Security (GDPR Art. 32)

5.1 Jibrok implements appropriate technical and organizational measures described in **Annex 2**.

5.2 The App has **no external data egress** and uses only Atlassian Forge runtime and storage. The only outbound call is the weekly report of stored `accountId` identifiers to the Atlassian Personal Data Reporting API, as required by Atlassian's privacy compliance framework.

5.3 Jibrok maintains **SOC 2 Type II** certification for its organizational controls (evidence may be shared under NDA where appropriate).

5.4 All user-authored scripts execute within a sandboxed environment with resource limits and restricted API access. See [Forge Architecture](/forge/) for technical details.

5.5 The App implements automated PII redaction in all diagnostic logging. Only error-level logs are emitted in production.

5.6 The App's interface is restricted to Jira administrators. Non-administrator users cannot access scripts, configurations, or data stored by the App.

---

## 6. Sub-processors

6.1 Customer authorizes Jibrok to use **Atlassian (Forge platform)** as a sub-processor for hosting/compute/storage required to run the App.

6.2 Jibrok does not use other sub-processors for this App.

---

## 6A. International Data Transfers

6A.1 Jibrok does not independently transfer Personal Data outside the European Economic Area (EEA). All App data is processed within the Atlassian Forge platform.

6A.2 Atlassian, as sub-processor, determines the geographic location of data processing based on the Customer's Atlassian cloud instance configuration. Any international transfers by Atlassian are governed by Atlassian's own Data Processing Addendum and transfer safeguards (including Standard Contractual Clauses where applicable).

6A.3 If Customer requires information about the location of its data processing, Customer should consult Atlassian's documentation on data residency and Forge data handling.

---

## 7. Assistance with Data Subject requests

7.1 Jibrok will reasonably assist Customer in responding to Data Subject requests (access/erasure/rectification/restriction) to the extent applicable to data processed by the App and technically feasible.

7.2 Jibrok implements Atlassian's Personal Data Reporting and erasure workflow, including weekly reporting of tracked identifiers and automatic anonymization of account data upon account closure.

---

## 8. Personal Data Breach

Jibrok will notify Customer **without undue delay and in any event within 48 hours** after confirming a Personal Data Breach affecting Personal Data processed under this DPA. Jibrok will provide available information reasonably necessary for Customer's compliance obligations, including the nature of the breach, categories of data subjects affected, likely consequences, and measures taken or proposed to mitigate the breach. Jibrok will cooperate with Customer's notification obligations under GDPR Articles 33 and 34, and will document all Personal Data Breaches in accordance with GDPR Article 33(5).

---

## 9. Return and deletion

9.1 Jibrok stores all App data within Atlassian Forge storage and does not keep separate copies outside Forge. The App applies automatic data retention limits (see Annex 1, Section F).

9.2 Upon uninstall/termination, deletion and retention of App-hosted data follow Atlassian Forge platform behavior. Where technically feasible, Jibrok will assist Customer with deletion requests relating to App-stored data.

---

## 10. Audit / information

Upon reasonable written request (no more than once per calendar year), Jibrok will provide information necessary to demonstrate compliance with this DPA, typically via written responses, SOC 2 reports, and security documentation. If Customer requires an audit beyond documentation review, such audit shall be: (a) conducted at Customer's expense; (b) preceded by at least thirty (30) days' written notice; (c) limited to records and processes relevant to this DPA; and (d) subject to reasonable confidentiality obligations. Jibrok may satisfy audit requests by providing its most recent SOC 2 Type II report and answering supplemental written questions.

---

## 11. Governing terms

If this DPA conflicts with the main agreement/terms, this DPA prevails only regarding personal data processing. Governing law and venue follow the main agreement/terms unless required otherwise by applicable law.

---

## Annex 1 - Processing details (GDPR Art. 28(3))

### A. Service

**JiBrok Studio for Jira Cloud** - Jira app on Atlassian Marketplace running on Atlassian Forge.

### B. Categories of Data Subjects

- Customer's Jira administrators who create, configure, and execute scripts.
- Customer's Jira users whose data may be accessed or modified by scripts.
- Customer's Jira users configured for script execution impersonation.

### C. Personal Data processed

1. **Atlassian `accountId`** - stored as script author/actor, in audit records, and in the account tracking table (for GDPR data reporting compliance).
2. **User display name** - stored in the preconfigured users list for administrator interface convenience.
3. **Script metadata** - administrator-authored script name, source code, description, and language. May contain references to Personal Data.
4. **Script execution history** - execution logs, results, issue keys, error text. May contain fragments of Jira data including Personal Data. Subject to automatic pruning.
5. **Audit records** - script name, actor accountId, trigger type, success/error status. Subject to automatic pruning.
6. **Custom table and queue data** - user-defined data structures with Customer-controlled content. Customer determines whether any Personal Data is stored.
7. **Configuration metadata** - folder/label names, trigger configurations, access control settings.

### D. Purpose

Provide App functionality; debugging; reliability improvements using aggregated/de-identified signals; security.

### E. Duration

While installed/active, plus any Atlassian Forge platform retention behavior after uninstall.

### F. Data retention

The App enforces automatic data retention through pruning mechanisms: execution history, audit records, and script versions are automatically rotated when reaching configured limits. Account-related data is anonymized upon account closure through the GDPR workflow described in Section 7.2. Upon App uninstallation, data retention follows Atlassian Forge platform behavior. See [product documentation](/docs/jibrok-studio-jira/) for current limits.

---

## Annex 2 - Security measures (TOMs)

- **Platform isolation:** Runs entirely on Atlassian Forge; no external data egress, no third-party services.
- **Administrator-only access:** All App functionality restricted to Jira administrators.
- **Sandboxed script execution:** Scripts run in a sandboxed environment with resource limits and restricted API access. See [Forge Architecture](/forge/) for details.
- **API access controls:** Administrator-configurable restrictions on which Jira REST API paths scripts can access.
- **Automated PII redaction:** Sensitive fields automatically redacted from all diagnostic logs.
- **GDPR data lifecycle:** Weekly personal data reporting to Atlassian; automatic anonymization on account closure.
- **Data minimization:** Automatic pruning enforces retention limits; no persistent storage of Jira issue content accessed by scripts.
- **Impersonation controls:** Running scripts as a different user requires explicit administrator opt-in.
- **Organizational controls:** Supported by SOC 2 Type II certification.

---

## Annex 3 - Sub-processors

- **Atlassian (Forge platform)** - hosting/compute/storage required to run the App.
