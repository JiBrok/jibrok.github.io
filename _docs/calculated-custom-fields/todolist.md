---
title: To Do list
key: calculated-custom-fields
excerpt: "Interactive to-do list custom field for Jira with drag-and-drop functionality, completion tracking, and JQL search capabilities for task management."
---
### Field for maintaining lists with the ability to mark completed items. ###

In issues the field looks like this

<p style="text-align: center;"><a href="/uploads/jbcf/todolist.webp" target="_blank">
<img src="/uploads/jbcf/todolist.webp" alt="todolist screenshot" style="width:100%" loading="lazy"></a></p>

* You can use enter to complete the input process, create an item, and proceed to creating a new one.
* You can drag and drop items inside the list and between other lists(ToDo custom fields)

#### Search and JQL functions ####

* **"ToDo custom field" = allItemsDone()** - Allows to search the issues where all todo items are done.
* **"ToDo custom field" = allItemsUndone()** - Allows to search the issues where all todo items are undone.
* **"ToDo custom field" = todoItem("", "")** - Allows to search the issues where all todo items have name and they are done/undone:
  * "ToDo custom field" = todoItem("task1", "done")
  * "ToDo custom field" = todoItem("task1", "+")
  * "ToDo custom field" = todoItem("task1", "true")
  * "ToDo custom field" = todoItem("task1", "undone")
  * "ToDo custom field" = todoItem("task1", "-")
  * "ToDo custom field" = todoItem("task1", "false")


#### In field settings you can configure the default task list (items) #### 

<p style="text-align: center;"><a href="/uploads/jbcf/todolist2.webp" target="_blank">
<img src="/uploads/jbcf/todolist2.webp" alt="todolist2 screenshot" style="width:100%" loading="lazy"></a></p>

For each context you can configure editing of the default list and the ability to add new items.

<p style="text-align: center;"><a href="/uploads/jbcf/todolist3.webp" target="_blank">
<img src="/uploads/jbcf/todolist3.webp" alt="todolist3 screenshot" style="width:100%" loading="lazy"></a></p>