---
title: Message Field Basic Configuration Settings
key: message-field
excerpt: "Configure Message field basic settings including title, body, message types, colors, and banner vs flag display options with demo preview."
category: field-configuration
tags: [doc, server, datacenter, messaging, banners, configuration, styling, message-types, flags]
---

While setting up a field, you can choose which settings to show: basic or advanced.

In the field **Show Settings** select the **Base** option.

**Basic** settings include: 

<a href="/uploads/message-field/base-settings.webp" target="_blank">
<img src="/uploads/message-field/base-settings.webp" alt="Message field configuration panel with Title, Body, Message type dropdown, and Show as flag option" style="width:100%" loading="lazy"></a>

* **Title** - Not a required field. Supports plain text or HTML (only for **Message type** **'Custom'** and **Show as flag** **'No'**).
* **Body** - Supports plain text or HTML.
* **Message Type** - One of the predefined types responsible for the color and style of the message.
    * **Info**, **Warning**, **Error**, **Success**, **Change** <br>
    <a href="/uploads/message-field/message-types.webp" target="_blank">
<img src="/uploads/message-field/message-types.webp" alt="Examples of message types: Info, Warning, Error, Success, and Change banners with different colors" style="width:100%" loading="lazy"></a>
    * **Custom** - In the case when this color palette is not enough or the messages do not look good in corporate style, you can configure **Body** & **Title** style (separately) using HTML.
    
* **Show as flag**
    * **No** - Shows the message as a banner among the fields.
        * The position of the message is determined by the position of the field on the screen. 
    * **Yes** - Shows the message in a small pop-up on the right side of the screen.

    <a href="/uploads/message-field/show-as-flag.webp" target="_blank">
<img src="/uploads/message-field/show-as-flag.webp" alt="Service desk form with info flag popup message appearing on right side with user data table" style="width:100%" loading="lazy"></a>

* You can click **Show Demo** to test the display of a message.

<a href="/uploads/message-field/base-show-demo.webp" target="_blank">
<img src="/uploads/message-field/base-show-demo.webp" alt="Show as flag dropdown set to No with demo preview showing blue info banner below" style="width:100%" loading="lazy"></a>


* Click **Save** after setting the message. 


