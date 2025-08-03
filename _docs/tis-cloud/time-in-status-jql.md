---
title: Time in status - JQL
key: tis-cloud
excerpt: "Advanced JQL functions for Time in Status fields with time-based searches, status queries, and filtering capabilities."
category: search-jql
tags: [doc, cloud, time-in-status, jql-functions, status-tracking, business-calendar, dashboard-gadgets]
---

<ul>Configure JQL Queries.
    <li>You can display new fields in the JQL navigator and dashboards.</li>
    <li><b>"time in hours:FIELD_NAME" > 1.5</b> -  to search by time in hours. You can enter a fractional number. Minutes will be converted to hours in decimal notation.</li>
    <li><b>"time in minutes:FIELD_NAME" > 90</b> - to search by time in minutes. Hours will be converted to minutes.</li>
    <li>Combined conditions:
        <ul>
            <li>
                <b>"hours of:FIELD_NAME" > 1</b> - to search by hours. The number of hours spent in this status.
            </li>
            <li>
                <b>"minutes of:FIELD_NAME" > 30</b> - to search by minutes. The number of minutes spent in this status. You can combine this conditions for the convenient search.
            </li>
            <li>
                For example: <b>"hours:FIELD_NAME" > 2 AND "minutes:FIELD_NAME" > 45</b> will search for issues that spend more than 2 hours and 45 minutes in the defined status.
            </li>
        </ul>
    </li>
    <li>'For sorting, you can use any of these fields with the obligatory indication of <b>'ASC</b> or <b>DESC</b></li>
    <li><b>... ORDER BY "time in hours:FIELD_NAME" ASC</b></li>
</ul>