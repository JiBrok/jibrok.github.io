---
title: Getting Started with Time in Status for Jira Cloud 
key: tis-cloud
excerpt: "Calculate time spent in specific Jira statuses with TIS Cloud. Working calendar support, time metrics, JQL functions, and export capabilities."
category: getting-started
tags: [doc, cloud, time-in-status, time-tracking, business-calendar, jql-functions, setup, configuration]
---


<p>This application calculates the time that an issue spent in a specified status. Calculations can be made according to the working calendar (taking into account weekends, holidays, and lunch breaks).</p>
<p>You can search and sort tasks by the "time in status" fields. This allows you to create queues/filters according to time metrics.</p>
<p>Fields are also available for export in different formats, which allows you to use your favorite reporting tools: Excel, REST API, dashboards, etc.</p>
<p>Where to begin?
    <ol>
        <li>Create a work calendar. To do this, go to the adjacent tab: "Calendars".</li>
        <li>Create fields to track the time in status. To do this, go to the adjacent tab: "Time in status" fields.</li>
        <li>Configure JQL Queries.
            <ul>
                <li>You can display new fields in the JQL navigator and dashboards.</li>
                <li><b>"time in hours:FIELD_NAME" > 1.5</b> -  to search by time in hours. You can enter a fractional number. Minutes will be converted to hours in decimal notation.</li>
                <li><b>"time in minutes:FIELD_NAME" > 90</b> - to search by time in minutes. Hours will be converted to minutes.</li>
                <li>Combined conditions:
                    <ul>
                        <li>
                            <b>"hours of:FIELD_NAME" > 1</b> - to search by hours. The number of hours spent in this status.
                        </li>
                        <li>
                            <b>"minutes of:FIELD_NAME" > 30</b> - to search by minutes. The number of minutes spent in this status. You can combine these conditions for convenient searching.
                        </li>
                        <li>
                            For example: <b>"hours:FIELD_NAME" > 2 AND "minutes:FIELD_NAME" > 45</b> will search for issues that spent more than 2 hours and 45 minutes in the defined status.
                        </li>
                    </ul>
                </li>
                <li>For sorting, you can use any of these fields with the required indication of <b>ASC</b> or <b>DESC</b>
                    <ul>
                        <li><b>... ORDER BY "time in hours:FIELD_NAME" ASC</b></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>Create web panels for additional information about time in status. To do this, go to the adjacent tab: "Web panels".</li>
        <li><b>Contact support in case of difficulties.</b></li>
    </ol>
</p>
<p>The application is currently being fine-tuned and improved. More detailed information about functionality and limitations will be available later.</p>

