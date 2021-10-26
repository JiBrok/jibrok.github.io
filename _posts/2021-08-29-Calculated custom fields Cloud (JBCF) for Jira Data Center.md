[comment]: <> (---)

[comment]: <> (title: Calculated custom fields for Cloud &#40;JBCF&#41; for Jira Data Center )

[comment]: <> (---)



[comment]: <> (We have published our cloud application Calculated custom fields&#40;JBCF&#41;! 🥳)

[comment]: <> (Server functionality of the [Calculated and other custom fields&#40;JBCF&#41;]&#40;https://marketplace.atlassian.com/apps/1221055/calculated-and-other-custom-fields-jbcf?hosting=server&tab=overview&#41; application turned out to be very large.)

[comment]: <> (* ToDo list)

[comment]: <> (* Shared components)

[comment]: <> (* Role, Group, Status pickers)

[comment]: <> (* Versions - This field allows you to calculate intersections, merges, and differences between two fields containing versions.)

[comment]: <> (* Time between dates - Calculates the time between two dates from fields - system fields or custom. jql to search for “time between dates” in time &#40;“>”, “2h”&#41;)

[comment]: <> (* Formula &#40;number, string, date&#41; - Field for calculating the value using the specified formula&#40;script&#41;. You can use any system and user fields for calculation. You can customize the display. You can connect jql functions to search by time.)

[comment]: <> (* Calculated field...)

[comment]: <> (* ...)


[comment]: <> (Now is the time to implement this for the Jira Cloud as well.)

[comment]: <> (In the cloud, this functionality is presented in the form of several applications. The Jira Cloud administrator will be able to connect only the functionality that is needed in his situation, and not drag everything into production.)

[comment]: <> (* [Migration from Server/Data Center]&#40;https://jibrok.com/docs/jbcf-cloud/migrationDocumentation/&#41;)

[comment]: <> (* [Feature Difference &#40;Server/Data Center and Cloud&#41;]&#40;https://jibrok.com/docs/jbcf-cloud/featureDifferenceDocumentation/&#41;)

[comment]: <> (Today we have published the first part of the functionality - [Calculated custom fields&#40;JBCF&#41;]&#40;https://marketplace.atlassian.com/apps/1221055/calculated-and-other-custom-fields-jbcf?hosting=cloud&tab=overview&#41;.)

[comment]: <> (This application contains calculated values only. All fields are read-only. The values are calculated automatically.)


[comment]: <> (### Custom field ###)

[comment]: <> ([List of available fields]&#40;https://jibrok.com/docs/jbcf-cloud/featureDifferenceDocumentation/&#41; )

[comment]: <> (Comments: )

[comment]: <> (* Number of comments)

[comment]: <> (* Commented users)

[comment]: <> (Last comment:)

[comment]: <> (* Last comment)

[comment]: <> (* User last commented)

[comment]: <> (* Date of last comment)

[comment]: <> (* Is author of last comment assignee)

[comment]: <> (* Is author of last comment reporter)

[comment]: <> (First comment:)

[comment]: <> (* First comment)

[comment]: <> (* First comment Author)

[comment]: <> (* First comment Date)

[comment]: <> (* Is author of first comment assignee)

[comment]: <> (* Is author of first comment reporter)

[comment]: <> (History: )

[comment]: <> (* Previous status)

[comment]: <> (* Previous assignee)

[comment]: <> (* Last change status Author)

[comment]: <> (* User resolver)

[comment]: <> (* User last updater)

[comment]: <> (* Who was assignee)

[comment]: <> (Links:)

[comment]: <> (* Number of links)

[comment]: <> (* Number of subtasks)

[comment]: <> (* Number of inward links)

[comment]: <> (* Number of outward links)

[comment]: <> (Sort:)

[comment]: <> (* Sort by parent ASK)

[comment]: <> (* Sort by parent DESK)

[comment]: <> (* Sort by epic ASK)

[comment]: <> (* Sort by epic DESK)

[comment]: <> (Leads:)

[comment]: <> (* Component leads)

[comment]: <> (* User project lead)


[comment]: <> (The list of fields will be supplemented as the functionality is updated.)


[comment]: <> (#### How to create the "Calculated custom field"? ####)

[comment]: <> (After installing the application, the administration page is available to you. You can also get to it from the "Manage apps" menu:)

[comment]: <> (<table>)

[comment]: <> (<tr>)

[comment]: <> (<td><a href="/uploads/jbcf-cloud/manage-your-apss-jbcf.png"><img src="/uploads/jbcf-cloud/manage-your-apss-jbcf.png" /></a></td>)

[comment]: <> (<td><a href="/uploads/jbcf-cloud/manage-your-apss.png"><img src="/uploads/jbcf-cloud/manage-your-apss.png" /></a></td>)

[comment]: <> (<td><a href="/uploads/jbcf-cloud/jbcf-cloud-configured.png"><img src="/uploads/jbcf-cloud/jbcf-cloud-configured.png" /></a></td>)

[comment]: <> (<td><a href="/uploads/jbcf-cloud/jbcf-cloud-configured-2.png"><img src="/uploads/jbcf-cloud/jbcf-cloud-configured-2.png" /></a></td>)

[comment]: <> (</tr>)

[comment]: <> (</table>)

[comment]: <> (<p><a href="/uploads/tis-cloud/create-field-2.png"><img src="/uploads/tis-cloud/create-field-2.png" style="width:100%;"/></a></p>)


[comment]: <> (Unfortunately, we had to abandon the standard interface for creating fields in the Jira Cloud. And the Time in status fields are created and configured through the application interface.)

[comment]: <> (For each field, you specify the context, statuses for which you want to count the time, work calendar and time display format.)

[comment]: <> (Detailed instructions are available in [documentation]&#40;https://jibrok.com/docs/jbcf-cloud/jbcf-create-field/&#41;.)

[comment]: <> (After creating the field, the process of calculating values for tasks from the specified context will start. This may take a while. You can see the sync status on the [plugin service page]&#40;https://jibrok.com/docs/jbcf-cloud/service-info/&#41;.)



[comment]: <> (### Is something not working? Something is missing? ###)

[comment]: <> (We track errors in real time and try to fix them promptly. If you have encountered an error, then most likely we already know about it and it will be fixed in the next few hours.)

[comment]: <> (If the decision is delayed or the error is "logical", we would be very grateful for your message to the [support service]&#40;https://jibrok.atlassian.net/servicedesk/customer/portals&#41;.)

[comment]: <> (You can also contact with any questions or ideas and we will try to help you.)

[comment]: <> (We publish server work that may affect users on the [Status page]&#40;https://jbcf.statuspage.io/&#41;. The same information is duplicated on the application settings page.)

[comment]: <> (### Discounts ###)

[comment]: <> (* Are you migrating from a server or data center to the cloud?)

[comment]: <> (* Do you have several of our apps?)

[comment]: <> ([comment]: <> &#40;* Are you interested in product development and reporting issues you find?&#41;)

[comment]: <> (We will be happy to provide you with a discount. Please contact [support]&#40;https://jibrok.atlassian.net/servicedesk/customer/portals&#41;.)


[comment]: <> (### Future plans ###)

[comment]: <> (In the near future, we will release Formula for the cloud, which will work similarly to [server versions]&#40;https://jibrok.atlassian.net/wiki/spaces/JBS/pages/694026241/Formula+field+-+script+field&#41;.)

