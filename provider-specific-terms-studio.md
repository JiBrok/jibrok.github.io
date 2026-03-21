---
layout: page
title: "Provider-Specific Terms - JiBrok Studio for Jira"
permalink: /provider-specific-terms-studio/
excerpt: "Provider-Specific Terms for JiBrok Studio for Jira Cloud. Scripts, custom tables, and Forge platform terms."
last_modified_at: 2026-03-21
---

Last updated: March 21, 2026

These Provider-Specific Terms supplement the [Atlassian Standard End User Agreement](https://www.atlassian.com/licensing/marketplace/end-user-agreement-v1) ("Standard Agreement") for **JiBrok Studio for Jira Cloud** provided by JiBrok ("Provider"). In the event of any conflict between these Provider-Specific Terms and the Standard Agreement, these Provider-Specific Terms shall prevail.

---

### 1. Governing Law and Jurisdiction

Section 19.2 of the Standard Agreement is replaced with the following:

This Agreement shall be governed by and construed in accordance with the laws of the Republic of Cyprus, without regard to its conflict of laws provisions. The parties consent to the exclusive jurisdiction and venue of the courts of Nicosia, Republic of Cyprus.

---

### 2. Data Protection

The following documents are incorporated by reference into this Agreement:

* **Data Processing Agreement (DPA):** [jibrok.com/dpa-jibrok-studio-jira/](/dpa-jibrok-studio-jira/)
* **Privacy Policy:** [jibrok.com/privacy-policy/](/privacy-policy/)
* **Cookie Policy:** [jibrok.com/cookie-policy/](/cookie-policy/)

The DPA governs the processing of personal data by the Provider on behalf of the Customer in connection with the Product.

---

### 3. Platform Dependency

The Product runs entirely on Atlassian Forge, a serverless platform managed by Atlassian. The Provider does not operate its own servers, databases, or network infrastructure for the Product. This dependency extends to all Atlassian platform services the Product interacts with, including but not limited to Atlassian Forge runtime, Forge SQL, Forge Key-Value Storage, Atlassian REST APIs, and Atlassian CDN.

Outages, performance degradation, or limitations of the Atlassian Forge platform or related Atlassian services that are outside the Provider's reasonable control shall not constitute a breach of this Agreement, a failure of the Performance Warranty (Section 6.2), or grounds for termination under the Force Majeure provisions (Section 19.8).

Platform availability is subject to Atlassian's own service commitments. Current operational status is available at [jibrok.statuspage.io](https://jibrok.statuspage.io/).

---

### 4. Customer Scripts and Content

#### 4.1 Script Authoring and Execution Responsibility

The Product enables Customers to create, store, and execute custom scripts in JavaScript, Python, and Groovy. The Customer is solely responsible for the content, legality, accuracy, compliance, and consequences of all scripts created, modified, and executed using the Product. This responsibility applies regardless of how scripts are triggered, including manual execution, scheduled execution, event-driven execution, webhook invocation, or invocation through Atlassian platform integrations (such as Automation for Jira, Rovo, or Workflows).

#### 4.2 No Monitoring, Review, or Approval

The Provider does not monitor, review, audit, approve, or endorse Customer scripts at any time - before, during, or after execution. The Provider has no obligation to review scripts for correctness, security, compliance with applicable laws, or fitness for any particular purpose. The Provider does not provide any certification, validation, or quality assurance of Customer scripts.

#### 4.3 Impersonation

The Product allows administrators to configure scripts to execute on behalf of other users (impersonation) or as the application identity. The Customer is solely responsible for configuring and using impersonation in accordance with the Customer's internal policies, applicable employment law, and data protection requirements. The Provider is not responsible for any consequences arising from scripts executing actions attributed to users who did not directly initiate or authorize those actions.

#### 4.4 Custom Tables, Message Queues, and Customer-Stored Data

The Product provides storage facilities including custom tables (with user-defined schemas) and message queues (with arbitrary JSON payloads). The Customer determines the content and structure of data stored in these facilities. The Customer is solely responsible for ensuring that data stored in custom tables and message queues complies with applicable laws, including but not limited to data protection regulations (GDPR, CCPA), industry-specific requirements (HIPAA, PCI DSS, SOX), and any internal Customer data governance policies. For clarity, the restrictions on Sensitive Data in Section 7.2 of the Standard Agreement apply equally to data stored by the Customer in custom tables and message queues.

#### 4.5 Webhook Token Security

Certain Product features use authentication tokens for webhook (Web Trigger) access. The Customer is responsible for safeguarding webhook tokens and for any actions initiated through webhooks, whether authorized or resulting from compromised tokens. The Provider encrypts tokens at rest but is not responsible for token exposure resulting from the Customer's sharing, logging, or insecure handling of tokens.

#### 4.6 Third-Party and Atlassian Platform Integrations

The Product may be accessed through or invoked by Atlassian platform features and services including, without limitation, Rovo (AI agents), Automation for Jira, Jira Workflows, and third-party applications. The Provider does not control the behavior, inputs, or invocation patterns of these platforms. The Customer's use of the Product through such integrations is subject to the terms of the respective platform, and the Customer bears sole responsibility for the consequences of scripts invoked through these channels.

#### 4.7 Exclusion of Liability for Script-Related Harm

To the maximum extent permitted by applicable law, the Provider shall have no liability for any loss, damage, claim, or expense arising from or related to:

* (a) the content, logic, or output of Customer scripts;
* (b) data loss, corruption, or unauthorized modification caused by Customer scripts;
* (c) violations of applicable law, regulation, or contractual obligations caused by Customer scripts;
* (d) business interruptions, workflow disruptions, or operational failures resulting from Customer scripts;
* (e) security incidents arising from Customer script logic, webhook token compromise, or impersonation configuration;
* (f) interactions between Customer scripts and third-party services or Atlassian platform features;
* (g) data stored by the Customer in custom tables or message queues.

The exclusions in this Section 4.7 apply only to the extent that the loss, damage, or claim is attributable to Customer scripts, Customer configurations, or Customer data, and not to any defect, error, or vulnerability in the Provider's platform, sandbox, or execution environment.

This exclusion applies in addition to, and does not limit, the liability limitations and exclusions in Sections 14.1 and 14.2 of the Standard Agreement.

#### 4.8 Customer Indemnification for Scripts

In addition to the Customer-Covered Claims defined in Section 15.2 of the Standard Agreement, the Customer shall indemnify, defend, and hold harmless the Provider from and against any third-party claims, regulatory investigations, proceedings, penalties, damages, losses, and expenses (including reasonable attorneys' fees and regulatory defense costs) arising from or related to Customer scripts, including claims alleging that Customer scripts violate applicable law, infringe third-party rights, cause data breaches, or result in harm to third parties.

---

### 5. AI and Machine Learning

The Provider will not use Customer Data (including Customer scripts, custom table data, message queue data, and script execution history) to train, fine-tune, or improve artificial intelligence or machine learning models. Usage Data collected under Section 3.4 of the Standard Agreement (aggregated, de-identified product usage metrics) is not Customer Data for these purposes and may be used for product improvement.

---

### 6. Backup and Data Recovery

The Customer is solely responsible for maintaining independent backups of its Jira data. The Product is not a backup or disaster recovery solution. The Provider shall not be liable for any failure to recover Customer data, whether caused by script execution, platform outages, Customer configuration, or any other cause. The Customer acknowledges that scripts may irreversibly modify or delete Jira data and that such modifications cannot be reversed by the Provider.

---

### 7. Liability Clarifications

This section supplements Section 14 of the Standard Agreement.

#### 7.1 General Cap Calculation

For the purposes of Section 14.1 of the Standard Agreement, the "General Cap" means amounts actually paid by the Customer to the Provider for the Product during the twelve (12) month period immediately preceding the first event giving rise to liability. Free trial periods, promotional periods, and any period during which the Customer did not pay fees do not contribute to the General Cap calculation.

#### 7.2 Specific Exclusions from Damages

Without limiting Section 14.2 of the Standard Agreement, neither party shall be liable for:

* (a) cost of procurement of substitute goods, technology, or services;
* (b) lost goodwill or reputational damage;
* (c) damages arising from the Customer's failure to implement reasonable data backup procedures;
* (d) damages arising from the Customer's continued use of the Product after becoming aware of a defect or vulnerability;
* (e) damages arising from use of the Product in combination with third-party products, platforms, or services not provided by the Provider;
* (f) penalties, fines, or sanctions imposed by regulatory authorities on the Customer.

#### 7.3 Sole Remedy

For any claim related to Product performance or functionality, the Customer's sole and exclusive remedy is as set forth in Section 6.2 of the Standard Agreement.

#### 7.4 Overall Liability Cap

Notwithstanding Sections 14.3 and 14.5 of the Standard Agreement, Provider's total aggregate liability arising out of or related to this Agreement, from all causes of action and under all theories of liability, shall not exceed two times (2x) the General Cap as calculated in Section 7.1 above.

For clarity, this cap applies to all categories of claims, including Provider-Covered Claims (Section 15), Enhanced Claims (Section 14.3), and confidentiality obligations.

This limitation does not apply to liability arising from Provider's fraud or intentional misconduct, or liability that cannot be limited under the laws of the Republic of Cyprus.

#### 7.5 Indemnification Conditions

In addition to the procedures set forth in Section 15.4 of the Standard Agreement, Provider's obligations under Section 15.1 are subject to the following conditions:

* (a) Customer must notify Provider in writing within ten (10) business days of becoming aware of a potential Provider-Covered Claim.
* (b) Customer must grant Provider sole control of the defense and settlement of any Provider-Covered Claim. Customer shall not settle or compromise any such claim without Provider's prior written consent.
* (c) In addition to the exceptions set forth in Section 15.6 of the Standard Agreement, Provider's indemnification obligations do not extend to claims arising from Customer's use of the Product in combination with products, services, or technologies not provided or recommended by Provider or Atlassian.
* (d) Provider's obligations under Section 15.1 shall be reduced to the extent that Customer's actions or omissions materially contributed to the claim.

---

### 8. Force Majeure Extension

In addition to events of Force Majeure described in Section 19.8 of the Standard Agreement, the following shall constitute Force Majeure events:

* (a) Atlassian platform outages, degradation, or changes to Forge APIs that materially affect Product functionality;
* (b) changes to Atlassian Marketplace policies that require Product modifications;
* (c) regulatory actions by government authorities affecting the Provider's ability to deliver the Product;
* (d) supply chain disruptions affecting cloud infrastructure providers used by Atlassian.

For events described in subsections (a) and (b) of this section, the period referenced in Section 19.8 of the Standard Agreement after which either party may terminate shall be extended to sixty (60) days.

---

### 9. Amendments

This section supersedes Section 19.5 of the Standard Agreement with respect to amendments to these Provider-Specific Terms.

The Provider may update these Provider-Specific Terms from time to time. Material changes - including changes to liability limitations, data processing obligations, or governing law - will be communicated through the Atlassian Marketplace listing or via the Provider's website at least thirty (30) days before taking effect.

If the Customer objects to a material change, the Customer may terminate its subscription by providing written notice to the Provider within the thirty (30) day notice period. In such case, the Customer will receive a pro-rata refund of any prepaid fees for the remainder of the subscription term. Continued use of the Product after the effective date of a material change constitutes acceptance of the updated terms.

---

### 10. Security Documentation

The Provider maintains the following security documentation:

* **Trust Center:** [jibrok.com/trust-center/](/trust-center/)
* **Security & SOC Reports:** [jibrok.com/security/](/security/)
* **Forge Platform Security:** [jibrok.com/docs/jibrok-studio-jira/forge-platform-security/](/docs/jibrok-studio-jira/forge-platform-security/) (or at such other URL as the Provider may designate)
* **Vulnerability Disclosure Policy:** [jibrok.com/vulnerability-disclosure/](/vulnerability-disclosure/)

---

### 11. Support

Support is provided in accordance with the Provider's Support Policy at [jibrok.com/support-policy/](/support-policy/).

Support requests may be submitted through the Provider's Help Center at [jibrok.atlassian.net/servicedesk/customer/portals](https://jibrok.atlassian.net/servicedesk/customer/portals) or by email at [support@jibrok.com](mailto:support@jibrok.com).

For security-related reports, contact [security@jibrok.com](mailto:security@jibrok.com).

---

### 12. Survival

The following sections of these Provider-Specific Terms survive termination or expiration of this Agreement: Section 1 (Governing Law and Jurisdiction), Section 4.7 (Exclusion of Liability for Script-Related Harm), Section 4.8 (Customer Indemnification for Scripts), Section 5 (AI and Machine Learning), Section 6 (Backup and Data Recovery), and Section 7 (Liability Clarifications).

---

### 13. Contact Information

JiBrok

Email: [support@jibrok.com](mailto:support@jibrok.com)

Help Center: [jibrok.atlassian.net/servicedesk/customer/portals](https://jibrok.atlassian.net/servicedesk/customer/portals)
