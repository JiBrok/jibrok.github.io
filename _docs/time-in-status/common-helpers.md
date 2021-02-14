---
title: Common helpers
key: time-in-status
---

Helper fields make it easy to integrate third-party solutions and applications.

<p style="text-align: center;"><a href="/uploads/time-in-status/common-helpers/1.png"><img src="/uploads/time-in-status/common-helpers/1.png" style="width:100%;"/></a></p>

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
    
<p style="text-align: center;"><a href="/uploads/time-in-status/common-helpers/2.png"><img src="/uploads/time-in-status/common-helpers/2.png" style="width:100%;"/></a></p>

So for example you can create a basic stopwatch field. Create a helper for it that will display the stopwatch time in hours. Connect a helper in a third-party plugin that can handle numeric values. 

<p style="text-align: center;"><a href="/uploads/time-in-status/common-helpers/3.png"><img src="/uploads/time-in-status/common-helpers/3.png" style="width:50%;"/></a></p>


