---
title: Overview
key: message-field
---
<a href="https://marketplace.atlassian.com/apps/1219615/message-field?hosting=datacenter&tab=overview"><img src="/uploads/message-field/marketplace.png" style="width:100%;;"/></a>

View app on [Atlassian Marketplace](https://marketplace.atlassian.com/apps/1219615/message-field?hosting=datacenter&tab=overview)
## Welcome to Message field! 


An application for displaying messages on issue screens.

<div id="youtube">
</div>
<script>

    function includeYoutube() {
        var js = document.createElement("script");
    
      js.setAttribute("data-jsd-embedded", "")
      js.setAttribute("data-key", "ba16f814-3b1d-4a84-8ea5-77ef8bf8a1ed")
      js.setAttribute("data-base-url", "https://jsd-widget.atlassian.com")
      js.src = "https://jsd-widget.atlassian.com/assets/embed.js";

      document.head.appendChild(js);
    }
    
    if(readCookie('cookie-notice-dismissed') == "true"){
        if(document.getElementById("video-added") == null){
            document.getElementById("youtube").innerHTML = '<div id="video-added"><p style="text-align: center;"><iframe width="600" height="315" src="https://www.youtube-nocookie.com/embed/PogUyk9eD7U?cc_load_policy=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe></p></div>'
        }
    }
    setInterval(function(){
        if(readCookie('cookie-notice-dismissed') == "true"){
            if(document.getElementById("video-added") == null){
                document.getElementById("youtube").innerHTML = '<div id="video-added"><p style="text-align: center;"><iframe width="600" height="315" src="https://www.youtube-nocookie.com/embed/PogUyk9eD7U?cc_load_policy=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe></p></div>'
            }
        }
    }, 1000);
</script>

[comment]: <> (<p style="text-align: center;"><iframe width="600" height="315" src="https://www.youtube-nocookie.com/embed/PogUyk9eD7U?cc_load_policy=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>)

You can use it to customize the message for any situation and in any style.
* Large number of built-in settings and display conditions.
* Unlimited customization options via templates and scripts.
* Support that will help you to implement the most unusual scenarios.

<a href="/uploads/message-field/field-demo-create.png"><img src="/uploads/message-field/field-demo-create.png" style="width:100%;"/></a> 

## Features

* Available for Jira Service Desk(Customer Portal) & portals created by <a href="https://marketplace.atlassian.com/apps/1216711/refined-for-jira-sites-themes?hosting=datacenter&tab=overview">Refined for Jira</a>.
* You can use any data from the issue or Jira in the message.
* The ability to display messages in Jira style or in custom style using HTML.
* Built-in conditions for displaying messages: issue screens, user groups, statuses, linked issues etc.
* Add dynamic behavior to your messages using [Dynamic Templates](/docs/message-field/dynamic-templates/), JavaScript and <a href="https://marketplace.atlassian.com/apps/6820/scriptrunner-for-jira?hosting=datacenter&tab=overview">ScriptRunner</a>.


<img src="/uploads/message-field/message_field_video_dynamical.gif" style="width:100%;"/> 

