---
title: Install Message Panel for Jira Cloud
key: message-field-cloud
excerpt: "Install Message Panel app for Jira Cloud from Atlassian Marketplace."
category: getting-started
tags: [doc, cloud, installation, marketplace, forge]
---

{:.no_toc}
* TOC
{:toc}

## Install from Atlassian Marketplace

1. Log in to your Jira Cloud instance as an administrator.
2. Click the **Settings** icon (⚙️) → **Apps**.
3. Click **Find new apps** in the left sidebar.
4. Search for **"Message Panel"**.
5. Click **Get it now** or **Try it free**.
6. Review and accept the app permissions.
7. Wait for installation to complete (1-2 minutes).

## Enable Modules

Before panels appear, enable the display modules:

1. Go to **Apps** → **Message Panel Settings**.
2. Click the **Modules** tab.
3. Enable the modules you want:
   - **Issue Panel** - Main panel on issue view screen
   - **Issue Activity** - Activity feed integration
   - **Issue Context** - Context menu info
   - **Issue Action** - Custom action buttons
4. Click **Save**.

## Create First Configuration

1. In **Message Panel Settings**, click **Create New Configuration**.
2. Enter a name and optional description.
3. Choose data source (Linked Issues or JQL Query).
4. Select display module.
5. Click **Save**.
6. Open a Jira issue to see your panel.

## Next Steps

- [Configuration Guide](/docs/message-field-cloud/configuration/) - Set up panels
- [Modules Guide](/docs/message-field-cloud/modules/) - Display locations
- [Dynamic Templates](/docs/message-field-cloud/dynamic-templates/) - Add dynamic content
- [Delegation](/docs/message-field-cloud/delegation/) - Project admin access
