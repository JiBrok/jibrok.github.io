---
title: Get started
key: time-between-dates-cloud
---

<p style="text-align: center;"><a href="https://marketplace.atlassian.com/1226143"><img src="/uploads/time-between-dates-cloud/marketplace.png" style="width:100%"/></a></p>

View app on [Atlassian Marketplace](https://marketplace.atlassian.com/1226143)

## Welcome to Time between date for Jira Cloud! 

<p>This application calculates the time between two dates from the issue fields. These can be either system fields - created, updated ... or any custom fields of the date time type.</p>
<p>The countdown is specified in the field settings (Start field). Each field dynamically changes its value with a certain frequency. Update rate depends on the time: the longer the time, the less frequently the value will be updated.</p>

<p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/demo-field.png"><img src="/uploads/time-between-dates-cloud/demo-field.png" style="width:100%"/></a></p>

### More calculated info ###

<p>The field will calculate several values at the same time.
    <ul>
        <li>Time between dates (start and end) - goal time</li>
        <li>Time between dates (now and end) - left time.</li>
        <li>Time between dates (start and now) - time spent.</li>
    </ul>
    Left time and time spent - These values are calculated after the start date.
</p>


### Business calendar: ###

The plugin can calculate the time according to the configured calendars. In fields and jql there are corresponding settings.
You can create an unlimited number of calendars and use it in any contexts and projects.
<p style="text-align: center;"><a href="/uploads/time-in-status/overview/calendar-example.png"><img src="/uploads/time-in-status/overview/calendar-example.png" style="width:100%;"/></a></p>


### JQL for time between dates  ###

<p>You can search and sort tasks by the "Time between dates" fields. This allows to create queue/filters according to the time metrics.</p>
<p>Fields are also available for export in different formats, which allows you to use your favourite reporting tools: excel, rest api, dashboards, etc.</p>
<h3>Where to begin?</h3>
<ol>
    <li>Create a work calendar. To do this, go to the adjacent tab: Calendars.</li>
    <li>Create fields to track the time between issue dates. To do this, go to the adjacent tab: "Time between dates fields".</li>
    <li>Configure JQL Queries. You can display new fields in the JQL navigator and dashboards. (📌 Clickable examples will be here after creating the field)
        <ul>
            <li><b>"DATE:FIELD_NAME" = startOfDay()</b>
                <ul>Available <b>DATE</b> values:
                    <li>"started:FIELD_NAME" > startOfDay() - start date is drilled from the start field specified in the settings</li>
                    <li>"stopped:FIELD_NAME" > startOfDay() - stopped date is drilled from the stopped field specified in the settings</li>
                </ul>
                For example: <b>"started:FIELD_NAME" > startOfDay()</b>  - to search by start date.
            </li>
            <li><b>"state:FIELD_NAME" = STATE</b> - to search by state of "Time between dates" field.
                <ul>Available <b>STATE</b> values:
                    <li>"state:FIELD_NAME" = active - The state becomes active after the start date. </li>
                    <li>"state:FIELD_NAME" = inactive - The state becomes inactive, before the start date and after the end date.</li>
                </ul>
                For example: <b>"state:FIELD_NAME" = active</b>  - to search active timers.
            </li>
            <li>Search by hours and minutes:
                <ul>
                    <li><b>"hours TIME:FIELD_NAME" > 2</b> - to search by time in hours.</li>
                    <li><b>"minutes TIME:FIELD_NAME" > 45</b> - to search by time in minutes.</li>
                </ul>
                <ul>Available <b>TIME</b> values:
                    <li>"hours TimeSpent:FIELD_NAME" > 2 and "minutes TimeSpent:FIELD_NAME" > 45</li>
                    <li>"hours LeftTime:FIELD_NAME" > 2 and "minutes LeftTime:FIELD_NAME" > 45</li>
                    <li>"hours GoalTime:FIELD_NAME" > 2 and "minutes GoalTime:FIELD_NAME" > 45</li>
                </ul>
                Combined this conditions:<br/>
                <b>"hours TIME:FIELD_NAME" > 2 AND "minutes TIME:FIELD_NAME" > 45</b> will search for issues that time more than 2 hours and 45 minutes.
            </li>
            <li>
                <b>"time in hours TIME:FIELD_NAME" > 1.5</b> -  to search by time in hours. You can enter a fractional number. The all time will be converted to hours in decimal notation.
                <ul>Available <b>TIME</b> values:
                    <li>"time in hours TimeSpent:FIELD_NAME" > 1.5</li>
                    <li>"time in hours LeftTime:FIELD_NAME" > 1.5</li>
                    <li>"time in hours GoalTime:FIELD_NAME" > 1.5</li>
                </ul>
                For example: <b>"time in hours TimeSpent:FIELD_NAME" > 1.5</b> - find timers that have counted down more than an hour and a half.
            </li>
            <li>
                <b>"time in minutes TIME:FIELD_NAME" > 90</b> -  to search by time in minutes. The all time will be converted to minutes.
                <ul>Available <b>TIME</b> values:
                    <li>"time in minutes TimeSpent:FIELD_NAME" > 90</li>
                    <li>"time in minutes LeftTime:FIELD_NAME" > 90</li>
                    <li>"time in minutes GoalTime:FIELD_NAME" > 90</li>
                </ul>
                For example: <b>"time in minutes LeftTime:FIELD_NAME" > 90</b> - find timers that have more than 90 minutes left until the end.
            </li>
            <li>'For sorting, you can use any of these fields with the obligatory indication of <b>'ASC</b> or <b>DESC</b>
                <ul>
                    <li><b>... ORDER BY "minutes TimeSpent:FIELD_NAME" ASC</b></li>
                </ul>
            </li>
        </ul>
    </li>
    <li>Information about scheduled work on the servers or a failure will be displayed on this page(Start page). Additional notifications are available on the page: <a href={"https://jibrok.statuspage.io/"}>Status page</a> </li>
    <li>Please contact support in case of difficulties.</li>
</ol>