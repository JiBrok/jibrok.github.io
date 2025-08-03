---
title: Common settings
key: time-in-status
excerpt: "Configure global plugin settings including system user authentication, notification mechanisms, and event handling for Time in Status."
---

This menu contains general plugin settings that affect a large number of functionality.

All settings:<br>
<p style="text-align: center;"><a href="/uploads/time-in-status/common-settings/common-settings.webp" target="_blank">
<img src="/uploads/time-in-status/common-settings/common-settings.webp" alt="screenshot" width="50%" loading="lazy"></a></p>
### System user ###

Some functions in the plugin run in the background.
By default, these actions are performed anonymously.
Here you can optionally set a user who will appear as the author of actions.

* Timer notifications - notifications will be sent on behalf of the specified user.
* [Autotrack](/docs/time-in-status/autotrack/) - start and stop timers or stopwatches. The user is recorded in the change history issue.

### Notifications ###

The plugin can send notifications when triggers are triggered for timers and stopwatches, when the timer runs out and in other situations.
Different types of events are handled differently, depending on the implementation of the handler. So, for example, ScriptRunner and Automation for Jira listeners work in different ways.
So that events (notifications) from a plugin can be processed by any plugin, it (plugin) implements two mechanisms for sending events:
* IssueEvent - ScriptRunner, MyGroovy, some plugins.
* IssueEventBundle - Send email notifications, Automation for Jira, Slack, some plugins.

You can enable both mechanisms, they do not consume a very large amount of resources.





