---
title: Module settings in the fields
tags: tis-cloud
---

In case you need to create many fields by default, you are limited to 25 fields. But now you can disable modules that are not critical for you and increase the available number of fields.

Now, when creating or editing a field, you can choose which modules you need.

[More about limits](https://jibrok.com/docs/tis-cloud/limits/)

<p><a href="/uploads/tis-cloud/modules.webp"><img src="/uploads/tis-cloud/modules.webp" style="width:100%;" loading="lazy"></a></p>

* Issue Property
    * The main module.
    * Requires 1 quota of modules.
    * Stores data and provides a search engine (JQL). Doesn't require other modules to work, but it is needed for other modules to work.
    * With the option disabled: nothing will work. The settings will be saved.
    * With the option enabled: the data will be updated and search through properties will be available.
* Create field 
    * Requires 1 quota of modules.
    * When this option is enabled, creates a custom field. The field can be added to screens, dashboards, reports. The field is available for export.
    * The field creates search functions for easy searching in JQL.
    * When disabled, deletes the existing custom field.
* Fast update data after create issue
    * Requires 1 quota of modules.
    * Provides fast data refresh after creating a issue. If the option is disabled, the data will be updated with delays.
* Fast update data after update issue
    * Requires 1 quota of modules.
    * Provides fast data refresh after update a issue. If the option is disabled, the data will be updated with delays.






