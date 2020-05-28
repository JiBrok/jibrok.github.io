---
layout: post
title: Custom fields from plugins from JiBrok
---

# List of available custom fields for Jira #

* Time in status
* Stopwatch
* Timer
* Transition counter
* Is status
* Message
* Mentions users from comments
* Age
* Age by resolution
* Count of attachment
* Attachment links
* Count of comment
* Last comment
* Previous assignee
* Resolver
* Not resolves sub-tasks
* Resolves sub-tasks
* Parent status
* Sort by parent ASK
* Sort by parent DESC
* Sort by epic
* Sort by epic rank
* Date of the first comment
* Date of the last comment
* Author of last comment
* Component leads
* Project lead
* Issue assignee, reporter and all comments
* Issue assignee, reporter and last comment
* Inward issues
* Outward issues
* Inward issues group by link type
* Outward issues group by link type
* Inward issues(include subtasks) group by link type
* Outward issues(include subtasks) group by link type
* All linked issues(include subtasks) group by link type


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
