---
layout: page
title: JiBrok Studio for Jira Cloud
key: jibrok-studio-jira
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

<style>
/* ===== LANDING PAGE STYLES ===== */

/* Hero logo */
.hero-logo-row {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 20px;
}
.hero-logo-icon {
  width: 48px;
  height: 48px;
  border-radius: 12px;
  background: #fff;
  padding: 6px;
  box-shadow: 0 2px 12px rgba(0,0,0,0.15);
}
.hero-logo-label {
  color: rgba(255,255,255,0.9);
  font-size: 1rem;
  font-weight: 600;
  letter-spacing: 0.02em;
}

/* Hero */
.studio-hero {
  background: linear-gradient(135deg, #0052CC 0%, #2684FF 50%, #0065FF 100%);
  padding: 80px 0 60px;
  position: relative;
  overflow: hidden;
}
.studio-hero::before {
  content: '';
  position: absolute;
  inset: 0;
  background:
    radial-gradient(circle at 20% 80%, rgba(255,255,255,0.06) 0%, transparent 50%),
    radial-gradient(circle at 80% 20%, rgba(255,255,255,0.08) 0%, transparent 50%);
  pointer-events: none;
}
.studio-hero-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 40px;
  align-items: center;
}
@media (min-width: 960px) {
  .studio-hero { padding: 100px 0 80px; }
  .studio-hero-grid { grid-template-columns: 1fr 1fr; gap: 60px; }
}
.studio-hero h1 {
  color: #fff;
  font-size: 2.4rem;
  font-weight: 800;
  line-height: 1.15;
  margin: 0 0 20px;
  letter-spacing: -0.02em;
}
@media (min-width: 960px) {
  .studio-hero h1 { font-size: 3.2rem; }
}
.studio-hero .hero-subtitle {
  color: rgba(255,255,255,0.85);
  font-size: 1.15rem;
  line-height: 1.6;
  margin: 0 0 32px;
  max-width: 520px;
}
.studio-hero .hero-buttons a {
  display: inline-block;
  padding: 14px 32px;
  border-radius: 8px;
  font-weight: 600;
  font-size: 1rem;
  text-decoration: none;
  transition: all 0.2s ease;
  margin: 0 10px 10px 0;
}
.studio-hero .btn-primary-hero {
  background: #fff;
  color: #0052CC;
}
.studio-hero .btn-primary-hero:hover {
  background: #f0f6ff;
  transform: translateY(-1px);
  box-shadow: 0 4px 20px rgba(0,0,0,0.15);
}
.studio-hero .btn-secondary-hero {
  background: rgba(255,255,255,0.15);
  color: #fff;
  border: 1.5px solid rgba(255,255,255,0.35);
}
.studio-hero .btn-secondary-hero:hover {
  background: rgba(255,255,255,0.25);
  transform: translateY(-1px);
}
.studio-hero-screenshot {
  border-radius: 12px;
  box-shadow: 0 20px 60px rgba(0,0,0,0.3), 0 0 0 1px rgba(255,255,255,0.1);
  width: 100%;
  transition: transform 0.3s ease;
}
.studio-hero-screenshot:hover {
  transform: scale(1.02);
}

/* Badges row */
.studio-badges {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-top: 24px;
}
.studio-badge {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 6px 14px;
  background: rgba(255,255,255,0.12);
  border-radius: 20px;
  color: rgba(255,255,255,0.9);
  font-size: 0.82rem;
  font-weight: 500;
  backdrop-filter: blur(4px);
}
.studio-badge svg {
  width: 14px;
  height: 14px;
  flex-shrink: 0;
}

/* Section base */
.studio-section {
  padding: 80px 0;
}
.studio-section-gray {
  background: #f7f8fa;
}
.studio-section-dark {
  background: #1a1a2e;
  color: #e0e0e8;
}
.studio-section-dark h2,
.studio-section-dark h3 {
  color: #fff;
}
.studio-section-dark .section-subtitle {
  color: rgba(255,255,255,0.65);
}
.studio-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 30px;
}
.section-header {
  text-align: center;
  margin-bottom: 56px;
}
.section-header h2 {
  font-size: 2rem;
  font-weight: 800;
  margin: 0 0 14px;
  letter-spacing: -0.01em;
}
@media (min-width: 960px) {
  .section-header h2 { font-size: 2.4rem; }
}
.section-subtitle {
  color: #8f919e;
  font-size: 1.1rem;
  max-width: 600px;
  margin: 0 auto;
  line-height: 1.6;
}

/* Feature cards */
.feature-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 24px;
}
@media (min-width: 640px) {
  .feature-grid { grid-template-columns: repeat(2, 1fr); }
}
@media (min-width: 960px) {
  .feature-grid { grid-template-columns: repeat(3, 1fr); }
}
.feature-card {
  background: #fff;
  border-radius: 14px;
  padding: 32px 28px;
  border: 1px solid #eef0f3;
  transition: all 0.25s ease;
  text-decoration: none;
  color: inherit;
  display: block;
}
.feature-card:hover {
  border-color: #d0d7e0;
  box-shadow: 0 8px 32px rgba(0,0,0,0.08);
  transform: translateY(-3px);
  color: inherit;
  text-decoration: none;
}
.feature-card-icon {
  width: 48px;
  height: 48px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 20px;
  font-size: 22px;
}
.feature-card h3 {
  font-size: 1.15rem;
  font-weight: 700;
  margin: 0 0 10px;
}
.feature-card p {
  color: #6b6d7b;
  font-size: 0.92rem;
  line-height: 1.6;
  margin: 0;
}
.icon-blue { background: #e6f0ff; color: #0052CC; }
.icon-purple { background: #f0e6ff; color: #6554C0; }
.icon-green { background: #e3fcef; color: #006644; }
.icon-orange { background: #fff4e5; color: #FF8B00; }
.icon-teal { background: #e6fcff; color: #00A3BF; }
.icon-red { background: #ffebe6; color: #DE350B; }

/* How it works - Steps */
.steps-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 0;
  position: relative;
}
@media (min-width: 960px) {
  .steps-grid { grid-template-columns: repeat(5, 1fr); gap: 0; }
}
.step-item {
  text-align: center;
  padding: 24px 20px;
  position: relative;
}
@media (min-width: 960px) {
  .step-item:not(:last-child)::after {
    content: '';
    position: absolute;
    right: -2px;
    top: 50%;
    transform: translateY(-50%);
    width: 24px;
    height: 2px;
    background: linear-gradient(90deg, #0052CC, #2684FF);
    z-index: 1;
  }
}
.step-number {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  background: linear-gradient(135deg, #0052CC, #2684FF);
  color: #fff;
  font-weight: 800;
  font-size: 1.1rem;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 16px;
}
.step-item h3 {
  font-size: 1rem;
  font-weight: 700;
  margin: 0 0 8px;
  color: #323247;
}
.step-item p {
  font-size: 0.85rem;
  color: #8f919e;
  margin: 0;
  line-height: 1.5;
}

/* Showcase section with image */
.showcase-block {
  display: grid;
  grid-template-columns: 1fr;
  gap: 40px;
  align-items: center;
  margin-bottom: 64px;
}
.showcase-block:last-child { margin-bottom: 0; }
@media (min-width: 960px) {
  .showcase-block { grid-template-columns: 1fr 1fr; gap: 60px; }
  .showcase-block.reverse { direction: rtl; }
  .showcase-block.reverse > * { direction: ltr; }
}
.showcase-text h3 {
  font-size: 1.5rem;
  font-weight: 800;
  margin: 0 0 16px;
}
.showcase-text p {
  color: #6b6d7b;
  line-height: 1.7;
  margin: 0 0 20px;
}
.showcase-text ul {
  list-style: none;
  padding: 0;
  margin: 0;
}
.showcase-text ul li {
  padding: 6px 0;
  color: #4a4b5a;
  font-size: 0.95rem;
  display: flex;
  align-items: flex-start;
  gap: 10px;
}
.showcase-text ul li::before {
  content: '✓';
  color: #0052CC;
  font-weight: 700;
  flex-shrink: 0;
  margin-top: 1px;
}
.showcase-img img {
  width: 100%;
  border-radius: 12px;
  box-shadow: 0 4px 24px rgba(0,0,0,0.08), 0 0 0 1px rgba(0,0,0,0.04);
}

/* Docs grid */
.docs-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 20px;
}
@media (min-width: 640px) {
  .docs-grid { grid-template-columns: repeat(2, 1fr); }
}
@media (min-width: 960px) {
  .docs-grid { grid-template-columns: repeat(4, 1fr); }
}
.docs-card {
  background: rgba(255,255,255,0.06);
  border: 1px solid rgba(255,255,255,0.1);
  border-radius: 12px;
  padding: 28px 24px;
  transition: all 0.2s ease;
  text-decoration: none;
  display: block;
}
.docs-card:hover {
  background: rgba(255,255,255,0.1);
  border-color: rgba(255,255,255,0.2);
  transform: translateY(-2px);
  text-decoration: none;
}
.docs-card h3 {
  font-size: 1rem;
  margin: 0 0 10px;
  color: #fff;
}
.docs-card p {
  font-size: 0.85rem;
  color: rgba(255,255,255,0.55);
  margin: 0;
  line-height: 1.5;
}
.docs-card .docs-card-icon {
  font-size: 1.6rem;
  margin-bottom: 14px;
  display: block;
}

/* CTA */
.studio-cta {
  background: linear-gradient(135deg, #0747A6 0%, #0052CC 40%, #2684FF 100%);
  padding: 80px 0;
  text-align: center;
  position: relative;
  overflow: hidden;
}
.studio-cta::before {
  content: '';
  position: absolute;
  inset: 0;
  background:
    radial-gradient(circle at 30% 50%, rgba(255,255,255,0.06) 0%, transparent 50%),
    radial-gradient(circle at 70% 80%, rgba(255,255,255,0.04) 0%, transparent 40%);
  pointer-events: none;
}
.studio-cta .btn-primary-hero {
  background: #fff;
  color: #0052CC;
  box-shadow: 0 4px 24px rgba(0,0,0,0.2);
}
.studio-cta .btn-primary-hero:hover {
  background: #f0f6ff;
  transform: translateY(-2px);
  box-shadow: 0 8px 32px rgba(0,0,0,0.25);
}
.studio-cta .btn-secondary-hero {
  background: rgba(255,255,255,0.15);
  color: #fff;
  border: 1.5px solid rgba(255,255,255,0.35);
}
.studio-cta .btn-secondary-hero:hover {
  background: rgba(255,255,255,0.25);
  transform: translateY(-2px);
}
.studio-cta h2 {
  color: #fff;
  font-size: 2rem;
  font-weight: 800;
  margin: 0 0 14px;
}
@media (min-width: 960px) {
  .studio-cta h2 { font-size: 2.5rem; }
}
.studio-cta p {
  color: rgba(255,255,255,0.8);
  font-size: 1.1rem;
  margin: 0 0 32px;
}
.studio-cta .hero-buttons a {
  display: inline-block;
  padding: 14px 32px;
  border-radius: 8px;
  font-weight: 600;
  font-size: 1rem;
  text-decoration: none;
  transition: all 0.2s ease;
  margin: 0 8px 10px;
}

/* Languages pills */
.lang-pills {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
  margin-top: 6px;
}
.lang-pill {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 5px 14px;
  background: #f0f2f5;
  border-radius: 6px;
  font-size: 0.82rem;
  font-weight: 600;
  color: #323247;
}
.lang-pill code {
  background: none;
  padding: 0;
  font-size: 0.8rem;
}
</style>


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
          Write scripts in JavaScript, Python, or Groovy. Execute interactively, save to a shared library, and automate anything — schedules, events, workflows, AI&nbsp;agents.
        </p>
        <div class="hero-buttons">
          <a href="https://marketplace.atlassian.com/apps/2349892699" class="btn-primary-hero" target="_blank">Get it on Marketplace</a>
          <a href="/docs/jibrok-studio-jira/getting-started/" class="btn-secondary-hero">Getting Started</a>
        </div>
        <div class="studio-badges">
          <span class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
            Forge-native
          </span>
          <span class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="16 18 22 12 16 6"/><polyline points="8 6 2 12 8 18"/></svg>
            JS &middot; Python &middot; Groovy
          </span>
          <span class="studio-badge">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
            Audit logs
          </span>
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
      <p class="section-subtitle">A complete toolkit: interactive console, shared library, global variables, and powerful triggers — all running securely on Atlassian Forge.</p>
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
        <p>Run scripts on a cron schedule — daily cleanups, weekly reports, periodic syncs.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/triggers-events/" class="feature-card">
        <div class="feature-card-icon icon-teal">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"/></svg>
        </div>
        <h3>Event Triggers</h3>
        <p>React to issue creates, updates, comments, and 20+ other Jira events in real time.</p>
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
        <h3>Write, test, and iterate — in seconds</h3>
        <p>The Script Console is your interactive playground. Write code, run it instantly, and see results — all without leaving Jira.</p>
        <ul>
          <li>Syntax highlighting &amp; autocomplete</li>
          <li>Sandbox mode — test safely, no risk to live data</li>
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
        <p>Computed custom fields — text, number, date — that recalculate on issue create and update.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/ui-modifications/" class="feature-card">
        <div class="feature-card-icon icon-purple">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
        </div>
        <h3>UI Modifications</h3>
        <p>Dynamically customize create and transition forms — hide, show, and set fields in real time.</p>
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
        <p>SQL-backed custom tables and priority message queues for persistent data.</p>
      </a>
      <a href="/docs/jibrok-studio-jira/triggers-async/" class="feature-card">
        <div class="feature-card-icon icon-red">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
        </div>
        <h3>Async Events</h3>
        <p>Background processing with message queues for heavy or long-running operations.</p>
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
        <p>Run interactively in sandbox mode — no risk to live data</p>
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
  </div>
</div>
