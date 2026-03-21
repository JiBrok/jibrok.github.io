---
layout: page
title: DPA - Message Field Cloud
permalink: /dpa-message-field-cloud/
excerpt: "Data Processing Agreement for Message Field Cloud (Atlassian Forge). GDPR compliant."
last_modified_at: 2026-03-21
---

## Data Processing Agreement (DPA) - Message Field Cloud (Atlassian Forge)

Effective date: March 21, 2026

This Data Processing Agreement ("**DPA**") forms part of the agreement/terms governing a customer's use of the **Message Field Cloud** app by JiBrok, hosted on the Atlassian Marketplace and running entirely on **Atlassian Forge** (the "**App**").

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

3.3 The App includes configuration fields that may accept free text (e.g., name, description, message, JQL). Customer is responsible for ensuring that any Personal Data included in such fields is lawful and necessary.

---

## 4. Confidentiality

JiBrok ensures that any person authorized to process Personal Data is bound by confidentiality and accesses Personal Data only as necessary.

---

## 5. Security (GDPR Art. 32)

5.1 JiBrok implements appropriate technical and organizational measures described in **Annex 2**.

5.2 The App has **no external data egress** and uses only Atlassian Forge runtime and storage.

5.3 JiBrok maintains **SOC 2 Type II** certification for its organizational controls (evidence may be shared under NDA where appropriate).

5.4 The App implements automated PII redaction in diagnostic logging. Only error-level logs are emitted in production.

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

8.2 JiBrok implements Atlassian's Personal Data Reporting and erasure workflow for stored `accountId` identifiers and will process applicable erasure actions as required.

---

## 9. Personal Data Breach

JiBrok will notify Customer **without undue delay and in any event within 48 hours** after confirming a Personal Data Breach affecting Personal Data processed under this DPA. JiBrok will provide available information reasonably necessary for Customer's compliance obligations, including the nature of the breach, categories of data subjects affected, likely consequences, and measures taken or proposed to mitigate the breach. JiBrok will cooperate with Customer's notification obligations under GDPR Articles 33 and 34, and will document all Personal Data Breaches in accordance with GDPR Article 33(5).

---

## 10. Return and deletion

10.1 JiBrok stores App configuration data and identifiers only within Atlassian Forge storage and does not keep separate copies outside Forge.

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

**Message Field Cloud** - Jira app on Atlassian Marketplace running on Atlassian Forge.

### B. Categories of Data Subjects

Customer's Jira users (administrators creating or updating App configuration).

### C. Personal Data processed

1. **Atlassian `accountId`** - stored as creator/updater attribution for configuration items.
2. **Configuration free-text fields** - name, description, message content, JQL queries. Customer-controlled inputs; Customer determines whether any Personal Data is entered.

The App may read Jira data to render functionality but does not write back to Jira and does not persistently store Jira issue content.

### D. Purpose

Provide App functionality; debugging; reliability improvements using aggregated/de-identified signals; security.

### E. Duration

While installed/active, plus any Atlassian Forge platform retention behavior after uninstall.

---

## Annex 2 - Security measures (TOMs)

- **Platform isolation:** Runs entirely on Atlassian Forge; no external data egress, no third-party services.
- **Data minimization:** Only `accountId` for attribution and configuration data in Forge storage. No persistent storage of Jira issue content.
- **Automated PII redaction:** Sensitive fields automatically redacted from diagnostic logs.
- **Access controls:** Restricted administrative access, strong authentication, least privilege.
- **Organizational controls:** Supported by SOC 2 Type II certification.

---

## Annex 3 - Sub-processors

- **Atlassian (Forge platform)** - hosting/compute/storage required to run the App.
