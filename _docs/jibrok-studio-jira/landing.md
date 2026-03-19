---
layout: page
title: JiBrok Studio for Jira Cloud
key: jibrok-studio-jira
permalink: /docs/jibrok-studio-jira/
width: expand
excerpt: Scripting platform for Jira Cloud - automate, extend, and customize your Jira workflows with JavaScript, Python, and Groovy
category: getting-started
tags:
  - doc
  - cloud
  - overview
  - introduction
  - landing
---


<!-- ==================== HERO ==================== -->
<div class="studio-hero">
  <div class="studio-container">
    <div class="studio-hero-grid">
      <div>
        <div class="hero-logo-row">
          <img src="/uploads/jibrok-studio-jira/jibrok-studio.svg" alt="JiBrok Studio" class="hero-logo-icon">
          <span class="hero-logo-label">JiBrok Studio</span>
        </div>
        <h1>The Scripting Platform for Jira&nbsp;Cloud</h1>
        <p class="hero-subtitle">
          Write scripts in JavaScript, Python, or Groovy. Execute interactively, save to a shared library, and automate anything - schedules, events, workflows, AI&nbsp;agents.
        </p>
        <div class="hero-buttons">
          <a href="https://marketplace.atlassian.com/apps/2349892699" class="btn-primary-hero" target="_blank">Get it on Marketplace</a>
          <a href="/docs/jibrok-studio-jira/getting-started/" class="btn-secondary-hero">Getting Started</a>
        </div>
        <div class="studio-badges">
          <a href="/forge/" class="studio-badge" >
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            Forge-native
          </a>
          <span class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
            JS &middot; Python &middot; Groovy
          </span>
          <span class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
            Audit logs
          </span>
          <a href="/security/" class="studio-badge" >
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/><polyline points="9 12 11 14 15 10"/></svg>
            SOC 2 Type II
          </a>
        </div>
      </div>
      <div>
        <a href="/uploads/jibrok-studio-jira/console-interface-overview.png" target="_blank">
          <img src="/uploads/jibrok-studio-jira/console-interface-overview.png" alt="JiBrok Studio Script Console" class="studio-hero-screenshot" loading="lazy">
        </a>
      </div>
    </div>
  </div>
</div>


<!-- ==================== CORE FEATURES ==================== -->
<div class="studio-section studio-section-gray">
  <div class="studio-container">
    <div class="section-header">
      <h2>Everything you need to script Jira</h2>
      <p class="section-subtitle">A complete toolkit: interactive console, shared library, global variables, and powerful triggers - all running securely on Atlassian Forge.</p>
    </div>
    <div class="feature-grid">
      <a href="/docs/jibrok-studio-jira/script-console/" class="feature-card">
        <div class="feature-card-icon icon-blue">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="4 17 10 11 4 5"/><line x1="12" y1="19" x2="20" y2="19"/></svg>
        </div>
        <h3>Script Console</h3>
        <p>Interactive editor with syntax highlighting, autocomplete, and sandbox mode for safe testing.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/script-library/" class="feature-card">
        <div class="feature-card-icon icon-purple">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"/><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"/></svg>
        </div>
        <h3>Script Library</h3>
        <p>Central storage with folders, labels, version history, and import/export capabilities.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/global-variables/" class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><line x1="2" y1="12" x2="22" y2="12"/><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"/></svg>
        </div>
        <h3>Global Variables</h3>
        <p>Shared constants and secrets available across all scripts. Change once, used everywhere.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/triggers-scheduled/" class="feature-card">
        <div class="feature-card-icon icon-orange">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
        </div>
        <h3>Scheduled Triggers</h3>
        <p>Run scripts on a cron schedule - daily cleanups, weekly reports, periodic syncs.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/triggers-events/" class="feature-card">
        <div class="feature-card-icon icon-teal">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg>
        </div>
        <h3>Event Triggers</h3>
        <p>React to issue creates, updates, comments, and 30+ Jira events in real time.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/triggers-workflow-post-function/" class="feature-card">
        <div class="feature-card-icon icon-red">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
        </div>
        <h3>Workflow Functions</h3>
        <p>Post-functions, validators, and conditions powered by your scripts on transitions.</p>
      </a>
    </div>
  </div>
</div>


<!-- ==================== SHOWCASE: Console ==================== -->
<div class="studio-section">
  <div class="studio-container">
    <div class="showcase-block">
      <div class="showcase-text">
        <h3>Write, test, and iterate - in seconds</h3>
        <p>The Script Console is your interactive playground. Write code, run it instantly, and see results - all without leaving Jira.</p>
        <ul>
          <li>Syntax highlighting &amp; autocomplete</li>
          <li>Sandbox mode - test safely, no risk to live data</li>
          <li>Run as any user for permission testing</li>
          <li>Full output with structured log levels</li>
        </ul>
        <div class="lang-pills">
          <span class="lang-pill"><code>JS</code> JavaScript</span>
          <span class="lang-pill"><code>PY</code> Python</span>
          <span class="lang-pill"><code>GR</code> Groovy</span>
        </div>
      </div>
      <div class="showcase-img">
        <a href="/uploads/jibrok-studio-jira/console-interface-overview.png" target="_blank">
          <img src="/uploads/jibrok-studio-jira/console-interface-overview.png" alt="Script Console" loading="lazy">
        </a>
      </div>
    </div>

    <div class="showcase-block reverse">
      <div class="showcase-text">
        <h3>Organize scripts your way</h3>
        <p>The Script Library is your team's shared repository. Organize with folders, tag with labels, track every change with version history.</p>
        <ul>
          <li>Folders &amp; labels for organization</li>
          <li>Version history with diff view</li>
          <li>Import &amp; export for backup and migration</li>
          <li>Save directly from console with one click</li>
        </ul>
      </div>
      <div class="showcase-img">
        <a href="/uploads/jibrok-studio-jira/library-overview-table.png" target="_blank">
          <img src="/uploads/jibrok-studio-jira/library-overview-table.png" alt="Script Library" loading="lazy">
        </a>
      </div>
    </div>
  </div>
</div>


<!-- ==================== EXTENSIONS ==================== -->
<div class="studio-section studio-section-gray">
  <div class="studio-container">
    <div class="section-header">
      <h2>Extend Jira beyond its limits</h2>
      <p class="section-subtitle">Computed fields, dynamic forms, native automation actions, AI agent integration, and persistent data storage.</p>
    </div>
    <div class="feature-grid">
      <a href="/docs/jibrok-studio-jira/scripted-fields/" class="feature-card">
        <div class="feature-card-icon icon-blue">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"/><line x1="3" y1="9" x2="21" y2="9"/><line x1="9" y1="21" x2="9" y2="9"/></svg>
        </div>
        <h3>Scripted Fields</h3>
        <p>Computed custom fields - text, number, date - that recalculate on issue create and update.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/ui-modifications/" class="feature-card">
        <div class="feature-card-icon icon-purple">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
        </div>
        <h3>UI Modifications</h3>
        <p>Dynamically customize create and transition forms - hide, show, and set fields in real time.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/automation/" class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 2L2 7l10 5 10-5-10-5z"/><path d="M2 17l10 5 10-5"/><path d="M2 12l10 5 10-5"/></svg>
        </div>
        <h3>Jira Automation</h3>
        <p>Use scripts as actions inside native Jira Automation rules for unlimited flexibility.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/rovo/" class="feature-card">
        <div class="feature-card-icon icon-teal">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
        </div>
        <h3>Rovo AI Agent</h3>
        <p>Expose scripts to Atlassian Rovo for natural-language execution via AI chat.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/data-storage/" class="feature-card">
        <div class="feature-card-icon icon-orange">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/></svg>
        </div>
        <h3>Data Storage</h3>
        <p>Custom tables and priority message queues for persistent data.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/triggers-async/" class="feature-card">
        <div class="feature-card-icon icon-red">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
        </div>
        <h3>Async Events</h3>
        <p>Background processing with message queues for heavy or long-running operations.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/triggers-webhook/" class="feature-card">
        <div class="feature-card-icon icon-blue">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"/><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"/></svg>
        </div>
        <h3>Webhook Trigger</h3>
        <p>Trigger scripts via HTTP requests from external systems with Basic Auth and rate limiting.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/scenarios/" class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 3 21 3 21 8"/><line x1="4" y1="20" x2="21" y2="3"/><polyline points="21 16 21 21 16 21"/><line x1="15" y1="15" x2="21" y2="21"/><line x1="4" y1="4" x2="9" y2="9"/></svg>
        </div>
        <h3>Scenarios</h3>
        <p>Split long-running scripts into managed steps for processing thousands of issues.</p>
      </a>
    </div>
  </div>
</div>


<!-- ==================== HOW IT WORKS ==================== -->
<div class="studio-section">
  <div class="studio-container">
    <div class="section-header">
      <h2>How it works</h2>
      <p class="section-subtitle">From first script to full automation in five steps.</p>
    </div>
    <div class="steps-grid">
      <div class="step-item">
        <div class="step-number">1</div>
        <h3>Write</h3>
        <p>Author scripts in JS, Python, or Groovy in the built-in editor</p>
      </div>
      <div class="step-item">
        <div class="step-number">2</div>
        <h3>Test</h3>
        <p>Run interactively in sandbox mode - no risk to live data</p>
      </div>
      <div class="step-item">
        <div class="step-number">3</div>
        <h3>Save</h3>
        <p>Store in the Library with folders, labels, and version history</p>
      </div>
      <div class="step-item">
        <div class="step-number">4</div>
        <h3>Automate</h3>
        <p>Attach triggers: schedules, events, workflows, or AI agents</p>
      </div>
      <div class="step-item">
        <div class="step-number">5</div>
        <h3>Monitor</h3>
        <p>Track every execution with audit logs and run history</p>
      </div>
    </div>
  </div>
</div>


<!-- ==================== 100% ON FORGE ==================== -->
<div class="studio-section studio-section-gray">
  <div class="studio-container">
    <div class="section-header">
      <h2>100% on Atlassian Forge</h2>
      <p class="section-subtitle">No external servers. No external analytics. No external logs. Your data never leaves Atlassian infrastructure.</p>
    </div>
    <div class="feature-grid" style="grid-template-columns: repeat(3, 1fr);">
      <div class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"/><rect x="2" y="14" width="20" height="8" rx="2" ry="2"/><line x1="6" y1="6" x2="6.01" y2="6"/><line x1="6" y1="18" x2="6.01" y2="18"/></svg>
        </div>
        <h3>No External Servers</h3>
        <p>Runs entirely within Atlassian's serverless infrastructure. No vendor-hosted servers, databases, or companion services.</p>
      </div>
      <div class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 20V10"/><path d="M12 20V4"/><path d="M6 20v-6"/></svg>
        </div>
        <h3>No External Analytics</h3>
        <p>Zero third-party analytics or tracking services inside the app. No Google Analytics, no Mixpanel, no Datadog.</p>
      </div>
      <div class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>
        </div>
        <h3>No External Logging</h3>
        <p>All execution logs and audit trails stay within Atlassian Forge. No Splunk, no CloudWatch, no external log aggregation.</p>
      </div>
    </div>
    <div style="text-align:center; margin-top:32px;">
      <a href="/forge/" style="color:#0052CC; font-weight:600; text-decoration:none; font-size:1rem;">Learn more about our Forge architecture &rarr;</a>
    </div>
  </div>
</div>


<!-- ==================== DOCUMENTATION ==================== -->
<div class="studio-section studio-section-dark">
  <div class="studio-container">
    <div class="section-header">
      <h2>Documentation</h2>
      <p class="section-subtitle">Everything you need to get started and go deep.</p>
    </div>
    <div class="docs-grid">
      <a href="/docs/jibrok-studio-jira/getting-started/" class="docs-card">
        <span class="docs-card-icon">&#9889;</span>
        <h3>Getting Started</h3>
        <p>Install the app and run your first script in minutes.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/scripting-api/" class="docs-card">
        <span class="docs-card-icon">&#128214;</span>
        <h3>API Reference</h3>
        <p>Complete reference for all built-in objects and methods.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/use-cases/" class="docs-card">
        <span class="docs-card-icon">&#128161;</span>
        <h3>Use Cases</h3>
        <p>Real-world examples and recipes for common tasks.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/faq/" class="docs-card">
        <span class="docs-card-icon">&#10067;</span>
        <h3>FAQ</h3>
        <p>Answers to frequently asked questions and troubleshooting.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/forge-platform-security/" class="docs-card">
        <span class="docs-card-icon">&#128737;</span>
        <h3>Forge & Security</h3>
        <p>Tenant isolation, custom interpreter, data residency, and zero external infrastructure.</p>
      </a>
    </div>
  </div>
</div>


<!-- ==================== CTA ==================== -->
<div class="studio-cta">
  <div class="studio-container">
    <h2>Ready to automate your Jira Cloud?</h2>
    <p>Install JiBrok Studio and run your first script in minutes.</p>
    <div class="hero-buttons">
      <a href="https://marketplace.atlassian.com/apps/2349892699" class="btn-primary-hero" target="_blank">Get it on Marketplace</a>
      <a href="https://jibrok.atlassian.net/servicedesk/customer/portal/9/group/41/create/140" class="btn-secondary-hero" target="_blank">Contact Us</a>
    </div>
    <p style="color:rgba(255,255,255,0.55); font-size:0.9rem; margin-top:24px;">
      SOC 2 Type II certified &middot; EU-based vendor &middot; Building for Jira since 2016
    </p>
  </div>
</div>
