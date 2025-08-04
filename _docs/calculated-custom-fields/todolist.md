---
title: To Do list
key: calculated-custom-fields
category: field-types
tags: [doc, server, datacenter, calculated-fields, custom-fields, todo-list, jql-functions, field-creation]
excerpt: "Interactive to-do list custom field for Jira with drag-and-drop functionality, completion tracking, and JQL search capabilities for task management."
---
### A Field for Maintaining Lists with the Ability to Mark Completed Items ###

In issues, the field looks like this:

<p style="text-align: center;"><a href="/uploads/jbcf/todolist.webp" target="_blank">
<img src="/uploads/jbcf/todolist.webp" alt="todolist screenshot" style="width:100%" loading="lazy"></a></p>

* You can use enter to complete the input process, create an item, and proceed to creating a new one.
* You can drag and drop items inside the list and between other lists (ToDo custom fields).

#### Search and JQL functions ####

* **"ToDo custom field" = allItemsDone()** - Allows you to search for issues where all todo items are done.
* **"ToDo custom field" = allItemsUndone()** - Allows you to search for issues where all todo items are undone.
* **"ToDo custom field" = todoItem("", "")** - Allows you to search for issues where todo items have a specific name and are done/undone:
  * "ToDo custom field" = todoItem("task1", "done")
  * "ToDo custom field" = todoItem("task1", "+")
  * "ToDo custom field" = todoItem("task1", "true")
  * "ToDo custom field" = todoItem("task1", "undone")
  * "ToDo custom field" = todoItem("task1", "-")
  * "ToDo custom field" = todoItem("task1", "false")


#### In Field Settings You Can Configure the Default Task List (Items) #### 

<p style="text-align: center;"><a href="/uploads/jbcf/todolist2.webp" target="_blank">
<img src="/uploads/jbcf/todolist2.webp" alt="todolist2 screenshot" style="width:100%" loading="lazy"></a></p>

For each context, you can configure editing of the default list and the ability to add new items.

<p style="text-align: center;"><a href="/uploads/jbcf/todolist3.webp" target="_blank">
<img src="/uploads/jbcf/todolist3.webp" alt="todolist3 screenshot" style="width:100%" loading="lazy"></a></p>