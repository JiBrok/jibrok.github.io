---
title: Work calendar
key: time-in-status
excerpt: Create and manage working calendars with time zones, business hours, breaks, and holidays for accurate time tracking calculations in Time in Status fields.
---

The fields "Time in status", "Timer" and "Stopwatch", as well as [JQL functions](/docs/time-in-status/user-help-info/) are able to count the time according to working calendars.
Calendars take into account working hours and [user time zone](https://docs.oracle.com/javase/8/docs/api/java/time/ZonedDateTime.html). That allows you to coordinate the time between users from different regions.

For example, the timers and stopwatches will display the dates of the continuation of work, taking into account the user's working calendar and timezone. <br>
<p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/timer-example.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/timer-example.webp" alt="timer-example screenshot" style="width:50%" loading="lazy"></a></p>


### View ###
All users can view work calendars.
Open user menu and click on "Work calendars"
<p style="text-align: center;"><a href="/uploads/time-in-status/user-help-info/work-calendars.webp" target="_blank">
<img src="/uploads/time-in-status/user-help-info/work-calendars.webp" alt="work-calendars screenshot" style="width:50%" loading="lazy"></a></p>

In the window that opens, select a calendar for detailed viewing.<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/view.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/view.webp" alt="view screenshot" style="width:100%" loading="lazy"></a></p>

### Create ### 

1. Open {baseUrl}/secure/jibrokAllCalendars!default.jspa or from admin search by "Work calendars":<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/admin-search.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/admin-search.webp" alt="admin-search screenshot" style="width:100%" loading="lazy"></a></p>
2. Click "Сreate".<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/all.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/all.webp" alt="all screenshot" style="width:100%" loading="lazy"></a></p>
3. Enter the data in the calendar settings fields.<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/create.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/create.webp" alt="create screenshot" style="width:50%" loading="lazy"></a></p>
    1. You can specify an arbitrary time. Set in time field "21:35" (example). Click on time field and start typing "time" as "7:00" or "19:30".<br>
       <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/set-time.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/set-time.webp" alt="set-time screenshot" style="width:50%" loading="lazy"></a></p>
    2. then click "Create"<br>
       <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/set-time2.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/set-time2.webp" alt="set-time2 screenshot" style="width:50%" loading="lazy"></a></p>
4. Time zones - Calendar time calculations occur in the specified time zone. However, displays take into account the user's time zone.
5. If the data are not correct, an error will appear when saving.<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/validation.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/validation.webp" alt="validation screenshot" style="width:50%" loading="lazy"></a></p>
   
6. Adding Breaks. To add breaks during working hours, do the following.
   1. Create a break at "Add break time intervals". Set start and end times and click “Add“.<br>
      <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/break-time.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/break-time.webp" alt="break-time screenshot" style="width:50%" loading="lazy"></a></p>
   2. When there are breaks in the calendar for selection, then the working day has a field for selecting breaks.
   3. Then you can set default calendar breaks. The default break time can be selected in the working day.
   4. Set up work breaks for work days. Choose a default break or set one or more time intervals. Intervals must not overlap.<br>
      <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/break-time2.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/break-time2.webp" alt="break-time2 screenshot" style="width:50%" loading="lazy"></a></p>
   

7. Start date time - All calculations will be carried out from this date. The time before this date is considered non-working. For example: project start date.
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/start-date-time.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/start-date-time.webp" alt="start-date-time screenshot" style="width:50%" loading="lazy"></a></p>


8.  Work time settings - are user for new time formats from D13 to D42
   Default - The working day is equal to the calendar day.<br>
   <p style="text-align: center;"><a href="/uploads/time-in-status/work-calendar/time-settings.webp" target="_blank">
<img src="/uploads/time-in-status/work-calendar/time-settings.webp" alt="time-settings screenshot" style="width:50%" loading="lazy"></a></p>
