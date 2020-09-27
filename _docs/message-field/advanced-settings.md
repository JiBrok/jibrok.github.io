---
title: Advanced settings

---
In the field **Show Settings** select the **Advanced** option.

**Advance** settings include: 

<a href="/uploads/message-field/advance settings.jpg"><img src="/uploads/message-field/advance settings.jpg" style="width:300px"/></a>

## Message content

General view of the message and text

* **Title** - Not a required field. Plain text or HTML(only for **Message type** **'Custom'** and **Show as flag** **'No'**).
* **Velocity render**
    * **Off** - Allows to use only plain text or HTML in the message body.
    * **On** - Allows also to use various parameters($issue, $context, etc.) and velocity template in the message body.
    [See Dynamic templates](/docs/message-field/dynamic-templates/)

* **Body** - Plain text, HTML or velocity template.

* **Message Type** - One of the predefined types responsible for the color and style of the message.
    * **Info**, **Warning**, **Error**, **Success**, **Change** <br>
    <a href="/uploads/message-field/message types.png"><img src="/uploads/message-field/message types.png" style="width:600px"/></a>
    * **Custom** -  In the case when this color palette is not enough or the messages do not look good in corporate style, you can configure **Body** & **Title** style(separately) using HTML.
    
* **Show as flag**
    * **No** - shows the message as a banner among the fields.
        * The position of the message is determined by the position of the field on the screen. 
    * **Yes** - shows message in a small pop-up on the right side of the screen.
    
    <a href="/uploads/message-field/show as flag.png"><img src="/uploads/message-field/show as flag.png" style="width:600px"/></a>

* **Size of displayed message**
    * **Standard**
        * Custom field name is hidden on the Create/Edit/Transition issue screens.
        * Custom field name is displayed on the View issue screen.
        * For the option **Show as flag** **'Yes'** size of the flag is default(small pop-up).
    * **Big**
        * The custom field name is hidden on all issue screens.
        * For the option **Show as flag** **'Yes'** the pop-up window is bigger and more noticeable. 
        The message(big pop-up) appears on top of all page content. The pop-up window should be closed for further work on the page. You can close it by clicking the **Close** button or gray background around the popup.
       
        <a href="/uploads/message-field/big-popup.png"><img src="/uploads/message-field/big-popup.png" style="width:300px"/></a>    


## Conditions for displaying message

<a href="/uploads/message-field/conditions for display a message.png"><img src="/uploads/message-field/conditions for display a message.png" style="width:600px"/></a>

* **Screens** 
    * For example if you use one screen for all issue actions(creating, viewing, editing a issue) with this setting you can specify on which screen you want to display the message. Although technically the field will be added to all issue screens, the display of the message (and the field) can be specified in this setting.
    * If the value is empty, the message is displayed on all screens where the field is added. 
    
* **Statuses** 
    * The message will be displayed only for issues in one of the specified statuses. 
    * If the value is empty the message will be displayed for issues in any statuses.
    * This condition will be ignored on the issue create screen.

* **Links**
    * The message will be displayed if there are specified links to other issues.
        * This condition will be ignored on the issue create screen.
        * You can choose which issue links to check: **Any**, **Inward**, **Outward**.         
    * **Types of links** 
        * You can choose types of issue links to check.
    * **Statuses of linked issues** 
        * You can choose what statuses the linked(by the specified types of links) issue should have.
    * If the issue has at least 1 issue link  with the specified parameters then the message will be displayed.    

The message will be displayed only if all **three(Screens, Statuses, Links)** conditions are met (and if other conditions are met).
    
## Permissions
   
In this section you can configure users for whom a message will be displayed (and if other conditions are met).

<a href="/uploads/message-field/show message for next users.png"><img src="/uploads/message-field/show message for next users.png" style="width:600px"/></a>

* **Show for** 
    * **All users (logged in users and anonymous)**
    * **Only logged in users** - you can filter users by groups or roles with the conditions below
    * **Only anonymous users**
    * **Selected users and anonymous** - you can filter users by groups or roles with the conditions below

* **Show for users in groups** - List of user groups to show the message. If the user is in one of these groups, then the message will be displayed. If the value is empty, then the condition is ignored.
* **Show for users in roles** - List of project roles to show the message. If the user has at least one of the specified roles in the issue project, then a message will be displayed. If the value is empty, then the condition is ignored.

1. Condition **Show for** must always be met.
1. If condition **Show for users in groups** is not empty then the user should be in one of these groups.
1. If condition **Show for users in roles** is not empty then the user should be in one of these roles.
1. If both of the conditions(**Show for users in groups** and **Show for users in roles**) are not empty then the user should satisfy at list one of the condition.

## JavaScript

In this section, you can add arbitrary code that will be executed along with displaying the message. With its help, you can dynamically change the message text depending on the selected values in other fields and much more.

Basicaly most of the problems which have usually been solved by using JavaScript now(version 4.0.0) can be solved by [dynamic templates](/docs/message-field/dynamic-templates/).

<a href="/uploads/message-field/javascript.png"><img src="/uploads/message-field/javascript.png" style="width:600px"/></a>

* **JavaScript code** - The code has a predefined variable **JIBROK_MESSAGE_FIELD_CONTEXT** that contains information about the screen(context) on which the code is executed (and the message is displayed).
* **JavaScript contexts** - This option specifies the contexts on which Javascript will executed. If the value is empty, then the code will always execute when displaying a message.
    * **"CREATE"** - Issue create screen
    * **"EDIT"** - Issue edit screen
    * **"TRANSITION"** - Issue transition screens
    * **"VIEW_ISSUE"** - Issue view screen
    * **"CREATE_SD"** - Service desk create screen
    * **"VIEW_SD"** - Service desk view screen


## Parameters for demonstration

You can click **Show Demo** to test the display of a message.

<a href="/uploads/message-field/advanced-demo.png"><img src="/uploads/message-field/advanced-demo.png" style="width:600px"/></a>

You can see how your message will look like for the specified issue and execution context.

**Conditions for displaying message** and **Permissions** are not checked during this demonstration.

Next options are available when **Velocity render** is **'On'**.

* **Issue key** - The message will be generated for this issue.
* **Form data (JSON)** - Information from issue screen. [See Dynamic templates](/docs/message-field/dynamic-templates/) for more information.
* **Context** - The message will be generated for this issue context. 
    * **"CREATE"** - Issue create screen
    * **"EDIT"** - Issue edit screen
    * **"TRANSITION"** - Issue transition screens
    * **"VIEW_ISSUE"** - Issue view screen
    * **"CREATE_SD"** - Service desk create screen
    * **"VIEW_SD"** - Service desk view screen
    



Click **Save** after configuring the message. 


