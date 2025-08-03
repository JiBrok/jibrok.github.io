---
title: Templates for field values
key: time-in-status
excerpt: "Customize field value display with templates including time formats, conditional logic, and dynamic content rendering options."
---


You can configure how to display the values of the Time in status, Timer, and Stopwatch fields. This is done through the configuration of the fields.

The template uses [velocity](https://velocity.apache.org/engine/1.7/user-guide.html) and a number of predefined variables to render the value. Thanks to this, you can use html to set absolutely any kind of your fields, and not just the one provided by the vendor.

In the menu with all templates, you can see what templates are available and where they are used.

<p style="text-align: center;"><a href="/uploads/time-in-status/templates/1.png"><img src="/uploads/time-in-status/templates/1.png" style="width:600px" loading="lazy"></a></p>

In the template itself, you can use HTML, JavaScript and predefined variables that depend on the selected field type.

A small example of what you can do: <br>
* Display the necessary data about the timer in the table: <br>
<p style="text-align: center;"><a href="/uploads/time-in-status/templates/2.png"><img src="/uploads/time-in-status/templates/2.png" style="width:300px" loading="lazy"></a></p>


<script src="https://gist.github.com/JiBrok/9999437e950b81d35853d85c4975caad.js"></script>

* Connect this template in the field settings: <br>
  <p style="text-align: center;"><a href="/uploads/time-in-status/templates/3.png"><img src="/uploads/time-in-status/templates/4.png" style="width:300px" loading="lazy"></a></p>

* And this is how the timer value in the task will now look like: <br>
<p style="text-align: center;"><a href="/uploads/time-in-status/templates/3.png"><img src="/uploads/time-in-status/templates/3.png" style="width:300px" loading="lazy"></a></p>


Now you are not limited by anything and can customize the display of values as you like.