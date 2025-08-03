---
title: Time between dates - How to create field?
key: time-between-dates-cloud
excerpt: "Create Time between dates fields in Jira Cloud to calculate time spans with working calendars, date field selection, and JQL support."
---

📌 The fields are not created from the standard Jira interface, but will be displayed in it after creation.

<p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/standard-cf-menu.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/standard-cf-menu.webp" style="width:100%" loading="lazy"></a></p>


1. Open application "Time between dates":<br>
   <ul>
      <li>Open from “Manage your app“:
      <p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/open-admin-from-app-manage.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/open-admin-from-app-manage.webp" style="width:100%" loading="lazy"></a></p>
      </li>
      <li>Or from “Apps“ menu:
      <p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/open-admin-from-apps-menu.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/open-admin-from-apps-menu.webp" style="width:100%" loading="lazy"></a></p>
      </li>
   </ul>
2. Open "Time between dates fields" fields and click "Create":<br>

   <p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/fields-tab.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/fields-tab.webp" style="width:100%" loading="lazy"></a></p>

3. Open the tab with the "Time between dates" fields on the application administration page. Click the **Create**

   <p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/fields-tab.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/fields-tab.webp" style="width:100%" loading="lazy"></a></p>

4. Specify the name of the field. Be sure to specify the context(for which tasks to calculate the value), the field will not work without it. 

   <p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/general-settings.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/general-settings.webp" style="width:100%" loading="lazy"></a></p>

5. Specify the dates between which you want to calculate the time and the working calendar. If there is no value in one of the fields in the issue, the time will not be calculated.

   <p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/date-fields-settings.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/date-fields-settings.webp" style="width:100%" loading="lazy"></a></p>

6. After saving, the calculation of values for tasks from the specified context will start. You can track this process on the Service information tab. After the initial calculation is completed, the field will be automatically updated in the background.

   <p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/demo-field.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/demo-field.webp" style="width:100%" loading="lazy"></a></p>

7. After creating the first field, the JQL examples will also be updated on the start page.

   <p style="text-align: center;"><a href="/uploads/time-between-dates-cloud/jql-examples.webp" target="_blank"><img src="/uploads/time-between-dates-cloud/jql-examples.webp" style="width:100%" loading="lazy"></a></p>

