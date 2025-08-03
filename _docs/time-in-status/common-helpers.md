---
title: Common helpers
key: time-in-status
excerpt: "Create helper fields to extract specific values from Time in Status, Timer, and Stopwatch fields for integrations and third-party applications."
category: field-types-configuration
tags: [doc, server, datacenter, time-tracking, time-in-status, timer, stopwatch, business-calendar, jql-functions, reporting, sla-tracking, performance-optimization, rest-api, java-api, worklog, field-panels, export, eazybi-integration]
---

Helper fields make it easy to integrate third-party solutions and applications.

<p style="text-align: center;"><a href="/uploads/time-in-status/common-helpers/1.webp" target="_blank">
<img src="/uploads/time-in-status/common-helpers/1.webp" alt="1 screenshot" style="width:100%;" loading="lazy"></a></p>

The fields "Time in status", "Timer" and "Stopwatch" contain the "complex" value of the field. It includes time spent, break times, counter status, start date and other information. But when it comes to exports or integrations then you need some specific value - for example, the time spent. To facilitate obtaining these specific values, help fields are needed.

Helper fields work as follows. <br>
* The main field is created ("Time in status", "Timer" or "Stopwatch").
* A helper field of the required type to the main field is created. The types currently available are number, date, and statistic.
    * number - works like a normal number field.
    * date - works like a normal date field.
    * statistic - statistics are processed in a special way in gadgets.
* The helper field settings indicate:
    * Main field. It will serve as a source of information. The helper will refer to it to get the value and process the resulting value.
    * Data that needs to be received and displayed from the value of the main field.
    
<p style="text-align: center;"><a href="/uploads/time-in-status/common-helpers/2.webp" target="_blank">
<img src="/uploads/time-in-status/common-helpers/2.webp" alt="2 screenshot" style="width:100%;" loading="lazy"></a></p>

So for example you can create a basic stopwatch field. Create a helper for it that will display the stopwatch time in hours. Connect a helper in a third-party plugin that can handle numeric values. 

<p style="text-align: center;"><a href="/uploads/time-in-status/common-helpers/3.webp" target="_blank">
<img src="/uploads/time-in-status/common-helpers/3.webp" alt="3 screenshot" style="width:50%;" loading="lazy"></a></p>


