---
title: Install Message Panel for Jira Cloud
key: message-field-cloud
excerpt: "Install Message Panel app for Jira Cloud from Atlassian Marketplace with step-by-step instructions for subscription and activation."
category: getting-started
tags: [doc, cloud, installation, marketplace, licensing, forge]
---

{:.no_toc}
* TOC
{:toc}

## Overview

Message Panel is a Jira Cloud app built on Atlassian Forge. This guide will walk you through the installation and activation process.

## Prerequisites

- Jira Cloud instance
- Site administrator permissions
- Active Atlassian account

## Install from Atlassian Marketplace

### Method 1: From Jira Administration

1. Log in to your Jira Cloud instance as an administrator.
2. Click the **Settings** icon (⚙️) in the top right corner.
3. Select **Apps** from the dropdown menu.

4. Click **Find new apps** in the left sidebar.

5. In the search box, type **"Message Panel"** or navigate to the app page directly.

6. Click on the **Message Panel** app in the search results.

7. Click **Get it now** or **Try it free** to start installation.

8. Review the permissions requested by the app:
   - Read Jira work data (issues, projects, fields)
   - Read user information
   - Store app configuration data
   - Read field metadata
   - Read custom field contexts
   - Read epic data
   - Read user locale settings

9. Click **Get app** to confirm installation.

10. Wait for the installation to complete (usually 1-2 minutes).

11. You'll see a confirmation message when the app is successfully installed.

### Method 2: From Atlassian Marketplace

1. Go to [Atlassian Marketplace](https://marketplace.atlassian.com/).

2. Search for **"Message Panel"** in the search bar.

3. Select **Message Panel** from the results.

4. Make sure **Cloud** is selected as the hosting option.

5. Click **Try it free** or **Buy now**.

6. Select your Jira Cloud site from the dropdown.

7. Click **Install app** to start the installation.

8. Review and accept the permissions.

9. Wait for the installation to complete.

## Verify Installation

After installation, verify that Message Panel is working:

1. Go to **Jira Settings** (⚙️) → **Apps** → **Manage apps**.

2. Locate **Message Panel** in the installed apps list.

3. Ensure the app status shows as **Enabled**.

4. Look for the **Message Panel Settings** option in:
   - **Apps** menu (top navigation bar)
   - Or **Jira Settings** → **Apps** → **Message Panel Settings**

## Access Admin Settings

### Global Settings (Site Admins)

1. Click the **Apps** dropdown in the top navigation.

2. Select **Message Panel Settings**.

3. You'll see the admin configuration page with:
   - List of existing configurations
   - Module management tab
   - Delegation settings tab

### Project Settings (Project Admins)

If delegation is enabled for your project:

1. Go to your **Project Settings**.

2. Look for **Message Panel Settings** in the left sidebar.

3. You can create and manage configurations for your project.

## Enable Modules

Before panels appear on issues, you need to enable the display modules:

1. Go to **Message Panel Settings** (admin page).

2. Click the **Modules** tab.

3. Enable the modules you want to use:
   - ✅ **Issue Panel** - Main panel on issue view screen
   - ✅ **Issue Activity** - Activity feed integration
   - ✅ **Issue Context** - Context menu quick info
   - ✅ **Issue Action** - Custom action buttons

4. Click **Save** to apply changes.

**Note:** Modules will only appear on issues that have matching configurations.

## First Configuration

Create your first panel configuration:

1. In **Message Panel Settings**, click **Create New Configuration**.

2. Fill in basic information:
   - **Name**: Give your panel a descriptive name
   - **Description**: Optional message to display (supports templates)

3. Choose data source:
   - **Linked Issues**: Show issues connected via link types
   - **JQL Query**: Show issues matching a JQL query

4. Select display module:
   - Choose where the panel should appear (Issue Panel, Activity, etc.)

5. Click **Save** to create the configuration.

6. Open a Jira issue to see your panel in action!

## Licensing

### Free Trial

Message Panel offers a free trial period:
- Full access to all features
- No credit card required
- Automatically starts when you install the app

### Subscription

After the trial period:
1. Purchase a subscription from the Atlassian Marketplace
2. Pricing is based on the number of Jira users
3. The app will continue working seamlessly

### Managing License

To view or manage your license:
1. Go to **Jira Settings** (⚙️) → **Apps** → **Manage apps**
2. Find **Message Panel** in the list
3. Click on the app name to see license details
4. You can update or cancel the subscription from here

## Uninstallation

To uninstall Message Panel:

1. Go to **Jira Settings** (⚙️) → **Apps** → **Manage apps**.

2. Find **Message Panel** in the installed apps list.

3. Click the **...** (more options) button.

4. Select **Uninstall**.

5. Confirm the uninstallation.

**Note:** Uninstalling will remove all configurations and settings. This action cannot be undone.

## Troubleshooting Installation

### App Not Appearing After Installation

If the app doesn't appear:
1. Wait 2-3 minutes for the installation to complete
2. Refresh your browser
3. Clear browser cache
4. Check if you have admin permissions

### Permission Errors

If you see permission errors:
1. Verify you're logged in as a site administrator
2. Check that your Jira plan supports Forge apps
3. Contact your Atlassian administrator if needed

### Installation Failed

If installation fails:
1. Try the installation again
2. Check Atlassian status page for service issues
3. Contact [Atlassian Support](https://support.atlassian.com/)
4. Contact [Message Panel Support](https://jibrok.atlassian.net/servicedesk/customer/portals) if the issue persists

### App Shows as Disabled

If the app is installed but disabled:
1. Go to **Manage apps**
2. Find Message Panel
3. Click **Enable** to activate the app

## Next Steps

Now that Message Panel is installed:

1. **[Create Your First Configuration](/docs/user-docs/configuration/)** - Set up a panel to display linked issues
2. **[Learn About Modules](/docs/user-docs/modules/)** - Understand different display locations
3. **[Explore Dynamic Templates](/docs/user-docs/dynamic-templates/)** - Add dynamic content to messages
4. **[Set Up Delegation](/docs/user-docs/delegation/)** - Allow project admins to manage panels

## Support

Need help? We're here for you:

- 📖 **[Documentation](/docs/user-docs/overview/)** - Complete user guide
- 🎫 **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Submit a ticket
- 💬 **[Community Forum](https://community.atlassian.com/)** - Ask questions
- 📧 **Email**: support@jibrok.com

---

**Ready to configure your panels?** Continue to the [Configuration Guide](/docs/user-docs/configuration/)!
