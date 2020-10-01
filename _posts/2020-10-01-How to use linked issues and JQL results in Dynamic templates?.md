---
title: How to use linked issues and JQL results in Dynamic templates?

---

{:.no_toc}
* TOC
{:toc}

Dynamic templates allow you to use various variables in your message.
Some variables change their values in real time while user changes data on the screen, for example $form and $formIssue link.
This post shows the examples of using utility variables for linked issues access: $link $jqlService

## How to get parent issue? ##
You can get parent issue access directly through the $issue:

```velocity
#set($parent = $issue.parentObject)
$parent
```

Or through the $formIssue:
```velocity
#set($parent = $formIssue.parentObject)
$parent
```
Accessing parent issue through $formIsuue is recommended as it works in every issue screens including creating subtask screen. $issue contains only saved data(from database). 

## How to get subtask? ##

You can get subtask access also through the $issue:
```velocity
#set($subTasks = $issue.subTaskObjects)
$subTasks
```

Or through the $formIssue:
```velocity
#set($subTasks = $formIssue.subTaskObjects)
$subTasks
```
  
$subTasks in this example is issue list. You can find examples of getting data from task list and displaying issue list below.

## How to get all linked issues? ##

Variable $links is used for work with issue links.
Each issue link has its orientation. Use $links.getOutwardIssues() and $links.getInwardIssues() methods to get linked issues and incoming links.

```velocity
#set($outwardIssues = $links.getOutwardIssues())
$outwardIssues
```

```velocity
#set($inwardIssues = $links.getInwardIssues())
$inwardIssues
```
This methods will also return issues with parent links.
Both methods return issue lists. See [How to get system fields values for issue list?](#how-to-get-system-fields-values-for-issue-list) below.

## How to get issues with certain type of links? ##

getOutwardIssues and getInwardIssues methods can accept 1 parameter: link type(numeric Id) or link name(string).
If parameter is set, then method will return only issues with certain type of link. This methods return already created links.

```velocity
#set($blockedOutwardIssues = $links.getOutwardIssues("Blocks"))
$blockedOutwardIssues
```
 
```velocity
#set($blockedInwardIssues = $links.getInwardIssues(10000))
$blockedInwardIssues
```

You can also get linked issues specified on screen by user.
$links.getInwardIssuesFromForm() method will return saved and specified by user linked issues.

```velocity
#set($blockedInwardIssues = $links.getInwardIssuesFromForm(10000))
$blockedInwardIssues
```

$links.getRawInwardIssuesFromForm() method will return only specified by user linked issues.

```velocity
#set($blockedInwardIssues = $links.getRawInwardIssuesFromForm(10000))
$blockedInwardIssues
```

All methods return issue lists. See [How to get system fields values for issue list?](#how-to-get-system-fields-values-for-issue-list) below.


## How to get issues by jql query?  ##
$jqlService is used for work with JQL.
$jqlService can execute jql queries, return issue lists or number of issues that satisfy the query.

Use $jqlService.getIssuesByJQL(JQL, COUNT) to get issue list by JQL.
JQL - request string.
COUNT - number of tasks.

```velocity
#set($criticalIssuesFromProject = $jqlService.getIssuesByJQL("Project = TEST and status != Done and priority = Critical", 5))
$criticalIssuesFromProject
```
You can use any available data to create a JQL request.

```velocity
#set($criticalIssuesFromProject = $jqlService.getIssuesByJQL("Project = '$formIssue.project.key' and status != Done and priority = Critical", 10))
$criticalIssuesFromProject
```
You can check with the JQL query if the current task meet certain condition. 
But $jqlService can search only for stored data.

 ```velocity
 #set($isIssueSavedWithCriticalPriority = $jqlService.getIssueCountByJQL("Key = $issue.key and status != Done and priority = Critical") > 0)
 $isIssueSavedWithCriticalPriority
 ```

## How to get system fields values for issue list? ##
You can display on screen and use in conditions any available data. 

```velocity
#set($blockedInwardIssues = $links.getOutwardIssuesFromForm(10000))
#foreach($blockedInwardIssue in $blockedInwardIssues)
	$blockedInwardIssue.key,
    $blockedInwardIssue.summary,
    $blockedInwardIssue.assignee.displayName,
    $blockedInwardIssue.priority.name,
	Components: [
	#foreach($component in $blockedInwardIssue.components)
 		$component.name #if($velocityCount < $blockedInwardIssue.components.size()) , #end
	#end
	] <br>
#end
```

```velocity
#set($blockedInwardIssues = $links.getOutwardIssuesFromForm(10000))
#foreach($blockedInwardIssue in $blockedInwardIssues)
    #if($blockedInwardIssue.reporter == $currentUser)
        $blockedInwardIssue.key,
        $blockedInwardIssue.summary,
        $blockedInwardIssue.assignee.displayName,
        $blockedInwardIssue.priority.name,
        Components: [
        #foreach($component in $blockedInwardIssue.components)
            $component.name #if($velocityCount < $blockedInwardIssue.components.size()) , #end
        #end
        ] <br>
    #end
#end
```
Also you can use $issueFieldRender variable for rendering field values in beautiful Jira Style. 

```velocity
#set($blockedInwardIssues = $links.getOutwardIssuesFromForm(10000))
#foreach($blockedInwardIssue in $blockedInwardIssues)
    #if($blockedInwardIssue.reporter == $currentUser && $blockedInwardIssue.assignee)
        summary: $issueFieldRender.getFieldValueHtml($blockedInwardIssue, "summary")<br>
		assignee: $issueFieldRender.getFieldValueHtml($blockedInwardIssue, "assignee")<br>
        pririty: $issueFieldRender.getFieldValueHtml($blockedInwardIssue, "priority")<br>
        components: $issueFieldRender.getFieldValueHtml($blockedInwardIssue, "components")<br>
    #end
#end
```



## How to get custom field values from issue list? ## 
$cfValues is used to get custom field values.
$cfValues can return field values stored in the database and values that the user specifies on the screen.

Example of getting data from the database for current issue.
```velocity
#set($cfValue = $cfValues.get(10000))##10000 custom field id
$cfValue
```

```velocity
#set($cfValue = $cfValues.get("Custom field name"))
$cfValue
```

Example of getting data from the screen for current issue.

```velocity
#set($cfValue = $cfValues.getFromForm(10000))##10000 custom field id
$cfValue
```

```velocity
#set($cfValue = $cfValues.getFromForm("Custom field name"))
$cfValue
```


For issue list use the methods $cfValues.get(issue, "Custom field name")

```velocity
#set($blockedInwardIssues = $links.getInwardIssuesFromForm(10000))
#foreach($blockedInwardIssue in $blockedInwardIssues)
    #if($cfValues.get($blockedInwardIssue, "Custom field name").contains($currentUser) && $blockedInwardIssue.assignee)
        $!cfValues.get($blockedInwardIssue, "Custom field name"),
        $!cfValues.get($blockedInwardIssue, "Custom field name2"),
        $!cfValues.get($blockedInwardIssue, "Custom field name3")<br>
    #end
#end
```

Also you can use $issueFieldRender for rendering field values in Jira Style. 

```velocity
#set($blockedInwardIssues = $links.getInwardIssuesFromForm(10000))
#foreach($blockedInwardIssue in $blockedInwardIssues)
    #if($blockedInwardIssue.reporter == $currentUser && $blockedInwardIssue.assignee)
        $!issueFieldRender.getFieldValueHtml($blockedInwardIssue, "Custom field name"),
        $!issueFieldRender.getFieldValueHtml($blockedInwardIssue, "Custom field name2"),
        $!issueFieldRender.getFieldValueHtml($blockedInwardIssue, "Custom field name3")<br>
    #end
#end
```


## How to display issue list and specified fields in tabular form? ##

$issueFieldRender variable has method for displaying issue list and specified fields in tabular form.

$issueFieldRender.getAsTableHtml(issues, fields)
issues - issue list
fields - field list

```velocity
$issueFieldRender.getAsTableHtml( 
    	$jqlService.getIssuesByJQL("priority = $formIssue.priority.name ORDER BY Key DESC", 5), 
    	"issue key", "Priority", "Assignee", "customfield_10110", "Product categorization", "10110"
    	)
```

```velocity
#set($blockedInwardIssues = $links.getInwardIssuesFromForm(10000))
$issueFieldRender.getAsTableHtml( 
    	$blockedInwardIssues, 
    	"issue key", "Priority", "Assignee", "customfield_10110", "Product categorization", "10110"
    	)
```