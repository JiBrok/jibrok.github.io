---
title: 🔥Dynamic templates

---

The dynamic templates allow to render the message using data from the issue and issue screens(creation,editing, etc) that can be changed in real time.
In templates you can use conditions, use Jira Java API or do some calculations before displaying the message.
You can change the display parameters of the message - title, body, type, location.
This functionality works in Jira Core/Software/Service Desk.


In previous versions of the application you could change message dynamically only using JavaScript. Many cases now can be done by using the dynamic templates([velocity](https://velocity.apache.org/engine/1.7/user-guide.html) templates (HTML + Java API) + real time render).

<a href="/uploads/message-field/dynamic-template-demo1.gif"><img src="/uploads/message-field/dynamic-template-demo1.gif" alt="dynamic template demo.gif" width="600"/></a>

[How to do this?](/docs/message-field/dynamic-templates-examples/#show-message-for-description-and-assignee-depending-on-the-priority)


To enable templates you need to set **Velocity render** **'On'** in the field config.
<a href="/uploads/message-field/dynamic-templates.png"><img src="/uploads/message-field/dynamic-templates.png" alt="dynamic templates settings" width="600"/></a> 


Special variables will be available in the template for work with data. Links lead to <a href="/jira/plugins/message-field/java/doc/"> Java doc </a> with descriptions of available methods.

* [$issue](https://docs.atlassian.com/software/jira/docs/api/8.12.1/com/atlassian/jira/issue/Issue.html)
    * This variable contains the issue data stored in the database.
    * This variable is not defined on the creation screen($context == "CREATE").
* $form
    * JSON serialization of the form. 
    * Variable that contains information entered by the user on the screen (Create, Edit issue ...) without additional processing. 
    * The data in the variable is updated in real time. 
    * Variable value is entered data(without any validation). 
    * You can get values by the name of the property.
* [$formIssue](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FormIssue.html) - 🔥Recommended for use.
    * The variable combines data from $issue and $form.
    * Data from the screen($form) are in priority.
    * The data from the screen($form) undergoes additional validation and processing. Invalid values ​​return null.
    * The data in the variable is updated in real time. 
* [$fieldDisplayConfig](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FieldDisplayConfigDto.html)
    * The variable contains information about the display of the message (message type, location, etc.).
    * The message will be recreated when this information changes. JavaScript won't run again.
* $context - Can have one of the following values:
    * "CREATE" - Issue create screen
    * "EDIT" - Issue edit screen
    * "TRANSITION" - Issue transition screens. Additional variables are accessed in this context:
        * $transitionId - number
        * $transitionName - string
    * "VIEW_ISSUE" - Issue view screen
    * "CREATE_SD" - Service desk create screen
    * "VIEW_SD" - Service desk view screen
* [$currentUser](https://docs.atlassian.com/software/jira/docs/api/8.12.1/com/atlassian/jira/user/ApplicationUser.html)
    * The user who is viewing the message.
* [$cfValues](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/CFValues.html)
    * Utility object for getting custom field value from $issue and $formIssue.
* [$links](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/Links.html)
    * Utility object for getting issue links or linked issues.
* [$jqlService](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/JqlService.html)
    * Utility object for getting JQL results.
* [$issueFieldRender](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/IssueFieldRender.html)
    * Utility object for rendering issue fields values as HTML.
* [$JSON](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/JSON.html)
    * Utility object for parse string to JSONObject.
* [$ComponentAccessor](https://docs.atlassian.com/software/jira/docs/api/8.12.1/com/atlassian/jira/component/ComponentAccessor.html)
    * Provides static methods for accessing JIRA's managed components.



## Parameters for demonstration

You can click **Show Demo** to test the display of a message.

<a href="/uploads/message-field/dynamic-templates-demo.png"><img src="/uploads/message-field/dynamic-templates-demo.png" alt="dynamic templates demo" width="600"/></a>

You can see how your message will look like for the specified issue and execution context.

**Conditions for displaying message** and **Permissions** are not checked during this demonstration.


* **Issue key** - The message will be generated for this issue.
* **Form data (JSON)** - Text information from issue screen presented in JSON format. 
    * To collect test data:
      * Open the issue screen(create, edit ...).
      * Open your [browser console](https://developers.google.com/web/tools/chrome-devtools/open).
      * Execute the following code([Running JavaScript](https://developers.google.com/web/tools/chrome-devtools/console#javascript)): `JSON.stringify(MESSAGE_FIELD_OBJECT.getDataFromDefaultForm (), undefined, 4)`
      * Paste its result in the box above. Except for the first and last quotes.
      
      <a href="/uploads/message-field/dynamic-templates-demo-collect-data.png"><img src="/uploads/message-field/dynamic-templates-demo-collect-data.png" alt="dynamic templates demo collect data.png" width="600"/></a>

* **Context** - The message will be generated for this issue context. 
    * **"CREATE"** - Issue create screen
    * **"EDIT"** - Issue edit screen
    * **"TRANSITION"** - Issue transition screens
    * **"VIEW_ISSUE"** - Issue view screen
    * **"CREATE_SD"** - Service desk create screen
    * **"VIEW_SD"** - Service desk view screen
    
    

You can see [usage examples](/docs/message-field/dynamic-templates-examples/).






