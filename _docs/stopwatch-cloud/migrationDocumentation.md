---
title: Migration from Server/Data Center
key: stopwatch-cloud
excerpt: "Guide for migrating Stopwatch field from Jira Server/Data Center to Cloud with manual settings transfer and configuration checklist."
category: migration
tags: [doc, cloud, time-tracking, stopwatch, migration, server-to-cloud, settings-transfer, data-center]
---

Automatic migration of settings is under development.

Currently, the application requires manual transfer of settings.
You don't need to migrate data from issues. <b>You only need to transfer the settings for calendars, fields, and panels</b>.
Some [features are missing](/docs/stopwatch-cloud/featureDifferenceDocumentation/) in the cloud version of the app.

Here is a small checklist for transferring settings:
1. Transfer work calendars. They have the same interfaces and you need to create copies.
2. For each "Stopwatch" field, you need to create a new field with appropriate settings. 
3. If the "Stopwatch" field was displayed as a sidebar on the server, then you need to create a new web panel in the cloud (coming soon 🛠).
4. If you transfer user filters, then you need to take into account that the field ID in the cloud will differ from the server ones, and not all JQL functions from the server are available in the cloud.


For any questions, please contact support.