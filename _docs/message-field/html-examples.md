---
title: Custom colors and HTML
key: message-field
excerpt: "Customize Message field appearance with HTML styling, custom colors, and advanced formatting for branded corporate messaging."
---

You can configure your own message style, if predefined styles are not enough.

To do this you can use detailed settings of the message colour and add HTML with structure and style description in the message body

## What is HTML?

If you are new to HTML (like us) then here is a great introductory guide recommended by our more experienced users. 
[Learn HTML Free in [2021] – Basic HTML Codes for Beginners](https://www.websiteplanet.com/blog/html-guide-beginners/)

Thank you for your recommendation! 😉

## How to set colours in the message? ## 

1. Choose **Message type** **'Custom'**. 
2. Additional fields **Background color**, **Text color**, **Icon**, **Icon color** should appear.
3. Choose predefined [colours Atlassian](https://www.atlassian.design/foundations/color).
4. If you can't find the right colour, press **Select a custom color** for manual colour selection.

<a href="/uploads/message-field/message-type-custom.png"><img src="/uploads/message-field/message-type-custom.png" width="100%"/></a>

<a href="/uploads/message-field/message-type-custom-as-flag.png"><img src="/uploads/message-field/message-type-custom-as-flag.png" width="50%"/></a>

Message colour can be set by code in [dynamic templates](/docs/message-field/dynamic-templates-examples/#how-to-change-message-colour).

## How do I change the color of the text and background in a message? ##
You can display any HTML as a message. To do this select the **Message type** **'Custom'** in the field settings.


```html
<text style="background: black; color: white"> The white message on the black backgroud</text>
```

Or hex colors

```html
<text style="background: #000000; color: #FFFFFF"> The white message on the black backgroud</text>
```

<a href="/uploads/message-field/html-example-1.png"><img src="/uploads/message-field/html-example-1.png" width="100%"/></a>


Colors: <a href="https://htmlcolorcodes.com/">htmlcolorcodes.com</a>

Attlassian Design System: <a href="https://www.atlassian.design/foundations/color">atlassian.design/foundations/color</a>

## How to add a scroll to a long message? ##



 <table>
    <tr>
        <td>
            <a href="/uploads/message-field/html-example-scroll.png"><img src="/uploads/message-field/html-example-scroll.png" width="100%"/></a>
        </td>
        <td>
            <a href="/uploads/message-field/html-example-scroll-2.png"><img src="/uploads/message-field/html-example-scroll-2.png" width="100%"/></a>
        </td>
    </tr>
</table>


```html
<div style="height: 200px; overflow-y: scroll;">
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
    Long Message<br/>
</div>
```





















