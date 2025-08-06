---
title: Getting Started with Timer Field for Jira Cloud
key: timer-cloud
excerpt: "Calculate time between Jira issue events with Timer Cloud. Working calendar integration, timer fields, JQL search, and export options."
category: getting-started
tags: [doc, cloud, timer, countdown, business-calendar, jql-functions, setup, configuration]
---


<p>This application calculates the time that issues spend between issue events. Calculations can be made according to the working calendar (taking into account weekends, holidays, and lunch breaks).</p>
<p>You can search and sort issues by the "timer" fields. This allows you to create queues/filters according to time metrics.</p>
<p>Fields are also available for export in different formats, which allows you to use your favorite reporting tools: Excel, REST API, dashboards, etc.</p>
<h3>Where to begin?</h3>
<ol>
    <li>Create a work calendar. To do this, go to the Calendars tab.</li>
    <li>Create fields to track the time between issue events. To do this, go to the "Timer fields" tab.</li>
    <li>Configure JQL queries.</li>
    <li>You can display new fields in the JQL navigator and dashboards. {this.state.isDownloaded?"(📌 examples are clickable)":"(📌 Clickable examples will be here after creating the timer)"}
        <ul>
            <li><b>"DATE:FIELD_NAME" = startOfDay()</b>
                <ul>Available <b>DATE</b> values:
                    <li>"started:FIELD_NAME" > startOfDay()</li>
                    <li>"paused:FIELD_NAME" > startOfDay()</li>
                    <li>"stopped:FIELD_NAME" > startOfDay()</li>
                    <li>"failed:FIELD_NAME" > startOfDay()</li>
                </ul>
                For example: <b>"started:FIELD_NAME" = startOfDay()</b> - to search by start date.
            </li>
            <li><b>"state:FIELD_NAME" = STATE</b> - to search by state of timers.
                <ul>Available <b>STATE</b> values:
                    <li>"state:FIELD_NAME" = running</li>
                    <li>"state:FIELD_NAME" = pause</li>
                    <li>"state:FIELD_NAME" = completed</li>
                    <li>"state:FIELD_NAME" = failed</li>
                </ul>
                For example: <b>"state:FIELD_NAME" = running</b> - to search for running timers.
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
                Combining these conditions:<br/>
                <b>"hours TIME:FIELD_NAME" > 2 AND "minutes TIME:FIELD_NAME" > 45</b> will search for issues that time more than 2 hours and 45 minutes.
            </li>
            <li>
                <b>"time in hours TIME:FIELD_NAME" > 1.5</b> - to search by time in hours. You can enter a fractional number. All time will be converted to hours in decimal notation.
                <ul>Available <b>TIME</b> values:
                    <li>"time in hours TimeSpent:FIELD_NAME" > 1.5</li>
                    <li>"time in hours PauseTime:FIELD_NAME" > 1.5</li>
                    <li>"time in hours LeftTime:FIELD_NAME" > 1.5</li>
                </ul>
                For example: <b>"time in hours TimeSpent:FIELD_NAME" > 1.5</b> - find timers that have counted down more than an hour and a half.
            </li>
            <li>
                <b>"time in minutes TIME:FIELD_NAME" > 1.5</b> - to search by time in minutes. All time will be converted to minutes.
                <ul>Available <b>TIME</b> values:
                    <li>"time in minutes TimeSpent:FIELD_NAME" > 90</li>
                    <li>"time in minutes PauseTime:FIELD_NAME" > 90</li>
                    <li>"time in minutes LeftTime:FIELD_NAME" > 90</li>
                </ul>
                For example: <b>"time in minutes LeftTime:FIELD_NAME" > 90</b> - find timers that have more than 90 minutes left until the end.
            </li>
            <li>For sorting, you can use any of these fields with the required indication of <b>ASC</b> or <b>DESC</b>
                <ul>
                    <li><b>... ORDER BY "minutes TimeSpent:FIELD_NAME" ASC</b></li>
                </ul>
            </li>
        </ul>
    </li>
    <li>Web panels - Coming soon 🛠</li>
    <li>Timer Archive - Coming soon 🛠</li>
    <li><b>Contact support in case of difficulties.</b></li>
</ol>
<p>The application is currently being fine-tuned and improved. More detailed information about functionality and limitations will be provided later.</p>
