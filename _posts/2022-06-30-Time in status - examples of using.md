---
title: Time in status cloud - Case 1 - simple status time report for a manager
tags: tis tis-cloud
---


The support team consists of several generalist specialists and a manager. The work is being done in Jira in the SUP project. Every day clients create a large number of issues. Most of these issues are quite typical, not costly in time support for clients. The team's goals are: promptly solve customer problems, leave customers satisfied with the quality of the service provided.

The work is organized as follows:<br/>
* Every day one of the specialists performs the functions of an employee on duty. He processes new tasks (the “To Do” status): finds out the missing details (and transition it to the “Awaiting for Customer” status), performs primary classification and directs the task to the most competent and least loaded support specialist (transition it to the “In Progress" status);
* A support specialist solves the problem. If necessary, he can request the missing information from the client (transition the task to the status “Awaiting for Customer”). When the problem is solved, he moves it to the client to confirm the correctness of the solution (in the status “Review");
* If additional information was requested, the customer can respond and return the task to the duty-person (“To Do” status). If the task is on his review, approve the work (move to the “Done” status), or reject the solution and reopen the task (return to the “To Do” status).


<p style="text-align: center;"><a href="/uploads/time-in-status/post/2022-06-30/workflow-for-examples.png"><img src="/uploads/time-in-status/post/2022-06-30/workflow-for-examples.png" style="width:100%" loading="lazy"></a></p>


Roles in the process:
* Customer
* Duty person
* Support Specialist
* Support Manager

## Case 1: simple status time report for a manager ##

Problem: there have been no attempts to estimate which operation takes how long in the described process. Customers complain that the tasks are solved for a very long time. An attempt to calculate the average solution time based on the standard fields Created and Resolved shows that this is true – some tasks are solved for weeks or even months. At the same time, when viewing certain tasks, the data in the history is not so clear. The manager needs a tool that will allow to track the average time for separate stages of the task workflow.

Solution: for each status in the process, we add the Time in Status field. Then, based on these fields, we build a report on the average time for the period

1. Add a new work calendar. In the Apps administration section, in the Time in Status block, select the Calendar tab, click Create. Set the calendar name and working time parameters <a href="/uploads/time-in-status/post/2022-06-30/add-calendar.png"><img src="/uploads/time-in-status/post/2022-06-30/add-calendar.png" style="width:100%" loading="lazy"></a>
2. Add the Time in Status fields for each status (except for the “Done” status, since we are not interested in the amount of time that the task is closed right now).
   1. Go to the Time in Status tab, click Create, create fields. <a href="/uploads/time-in-status/post/2022-06-30/field-settings-1.png"><img src="/uploads/time-in-status/post/2022-06-30/field-settings-1.png" style="width:100%" loading="lazy"></a><a href="/uploads/time-in-status/post/2022-06-30/field-settings-2.png"><img src="/uploads/time-in-status/post/2022-06-30/field-settings-2.png" style="width:100%" loading="lazy"></a>
   2. We should get something like this: <a href="/uploads/time-in-status/post/2022-06-30/all-fields-settings-1.png"><img src="/uploads/time-in-status/post/2022-06-30/all-fields-settings-1.png" style="width:100%" loading="lazy"></a>
3. Create a desktop with a time report gadget in statuses. 
   1. Let's create a dashboard for the manager. <a href="/uploads/time-in-status/post/2022-06-30/dashboard-create-1.png"><img src="/uploads/time-in-status/post/2022-06-30/dashboard-create-1.png" style="width:100%" loading="lazy"></a>
   2. Add the gadget Calculated functions for Time in Status to it. <a href="/uploads/time-in-status/post/2022-06-30/dashboard-create-2.png"><img src="/uploads/time-in-status/post/2022-06-30/dashboard-create-2.png" style="width:100%" loading="lazy"></a>
   3. On the Config gadget tab, we set up the fields that need to be displayed as lines of our report. <a href="/uploads/time-in-status/post/2022-06-30/dashboard-create-3.png"><img src="/uploads/time-in-status/post/2022-06-30/dashboard-create-3.png" style="width:100%" loading="lazy"></a>
   4. Go to the Result tab. <a href="/uploads/time-in-status/post/2022-06-30/dashboard-create-4.png"><img src="/uploads/time-in-status/post/2022-06-30/dashboard-create-4.png" style="width:100%" loading="lazy"></a>
4. Now it can be seen that up to half of the time it takes to solve problems is to clarify the information from customer.







