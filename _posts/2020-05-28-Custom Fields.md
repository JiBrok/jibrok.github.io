---
layout: post
title: Custom fields from plugins from JiBrok
---

## List of available custom fields for Jira ##

## Plugin "Time in status field/Timer/Stopwatch/SLA" ##
![message-field-banner](/images/time-in-status-field/time-in-status-plugin-image.png)

* [Marketplace](https://marketplace.atlassian.com/apps/1220908/time-in-status-field?hosting=server&tab=overview)
* [Documentation](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513441810/Plugin+Time+in+status+field+Timer+Stopwatch+SLA)

A set of fields for counting time on issue in various scenarios.

All fields of this plugin have various settings.

* Various time output formats
* Display in the form of panels (the location of the [panel is also configurable](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/513015970/Field+panels+config))
* Rights to view field data
* They know how to count time according to the working calendar
* Multiple export formats
* A variety of JQL functions for finding tasks.

### Time in status ###

Field for displaying the time spent by the task in the indicated statuses.
The field is dynamic and counts the time for all tasks (existing and new). Therefore, it is not a problem to upload data on old tasks(any) in accordance with the field settings. The function of searching and sorting the field allows you to configure work queues tied to the reaction time.

### Stopwatch field ###

The field shows the time between task events.
Between the change of status, the event of the start of work, commenting, changing the value of the field or any other actions with the request.

The field also works with calendars, has functions for searching and sorting, and display and export formats are configured.

It can be controlled manually or using API.

### Timer field ###

During startup, it is set for a certain time (5 minutes, 4 hours) and then shows the remaining time. Reacts to events (link). And depending on the settings, it starts the timer or stops. The initial time is determined by the jql condition.

It can be controlled manually or using API.

### Custom field "Transition counter" ### 

* Calculate the number of transitions between selected statuses.
* Value: Number
* Search: The field stores the value in the index.

### Custom field "Is status" ###

* Field returns yes or no - whether the issue is in the specified status. 
* Value: "true" or "false"
* Search: The field stores the value in the index.


## Plugin "Message field" ##
![message-field-banner](/images/message-field/message-field-banner.png)

* [Marketplace](https://marketplace.atlassian.com/apps/1219615/message-field?hosting=server&tab=overview)
* [Documentation](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/546668726/Plugin+Message+field)

Field for displaying messages.
All functionality of field is available including on the Jira Service Desk portal.

It has several settings for display format: 

* Show banner
* Show as a small flag on the side of the screen
* Show as popup

It can show a message only in the indicated statuses or screens (if you use 1 common screen).
Allows you to run custom Javascript code in the specified context (Create/Edit/View/Transtion/Service Desk create/Service Desk view request).

It has an API for working with ScriptRunner behaviours.
The javascript api allows you to change or hide the message depending on the data of other fields. For example, on the request creation screen, change the message depending on the selected priority. Or add any dynamic behavior to the page.

 

## Plugin "Calculated custom fields" ##
![calculated-custom-fields-banner](/images/calculated-custom-fields/calculated-custom-fields-banner.png)

* [Marketplace](https://marketplace.atlassian.com/apps/1221055/calculated-custom-fields?hosting=server&tab=overview)
* [Documentation](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/542834856/Plugin+Calculated+custom+fields)

### Shared component picker ###
* The list of projects is set in the field settings. In this field you can select components from the specified projects
* Value: Components
* Search: The field stores the value in the index.

### Status picker ### 
* The list of statuses(issue status) is set in the field settings. One of these statuses is selected as the field value. 
* Value: Status
* Search: The field stores the value in the index.

### Role picker ###
* The list of Project Roles is set in the field settings. One of these roles is selected as the field value.
* Project role
* Search: The field stores the value in the index.

### Group picker ###
* The list of groups is set in the field settings. One of these groups is selected as the field value. 
* Value: Group
* Search: The field stores the value in the index
* Can use in permission and notification schemes

### Versions ###
* This field allows you to calculate intersections, merges, and differences between two fields containing versions.
* Value: Versions
* Search: versions searcher

You can use any fields for the calculation. The main thing is that the field returns the version or a list of versions. Checkboxes help you filter out unnecessary field types.
You select two fields with versions. And Specify what relationship between them the field should calculate.
Calculate mode for versions: 
intersection 
Union
Subtract
Symmetric difference
 
Example of use: different between Affected versions and Fix versions

### Formula fields ###
This field runs a formula(script) on the server to calculate the value. Now the field supports JavaScript Syntax in the future there will be support for other programming languages and templates.
The calculated field. The value of this field is the result of the formula. The value can be further processed before display.
Formula fields differ in value type.
Currently available types are: number, string, date.
For each type of field, you can connect a search engine to work with the field through JQL.
For numerical formulas, an additional time search engine is available.

[Documentation](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/694026241/Formula+field+-+script+field)

### Time between dates ###
This field calculates the time between two dates. You can specify a system field or a custom field as the date. The main thing is that the field returns values of the java.util. Date type.

[Documentation](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/694255617/Time+between+dates)

### Issue Link counter ###
This field shows the number of links to queries. The field settings specify which links to count. Takes into account the link's orientation(inward, outward, any) and type. It can count the number of linked issues, as well as the number of linked issues in the specified statuses.

[Documentation](https://jibrok.atlassian.net/wiki/spaces/JBS/pages/725680146/Issue+link+counter)


### Mentions users from comments ###
* Show all users from comments. By mentions(this field) you can search(JQL)
* Value: Users
* Search: The field stores the value in the index.
* Can use in permission and notification schemes

### Age ###
* Description: Elapsed time from the moment the task was created to the current time. 
* Value: Number - time in seconds
* Search: The field stores the value in the index.

### Age by resolution ###
* Description: The elapsed time from the moment the task was created to the resolution.
* Value: Number - time in seconds
* Search: The field stores the value in the index.

### Count of attachment ###
* Type: Number
* Search: The field stores the value in the index.

### Attachment links ###
* Description: List of links to issue attachments
* Value: null - The field only displays the links. Sort attachment by file type.
* Search: The field does not store the value in the index. 

### Count of comment ###
* Value: Number
* Search: The field stores the value in the index.

### Last comment ###
* Description: Shows the last comment available to the current user.
* Value: null - The field only displays the last comment. 
* Search: The field does not store the value in the index. 

### Previous assignee ###
* Description: Previous assignee by issue history.
* Value: User
* Search: The field stores the value in the index.
* Can use in permission and notification schemes

### Resolver ###
* Description: The user who last posted the resolution in issue.
* Value: User
* Search: The field stores the value in the index.
* Can use in permission and notification schemes

### Not resolves sub-tasks ###
* Description: Get list of subtasks without resolution.
* Value: String - list of subtask keys
* Search: The field stores the value in the index.

### Resolves sub-tasks ###
* Description: Get list of subtasks with resolution.
* Value: String - list of subtask keys
* Search: The field stores the value in the index.

### Parent status ###
* Value: String - Parent task status name 
* Search: The field stores the value in the index.

### Sort by parent ASK ###
* Description: Field for sorting tasks by parent task. In the search results, when sorting by this field, all subtask will follow their parental task.
* Value: The field returns the key of the parent task. On issue screens, adding a field is optional.
* Search: The field stores the value in the index.

### Sort by parent DESC ###
* Description: Field for sorting tasks by parent task. In the search results, when sorting by this field, all subtask will follow their parental task.
* Value: The field returns the key of the parent task. On issue screens, adding a field is optional.
* Search: The field stores the value in the index.

### Sort by epic ###
* Description: Field for sorting tasks according to the epic specified in the task. When sorting by this field, the tasks in the search results will be after the epic specified in the task.
* Value: String: The field returns the key of the task. On issue screens, adding a field is optional.
* Search: The field stores the value in the index.

### Sort by epic rank ###
* Description: The field for sorting tasks by the rank specified in the epic task. When sorting by this field, the tasks in the search results will be after the epic specified in the task. All epics will be sorted by their rank. All tasks from the epic will be under the epic. All tasks under the epic will be sorted by their rank.
* Value: String: The field returns the key of the task. On issue screens, adding a field is optional.
* Search: The field stores the value in the index.

### Date of the first comment ###
* Description: The date of the first comment that is available to the current user.
* Value: Date and time
* Search: The field stores the value in the index.

### Date of the last comment ###
* Description: The date of the last comment that is available to the current user.
* Value: Date and time
* Search: The field stores the value in the index.

### Author of last comment ###
* Description: The author of the last comment that is available to the current user.
* Value: User
* Search: The field stores the value in the index.
* Can use in permission and notification schemes

### Component leads ###
* Description: List of leads specified in the issue components.
* Value: Users
* Search: The field stores the value in the index.
Can use in permission and notification schemes

### Project lead ###
* Description: Project lead for current issue
* Value: User
* Search: The field stores the value in the index.
Can use in permission and notification schemes

### Issue assignee, reporter and all comments ###
* Description: Show assignee, reporter and all comments that is available to the current user 
* Value: Html
* Search: no search

### Issue assignee, reporter and last comment ###
* Description: Show assignee, reporter and last comment that is available to the current user 
* Value: Html
* Search: no search

### Inward issues ###
* Description: Show list inward issues 
* Value: Issues
* Search: no search

### Outward issues ###
* Description: Show list outward issues 
* Value: Issues
* Search: no search

### Inward issues group by link type ###
* Description: Show list inward issues group by link type. Include epic links. 
* Value: Html
* Search: no search

### Outward issues group by link type ###
* Description: Show list outward issues group by link type. Include epic links. 
* Value: Html
* Search: no search

### Inward issues(include subtasks) group by link type ###
* Description: Show list inward issues group by link type. Include sub-task/parent and epic links. 
* Value: Html
* Search: no search

### Outward issues(include subtasks) group by link type ###
* Description: Show list outward issues group by link type. Include sub-task/parent and epic links. 
* Value: Html
* Search: no search

### All linked issues(include subtasks) group by link type ###
* Description: Show all linked issues group by link type. Include sub-task/parent and epic links. 
* Value: Html
* Search: no search


### 📜 More information ###

[View all plugin on Atlassian Marketplace](https://marketplace.atlassian.com/manage/vendors/1216083/addons)

[Documentation and Knowledge Base](https://jibrok.atlassian.net/wiki/spaces/JBS/overview)

[Support](https://jibrok.atlassian.net/servicedesk/customer/portals)
