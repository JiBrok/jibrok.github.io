---
title: Work calendar
key: time-in-status
---

Поля "Time in status", "Timer" и "Stopwatch", а так же [JQL функции](/docs/time-in-status/user-help-info/) умеют считать время по рабочим календарям. 
Календари учитывают рабочее время и [временную зону пользователей](https://docs.oracle.com/javase/8/docs/api/java/time/ZonedDateTime.html). Что позволяет согласовывать время между пользователями из разных регионов.

Например в таймерах и секундомерах будет отображены даты продолжения работы с учетом рабочего календаря и таймзоны пользователя.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/timer-example.png"><img src="/uploads/time-in-status/work-calendar/timer-example.png" style="width:300px"/></a></p>


### View ###
All users can view work calendars.
Open user menu and click on "Work calendars"
<p style="text-align: center;"><a href="/uploads/time-in-status/user-help-info/work-calendars.png"><img src="/uploads/time-in-status/user-help-info/work-calendars.png" style="width:300px"/></a></p>

In the window that opens, select a calendar for detailed viewing.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/view.png"><img src="/uploads/time-in-status/work-calendar/view.png" style="width:600px"/></a></p>

### Create ### 

1. Open {baseUrl}/secure/jibrokAllCalendars!default.jspa or from admin search by "Work calendars":<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/admin-search.png"><img src="/uploads/time-in-status/work-calendar/admin-search.png" style="width:600px"/></a></p>
2. Click "Сreate".<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/all.png"><img src="/uploads/time-in-status/work-calendar/all.png" style="width:600px"/></a></p>
3. Enter the data in the calendar settings fields.<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/create.png"><img src="/uploads/time-in-status/work-calendar/create.png" style="width:300px"/></a></p>
    1. You can specify an arbitrary time. Set in time field "21:35" (example). Click on time field and start typing "time" as "7:00" or "19:30".<br>
       <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/set-time.png"><img src="/uploads/time-in-status/work-calendar/set-time.png" style="width:300px"/></a></p>
    2. then click "Create"<br>
       <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/set-time2.png"><img src="/uploads/time-in-status/work-calendar/set-time2.png" style="width:300px"/></a></p>
4. Time zones - Calendar time calculations occur in the specified time zone. However, displays take into account the user's time zone.
5. If the data are not correct, an error will appear when saving.<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/validation.png"><img src="/uploads/time-in-status/work-calendar/validation.png" style="width:300px"/></a></p>
   
6. Adding Breaks. To add breaks during working hours, do the following.
   1. Create a break at "Add break time intervals". Set start and end times and click “Add“.<br>
      <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/break-time.png"><img src="/uploads/time-in-status/work-calendar/break-time.png" style="width:300px"/></a></p>
   2. When there are breaks in the calendar for selection, then the working day has a field for selecting breaks.
   3. Then you can set default calendar breaks. The default break time can be selected in the working day.
   4. Set up work breaks for work days. Choose a default break or set one or more time intervals. Intervals must not overlap.<br>
      <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/break-time2.png"><img src="/uploads/time-in-status/work-calendar/break-time2.png" style="width:300px"/></a></p>
   

7. Work time settings - are user for new time formats from D13 to D42
Default - The working day is equal to the calendar day.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/time-settings.png"><img src="/uploads/time-in-status/work-calendar/time-settings.png" style="width:300px"/></a></p>
   

