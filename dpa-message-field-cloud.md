---
layout: page
title: DPA - Message Field Cloud
permalink: /dpa-message-field-cloud/
---

## Data Processing Agreement (DPA) - Message Field Cloud (Atlassian Forge)

**Version 1.1 | Effective date:** 2026-03-18

This Data Processing Agreement ("**DPA**") forms part of the agreement/terms governing a customer's use of the **Message Field Cloud** app by Jibrok, hosted on the Atlassian Marketplace and running entirely on **Atlassian Forge** (the "**App**").

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

3.3 **Free-text fields.** The App includes configuration fields that may accept free text (e.g., **name**, **description**, **message**, **JQL**). Customer is responsible for ensuring that any Personal Data included in such fields is lawful and necessary.

---

## 4. Confidentiality

Jibrok ensures that any person authorized to process Personal Data is bound by confidentiality and accesses Personal Data only as necessary.

---

## 5. Security (GDPR Art. 32)

5.1 Jibrok implements appropriate technical and organizational measures described in **Annex 2**.

5.2 The App has **no external data egress** and uses only Atlassian Forge runtime and storage (no external services, no Forge Remote).

5.3 Jibrok maintains **SOC 2 Type II** for its organizational controls (evidence may be shared under NDA where appropriate).

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

7.2 **Atlassian accountId reporting/erasure.** Jibrok confirms it has implemented the Atlassian Personal Data Reporting/erasure workflow for stored `accountId` identifiers and will process applicable "erase/refresh" actions as required for the App.

---

## 8. Personal Data Breach

Jibrok will notify Customer **without undue delay and in any event within 48 hours** after confirming a Personal Data Breach affecting Personal Data processed under this DPA. Jibrok will provide available information reasonably necessary for Customer's compliance obligations, including the nature of the breach, categories of data subjects affected, likely consequences, and measures taken or proposed to mitigate the breach. Jibrok will cooperate with Customer's notification obligations under GDPR Articles 33 and 34, and will document all Personal Data Breaches in accordance with GDPR Article 33(5).

---

## 9. Return and deletion

9.1 Jibrok stores App configuration data and identifiers only within Atlassian Forge storage and does not keep separate copies outside Forge.

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
**Message Field Cloud** - Jira app on Atlassian Marketplace running on Atlassian Forge.

### B. Categories of Data Subjects
Customer's Jira users (e.g., admins/users creating or updating App configuration).

### C. Personal Data processed (minimal)
- **Atlassian `accountId`** stored as `createdBy` / `updatedBy` (and any similar creator/updater linkage fields used by the App) solely to attribute who created/updated a configuration item.
- App configuration may include free-text fields (**name/description/message/JQL**). These are Customer-controlled inputs; Customer determines whether any Personal Data is entered there.

### D. Non-persistent access (read-only)
- The App may read Jira data to render functionality but does **not** write back to Jira and does **not** store Jira issue content.

### E. Diagnostic data (Forge logs)
- The App uses **Forge logs only** for error diagnostics.
- Jibrok does not intentionally log Jira content or Personal Data; however, in rare cases technical error context might include fragments of data. Jibrok applies reasonable efforts to minimize/scrub such occurrences.

### F. Purpose
Provide App functionality; debugging; reliability improvements using aggregated/de-identified signals; security.

### G. Duration
While installed/active, plus any Atlassian Forge platform retention behavior after uninstall.

---

## Annex 2 - Security measures (TOMs)

- Runs entirely on Atlassian Forge; no external egress/third-party analytics for this App.
- Minimal data: `accountId` for attribution + configuration stored in Forge storage.
- Access controls: restricted administrative access (single operator), strong authentication, least privilege.
- Logging: error-focused; avoidance of user content; scrubbing/minimization practices.
- Organizational controls supported by SOC 2 Type II (sharing under NDA when needed).

---

## Annex 3 - Sub-processors

- **Atlassian (Forge platform)** - hosting/compute/storage required to run the App.
