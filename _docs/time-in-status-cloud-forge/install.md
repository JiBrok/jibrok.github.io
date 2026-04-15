---
title: Install Time in Status (Forge) for Jira Cloud
key: time-in-status-cloud-forge
excerpt: "Install Time in Status (Forge) from the Atlassian Marketplace. Forge-native app - no server setup, OAuth, or external infrastructure required."
category: getting-started
tags: [doc, cloud, time-in-status, forge, setup, installation]
---

> **Draft: Forge version documentation - work in progress.**

## Requirements

- A Jira Cloud site (Jira Software, Jira Service Management, or Jira Work Management)
- Jira site administrator permissions to install apps
- An active Atlassian Marketplace account

No external server, OAuth configuration, or database is required. The app runs entirely on Atlassian's Forge platform.

---

## Install from the Atlassian Marketplace

1. Sign in to your Jira Cloud site as a **site administrator**.
2. Open **Settings ⚙ → Apps → Find new apps**.
3. Search for **Time in Status** by JiBrok.
4. Select **Try it free** (or **Buy now**) and follow the prompts.
5. Wait for the **"Installed and ready to go"** confirmation.

On first installation, the app automatically:

- Creates its internal storage (MySQL tables managed by Forge SQL)
- Registers the custom field types: **Time in Status**, **Stopwatch**, **Timer**, **Time Between Dates**, and **Calendar Select**
- Registers the issue panels and activity panel
- Schedules background jobs for periodic recalculation

No manual post-install configuration is needed. The app is ready to use as soon as the Marketplace install completes.

---

## Open the admin panel

After installation, the admin panel is available at:

**Jira Settings ⚙ → Apps → Manage apps → Time in Status → Configure**

Or from the **Apps** menu in the top navigation, if the app exposes itself there for your site.

Inside the admin panel you will find tabs for:

- Time in Status
- Stopwatch
- Timer
- Time Between Dates
- Activity Panels
- Custom Events
- Calendars
- Recalculation
- Import / Export

---

## Permissions granted

During installation Jira asks you to approve the following scopes:

- **Read and write** Jira work (issues, comments, fields)
- **Read** Jira fields and field contexts
- **Write** app data (for the app's own storage)
- **Manage** Jira project settings (used by per-project panel configuration)

These scopes are required for the app to calculate time values, expose custom field data, and let you configure per-project panels.

---

## Next steps

- [Create a work calendar](/docs/time-in-status-cloud-forge/work-calendar)
- [Create your first Time in Status field](/docs/time-in-status-cloud-forge/time-in-status-field-create)
- [Follow the Getting Started guide](/docs/time-in-status-cloud-forge/get-started)
