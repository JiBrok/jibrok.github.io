---
layout: page
width: expand
---

<!-- ==================== COMPANY HERO ==================== -->
<div class="company-hero">
    <div class="studio-container">
        <h1>Professional Jira Extensions</h1>
        <p class="hero-subtitle">
            Scripting, automation, time tracking, computed fields, and more.
            Trusted by 1,000+ companies. SOC 2 Type II certified. Building for Jira since 2016.
        </p>
        <div class="hero-buttons">
            <a href="/docs/jibrok-studio-jira/" class="btn-primary-hero">Explore JiBrok Studio</a>
            <a href="#products" class="btn-secondary-hero">All Products</a>
        </div>
    </div>
</div>

<!-- ==================== FEATURED PRODUCT ==================== -->
<div class="featured-product">
    <div class="studio-container">
        <div class="featured-product-grid">
            <div class="featured-product-text">
                <div class="featured-product-label">
                    <img src="/uploads/jibrok-studio-jira/jibrok-studio.svg" alt="JiBrok Studio">
                    Featured Product
                </div>
                <h2>JiBrok Studio for Jira Cloud</h2>
                <p>
                    The scripting platform for Jira Cloud. Write and execute scripts in JavaScript, Python, or Groovy - automate workflows, create computed fields, build triggers, and extend Jira with a full-featured scripting engine running securely on Atlassian Forge.
                </p>
                <div class="featured-product-badges">
                    <span class="featured-product-badge">Forge-native</span>
                    <span class="featured-product-badge">JS / Python / Groovy</span>
                    <span class="featured-product-badge">SOC 2 Type II</span>
                </div>
                <a href="/docs/jibrok-studio-jira/" class="featured-product-btn">Learn More</a>
            </div>
            <div class="featured-product-img">
                <a href="/docs/jibrok-studio-jira/script-console/">
                    <img src="/uploads/jibrok-studio-jira/console-interface-overview.png" alt="JiBrok Studio Script Console" loading="lazy">
                </a>
            </div>
        </div>
    </div>
</div>

<!-- ==================== TRUST SIGNALS ==================== -->
<div class="studio-section">
    <div class="studio-container">
        <div class="stat-bar">
            <a href="/docs/" class="stat-bar-item">
                <div class="stat-bar-value">10+</div>
                <p class="stat-bar-label">Cloud apps for Jira</p>
            </a>
            <div class="stat-bar-item">
                <div class="stat-bar-value">1,000+</div>
                <p class="stat-bar-label">Companies trust JiBrok</p>
            </div>
            <a href="/security/" class="stat-bar-item">
                <div class="stat-bar-value">SOC 2</div>
                <p class="stat-bar-label">Type II certified</p>
            </a>
            <a href="/forge/" class="stat-bar-item">
                <div class="stat-bar-value">Forge</div>
                <p class="stat-bar-label">Atlassian-native platform</p>
            </a>
        </div>
    </div>
</div>

<!-- ==================== PRODUCT CATALOG ==================== -->
<div id="products"></div>

{% include boxes_cloud.html columns="3" title="Cloud Products" %}

{% include boxes.html columns="3" title="Data Center / Server Products" %}

{% include cta.html title="Enterprise-ready Jira extensions" button_text="Trust Center" button_url="/trust-center/" subtitle="SOC 2 Type II certified. GDPR compliant. Forge-native architecture." style="gradient" %}
