---
title: 📖 How to create Timer and configure it step-by-step
key: timer-cloud
---

## In this guide we will create timer that will track the time to resolution. ##

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

### 1. Open page for create fields ###

1. In the top bar of the navigator there is a menu "Apps" in it you need to select the "Timer field" application. This will open the Application Settings menu.

<a href="/uploads/timer-cloud/step-by-step/open-plugin-menu.png"><img src="/uploads/timer-cloud/step-by-step/open-plugin-menu.png" alt="" width="100%"/></a>

2. Then you need to go to the "Timer fields" tab

<br><a href="/uploads/timer-cloud/step-by-step/open-timer-fields-tab.png"><img src="/uploads/timer-cloud/step-by-step/open-timer-fields-tab.png" alt="" width="100%"/></a>


### Create Timer/SLA for "Time to resolution"

1. Click to "Create" for create new Timer.
   <br><a href="/uploads/timer-cloud/step-by-step/timer-name-and-contexts.png"><img src="/uploads/timer-cloud/step-by-step/timer-name-and-contexts.png" alt="" width="100%"/></a>
2. General information
   1. Provide a name for the timer. A field will be created with the specified name. This name will also be used in JQL queries.
   2. Set this field to active. Otherwise it will not work, it will only save the settings.
3. Contexts
   * Provide contexts for this field. The following settings will only apply to issues from the specified projects and specified issue types.
         <br><a href="/uploads/timer-cloud/step-by-step/set-contexts.png"><img src="/uploads/timer-cloud/step-by-step/set-contexts.png" alt="" width="100%"/></a>
   * You can refine the goals below with JQL conditions.
4. Set Calculate type - "First start".
   <br><a href="/uploads/timer-cloud/step-by-step/timer-config-time-to-resolution.png"><img src="/uploads/timer-cloud/step-by-step/timer-config-time-to-resolution.png" alt="" width="100%"/></a>
5. Events
   * Start events:
     * The timer will start when the task transition to "In progress". add "Change status to: In progress".
     * (see Pause events) When a task returns from Hold status, then a timer must be started. add "Change status from: Hold".
     * When a task is assigned (assignee change from Null(Empty) to user). add "assigned issue".
   * Restart events:
     * If the task is removed from the resolution, then the timer starts the countdown again. add "Remove resolution". (If you do not need to restart the timer, then you need to use a pause instead of a retart.)
       * ❓It can be omitted if you are only interested in the time of the first decision of the query (Calculate type - "First start".). There will soon be new types to handle cases where requests are re-submitted. If you are interested in the total time, then you need to use the "Pause" events to pause the calculation. After triggering "Stop", the calculation is terminated completely.
   * Pause events:
     * The team can send the task to hold the status. While the task in this status the timer needs to be stopped. add "Change status to: Hold".
   * Stop events:
     * We fix the timer time when the task closes or a solution is established for it. .add "Change status to: Closed". add "Set resolution".
6. Display settings 
   * Configure the settings for displaying data in the field. It will not affect the actual value or sorting by field.
     <br><a href="/uploads/timer-cloud/step-by-step/timer-display-settings.png"><img src="/uploads/timer-cloud/step-by-step/timer-display-settings.png" alt="" width="100%"/></a>
7. Time settings
   * Default calendar - You can set a working calendar by which the timer will be considered. If left blank, the time will be considered 24/7
   * Default time (Default goal) - Time for which the timer is set if it is not possible to select the goal.
       * The timer time depends on the priority. If the issue does not have a priority or it does not match any of the conditions, then the default target 0 will be selected. **A zero target does not start the timer**.
   * The target time will be determined by the priority of the task. For each condition (priority) you need to add a goal.
   * Create goals by priorities: see screenshots
     * JQL - Condition for the application of this Goal. If none of the conditions match the issue then the default goal will be applied.
     * Time option:
       * Time - You can specify the time manually. After the start, the timer will be set to the specified time.
       * Date time field - The timer will count down the time from the start to the date in the specified issue field.
       * Preset options: 
         * NBD next business day. The timer will count down the time from the moment of the start to the end of the next working day.
     * An example of a combination of different conditions: 
     <p style="text-align: center;"><a href="/uploads/timer-cloud/step-by-step/timer-config-example.png"><img src="/uploads/timer-cloud/step-by-step/timer-config-example.png" alt="" width="100%"/></a></p>

   Goals and conditions for "track the time to resolution"
   <p><a href="/uploads/timer-cloud/step-by-step/timer-goal-config.png"><img src="/uploads/timer-cloud/step-by-step/timer-goal-config.png" alt="" width="100%"/></a></p>
    

8. Click "Save"
   <br><a href="/uploads/timer-cloud/step-by-step/timer-after-save.png"><img src="/uploads/timer-cloud/step-by-step/timer-after-save.png" alt="" width="100%"/></a>
9. After a successful save, the data synchronization process will start. It includes calculating historical values and starting tracking of active timers. Depending on the number of requests, the first synchronization may take some time. You can follow the synchronization status in the "Service info" tab.
   <br><a href="/uploads/timer-cloud/step-by-step/service-info.png"><img src="/uploads/timer-cloud/step-by-step/service-info.png" alt="" width="100%"/></a>
10. After you create the field, you can go to the "Start Page" tab. The examples will be updated on it and there will be links to demo JQL queries.
11. You can also work with this field as with any other. You can display it on screens, in reports, search and sort data by it.
    <br><a href="/uploads/timer-cloud/step-by-step/timer-fields-in-navigator.png"><img src="/uploads/timer-cloud/step-by-step/timer-fields-in-navigator.png" alt="" width="100%"/></a>
12. The data in the field will be updated periodically and whenever the task is updated. The frequency of automatic updates is now automatically detected. The less time is left, the more frequent updates will be.
    * Current intervals of time updates:
      * 1-5min: every 1 min
      * 5min-2h: every 5 min
      * 2h-12h: every 15 min
      * 12h-24h: every 30 min
      * 24h-7d: every 1h
      * 7d-14d: every 2h
      * 14d+: every 4h