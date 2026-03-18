---
layout: page
title: Forge Architecture
permalink: /forge/
width: expand
---

<div class="uk-section uk-section-muted uk-text-center">
    <div class="uk-container uk-container-small">
        <h1 class="uk-heading-small">100% on Atlassian Forge</h1>
        <p class="uk-text-lead">JiBrok Studio runs entirely within Atlassian infrastructure. No external servers, no external analytics, no external logs. Your data never leaves Atlassian's cloud.</p>
        <div class="uk-child-width-auto uk-flex-center uk-margin-medium-top" data-uk-grid>
            <div>
                <span class="uk-label" style="background:#0052CC; font-size:0.85rem; padding:8px 16px; border-radius:100px;">Forge Native</span>
            </div>
            <div>
                <span class="uk-label" style="background:#0052CC; font-size:0.85rem; padding:8px 16px; border-radius:100px;">Zero External Infrastructure</span>
            </div>
            <div>
                <span class="uk-label" style="background:#0052CC; font-size:0.85rem; padding:8px 16px; border-radius:100px;">SOC 2 Type II</span>
            </div>
        </div>
    </div>
</div>

<div class="uk-section uk-section-default">
    <div class="uk-container uk-container-small">
        <h2 class="uk-h2 uk-text-center">What is Atlassian Forge?</h2>
        <p class="uk-text-lead uk-text-center">Forge is Atlassian's serverless cloud platform for building apps. Apps built on Forge run inside Atlassian's own infrastructure — not on vendor-owned servers. All data processing, storage, and execution happens within Atlassian's cloud, subject to the same security controls and data residency policies as your Jira site.</p>
    </div>
</div>

<div class="uk-section uk-section-muted">
    <div class="uk-container">
        <h2 class="uk-h2 uk-text-center">What This Means for You</h2>
        <p class="uk-text-lead uk-text-center">Every component of JiBrok Studio — code execution, data storage, logging, and monitoring — runs within Atlassian's infrastructure</p>
        <div class="uk-child-width-1-2@s uk-child-width-1-4@m uk-grid-match uk-text-center uk-margin-medium-top" data-uk-grid>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-body border-radius-large border-xlight">
                    <span data-uk-icon="icon: server; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin-small">No External Servers</h3>
                    <p class="uk-text-small">No vendor-hosted servers, databases, proxies, or companion services. Everything runs on Atlassian's serverless infrastructure.</p>
                </div>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-body border-radius-large border-xlight">
                    <span data-uk-icon="icon: search; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin-small">No External Analytics</h3>
                    <p class="uk-text-small">Zero third-party analytics, tracking, or monitoring services inside the app. No Google Analytics, no Mixpanel, no Datadog.</p>
                </div>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-body border-radius-large border-xlight">
                    <span data-uk-icon="icon: file-text; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin-small">No External Logging</h3>
                    <p class="uk-text-small">All execution logs and audit trails stay within Atlassian Forge. No Splunk, no CloudWatch, no external log aggregation.</p>
                </div>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-body border-radius-large border-xlight">
                    <span data-uk-icon="icon: location; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin-small">Data Residency</h3>
                    <p class="uk-text-small">Your data is subject to the same <a href="https://www.atlassian.com/trust/privacy/data-residency">data residency policies</a> as your Jira Cloud site. No additional data locations.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="uk-section">
    <div class="uk-container">
        <h2 class="uk-h2 uk-text-center">How Forge Protects Your Data</h2>
        <p class="uk-text-lead uk-text-center">Security guarantees enforced by the platform, not just the app</p>
        <div class="uk-child-width-1-2@m uk-margin-medium-top" data-uk-grid>
            <div>
                <table class="uk-table uk-table-striped uk-table-small">
                    <thead>
                        <tr>
                            <th>Guarantee</th>
                            <th>How it works</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><strong>Tenant isolation</strong></td>
                            <td>Each Jira site gets its own isolated runtime. No shared memory, processes, or databases between tenants.</td>
                        </tr>
                        <tr>
                            <td><strong>No outbound network</strong></td>
                            <td>The app cannot make HTTP requests to external URLs. Data cannot be sent outside Atlassian.</td>
                        </tr>
                        <tr>
                            <td><strong>Scoped storage</strong></td>
                            <td>All data stored in Forge SQL and KV is per-installation. One tenant cannot access another's data.</td>
                        </tr>
                        <tr>
                            <td><strong>Atlassian app review</strong></td>
                            <td>Every app version passes Atlassian's security review before it becomes available on the Marketplace.</td>
                        </tr>
                        <tr>
                            <td><strong>Automatic updates</strong></td>
                            <td>Security patches reach every installation simultaneously. No version fragmentation.</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-body border-radius-large border-xlight">
                    <h3 class="uk-card-title">In Simple Terms</h3>
                    <p>When you install JiBrok Studio, it runs as a function inside Atlassian's cloud — the same way built-in Jira features do. There is no JiBrok server receiving your data. There is no external database storing your scripts. There is no third-party service watching what you do.</p>
                    <p>Everything stays inside Atlassian. Period.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="uk-section uk-section-muted">
    <div class="uk-container">
        <h2 class="uk-h2 uk-text-center">Official Atlassian Forge Resources</h2>
        <p class="uk-text-lead uk-text-center">Learn more about the Forge platform directly from Atlassian</p>
        <div class="uk-child-width-1-2@s uk-child-width-1-4@m uk-grid-match uk-text-center uk-margin-medium-top" data-uk-grid>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                    <a class="uk-position-cover" href="https://developer.atlassian.com/platform/forge/" target="_blank" rel="noopener"></a>
                    <span data-uk-icon="icon: cloud-upload; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin">Forge Platform</h3>
                    <p>Official developer documentation for Atlassian's serverless app platform.</p>
                </div>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                    <a class="uk-position-cover" href="https://developer.atlassian.com/platform/forge/manifest-reference/" target="_blank" rel="noopener"></a>
                    <span data-uk-icon="icon: file-text; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin">Manifest Reference</h3>
                    <p>App permissions, modules, and security scopes — everything declared in the manifest.</p>
                </div>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                    <a class="uk-position-cover" href="https://developer.atlassian.com/platform/forge/changelog/" target="_blank" rel="noopener"></a>
                    <span data-uk-icon="icon: bell; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin">Forge Changelog</h3>
                    <p>Latest platform updates, new features, and improvements from Atlassian.</p>
                </div>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                    <a class="uk-position-cover" href="https://www.atlassian.com/trust/privacy/data-residency" target="_blank" rel="noopener"></a>
                    <span data-uk-icon="icon: location; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin">Data Residency</h3>
                    <p>Atlassian's data residency policies and available regions for cloud products.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="uk-section">
    <div class="uk-container">
        <h2 class="uk-h2 uk-text-center">Learn More</h2>
        <div class="uk-child-width-1-3@m uk-grid-match uk-text-center uk-margin-medium-top" data-uk-grid>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                    <a class="uk-position-cover" href="/docs/jibrok-studio-jira/forge-platform-security/"></a>
                    <span data-uk-icon="icon: lock; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin">Technical Deep Dive</h3>
                    <p>Tenant isolation, custom interpreter, egress controls, and threat elimination — the full security architecture.</p>
                </div>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                    <a class="uk-position-cover" href="/trust-center/"></a>
                    <span data-uk-icon="icon: check; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin">Trust Center</h3>
                    <p>SOC 2 reports, compliance documentation, data processing agreements, and privacy policies.</p>
                </div>
            </div>
            <div>
                <div class="uk-card uk-card-default uk-box-shadow-medium uk-card-hover uk-card-body uk-inline border-radius-large border-xlight">
                    <a class="uk-position-cover" href="/security/"></a>
                    <span data-uk-icon="icon: world; ratio: 2.5" class="uk-text-primary"></span>
                    <h3 class="uk-card-title uk-margin">Security & SOC Reports</h3>
                    <p>Independent audit results, Drata Trust Center, and CAIQ self-assessment.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="uk-section uk-text-center">
    <div class="uk-container uk-container-small">
        <h2 class="uk-h2">Have Questions About Our Architecture?</h2>
        <p class="uk-text-lead">Our team is happy to discuss Forge architecture, data handling, or any security questions.</p>
        <div class="uk-margin-medium-top">
            <a href="https://jibrok.atlassian.net/servicedesk/customer/portals" class="uk-button uk-button-primary uk-button-large uk-margin-small-right">Help Center</a>
            <a href="mailto:support@jibrok.com" class="uk-button uk-button-default uk-button-large">support@jibrok.com</a>
        </div>
    </div>
</div>
