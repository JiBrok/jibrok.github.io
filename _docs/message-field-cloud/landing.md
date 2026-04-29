---
layout: page
title: Message Field for Jira Cloud
key: message-field-cloud
permalink: /docs/message-field-cloud/
width: expand
excerpt: Dynamic information panels for Jira Cloud - show warnings, linked issues, and JQL data where work happens
category: getting-started
tags:
  - doc
  - cloud
  - overview
  - introduction
  - landing
seo_title: Message Field for Jira Cloud - Dynamic Information Panels
software_schema: true
last_modified_at: 2026-04-29
date: 2026-04-29
seo:
  date_modified: 2026-04-29
---


<!-- ==================== HERO ==================== -->
<div class="studio-hero">
  <div class="studio-container">
    <div class="studio-hero-grid">
      <div>
        <div class="hero-logo-row">
          <img src="/uploads/message-field/messge-144px.png" alt="Message Field for Jira Cloud" class="hero-logo-icon">
          <span class="hero-logo-label">Message Field</span>
        </div>
        <h1>Information panels where work happens</h1>
        <p class="hero-subtitle">
          Show warnings, linked issues, JQL results, and custom messages directly on Jira issues, JSM portals, and request creation forms. Configure once - display everywhere.
        </p>
        <div class="hero-buttons">
          <a href="https://marketplace.atlassian.com/apps/1219615/message-field?hosting=cloud&tab=overview" class="btn-primary-hero" target="_blank">Get it on Marketplace</a>
          <a href="/docs/message-field-cloud/getting-started/" class="btn-secondary-hero">Getting Started</a>
        </div>
        <div class="studio-badges">
          <a href="/forge/" class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            Forge-native
          </a>
          <span class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"/><line x1="3" y1="9" x2="21" y2="9"/></svg>
            Issue Panel &middot; JSM &middot; Custom Fields
          </span>
          <span class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
            Templates &amp; JQL
          </span>
          <span class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
            Rovo AI
          </span>
        </div>
      </div>
      <div>
        <a href="/uploads/message-field-cloud/configuration/example%20jira%20modules.png" target="_blank">
          <img src="/uploads/message-field-cloud/configuration/example jira modules.png" alt="Message Field on Jira issue" class="studio-hero-screenshot" loading="lazy">
        </a>
      </div>
    </div>
  </div>
</div>


<!-- ==================== CORE FEATURES ==================== -->
<div class="studio-section studio-section-gray">
  <div class="studio-container">
    <div class="section-header">
      <h2>Display dynamic content anywhere on Jira</h2>
      <p class="section-subtitle">Native modules for Jira and JSM, custom fields with per-context configuration, and conditional display rules - all driven by templates and data sources.</p>
    </div>
    <div class="feature-grid">
      <a href="/docs/message-field-cloud/modules/" class="feature-card">
        <div class="feature-card-icon icon-blue">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"/><line x1="3" y1="9" x2="21" y2="9"/></svg>
        </div>
        <h3>Display Modules</h3>
        <p>Native Jira locations: Issue Panel, Activity, Context, Action - plus JSM Portal modules.</p>
      </a>
      <a href="/docs/message-field-cloud/custom-fields/" class="feature-card">
        <div class="feature-card-icon icon-purple">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
        </div>
        <h3>Custom Fields</h3>
        <p>Message fields as native Jira custom fields - configure per project context for create, edit, and view screens.</p>
      </a>
      <a href="/docs/message-field-cloud/templates/" class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="4 17 10 11 4 5"/><line x1="12" y1="19" x2="20" y2="19"/></svg>
        </div>
        <h3>Dynamic Templates</h3>
        <p>Pull live issue data with <code>{% raw %}{{ issue.fields }}{% endraw %}</code> syntax. Conditionals, loops, filters - render messages from real Jira state.</p>
      </a>
      <a href="/docs/message-field-cloud/data-sources/" class="feature-card">
        <div class="feature-card-icon icon-orange">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><ellipse cx="12" cy="5" rx="9" ry="3"/><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"/><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"/></svg>
        </div>
        <h3>Data Sources</h3>
        <p>Show linked issues, JQL query results, or custom message - your panel's content adapts to the issue.</p>
      </a>
      <a href="/docs/message-field-cloud/display-conditions/" class="feature-card">
        <div class="feature-card-icon icon-teal">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"/></svg>
        </div>
        <h3>Conditional Display</h3>
        <p>Per-project, per-issue-type, per-JQL rules. Show panels only where they belong.</p>
      </a>
      <a href="/docs/message-field-cloud/jsm-create-modules/" class="feature-card">
        <div class="feature-card-icon icon-red">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"/></svg>
        </div>
        <h3>JSM Create Modules</h3>
        <p>Show contextual guidance on JSM request creation forms - with access to live form field values.</p>
      </a>
    </div>
  </div>
</div>


<!-- ==================== SHOWCASE: Modules ==================== -->
<div class="studio-section">
  <div class="studio-container">
    <div class="showcase-block">
      <div class="showcase-text">
        <h3>Display panels exactly where your team works</h3>
        <p>Whether your team lives in the issue view, the activity stream, or a JSM portal - Message Field meets them there.</p>
        <ul>
          <li>Issue Panel, Activity, Context, Action modules</li>
          <li>JSM Portal modules for customers</li>
          <li>JSM Create modules on request forms</li>
          <li>Custom fields on create, edit, and view screens</li>
        </ul>
      </div>
      <div class="showcase-img">
        <a href="/uploads/message-field-cloud/configuration/example%20jsm%20portal%20full.png" target="_blank">
          <img src="/uploads/message-field-cloud/configuration/example jsm portal full.png" alt="Message Field on JSM Portal" loading="lazy">
        </a>
      </div>
    </div>

    <div class="showcase-block reverse">
      <div class="showcase-text">
        <h3>Power your panels with templates and data</h3>
        <p>Combine live issue data, JQL results, and linked issues into context-aware messages. Built-in template editor with preview.</p>
        <ul>
          <li>Template syntax with live issue fields</li>
          <li>JQL queries with filters and ordering</li>
          <li>Linked issues displayed in tables</li>
          <li>Plain text, HTML, Markdown, or ADF formats</li>
        </ul>
      </div>
      <div class="showcase-img">
        <a href="/uploads/message-field-cloud/configuration/template%20editor%20with%20preview.png" target="_blank">
          <img src="/uploads/message-field-cloud/configuration/template editor with preview.png" alt="Template editor with live preview" loading="lazy">
        </a>
      </div>
    </div>
  </div>
</div>


<!-- ==================== EXTENSIONS ==================== -->
<div class="studio-section studio-section-gray">
  <div class="studio-container">
    <div class="section-header">
      <h2>Built for real teams</h2>
      <p class="section-subtitle">Modal windows, delegation to project admins, format flexibility, and AI-powered configuration via Rovo.</p>
    </div>
    <div class="feature-grid">
      <a href="/docs/message-field-cloud/modal-windows/" class="feature-card">
        <div class="feature-card-icon icon-blue">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"/><line x1="3" y1="9" x2="21" y2="9"/><line x1="9" y1="21" x2="9" y2="9"/></svg>
        </div>
        <h3>Modal Windows</h3>
        <p>Display critical information in pop-up dialogs from the Issue Panel - hard to miss, easy to read.</p>
      </a>
      <a href="/docs/message-field-cloud/message-formats/" class="feature-card">
        <div class="feature-card-icon icon-purple">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
        </div>
        <h3>Multiple Formats</h3>
        <p>Plain text for speed, HTML for control, Markdown for simplicity, or ADF for native Jira styling.</p>
      </a>
      <a href="/docs/message-field-cloud/delegation/" class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
        </div>
        <h3>Delegation</h3>
        <p>Let project admins manage their own panels without touching global configuration.</p>
      </a>
      <a href="/docs/message-field-cloud/rovo-integration/" class="feature-card">
        <div class="feature-card-icon icon-teal">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"/></svg>
        </div>
        <h3>Rovo AI Integration</h3>
        <p>AI-powered analysis and admin agents - configure panels with natural language.</p>
      </a>
      <a href="/docs/message-field-cloud/bulk-operations/" class="feature-card">
        <div class="feature-card-icon icon-orange">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/></svg>
        </div>
        <h3>Bulk Operations</h3>
        <p>Import, export, and apply panel configurations to multiple projects at once.</p>
      </a>
      <a href="/docs/message-field-cloud/context-filters/" class="feature-card">
        <div class="feature-card-icon icon-red">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="22 3 2 3 10 12.46 10 19 14 21 14 12.46 22 3"/></svg>
        </div>
        <h3>User Field Visibility</h3>
        <p>Show panels only when the viewing user appears in specific user-pickers - perfect for assignees and watchers.</p>
      </a>
    </div>
  </div>
</div>


<!-- ==================== HOW IT WORKS ==================== -->
<div class="studio-section">
  <div class="studio-container">
    <div class="section-header">
      <h2>How it works</h2>
      <p class="section-subtitle">From first panel to delegated team management in five steps.</p>
    </div>
    <div class="steps-grid">
      <div class="step-item">
        <div class="step-number">1</div>
        <h3>Configure</h3>
        <p>Create a panel configuration in the admin page</p>
      </div>
      <div class="step-item">
        <div class="step-number">2</div>
        <h3>Source</h3>
        <p>Pick data: linked issues, JQL, or custom message</p>
      </div>
      <div class="step-item">
        <div class="step-number">3</div>
        <h3>Conditions</h3>
        <p>Set projects, issue types, and JQL rules</p>
      </div>
      <div class="step-item">
        <div class="step-number">4</div>
        <h3>Template</h3>
        <p>Compose dynamic content with the template editor</p>
      </div>
      <div class="step-item">
        <div class="step-number">5</div>
        <h3>Enable</h3>
        <p>Turn on the module - or delegate to project admins</p>
      </div>
    </div>
  </div>
</div>


<!-- ==================== 100% ON FORGE ==================== -->
<div class="studio-section studio-section-gray">
  <div class="studio-container">
    <div class="section-header">
      <h2>100% on Atlassian Forge</h2>
      <p class="section-subtitle">No external servers. No OAuth setup. Your panels, templates, and configuration never leave Atlassian infrastructure.</p>
    </div>
    <div class="feature-grid" style="grid-template-columns: repeat(3, 1fr);">
      <div class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"/><rect x="2" y="14" width="20" height="8" rx="2" ry="2"/><line x1="6" y1="6" x2="6.01" y2="6"/><line x1="6" y1="18" x2="6.01" y2="18"/></svg>
        </div>
        <h3>Atlassian-Hosted</h3>
        <p>Runs entirely within Atlassian's serverless infrastructure. No vendor servers, no companion services to maintain.</p>
      </div>
      <div class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/><polyline points="9 12 11 14 15 10"/></svg>
        </div>
        <h3>Tenant Isolation</h3>
        <p>Each customer's panels and configuration are isolated by Forge. Same security model as Atlassian's own apps.</p>
      </div>
      <div class="feature-card">
        <div class="feature-card-icon icon-green">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/></svg>
        </div>
        <h3>Zero External Dependencies</h3>
        <p>No third-party analytics, logging, or storage. Templates and data stay inside Atlassian Forge.</p>
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
      <p class="section-subtitle">Everything you need to configure your first panel - and master advanced templates.</p>
    </div>
    <div class="docs-grid">
      <a href="/docs/message-field-cloud/getting-started/" class="docs-card">
        <span class="docs-card-icon">&#9889;</span>
        <h3>Getting Started</h3>
        <p>Create your first panel in 5 minutes.</p>
      </a>
      <a href="/docs/message-field-cloud/configuration-basics/" class="docs-card">
        <span class="docs-card-icon">&#9881;</span>
        <h3>Configuration</h3>
        <p>Modules, custom fields, data sources, and display rules.</p>
      </a>
      <a href="/docs/message-field-cloud/templates/" class="docs-card">
        <span class="docs-card-icon">&#128214;</span>
        <h3>Templates</h3>
        <p>Master dynamic content with filters and advanced syntax.</p>
      </a>
      <a href="/docs/message-field-cloud/use-cases/" class="docs-card">
        <span class="docs-card-icon">&#128161;</span>
        <h3>Use Cases</h3>
        <p>Real-world examples for dev, support, and management teams.</p>
      </a>
      <a href="/docs/message-field-cloud/faq/" class="docs-card">
        <span class="docs-card-icon">&#10067;</span>
        <h3>FAQ</h3>
        <p>Common questions, troubleshooting, and limits.</p>
      </a>
    </div>
  </div>
</div>


<!-- ==================== CTA ==================== -->
<div class="studio-cta">
  <div class="studio-container">
    <h2>Ready to make your Jira issues more informative?</h2>
    <p>Install Message Field and configure your first panel in minutes.</p>
    <div class="hero-buttons">
      <a href="https://marketplace.atlassian.com/apps/1219615/message-field?hosting=cloud&tab=overview" class="btn-primary-hero" target="_blank">Get it on Marketplace</a>
      <a href="https://jibrok.atlassian.net/servicedesk/customer/portals" class="btn-secondary-hero" target="_blank">Contact Us</a>
    </div>
    <p style="color:rgba(255,255,255,0.55); font-size:0.9rem; margin-top:24px;">
      EU-based vendor &middot; Building for Jira since 2016
    </p>
  </div>
</div>
