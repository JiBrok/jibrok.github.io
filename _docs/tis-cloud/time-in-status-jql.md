---
title: Time in status - JQL
key: tis-cloud
---

<ul>Configure JQL Queries.
    <li>You can display new fields in the JQL navigator and dashboards.</li>
    <li><b>"time in hours: ...field name" > 1.5</b> -  to search by time in hours. You can enter a fractional number. Minutes will be converted to hours in decimal notation.</li>
    <li><b>"time in minutes: ...field name" > 90</b> - to search by time in minutes. Hours will be converted to minutes.</li>
    <li>Combined conditions:
        <ul>
            <li>
                <b>"hours of: ...field name" > 1</b> - to search by hours. The number of hours spent in this status.
            </li>
            <li>
                <b>"minutes of: ...field name" > 30</b> - to search by minutes. The number of minutes spent in this status. You can combine this conditions for the convenient search.
            </li>
            <li>
                For example: <b>"hours: ...field name" > 2 AND "minutes: ...field name" > 45</b> will search for issues that spend more than 2 hours and 45 minutes in the defined status.
            </li>
        </ul>
    </li>
    <li>'For sorting, you can use any of these fields with the obligatory indication of <b>'ASC</b> or <b>DESC</b></li>
    <li><b>... ORDER BY "time in hours: ...field name" ASC</b></li>
</ul>