---
title: Migration from Server/Data Center
key: timer-cloud
excerpt: "Guide for migrating Timer field from Jira Server/Data Center to Cloud with manual settings transfer and configuration checklist."
---

Automatic migration of settings during development.

Now the application requires manual transfer of settings.
You don't need to migrate data from issues. <b> You only need to transfer the settings for calendars, fields, panels </b>.
Some [things are missing](/docs/stopwatch-cloud/featureDifferenceDocumentation/) in the cloud version of the app.

A small checklist for transferring settings.
1. Transfer work calendars. They have the same interfaces and you need to create copies.
2. For each field "Stopwatch" you need to create a new field with appropriate settings. 
3. If the "Stopwatch" field was displayed as a sidebar on the server, then you need to create a new Web-panel in the cloud.(Coming soon 🛠)
4. If you transfer user filters, then you need to take into account: the id of field in the cloud will differ from the server ones, not all JQL functions from the server are available in the cloud.


For any questions please contact support.