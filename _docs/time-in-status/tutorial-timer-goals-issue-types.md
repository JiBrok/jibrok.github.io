---
title: 📖 How to set up one timer with different goal time for different issue types?
key: time-in-status
---

Overview
Two ways to set timer configs for a project. Using 1 Timer config which contains information for the whole project. Or for each type use its own Timer config. Methods can be combined with each other.


<div class="uk-alert-note" data-uk-alert="">
    <p>For example:</p>
In one <b>Project Test</b> for issue type <b>Task</b> with <b>Medium priority</b>, the timer should be <b>72h</b>.
And for issue type <b>Support</b> with <b>priority Medium 18h</b>.
</div>


Support:

Task:

### Using a common Timer Config. ###
1. Create a Timer config and specify two goals in it Timer configs
    1. IssueType = Task and priority = Medium
    2. IssueType = Support and priority = Medium


2. In Timer Scheme Specify this config for both issue types


3. Create and configure Timer Field How create or edit "Timer" field
    1. connect the Timer Scheme to it
    2. set the field context for these two types.
    

So we have 1 timer config that contains information about two types.

### Using different Timer Configs. ###
1. Change our configuration to suit the issue type Task.
2. Copy Timer config
3. Rename our copy and set the current time for issue Type Support
4. We have two timer configs that differ only in reaction time to different priorities
5. Now you need to connect them in the timer scheme to the corresponding issue type.
