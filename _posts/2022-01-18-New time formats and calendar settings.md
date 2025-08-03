---
title: New time formats and calendar settings (Cloud)
tags: tis-cloud timer-cloud stopwatch-cloud time-between-dates-cloud
---

We have added support for new formats for displaying time. Now you can display time converted to minutes/hours/days/weeks/months/years.

Full list of time formats for cloud applications(Time in status, Timer, Stopwatch, Time between dates fields): 
* DEFAULT("13h 48m")
* D0("13h 48m 03s")
* D3("833")
* D4("833m")
* D5("13")
* D6("13h")
* D7("13.8")
* D8("13,8")
* D9("13.8h")
* D10("13,8h")
* D11("13:48")
* D12("13h 48m")


**The following formats use calendar work time settings**
* D13("10d")
* D14("10 days")

* D15("10d 15h")
* D16("10 days 15 hours")

* D18("8w")
* D19("8 weeks")

* D20("8w 6d")
* D21("8 weeks 6 days")

* D23("8w 6d 13h")
* D24("8 weeks 6 days 13 hours")

* D26("2m 3w")
* D27("2 month 3 weeks")

* D29("2m 3w 6d")
* D30("2 month 3 weeks 6 days")

* D32("1y 2m 3w")
* D33("1 year 2 month 3 weeks")

* D35("1y 2m 3w 6d")
* D36("1 year 2 month 3 weeks 6 days")

* D38("1y 2m 3w 6d 13h")
* D39("1 year 2 month 3 weeks 6 days 13 hours")

* D41("1y 2m 3w 6d 13h 5m")
* D42("1 year 2 month 3 weeks 6 days 13 hours 5 minutes")


D13 and higher formats use *Work time settings* calendar settings.
These settings specify the length of the working day/week/month/year in seconds for your work schedule.
Soon we will add an automatic calculation of the average duration of these values, depending on the specified schedule.

<p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/time-settings.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/time-settings.webp" alt="time-settings screenshot" style="width:50%" loading="lazy"></a></p>
