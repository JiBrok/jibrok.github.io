---
title: Refined for Jira | Sites & Themes
key: message-field
---

**Message Field** may not display correctly on Jira Service Management portals created with <a href="https://marketplace.atlassian.com/apps/1216711/refined-for-jira-sites-themes?hosting=datacenter&tab=overview" target="_blank">Refined for Jira | Sites & Themes</a>.

## Message Field Version 5.0 and Later

Starting with **Message Field version 5.0**, the plugin includes only two main resource modules:
- **general** - Standard resource with default page loading settings
- **general-global** - Global resource with extended page loading settings

The main difference between these resources is the pages on which they load. In recent versions of Refined for Jira, enabling the global resource is typically **no longer necessary**, and the default settings should work correctly.

{% include alert.html style="info" text="For most users with recent versions of both Message Field (5.0+) and Refined for Jira, no manual configuration is required. The plugin should work out of the box." %}

## Manual Configuration (If Needed)

If you're experiencing display issues, you may need to adjust the resource settings:

1. Click the **Administration** icon in the top right corner of the screen
2. Navigate to **Manage apps**

    <a href="/uploads/message-field/install/manage-apps.png"><img src="/uploads/message-field/install/manage-apps.png" alt="open manage apps" width="100%"/></a>

3. Find **Message Field** in the apps list and click on its section
4. Click the button showing the number of enabled modules (e.g., "X of Y modules enabled") in the right column to display plugin modules
  
    <a href="/uploads/message-field/plugin-modules.png"><img src="/uploads/message-field/plugin-modules.png" alt="plugin modules" width="100%"/></a>
    
5. Hover over each module to see the **Enable** or **Disable** buttons
6. Configure the resources based on your needs:
   - **Option A (Recommended)**: Keep **general** enabled and **general-global** disabled
   - **Option B (If issues persist)**: Disable **general** and enable **general-global**

{% include alert.html style="warning" text="Important: Do not enable both 'general' and 'general-global' resources simultaneously, as this will cause message duplication and display issues." %}

## Troubleshooting

If messages still don't display correctly after configuration:

1. **Clear browser cache** and refresh the page
2. **Check Refined for Jira version compatibility** with your Message Field version
3. **Contact support** if issues persist with details about your Refined and Message Field versions

## Legacy Versions (Before 5.0)

For Message Field versions prior to 5.0, you may need to configure additional resources like **view-servicedesk** and **view-servicedesk-global**. However, upgrading to the latest version is recommended for the best compatibility.

After proper configuration, messages should display correctly in both standard Jira interfaces and **Refined for Jira** portals.


