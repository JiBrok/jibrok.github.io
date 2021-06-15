---
title: Limits
key: tis-cloud
---

<ul>
  <li>As of today, there are the following technical limitations for Jira Cloud applications:</li>
  <li>You can create no more than 100 additional entities within the application (fields and web-panels). </li>
  <li>Each web-panels uses 1 module quotas.</li>
  <li>Each working field uses 1-4 module quotas. You can create a maximum of 25-100 fields working.</li>
  <li><a href="https://developer.atlassian.com/cloud/jira/platform/rate-limiting" target="_blank">Rate limits.</a> Updating and indexing data in fields increases the load on Jira Cloud. To ensure that your Jira Cloud continues to work stably, we limit the generated load for each individual user.</li>
  <li>The data (value + indexes) in the field is updated every time the task changes.</li>
  <li>The data is also updated at intervals depending on the time. The longer the time, the less frequently the data is updated.</li>
  <li>In total, this gives the following results:
      <ul>
          <li>On average, we can provide 500k-1kk of data updates per day(for all fields). It depends on the load on your instance. See "Total using limits" and "Average using limits" under table.</li>
          <li>Updates are counted for each recalculation of the value.</li>
          <li><b>Estimated limits</b> - how much this JQL query can theoretically consume from the total available limit. Calculated based on historical data for the last 30 days.</li>
          <li><b>Using limits</b> - How much of the total update limit is used by this JQL query for the current day.</li>
          <li><b>Average using limits</b> - How much of the total update limit this JQL query has been using on average over the last 30 days.</li>
          <li>If the limits are reached, updates will progress but will be slowed down so as not to have a noticeable impact on your Jira Cloud instance. You can contact support to individually increase limits or update rate of requests.</li>
      </ul>
  </li>
</ul>

For simplicity, the plugin will show an estimate of the generated load. 

In general, two parameters are important: How many tasks are in the specified statuses and how long they are in them. If you have less than 5000 tasks in tracking statuses at the same time, then there should be no problems.