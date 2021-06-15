---
title: Migration from Server/Data Center
key: tis-cloud
---

Automatic migration of settings during development.

Now the application requires manual transfer of settings.
You don't need to migrate data from issues. <b> You only need to transfer the settings for calendars, fields, panels </b>.
Some [things are missing](/docs/tis-cloud/featureDifferenceDocumentation/) in the cloud version of the app.

A small checklist for transferring settings.
1. Transfer work calendars. They have the same interfaces and you need to create copies.
2. For each field "Time in status" you need to create a new field with appropriate settings. As JQL you can take key and transferred projects "project in (projectA, projectB)". A new field will be calculated for tasks from these projects.
3. If the "Time in status" field was displayed as a sidebar on the server, then you need to create a new Web-panel in the cloud.
4. If you transfer user filters, then you need to take into account: the id of field in the cloud will differ from the server ones, not all JQL functions from the server are available in the cloud.


