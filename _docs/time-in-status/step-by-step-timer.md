---
title: 📖 How to create Timer and configure it step-by-step 
key: time-in-status
---

## In this guide we will create two timers that will track the time of the first response and time to resolution. ##

PS. Это не огромный страшный гайд, он просто подробный :)

<div class="uk-alert-note" data-uk-alert="">
    <b>Time of the first response:</b>
<ul>
<li>The time will be calculated according to the <b>working calendar</b>.</li>
<li>The timer will count <b>3 hours</b> from the moment the task was created.</li>
<li>The timer will <b>stop</b> when answering or taking a <b>task to work</b>.</li>
<li>The timer can be <b>paused</b> by putting the task in <b>Hold status</b>.</li>
</ul>
</div>

<div class="uk-alert-note" data-uk-alert="">
    <b>Time to resolution:</b>
<ul>
<li>The time will be calculated according to the <b>working calendar</b>.</li>
<li>The time it takes to resolve the request will <b>depend on the priority</b> of the task. </li>
<ul>
<li>Priority <b>Lowest</b> - 144h</li>
<li>Priority <b>Low</b> - 72h</li>
<li>Priority <b>Medium</b> - 36h</li>
<li>Priority <b>High</b> - 18h</li>
<li>Priority <b>Highest</b> - 9h</li>
</ul>
<li>The timer can be <b>paused</b> by putting the task in <b>Hold status</b>.</li>
<li>The timer is <b>fixed</b> when you <b>close</b> the task or <b>set the resolution</b>.</li>
<li>The timer <b>restarts</b> when the <b>resolution is removed</b>.</li>

</ul>
</div>

### 1. Create fields ###

1. Create two timer field with names “Time to first response" and “Time to resolution".
2. Set the screens and contexts on which you want to see the timer. We will configure the field in detail later.

### 2. Open All Timer Configs ###

go to {baseUrl}/secure/jibrokAllTimerConfigs.jspa

or open with admin search (gg + "All Timer Configs")

### 3. Click "Add timer configuration" ###

TODO Timers and Stopwatches - Scheme and configurations

Now we will configure the conditions for starting the timer, stopping ...

### 4. Configure timer for "Time to first response" ###

1. Common settings

<ul>
<li>Set a name convenient for navigation - "Time to first response"</li>
<li>Set Calculate type - "First start". Our timer can't restart.</li>
<li>Update goal with issue update - No. Our timer will always be set to 3 hours (only default time). Therefore, you can set any value.</li>
<li>Allow change goal after start - No. Our timer will only have a default time(goal). Therefore, you can set any value.</li>
</ul>

2. Events

<ul>
<li> Start events:
    <ul>
    <li> The timer will start when the task is created. add "Issue created".</li>
    <li> In our project the task can be transferred from another project. add "Issue moved". </li>
    <li>(see Pause events) When a task returns from Hold status, if it is still unanswered, then a timer must be started. add "Change status from: Hold" </li>
    </ul>
</li>
<li> Pause events: 
    <ul>
    <li>The team can send the task to hold the status without response. While the task in this status the timer needs to be stopped. add "Change status to: Hold"</li>
    </ul>
</li>
<li> Stop events:  
    <ul>
    <li>We record the response time when the user is given an answer.add "Create any public comment" or "Create first public comment"</li>
<li>We also fix the time when the task is taken to work or closed. add "Change status to: In progress". add "Change status to: Closed".</li>
    </ul>
</li>
</ul>


3. Throw events

We do not need Thrown events in this timer.

4. Calendar

   Default calendar - You can set a working calendar by which the timer will be considered. If left blank, the time will be considered 24/7

TODO

5. Goal time

Default time (Default goal) - Time for which the timer is set if it is not possible to select the goal.

According to our condition the timer must be set for 3 hours. Set "3h"

We do not need Additional goals in this timer.

Click "Save".


### 5. Configure timer for "Time to resolution" ### 

0. Create new Configuration for (see p3)
TODO
   
1. Common settings

<ul>
<li>Set a name convenient for navigation - "Time to resolution"</li>
<li>Set Calculate type - "Calculate all start and create archive". The timer may restart and I want to see its previous values.</li>
<li>Update goal with issue update - No. The priority of the task is determined at the time of adoption (before the timer starts). And in the future, priority cannot change.</li>
<li>Allow change goal after start - No. The priority of the task is determined at the time of adoption (before the timer starts). And in the future, priority cannot change.</li>
</ul>


2. Events

<ul>
<li> Start events:
    <ul>
    <li> The timer will start when the task transition to "In progress". add "Change status to: In progress".</li>
    <li> (see Pause events) When a task returns from Hold status, then a timer must be started. add "Change status from: Hold".</li>
    <li>When a task is assigned (assignee change from Null(Empty) to user). add "assigned issue". </li>
    </ul>
</li>
<li> Restart events: 
    <ul>
    <li>If the task is removed from the resolution, then the timer starts the countdown again. add "Remove resolution". (If you do not need to restart the timer, then you need to use a pause instead of a retart.)</li>
    </ul>
</li>
<li> Pause events: 
    <ul>
    <li>The team can send the task to hold the status. While the task in this status the timer needs to be stopped. add "Change status to: Hold".</li>
    </ul>
</li>
<li> Stop events:  
    <ul>
    <li>We fix the timer time when the task closes or a solution is established for it. .add "Change status to: Closed". add "Set resolution"</li>
    </ul>
</li>
</ul>

3. throw events 

We do not need Thrown events in this timer.

4. Calendar

Default calendar - You can set a working calendar by which the timer will be considered. If left blank, the time will be considered 24/7

5. Goals 

Default time (Default goal) - Time for which the timer is set if it is not possible to select the goal.

The timer time depends on the priority and all tasks have priority. set "0".


The target time will be determined by the priority of the task. For each condition (priority) you need to add a goal.

Create goals by priorities: see screenshots

* JQL - condition by priority.
   * Example: priority = Lowest
* Use default time? - No 
   * Each goal has its own unique time.
* Time - set by condition 
   * Set "144h"
* Calendar - Set on which calendar you need to calculate the time. In this process, we use 1 working calendar.
   * Set "Default"
* Sequence - The conditions for our purposes do not overlap, so we do not need this field(The field will be filled automatically after create goal)
   * You can leave this field blank.
* Click "Create"

**after create all goals click "Save"**

### 6.  Open All timer schemes ###

go to {baseUrl}/secure/jibrokAllTimerSchemes.jspa

or open with admin search (gg + "All timer schemes")

### 7. Click "Add timer configuration scheme" ### 

TODO

Now you need to set which timer configurations to use depending on the project and the type of task. Analogue of context for custom fields. 

### 8. Configure timer scheme for "Time to first response" ###

* Set a name convenient for navigation - "Time to first response"
* Projects - Select the projects for which this scheme will work.
* Click "Add Association"
* Set issue types and timer config(from p5)
* Click "Create"
  * We indicated that the timer config are relevant for tasks from the project and issue types.
* Click "Save"

### 9. Configure timer scheme for "Time to resolution" (see p8) ###

In our case, the schemes differ only in name and selected timer config(Time to resolution)

### 10. Field settings for "Time to first response" ###

Now we need to configure the fields and connect the created schemes to them.

TODO
* Open the field settings (see screenshots) for field "Time to first response" (see p1)
* Set timer scheme "Time to first response"
  * Other settings can be set by default.
* click "Save"


## Test ##
### 11. Field settings for "Time to resolution" ###

(see p10) All the same, just select the scheme "Time to resolution"

### 12. At this step, the basic setup is complete. You can test how everything works. ### 

* Create issue
* The time report for the first answer began.

### 13. Set status in progress ###

* Time to first response - The timer has stopped. 
  * In the current settings of the field, only time is displayed. The status of the timer can be displayed by hovering the mouse over the time.
* Time to resolution - The timer has started.

### 14. Set status close or set resolution ###

Time to resolution - The timer has stopped.