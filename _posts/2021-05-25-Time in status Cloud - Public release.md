---
title: ⭐️ Time in status for Cloud - Public release ⭐️
tags: tis-cloud cloud
---

We have published our cloud application Time in status!! 🥳

Server functionality of the [Time in status | SLA | Timer | Stopwatch](https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=datacenter&tab=overview) application turned out to be very large.
It allows you to count time for a wide variety of situations, export data, generate reports, send notifications, and much more. This all works for any Jira project.

Now is the time to implement this for the Jira Cloud as well.
In the cloud, this functionality is presented in the form of several applications. The Jira Cloud administrator will be able to connect only the functionality that is needed in his situation, and not drag everything into production.

* [Migration from Server/Data Center](https://jibrok.com/docs/tis-cloud/migrationDocumentation/)
* [Feature Difference (Server/Data Center and Cloud)](https://jibrok.com/docs/tis-cloud/featureDifferenceDocumentation/)

Today we have published the first part of the functionality - [Time in status](https://marketplace.atlassian.com/apps/1220908/time-in-status-sla-timer-stopwatch?hosting=cloud&tab=overview).
This application counts the time spent by the issue in the specified statuses. You can connect a work calendar to calculate only working hours.

Time in status can be displayed in the field or in the panel.


<p><a href="/uploads/tis-cloud/web-panel-1.png"><img src="/uploads/tis-cloud/web-panel-1.png" style="width:100%;"/></a></p>


### Custom field ###

#### How does the Time in status field work? ####

The field reads information about the issue, calculates the time according to the specified settings and saves the information in the readonly field.
The field periodically updates its data and updates the value in the field and search indexes.
The data in the fields is updated depending on the time spent in statuses. During the first day consumed in statuses, the time is updated every 1-30 minutes. The longer the time, the less frequent the updates. Then every hour. In the future, it will be possible to customize the frequency of updates.

Once created, the field can be used like any other - placed on issue screens, exported.
It is also possible to search for the "Time in status" field through regular jql. Searchable data is available based on the data refresh interval. This is not a real-time search, but very close to it.
There are several JQL functions available for searching, which can be enough for the case: How long did the task spend in the status?
JQL examples are available in [documentation](https://jibrok.com/docs/tis-cloud/time-in-status-jql/). 

#### How to create the "Time in status" field? ####

After installing the application, the administration page is available to you. You can also get to it from the "Manage apps" menu:

<table>
<tr>
<td><a href="/uploads/tis-cloud/manage-your-apss-tis.png"><img src="/uploads/tis-cloud/manage-your-apss-tis.png" /></a></td>
<td><a href="/uploads/tis-cloud/manage-your-apss.png"><img src="/uploads/tis-cloud/manage-your-apss.png" /></a></td>
<td><a href="/uploads/tis-cloud/tis-cloud-configured.png"><img src="/uploads/tis-cloud/tis-cloud-configured.png" /></a></td>
<td><a href="/uploads/tis-cloud/tis-cloud-configured-2.png"><img src="/uploads/tis-cloud/tis-cloud-configured-2.png" /></a></td>
</tr>
</table>

<p><a href="/uploads/tis-cloud/create-field-2.png"><img src="/uploads/tis-cloud/create-field-2.png" style="width:100%;"/></a></p>


Unfortunately, we had to abandon the standard interface for creating fields in the Jira Cloud. And the Time in status fields are created and configured through the application interface.

For each field, you specify the context, statuses for which you want to count the time, work calendar and time display format.
Detailed instructions are available in [documentation](https://jibrok.com/docs/tis-cloud/time-in-status-field-settings/).

After creating the field, the process of calculating values for tasks from the specified context will start. This may take a while. You can see the sync status on the [plugin service page](https://jibrok.com/docs/tis-cloud/service-info/).

Unlike a server in the cloud, there are a number of limitations. For the most part, these restrictions prevent you from creating too many fields. In the case of this plugin, you can create from 25 to 100 fields (depending on the connected options).
You can read more about limits in the [documentation](https://jibrok.com/docs/tis-cloud/limits/).


### Web panel ###

#### How does the panel work? ####

The field does not show very much information. It has a delay in updating data. It is more suitable for searching and reporting.
If you need to show in the request how long it has been in different statuses, then it is better to use the panel.

The panel displays the time spent in the specified statuses in the form of a table. Time is calculated without delay, on the fly.

[How do I create a "Time in Status" panel?](https://jibrok.com/docs/tis-cloud/web-panel/).


### Working calendar ###

In the fields and panels, you can use work calendars to calculate times.
They take into account time zones, work schedules, breaks and holidays.
[More about calendars](https://jibrok.com/docs/tis-cloud/work-calendar/).


### Is something not working? Something is missing? ###

We track errors in real time and try to fix them promptly. If you have encountered an error, then most likely we already know about it and it will be fixed in the next few hours.
If the decision is delayed or the error is "logical", we would be very grateful for your message to the [support service](https://jibrok.atlassian.net/servicedesk/customer/portals).
You can also contact with any questions or ideas and we will try to help you.

We publish server work that may affect users on the [Status page](https://timeinstatus.statuspage.io/). The same information is duplicated on the application settings page.

### Discounts ###

* Are you migrating from a server or data center to the cloud?
* Do you have several of our apps?
* Are you interested in product development and reporting issues you find?

We will be happy to provide you with a discount. Please contact [support](https://jibrok.atlassian.net/servicedesk/customer/portals).


### Future plans ###

In the near future, we will release Timers and Stopwatches for the cloud, which will work similarly to [server versions](https://jibrok.com/docs/time-in-status/overview/).

