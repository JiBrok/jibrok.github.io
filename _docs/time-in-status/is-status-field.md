---
title: Is status field
key: time-in-status
excerpt: "Boolean field type that returns true/false for issue status validation with JQL search capabilities for workflow tracking."
category: field-types-configuration
tags: [doc, server, datacenter, time-tracking, time-in-status, timer, stopwatch, business-calendar, jql-functions, reporting, sla-tracking, performance-optimization, rest-api, java-api, worklog, field-panels, export, eazybi-integration]
---

Returns yes or no - whether the issue is in the specified status.

Searchable. Returns text “true“ of “false“.
JQL example for field type 'Is status' with name 'is new':
'Is new' ~ "true"
'Is new' ~ "false"
The settings indicate the statuses. If the task is in one of the selected states, then ”true” is returned, otherwise, ”false” is returned. If statuses are not set, then the value is empty.


After changing the configuration, you need a reindex for the jql search to work correctly.
