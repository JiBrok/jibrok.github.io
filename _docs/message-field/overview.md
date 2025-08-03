---
title: Overview
key: message-field
excerpt: "Display contextual messages and banners on Jira issue screens with Message field. Features dynamic templates, custom styling, JQL targeting, and real-time field references."
---
<a href="https://marketplace.atlassian.com/apps/1219615/message-field?hosting=datacenter&tab=overview"><img src="/uploads/message-field/marketplace.webp" style="width:100%;;" loading="lazy"></a>

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
            document.getElementById("youtube").innerHTML = '<div id="video-added"><p style="text-align: center;"><iframe width="600" height="315" src="https://www.youtube.com/embed/PogUyk9eD7U?cc_load_policy=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe></p></div>'
        }
    }
    setInterval(function(){
        if(readCookie('cookie-notice-dismissed') == "true"){
            if(document.getElementById("video-added") == null){
                document.getElementById("youtube").innerHTML = '<div id="video-added"><p style="text-align: center;"><iframe width="600" height="315" src="https://www.youtube.com/embed/PogUyk9eD7U?cc_load_policy=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe></p></div>'
            }
        }
    }, 1000);
</script>

[comment]: <> (<p style="text-align: center;"><iframe width="600" height="315" src="https://www.youtube.com/embed/PogUyk9eD7U?cc_load_policy=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></p>)


📌 Message Field places contextual banners and notices on any Jira or JSM issue screen—no coding required.

🎯 Deliver onboarding hints, SLA warnings, release notes, or branded announcements with just a few clicks.

🎨 Easily customize style, location, and color, then precisely target messages by project, request type, JQL, status, group, linked issues and more.

🔄 Keep content up to date by referencing fields, users, and system values in real time, automatically reflecting any changes.

🛠️ Use Jira's native look or your own HTML/CSS for complete design freedom, and tap into dynamic templates or JavaScript for advanced customizations.

🔗 Integrations with external apps open endless possibilities, from highlighting priorities to preventing missing attachments.

🚀 Empower your team to reduce ticket ping‑pong, guide reporters effectively, and speed up resolutions—exactly where it matters.

🌟 Experience streamlined communication and a personalized portal that keeps everyone in sync.


<a href="/uploads/message-field/field-demo-create.webp"><img src="/uploads/message-field/field-demo-create.webp" style="width:100%;" loading="lazy"></a> 

## Key features

* Works on Jira Service Management portals (including those built with Refined).
* Add dynamic behaviour through [Dynamic Templates](/docs/message-field/dynamic-templates/), client‑side JavaScript or ScriptRunner Behaviours.
* Pull data from the current issue or Jira API directly into the message on any screen.
* Choose banner mode or compact flag mode, both printable.
* A large number of settings, styles and display conditions.
* Delegate message settings to project roles so that they can manage banners themselves.



<img src="/uploads/message-field/message_field_video_dynamical.gif" style="width:100%;" loading="lazy">

---

## 📖 Complete Documentation

### 🚀 Getting Started
- **[Installation Guide](/docs/message-field/install/)** - Install and configure Message Field
- **[Create Your First Field](/docs/message-field/create-field/)** - Step-by-step field creation
- **[Open Configuration](/docs/message-field/open-configure/)** - Access Message Field settings

### ⚙️ Field Configuration
- **[Base Settings](/docs/message-field/base-settings/)** - Configure basic message settings
- **[Advanced Settings](/docs/message-field/advanced-settings/)** - Unlock powerful targeting options
- **[Settings for All Fields](/docs/message-field/settings-for-all-fields/)** - Global configuration options
- **[Delegation](/docs/message-field/delegation/)** - User permissions and access control

### 🎨 Templates & Customization  
- **[Dynamic Templates](/docs/message-field/dynamic-templates/)** - Create dynamic, data-driven messages
- **[Dynamic Templates Examples](/docs/message-field/dynamic-templates-examples/)** - Real-world template samples
- **[HTML Examples](/docs/message-field/html-examples/)** - Custom styling with HTML/CSS
- **[JavaScript Examples](/docs/message-field/java-script-examples/)** - Advanced scripting capabilities

### 🔧 Integration & Automation
- **[ScriptRunner Behaviours](/docs/message-field/script-runner-behaviours/)** - ScriptRunner integration
- **[ScriptRunner Examples](/docs/message-field/script-runner-examples/)** - Sample automation scripts
- **[REST API](/docs/message-field/rest/)** - Programmatic access and automation
- **[Refined for Jira](/docs/message-field/refined-for-jira/)** - Integration with Refined themes

### 📊 Analytics & Monitoring
- **[Statistics](/docs/message-field/statistics/)** - Track message performance and usage

### 💡 Additional Resources
- **[Video Tutorial](https://www.youtube.com/watch?v=PogUyk9eD7U)** - Watch the overview demo
- **[Support Portal](https://jibrok.atlassian.net/servicedesk/customer/portals)** - Get help and submit feature requests