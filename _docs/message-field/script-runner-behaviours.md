---
title: Script Runner Behaviours - Settings
key: message-field
---

You can change the message using the [ScriptRunner for Jira](https://marketplace.atlassian.com/apps/6820/scriptrunner-for-jira?hosting=server&tab=overview) application and its [Behaviours](https://scriptrunner.adaptavist.com/6.9.0/jira/behaviours-overview.html) function.

You may need to change the default settings - depending on the complexity of the script in ScriptRunner Behaviours.

* Choose: **Administration** (<img src="/uploads/atlassian/cog_icon.png " style="width:20px"/> in the top panel on the right) > Manage apps.

* In the left menu, find the section **Message field** and click **Message field settings for ScriptRunner Behaviours**

<a href="/uploads/message-field/settings-for-scriptrunner.jpg"><img src="/uploads/message-field/settings-for-scriptrunner.jpg" style="width:600px"/></a> 


* **Timeout** - Indicated in milliseconds. The code in the ScriptRunner that changes the message can take quite a long time, a few seconds. For example, when he needs to get information from another system and display it in a message. In this case, you should increase the waiting time for the ScriptRunner result. If ScriptRunner returns a result **within the specified time**, the message will be displayed according to its result. Otherwise, the ScriptRunner result will be ignored.
* **Show default message?**
    * **No** - The message which is previously set in the field settings will be displayed only after the timeout expires(in this case the ScriptRunner results are ignored). While waiting for a response, the message will be hidden.
    * **Yes** - The message which is previously set in the field settings will be displayed until the ScriptRunner result is received. As soon as the result is received, the message will change according to the new data.
        * For example, you can set the message "Loading..." in the field settings. It will be displayed during "behavior" is running and until the new message will be set from the script.
          
          <a href="/uploads/message-field/message-field-loadig.png"><img src="/uploads/message-field/message-field-loadig.png" style="width:300px"/></a>
    
* **When the JavaScript from Message field settings should be run?**
    * **After displaying the default message** - The javascript will be executed after displaying the message from the field settings, i.e. immediately after opening the screen or after a timeout.
    * **After executing the "behavior" or timeout script** - Javascript will be executed after the ScriptRunner result will be received or after a timeout.



Click **Save** after editing the settings. 


