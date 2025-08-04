---
title: Migration from Server/Data Center
key: tis-cloud
excerpt: "Guide for migrating Time in Status from Jira Server/Data Center to Cloud with manual settings transfer and configuration checklist."
category: migration
tags: [doc, cloud, time-in-status, migration, field-creation, web-panels, status-tracking]
---

Automatic migration of settings is currently under development.

For now, the application requires manual transfer of settings.
You don't need to migrate data from issues. <b>You only need to transfer the settings for calendars, fields, and panels</b>.
Some [things are missing](/docs/tis-cloud/featureDifferenceDocumentation/) in the cloud version of the app.

A checklist for transferring settings:
1. Transfer work calendars. They have the same interfaces, and you need to create copies.
2. For each "Time in status" field, you need to create a new field with appropriate settings. For JQL, you can use the key and transferred projects "project in (projectA, projectB)". A new field will be calculated for issues from these projects.
3. If the "Time in status" field was displayed as a sidebar on the server, then you need to create a new web panel in the cloud.
4. If you transfer user filters, then you need to consider: the field ID in the cloud will differ from the server ones, and not all JQL functions from the server are available in the cloud.


For any questions please contact support.