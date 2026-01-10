---
title: Getting Started
key: message-field-cloud
excerpt: Install Message Panel and create your first panel in 5 minutes
category: getting-started
tags:
  - doc
  - cloud
  - installation
  - quickstart
---

# Getting Started
{:.no_toc}

* TOC
{:toc}

## Install from Marketplace

1. Log in to Jira Cloud as an **administrator**
2. Click **Settings** (gear icon) → **Apps**
3. Click **Find new apps** in the sidebar
4. Search for **"Message Panel"**
5. Click **Get it now** or **Try it free**
6. Accept the app permissions
7. Wait for installation (1-2 minutes)

**[Direct Marketplace Link](https://marketplace.atlassian.com/apps/1219615/message-field?hosting=cloud&tab=overview)**

## Enable Display Modules

After installation, enable where panels can appear:

1. Go to **Apps** → **Message Panel Settings**
2. Click the **Modules** tab
3. Enable the modules you need:

| Module | Location |
|--------|----------|
| Issue Panel | Right sidebar on issue view |
| Issue Activity | Activity feed section |
| Issue Context | Context panel |
| Issue Action | Toolbar button |
| JSM Portal Panel | Service desk portal |
| JSM Portal Footer | Portal page footer |
| JSM Portal Subheader | Portal page subheader |

4. Click **Save**

## Create Your First Panel

Let's create a simple welcome message panel:

### Step 1: Open Settings

Go to **Apps** → **Message Panel Settings**

### Step 2: Create Configuration

Click **Create New Configuration**

### Step 3: Basic Settings

- **Name**: `Welcome Message`
- **Description**: Leave empty for now

### Step 4: Choose Data Source

- Select **Empty (Message only)**

### Step 5: Add Message

In the Message field, enter:

```
{% raw %}Welcome to issue {{ issue.key }}!

This issue is currently {{ issue.fields.status.name }}.{% endraw %}
```

### Step 6: Select Module

- Choose **Issue Panel**

### Step 7: Save

Click **Save Configuration**

### Step 8: Test

Open any Jira issue - you should see your panel in the right sidebar!

## What's Next?

Now that you have your first panel working:

| Goal | Documentation |
|------|---------------|
| Show linked issues in a table | [Data Sources](data-sources) |
| Display JQL query results | [Data Sources](data-sources) |
| Show panels only in certain projects | [Context Filters](context-filters) |
| Use conditions and loops in messages | [Templates](templates) |
| Display warnings in pop-up dialogs | [Modal Windows](modal-windows) |
| Set up panels for JSM portal | [JSM Integration](jsm-integration) |
| Let project admins manage panels | [Delegation](delegation) |
