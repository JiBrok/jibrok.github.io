---
title: Stopwatch - JQL
key: stopwatch-cloud
---

<ul>Configure JQL Queries.
    <li>You can display new fields in the JQL navigator and dashboards.</li>
    <li><b>"DATE: ...field name" = startOfDay()</b>
        <ul>Available <b>DATE</b> values:
            <li>started</li>
            <li>paused</li>
            <li>stopped</li>
            <li>For example: <b>"started: ...field name" = startOfDay()</b>  - to search by start date.</li>
        </ul>
    </li>
    <li><b>"state: ...field name" = STATE</b> - to search by state of stopwatch./li>
        <ul>Available <b>STATE</b> values:
            <li>running</li>
            <li>pause</li>
            <li>stop</li>
            <li>For example: <b>"state: ...field name" = running</b>  - to search running stopwatch.</li>
        </ul>
    </li>
    <li><b>"hours TIME: ...field name" > 1.5</b> - to search by time in hours. You can enter a fractional number. Minutes will be converted to hours in decimal notation.</li>
    <li><b>"minutes TIME: ...field name" > 90</b> - to search by time in minutes. Hours will be converted to minutes.
        <ul>Available <b>TIME</b> values:
            <li>TimeSpent</li>
            <li>PauseTime</li>
            <li>For example: <b>"time in hours TimeSpent: ...field name" > 2 AND "time in minutes TimeSpent: ...field name" > 45</b>  - will search for issues that time spent more than 2 hours and 45 minutes.</li>
        </ul>
    </li>
    <li>Combined conditions:
        <ul>
            <li>
                <b>"time in hours TIME: ...field name" > 1</b> - to search by hours. The number of hours.
            </li>
            <li>
                <b>"time in minutes TIME: ...field name" > 30</b> - to search by minutes. The number of minutes. You can combine this conditions for the convenient search.
            </li>
            <li>
                For example: <b>"time in hours TIME: ...field name" > 2 AND "time in minutes TIME: ...field name" > 45</b> will search for issues that time more than 2 hours and 45 minutes.
            </li>
        </ul>
    </li>
    <li>'For sorting, you can use any of these fields with the obligatory indication of <b>'ASC</b> or <b>DESC</b>
        <ul>
         <li><b>... ORDER BY "minutes TimeSpent: ...field name" ASC</b></li>
        </ul>
    </li>
</ul>