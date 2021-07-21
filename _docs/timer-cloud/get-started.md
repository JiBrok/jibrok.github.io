---
title: Get started
key: timer-cloud
---


<p>This application calculates time that issue spent between issue events. Calculations can be made according to the working calendar(taking into account weekends, holidays and lunch breaks).</p>
<p>You can search and sort tasks by the "stopwatch" fields. This allows to create queue/filters according to the time metrics.</p>
<p>Fields are also available for export in different formats, which allows you to use your favourite reporting tools: excel, rest api, dashboards, etc.</p>
<p>Where to begin?
    <ol>
       <li>Create a work calendar. To do this, go to the adjacent tab: Calendars.</li>
        <li>Create fields to track the time between issue events. To do this, go to the adjacent tab: "Stopwatch" fields.</li>
        <li>Configure JQL Queries.</li>
        <li>You can display new fields in the JQL navigator and dashboards.
            <ul>
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
                <li><b>"minutes TIME: ...field name" > 90</b> - to search by time in minutes. Hours will be converted to minutes.</li>
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
                <li>
                    <ul>Available <b>TIME</b> values:
                        <li>TimeSpent</li>
                        <li>PauseTime</li>
                        <li>For example: <b>"time in hours TimeSpent: ...field name" > 2 AND "time in minutes TimeSpent: ...field name" > 45</b>  - will search for issues that time spent more than 2 hours and 45 minutes.</li>
                    </ul>
                </li>
                <li>'For sorting, you can use any of these fields with the obligatory indication of <b>'ASC</b> or <b>DESC</b>
                    <ul>
                     <li><b>... ORDER BY "minutes TimeSpent: ...field name" ASC</b></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li>Web panels - Coming soon 🛠</li>
        <li><b>Contact support in case of difficulties.</b></li>
    </ol>
</p>
<p>The application is now being fine-tuned and improved. Later on, there will be more detailed information about functionality and limitations.</p>

