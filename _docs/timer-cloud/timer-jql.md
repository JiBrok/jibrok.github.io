---
title: Timer - JQL
key: timer-cloud
excerpt: "Advanced JQL functions for Timer fields including time-based searches, goal tracking, remaining time queries, and sorting options."
category: search-jql
tags: [doc, cloud, timer, jql-functions, sla-tracking, goal-time, countdown]
---

Configure JQL Queries.

You can display new fields in the JQL navigator and dashboards.

<ul>
    <li><b>"DATE:FIELD_NAME" = startOfDay()</b>
        <ul>Available <b>DATE</b> values:
            <li>"started:FIELD_NAME" > startOfDay()</li>
            <li>"paused:FIELD_NAME" > startOfDay()</li>
            <li>"stopped:FIELD_NAME" > startOfDay()</li>
            <li>"failed:FIELD_NAME" > startOfDay()</li>
        </ul>
        For example: <b>"started:FIELD_NAME" = startOfDay()</b>  - to search by start date.
    </li>
    <li><b>"state:FIELD_NAME" = STATE</b> - to search by state of timers.
        <ul>Available <b>STATE</b> values:
            <li>"state:FIELD_NAME" = running</li>
            <li>"state:FIELD_NAME" = pause</li>
            <li>"state:FIELD_NAME" = completed</li>
            <li>"state:FIELD_NAME" = failed</li>
        </ul>
        For example: <b>"state:FIELD_NAME" = running</b>  - to search running timers.
    </li>
    <li>
        <ul>
            <li><b>"hours TIME:FIELD_NAME" > 2</b> - to search by time in hours.</li>
            <li><b>"minutes TIME:FIELD_NAME" > 45</b> - to search by time in minutes.</li>
        </ul>
        <ul>Available <b>TIME</b> values:
            <li>"hours TimeSpent:FIELD_NAME" > 2 and "minutes TimeSpent:FIELD_NAME" > 45</li>
            <li>"hours PauseTime:FIELD_NAME" > 2 and "minutes PauseTime:FIELD_NAME" > 45</li>
            <li>"hours LeftTime:FIELD_NAME" > 2 and "minutes LeftTime:FIELD_NAME" > 45</li>
        </ul>
        Combined this conditions:<br/>
        <b>"hours TIME:FIELD_NAME" > 2 AND "minutes TIME:FIELD_NAME" > 45</b> will search for issues that time more than 2 hours and 45 minutes.
    </li>
    <li>
        <b>"time in hours TIME:FIELD_NAME" > 1.5</b> -  to search by time in hours. You can enter a fractional number. The all time will be converted to hours in decimal notation.
        <ul>Available <b>TIME</b> values:
            <li>"time in hours TimeSpent:FIELD_NAME" > 1.5</li>
            <li>"time in hours PauseTime:FIELD_NAME" > 1.5</li>
            <li>"time in hours LeftTime:FIELD_NAME" > 1.5</li>
        </ul>
        For example: <b>"time in hours TimeSpent:FIELD_NAME" > 1.5</b> - find timers that have counted down more than an hour and a half.
    </li>
    <li>
        <b>"time in minutes TIME:FIELD_NAME" > 1.5</b> -  to search by time in minutes. The all time will be converted to minutes.
        <ul>Available <b>TIME</b> values:
            <li>"time in minutes TimeSpent:FIELD_NAME" > 90</li>
            <li>"time in minutes PauseTime:FIELD_NAME" > 90</li>
            <li>"time in minutes LeftTime:FIELD_NAME" > 90</li>
        </ul>
        For example: <b>"time in minutes LeftTime:FIELD_NAME" > 90</b> - find timers that have more than 90 minutes left until the end.
    </li>
    <li>'For sorting, you can use any of these fields with the obligatory indication of <b>'ASC</b> or <b>DESC</b>
        <ul>
            <li><b>... ORDER BY "minutes TimeSpent:FIELD_NAME" ASC</b></li>
        </ul>
    </li>
</ul>