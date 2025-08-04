---
title: Migration from Server/Data Center
key: jbcf-cloud
category: migration
tags: [doc, cloud, calculated-fields, migration, server, datacenter]
excerpt: "Guide for migrating calculated custom fields from Jira Server/Data Center to Cloud, including manual configuration requirements and limitations."
---

Automatic migration of settings is under development.

Currently, the application requires manual transfer of settings.
You do not need to migrate data from issues. <b>You only need to transfer the settings for calendars, fields, and panels</b>.
Some [things are missing](/docs/jbcf-cloud/featureDifferenceDocumentation/) in the cloud version of the app.

A small checklist for transferring settings.
1. You will have to manually configure all the required fields. ☹️
2. If you transfer user filters, you need to consider that: the field ID in the cloud will differ from the server versions, and not all fields and JQL functions from the server are available in the cloud.


For any questions please contact support.