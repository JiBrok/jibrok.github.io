---
title: ⭐️ Time in status Cloud - Public release ⭐️
tags: jbcf-cloud cloud
---

We have published our cloud application Calculated custom fields(JBCF)!! 🥳

Server functionality of the [Calculated and other custom fields(JBCF)](https://marketplace.atlassian.com/apps/1221055/calculated-and-other-custom-fields-jbcf?hosting=server&tab=overview) application turned out to be very large.
* ToDo list
* Shared components
* Role, Group, Status pickers
* Versions - This field allows you to calculate intersections, merges, and differences between two fields containing versions.
* Time between dates - Calculates the time between two dates from fields - system fields or custom. jql to search for “time between dates” in time (“>”, “2h”)
* Formula (number, string, date) - Field for calculating the value using the specified formula(script). You can use any system and user fields for calculation. You can customize the display. You can connect jql functions to search by time.
* Calculated field...
* ...


Now is the time to implement this for the Jira Cloud as well.
In the cloud, this functionality is presented in the form of several applications. The Jira Cloud administrator will be able to connect only the functionality that is needed in his situation, and not drag everything into production.

* [Migration from Server/Data Center](https://jibrok.com/docs/jbcf-cloud/migrationDocumentation/)
* [Feature Difference (Server/Data Center and Cloud)](https://jibrok.com/docs/jbcf-cloud/featureDifferenceDocumentation/)

Today we have published the first part of the functionality - [Calculated custom fields(JBCF)](https://marketplace.atlassian.com/apps/1221055/calculated-and-other-custom-fields-jbcf?hosting=cloud&tab=overview).
This application contains calculated values only. All fields are read-only. The values are calculated automatically.


### Custom field ###

[List of available fields](https://jibrok.com/docs/jbcf-cloud/featureDifferenceDocumentation/) 

Comments: 
* Number of comments
* Commented users

Last comment:
* Last comment
* User last commented
* Date of last comment
* Is author of last comment assignee
* Is author of last comment reporter

First comment:
* First comment
* First comment Author
* First comment Date
* Is author of first comment assignee
* Is author of first comment reporter

History: 
* Previous status
* Previous assignee
* Last change status Author
* User resolver
* User last updater
* Who was assignee

Links:
* Number of links
* Number of subtasks
* Number of inward links
* Number of outward links

Sort:
* Sort by parent ASK
* Sort by parent DESK
* Sort by epic ASK
* Sort by epic DESK

Leads:
* Component leads
* User project lead


The list of fields will be supplemented as the functionality is updated.


#### How to create the "Calculated custom field"? ####

After installing the application, the administration page is available to you. You can also get to it from the "Manage apps" menu:

<table>
<tr>
<td><a href="/uploads/jbcf-cloud/manage-your-apss-jbcf.png"><img src="/uploads/jbcf-cloud/manage-your-apss-jbcf.png" /></a></td>
<td><a href="/uploads/jbcf-cloud/manage-your-apss.png"><img src="/uploads/jbcf-cloud/manage-your-apss.png" /></a></td>
<td><a href="/uploads/jbcf-cloud/jbcf-cloud-configured.png"><img src="/uploads/jbcf-cloud/jbcf-cloud-configured.png" /></a></td>
<td><a href="/uploads/jbcf-cloud/jbcf-cloud-configured-2.png"><img src="/uploads/jbcf-cloud/jbcf-cloud-configured-2.png" /></a></td>
</tr>
</table>

<p><a href="/uploads/tis-cloud/create-field-2.png"><img src="/uploads/tis-cloud/create-field-2.png" style="width:100%;"/></a></p>


Unfortunately, we had to abandon the standard interface for creating fields in the Jira Cloud. And the Time in status fields are created and configured through the application interface.

For each field, you specify the context, statuses for which you want to count the time, work calendar and time display format.
Detailed instructions are available in [documentation](https://jibrok.com/docs/jbcf-cloud/jbcf-create-field/).

After creating the field, the process of calculating values for tasks from the specified context will start. This may take a while. You can see the sync status on the [plugin service page](https://jibrok.com/docs/jbcf-cloud/service-info/).



### Is something not working? Something is missing? ###

We track errors in real time and try to fix them promptly. If you have encountered an error, then most likely we already know about it and it will be fixed in the next few hours.
If the decision is delayed or the error is "logical", we would be very grateful for your message to the [support service](https://jibrok.atlassian.net/servicedesk/customer/portals).
You can also contact with any questions or ideas and we will try to help you.

We publish server work that may affect users on the [Status page](https://jbcf.statuspage.io/). The same information is duplicated on the application settings page.

### Discounts ###

* Are you migrating from a server or data center to the cloud?
* Do you have several of our apps?
* Are you interested in product development and reporting issues you find?

We will be happy to provide you with a discount. Please contact [support](https://jibrok.atlassian.net/servicedesk/customer/portals).


### Future plans ###

In the near future, we will release Formula for the cloud, which will work similarly to [server versions](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/694026241/Formula+field+-+script+field).

