---
title: Dynamic templates - Examples
key: message-field
excerpt: "Practical examples of dynamic template variables and implementation for creating context-aware messages with real-time data."
category: templates-customization
tags: [doc, server, datacenter, messaging, dynamic-templates, velocity, examples, variables, real-time-data, customization]
---
Examples of using variables that are available for use in dynamic templates.

{:.no_toc}
* TOC
{:toc}

📑[Java doc for Message field](/jira/plugins/message-field/java/doc/).

You can see the official user guide for velocity [here](http://velocity.apache.org/engine/1.7/user-guide.html).

## Velocity Template Basics

### Default Values for Variables

When working with variables that might be null or undefined, you can use these approaches to provide default values:

**Silent Reference Notation**
```velocity
$!variable
```
This displays an empty string if the variable is null, instead of showing the literal `$variable`.

**Conditional Statement with Default Value**
```velocity
#if($variable)$variable#else Default value #end
```
This checks if the variable exists and has a value, otherwise displays the default.

**Macro for Reusable Default Values**
```velocity
#macro(default $value $defaultValue)#if($value)$value#else$defaultValue#end#end
```
Add this macro at the beginning of your template, then use it like:
```velocity
#default($issue.assignee "Not assigned")
#default($cfValues.getFromForm("Custom Field") "No value set")
```

**Examples:**
```velocity
## Silent reference - shows empty string if assignee is null
Assignee: $!issue.assignee.displayName

## Conditional with default text
Assignee: #if($issue.assignee)$issue.assignee.displayName#else Not assigned #end

## Using macro (add macro definition at top of template)
#macro(default $value $defaultValue)#if($value)$value#else$defaultValue#end#end
Assignee: #default($issue.assignee.displayName "Not assigned")
Priority: #default($formIssue.priority.name "No priority set")
```

### Core Velocity Syntax

#### [How to set the value of variable?](http://velocity.apache.org/engine/1.7/user-guide.html#hello-velocity-world)

    
    #set( $foo = "Velocity" )
    Hello $foo World!
    
    
#### [Conditionals](http://velocity.apache.org/engine/1.7/user-guide.html#conditionals)

    #set( $foo = "Velocity" )
    
    Hello 
    #if( $foo )
        <strong>Velocity!</strong>
    #end
    World!
    
#### [Loops](http://velocity.apache.org/engine/1.7/user-guide.html#loops)

    <ul>
    #foreach( $product in $allProducts )
        <li>$product</li>
    #end
    </ul>
    
#### [Comments](http://velocity.apache.org/engine/1.7/user-guide.html#comments)

    ## This is a single line comment.  
    
    #*
      Thus begins a multi-line comment. Online visitors won't
      see this text because the Velocity Templating Engine will
      ignore it.
    *#   

## Data Access Methods

### Form Data Access

#### How to use $form? Get raw data from issue screen

    $form.summary <br>
    $form.customfield_10400
    
#### How to use $formIssue? Get valid data from the issue screen
[see Java doc $formIssue](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FormIssue.html) 
    
    $formIssue.summary <br>
    $formIssue.priority.name <br>
    #if($formIssue.assignee)
        $formIssue.assignee.displayName<br>
    #else
        Unassigned<br>
    #end

### Custom Field Values ($cfValues)

[see Java doc $cfValues](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/CFValues.html) 

The CFValues utility provides comprehensive methods for accessing custom field values from issues and forms.

#### How to get the value of a custom field for an $issue
    
    $cfValues.get(10100)<br>
    $cfValues.get("customfield_10100")<br>
    $cfValues.get("Custom field name")<br>
    
    $cfValues.getOrDefault(10100, "Default value")<br>
    $cfValues.getOrDefault("customfield_10100", 123)<br>
    $cfValues.getOrDefault("Custom field name", $issue.assignee)<br>
    
    ##use for get value for linked issue
    $cfValues.get($linkedIssue, 10100)<br>
    $cfValues.getOrDefault($linkedIssue, "customfield_10100", "Default value")<br>
    $cfValues.getOrDefault($linkedIssue, "Custom field name", 123)<br>
    
#### How to get the value of a custom field for an $formIssue
    
    $cfValues.getFromForm(10100)<br>
    $cfValues.getFromForm("customfield_10100")<br>
    $cfValues.getFromForm("Custom field name")<br>
    
    $cfValues.getFromFormOrDefault(10100, "Default value")<br>
    $cfValues.getFromFormOrDefault("customfield_10100", 123)<br>
    $cfValues.getFromFormOrDefault("Custom field name", $issue.assignee)<br>

#### How to get raw values from form (without type conversion)

The `getRawCFValueFromForm` methods return the raw value from the form without any type conversion:

```velocity
## Get raw value by field ID as number
#set($rawValue = $cfValues.getRawCFValueFromForm(10100))

## Get raw value by field ID as string
#set($rawValue = $cfValues.getRawCFValueFromForm("customfield_10100"))

## Example: Working with raw JSON data from a text field
#set($jsonData = $cfValues.getRawCFValueFromForm("customfield_10200"))
#if($jsonData)
    ## Parse JSON data
    #set($parsedData = $JSON.parse($jsonData))
    #if($parsedData)
        Configuration loaded: $parsedData.get("configName")
    #end
#end

## Example: Checking raw form values before type conversion
#set($rawSelectValue = $cfValues.getRawCFValueFromForm(10300))
#if($rawSelectValue)
    Raw select field value (option ID): $rawSelectValue
    ## Compare with converted value
    #set($convertedValue = $cfValues.getFromForm(10300))
    Converted value (option object): $convertedValue.value
#end
```


### Issue Field Access

#### How to use issue type

    #if($formIssue.issueType.name == 'Task')
         message for 'Task'
    #elseif($formIssue.issueType.name == 'Bug')
         message for 'Bug'
    #end

or

    #if($formIssue.issueType.id == 10000)
         message for 'Task'
    #elseif($formIssue.issueType.id == 10001)
         message for 'Bug'
    #end

or

    #if($issue.issueType.name == 'Task')
         message for 'Task'
    #elseif($issue.issueType.name == 'Bug')
         message for 'Bug'
    #end

($issue - this variable is not defined on the creation screen)
   

#### How to use issue status

    #if($issue.status.name == 'To Do')
         message for 'To Do' status
    #elseif($issue.status.name == 'In progress')
         message for 'In progress' status
    #end
    
or 

    #if($issue.status.id == 10000)
         message for 'To Do' status
    #elseif($issue.status.id == 10001)
         message for 'In progress' status
    #end

#### Get parent issue

 
    $formIssue.parentObject.key
    $issue.parentObject.key

    #if($formIssue.parentObject)
      $cfValues.get($formIssue.parentObject, "Impact").value ## impact - custom select field
    #end


## Message Display Configuration

### How to use $fieldDisplayConfig? How to change the display of a message?
[see Java doc $fieldDisplayConfig](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FieldDisplayConfigDto.html) 

    $fieldDisplayConfig.setAsFlag(true) ## true, false
    $fieldDisplayConfig.setMessageType("info") ## "info", "error", "success", "warning", "change", "SIMPLE_VIEW"
    $fieldDisplayConfig.setTitle("New title") 
    $fieldDisplayConfig.setShowForFieldId("summary") ## "customfield_10100"
    $fieldDisplayConfig.setInsert("before") ## "append", "prepend", "before", "after" 
    $fieldDisplayConfig.setHidden(true)
    
### How to hide a message?
[see Java doc $fieldDisplayConfig](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FieldDisplayConfigDto.html)
    
    #set ($optionCustomFieldValue = $cfValues.getFromForm("Option custom field name"))
    #if($optionCustomFieldValue.value == "option 1" )
        $fieldDisplayConfig.setTitle("New title for option 1")
        Body text for option 1<br> 
    #elseif($optionCustomFieldValue.value == "option 2" )
        #set ($titleForOption2 = "New title for " + $optionCustomFieldValue.value)
           $fieldDisplayConfig.setTitle($titleForOption2)
           Body text for option 2<br>
    #else
        $fieldDisplayConfig.setHidden(true)##hide
    #end


### How to change message colour?
[see Java doc $fieldDisplayConfig](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FieldDisplayConfigDto.html)


<a href="/uploads/message-field/message-field-random-colors.gif" target="_blank"><img src="/uploads/message-field/message-field-random-colors.gif" alt="Jira search results showing Message Field banners with dynamically changing random colors" width="100%" loading="lazy"></a>


    $fieldDisplayConfig.setMessageType("custom") ##require for custom colors
    #set($r = $mathTool.random(0,255))
    #set($g = $mathTool.random(0,255))
    #set($b = $mathTool.random(0,255))
    $fieldDisplayConfig.setBackgroundColor("rgb($r,$g,$b)") ## color as hex "#FFFFFF", "rgb(255,255,255)", "rgba(255,255,255, 1)"
    #set($r = $mathTool.random(0,255))
    #set($g = $mathTool.random(0,255))
    #set($b = $mathTool.random(0,255))
    $fieldDisplayConfig.setTextColor("rgb($r,$g,$b)")
    #set($r = $mathTool.random(0,255))
    #set($g = $mathTool.random(0,255))
    #set($b = $mathTool.random(0,255))
    $fieldDisplayConfig.setIconColor("rgb($r,$g,$b)")
    
    
    $issue.key: $issue.summary

## Context and State Variables

### How to use $context, $transitionId and $transitionName?

    #if($context == "TRANSITION")
    	is transitionId 31 ? #if($transitionId == 31) Yes #else No #end <br>
    	is transitionName "In Progress" ? #if($transitionName == "In Progress") Yes #else No #end<br>
    #end

### How to check how long ago the transition was made? (How to use $secAfterLastTransition)

      $fieldDisplayConfig.setHidden(true)##hide message by default (Including cases when there were no transitions yet.)

      #if($secAfterLastTransition && $secAfterLastTransition < 1*60)##We check that less than 1 minute has passed since the last transition (the time is indicated as a number of seconds)
		$fieldDisplayConfig.setHidden(false)## Show a message if the transition was not long ago. (< 1 min ago)
		
		##message edit here
		data:<br>
		$secAfterLastTransition<br>
		$previousStatusId <br>
		$previousStatusName <br>

      #end

### How to use and check linked issues?
[see Java doc $links](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/Links.html)

The Links utility provides comprehensive methods for working with issue links. All methods can be called with or without parameters to filter by link type.

#### Available methods:

**Outward Issues and Links:**
- `getOutwardIssues()` - Get all outward linked issues
- `getOutwardIssues(String linkTypeName)` - Get outward issues by link type name
- `getOutwardIssues(long linkTypeId)` - Get outward issues by link type ID
- `getOutwardIssuesFromForm()` - Get outward issues including form data
- `getOutwardIssuesFromForm(String linkTypeName)` - Get outward issues from form by type name
- `getOutwardIssuesFromForm(long linkTypeId)` - Get outward issues from form by type ID
- `getRawOutwardIssuesFromForm()` - Get only form data outward issues
- `getRawOutwardIssuesFromForm(String linkTypeName)` - Get raw form outward issues by type
- `getRawOutwardIssuesFromForm(long linkTypeId)` - Get raw form outward issues by type ID
- `getOutwardLinks()` - Get all outward issue links
- `getOutwardLinks(String linkTypeName)` - Get outward links by type name
- `getOutwardLinks(long linkTypeId)` - Get outward links by type ID

**Inward Issues and Links:**
- `getInwardIssues()` - Get all inward linked issues
- `getInwardIssues(String linkTypeName)` - Get inward issues by link type name
- `getInwardIssues(long linkTypeId)` - Get inward issues by link type ID
- `getInwardIssuesFromForm()` - Get inward issues including form data
- `getInwardIssuesFromForm(String linkTypeName)` - Get inward issues from form by type name
- `getInwardIssuesFromForm(long linkTypeId)` - Get inward issues from form by type ID
- `getRawInwardIssuesFromForm()` - Get only form data inward issues
- `getRawInwardIssuesFromForm(String linkTypeName)` - Get raw form inward issues by type
- `getRawInwardIssuesFromForm(long linkTypeId)` - Get raw form inward issues by type ID
- `getInwardLinks()` - Get all inward issue links
- `getInwardLinks(String linkTypeName)` - Get inward links by type name
- `getInwardLinks(long linkTypeId)` - Get inward links by type ID

#### Examples:

**Basic usage - check blocked issues:**
   
    #set ($blockedIssues = $links.getOutwardIssues("blocked"))
    #if($blockedIssues.size() > 0)
        #foreach($blockedIssue in $blockedIssues)
            $blockedIssue.status.name $cfValues.getOrDefault($blockedIssue, "developer custom field", "hasn't developer")<br>
        #end
    #end

**Check all linked issues (both directions):**
```velocity
## Get all outward issues
#set($outwardIssues = $links.getOutwardIssues())
#set($inwardIssues = $links.getInwardIssues())

#if($outwardIssues.size() > 0 || $inwardIssues.size() > 0)
    <h4>Linked Issues:</h4>
    
    #if($outwardIssues.size() > 0)
        <h5>This issue links to:</h5>
        <ul>
        #foreach($issue in $outwardIssues)
            <li>$issue.key - $issue.summary ($issue.status.name)</li>
        #end
        </ul>
    #end
    
    #if($inwardIssues.size() > 0)
        <h5>Issues linking to this:</h5>
        <ul>
        #foreach($issue in $inwardIssues)
            <li>$issue.key - $issue.summary ($issue.status.name)</li>
        #end
        </ul>
    #end
#else
    <p>No linked issues found.</p>
#end
```

**Work with specific link types:**
```velocity
## Check if issue is blocked
#set($blockers = $links.getInwardIssues("Blocks"))
#if($blockers.size() > 0)
    <div style="background: #ffebee; padding: 10px;">
        <h4>⛔ This issue is blocked by:</h4>
        #foreach($blocker in $blockers)
            <p>$blocker.key - $blocker.summary 
            #if($blocker.status.name != "Done")
                <span style="color: red;">(Still Open)</span>
            #end
            </p>
        #end
    </div>
#end

## Check dependencies
#set($dependencies = $links.getOutwardIssues("Dependency"))
#if($dependencies.size() > 0)
    <h4>Dependencies:</h4>
    #foreach($dep in $dependencies)
        - $dep.key: $dep.summary (Status: $dep.status.name)<br>
    #end
#end
```

**Working with form data (for create/edit screens):**
```velocity
## Get links including unsaved changes from form
#set($allOutwardIssues = $links.getOutwardIssuesFromForm())
#if($allOutwardIssues.size() > 0)
    <p>Total linked issues (including unsaved): $allOutwardIssues.size()</p>
#end

## Get only new links from form (not yet saved)
#set($newLinks = $links.getRawOutwardIssuesFromForm())
#if($newLinks.size() > 0)
    <p style="color: orange;">⚠️ You are adding $newLinks.size() new link(s)</p>
#end
```
## Utility Services

### JQL Service ($jqlService)
* [see Java doc $jqlService](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/JqlService.html)<br/>
* linked Post: [How to use linked issues and JQL results in Dynamic templates?](/How-to-use-linked-issues-and-JQL-results-in-Dynamic-templates/)

#### Available methods:

**Search methods:**
- `getIssuesByJQL(String jql, int maxCount)` - Search issues with current user's permissions

**Count methods:**
- `getIssueCountByJQL(String jql)` - Count issues with current user's permissions

#### How to use JQL in message?

```velocity 
$jqlService.getIssuesByJQL("priority = $formIssue.priority.name ORDER BY Key DESC", 10)
``` 

You can use current issue in jql for conditions:    

    #if($jqlService.getIssueCountByJQL("key = $issue.key and updated < startOfDay(-2)") > 0)
        The problem has not been updated for more than two days.
    #end

#### Advanced JQL examples:

**Count issues for statistics:**
```velocity
#set($criticalCount = $jqlService.getIssueCountByJQL("project = $issue.projectObject.key AND priority = Critical AND status != Done"))
#set($highCount = $jqlService.getIssueCountByJQL("project = $issue.projectObject.key AND priority = High AND status != Done"))

#if($criticalCount > 0 || $highCount > 0)
    <div style="background: #fff3cd; padding: 10px;">
        <h4>⚠️ Project has high priority issues:</h4>
        <p>Critical: $criticalCount issues</p>
        <p>High: $highCount issues</p>
    </div>
#end
```

#### How to show fields for issues by JQL in message?
* [see Java doc $jqlService](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/JqlService.html)<br/>
* linked Post: [How to use linked issues and JQL results in Dynamic templates?](/How-to-use-linked-issues-and-JQL-results-in-Dynamic-templates/)


```velocity 
$issueFieldRender.getAsTableHtml( 
  $jqlService.getIssuesByJQL("priority = $formIssue.priority.name ORDER BY Key DESC", 5), 
  "issue key", "Priority", "Assignee", "customfield_10110", "Product categorization", "10110"
  )
``` 

### Issue Field Renderer ($issueFieldRender)

[see Java doc $issueFieldRender](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/IssueFieldRender.html)

The Issue Field Renderer provides methods for rendering issue fields and formatting data.

#### Available methods:

- `getFieldValueHtml(Issue issue, long customFieldId)` - Get HTML rendered value of custom field by ID
- `getFieldValueHtml(Issue issue, String field)` - Get HTML rendered value of field by name/ID
- `getFieldName(long customFieldId)` - Get the name of a custom field by its ID
- `getFieldName(String fieldForView)` - Get the name of a field by its string identifier
- `getAsTableHtml(List<Issue> issues, String... fields)` - Render issues as HTML table
- `getAsTableHtml(Issue issue, String... fields)` - Render single issue fields as HTML table
- `getJQLAsTableHtml(String jql, int maxCount, String... fields)` - Execute JQL and render results as table
- `replaceNewlineCharactersForHtml(String string)` - Convert newlines to HTML breaks
- `dateFormat(Date date, String format)` - Format date with specified pattern

#### How to show fields from linked issues (also on Service Desk Portal)?

This example uses a different our plugin: [Display linked issues](https://marketplace.atlassian.com/apps/1223203/display-linked-issues?hosting=datacenter&tab=overview)
1) Create and configure field "Linked issues":

<a href="/uploads/message-field/dynamic-templates-examples/linked-issues-config.webp" target="_blank">
<img src="/uploads/message-field/dynamic-templates-examples/linked-issues-config.webp" alt="Linked issues field configuration with link types, fields selection, and issue key input" width="50%" loading="lazy"></a>

2) After creating the "linked issues" field, you can display it in the message body:


    $issueFieldRender.getFieldValueHtml($issue,"customfield_10101")

3) Result:
   
   <table><tr>
   <td><a href="/uploads/message-field/dynamic-templates-examples/render-another-field-1.webp" target="_blank">
<img src="/uploads/message-field/dynamic-templates-examples/render-another-field-1.webp" alt="screenshot" width="100%" loading="lazy"></a></td>
   </tr>
   <tr>
   <td><a href="/uploads/message-field/dynamic-templates-examples/render-another-field-2.webp" target="_blank">
<img src="/uploads/message-field/dynamic-templates-examples/render-another-field-2.webp" alt="screenshot" width="100%" loading="lazy"></a></td>
   </tr></table>


#### How to display the date in the correct format?
[see Java doc $issueFieldRender](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/IssueFieldRender.html)

```velocity 
$issueFieldRender.dateFormat($formIssue.created, "dd-MMM-yyy HH:mm")
<br/>
$issueFieldRender.dateFormat($formIssue.created, "dd-MM-yyyy")
``` 

Result:
<a href="/uploads/message-field/dynamic-templates-examples/dateformat.webp" target="_blank">
<img src="/uploads/message-field/dynamic-templates-examples/dateformat.webp" alt="Message field banner showing formatted dates: 12-Jan-2023 00:10 and 12-01-2023" width="50%" loading="lazy"></a>

#### How to show the multiline value of a text field?
[see Java doc $issueFieldRender](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/IssueFieldRender.html)

```velocity 
<b>original value of issueForm field "description":</b><br/>
$formIssue.description
<br/>
<b>After formating for better look:</b><br/>
$issueFieldRender.replaceNewlineCharactersForHtml($formIssue.description)
<br/
<br/>
<b>Original value of issueForm custom field "Text Field (multi-line)":</b><br/> ## customfield_10102
$cfValues.getFromForm("customfield_10102")
<br/>
<br/>
<b>After formating for better look:</b><br/>
$issueFieldRender.replaceNewlineCharactersForHtml($cfValues.getFromForm("Text Field (multi-line)"))

<hr/>

<b>HTML render available for any field of issue:</b><br/>
<b>Description:</b><br/>
$issueFieldRender.getFieldValueHtml($issue, "description")
<br/>
<b>Text Field (multi-line):</b><br/>
$issueFieldRender.getFieldValueHtml($issue, "customfield_10102")

``` 

Result:
<a href="/uploads/message-field/dynamic-templates-examples/replaceNewlineCharactersForHtml.webp" target="_blank">
<img src="/uploads/message-field/dynamic-templates-examples/replaceNewlineCharactersForHtml.webp" alt="screenshot" width="50%" loading="lazy"></a>

#### How to get field names dynamically?

```velocity
## Get custom field name by ID
#set($fieldName = $issueFieldRender.getFieldName(10100))
<p>Field 10100 is named: $fieldName</p>

## Get field name by field key
#set($summaryName = $issueFieldRender.getFieldName("summary"))
<p>Summary field display name: $summaryName</p>
```

#### How to render JQL results directly as a table?

```velocity
## Execute JQL and display results as table
$issueFieldRender.getJQLAsTableHtml(
    "project = $issue.projectObject.key AND created >= -7d", 
    10,
    "Key", "Summary", "Status", "Assignee", "Created"
)

## Display single issue data as table
$issueFieldRender.getAsTableHtml(
    $issue,
    "Summary", "Status", "Priority", "Assignee", "customfield_10100"
)
```


## Field Validation Examples

### Priority Validation


<a href="/uploads/message-field/dynamic-templates-examples/priority.gif" target="_blank"><img src="/uploads/message-field/dynamic-templates-examples/priority.gif" alt="Create issue form with Priority dropdown set to Medium, no message banner visible" width="50%" loading="lazy"></a>

      #if($formIssue.priority.name == "Blocker")
      $fieldDisplayConfig.setMessageType("error")
      
          State the reason for the Blocker priority. ##Message text
      #elseif($formIssue.priority.name == "High")
          $fieldDisplayConfig.setMessageType("warning")
        
          State the reason for the High priority. ##Message text
      #end

### Component Validation

      #foreach($component in $formIssue.components)
         #if($component.name == "Test component")

            You have selected a test component ##Message text
         #end
      #end

### Summary Validation


<a href="/uploads/message-field/dynamic-templates-examples/summary.gif" target="_blank"><img src="/uploads/message-field/dynamic-templates-examples/summary.gif" alt="Create issue form showing 'Short summary' info message appearing below Summary field" width="50%" loading="lazy"></a>

      #if($formIssue.summary.contains("PROJECTKEY"))
         message contains PROJECTKEY<br> ##Message text
      #end

      #if($formIssue.summary.matches("(.*)PROJECTKEY(.*)"))
         message contains PROJECTKEY (cheked by regex)<br> ##Message text
      #end

      #if($formIssue.summary.length() < 10)
         Short summary<br> ##Message text
      #end

### Description and User Picker Validation


<a href="/uploads/message-field/dynamic-templates-examples/description-and-user-picker(single).gif" target="_blank"><img src="/uploads/message-field/dynamic-templates-examples/description-and-user-picker(single).gif" alt="description-and-user-picker(single).gif" width="50%" loading="lazy"></a>

      #if(!$form.description || $form.description.trim() == "" || !$cfValues.getFromForm("User Picker (single user)"))
         You need to set data in the system description field and specify the user in the custom field "User Picker (single user)" ##Message text
      #end

### Number Field Validation


<a href="/uploads/message-field/dynamic-templates-examples/numbers.gif" target="_blank"><img src="/uploads/message-field/dynamic-templates-examples/numbers.gif" alt="Check number custom field.gif" width="50%" loading="lazy"></a>

      #if($cfValues.getFromForm("Number") > 10)
         number > 10 ##Message text
      #end

### Select Field Validation


<a href="/uploads/message-field/dynamic-templates-examples/selects.gif" target="_blank"><img src="/uploads/message-field/dynamic-templates-examples/selects.gif" alt="Check option from custom select field(checkbox or radio).gif" width="50%" loading="lazy"></a>

      #if($cfValues.getFromForm("Radio").optionId == 10102)
         Selected option with Id 10102<br> ##Message text
      #end

      #if($cfValues.getFromForm("Single select field").name == "yes")
          Selected option with name  "yes"<br> ##Message text
      #end

      #if($form.customfield_10202.indexOf("10301") > -1)
         "Select List (multiple choices)" contains otpion with id 10301(option2) ##Message text
      #end

## Advanced Features

### Multi-language Messages

      #if($language == "es")
          mensaje en español<br>
          línea 2
      #elseif($language == "fr")
          message en français<br>
          ligne 2
      #else
          message in english<br>
          line 2<br>
      #end


### Cascade Select Field

#### Working with $cfValues:

      1 - $cfValues.getFromForm(10101)<br>
      2 - $cfValues.getFromForm("customfield_10101")<br>
      3 - $cfValues.getFromForm("customfield_10101").getOptionId()<br>
      4 - $cfValues.getFromForm("customfield_10101").getValue()<br>
      5 - $cfValues.getFromForm("customfield_10101:1")<br>
      6 - $cfValues.getFromForm("customfield_10101:1").getOptionId()<br>
      7 - $cfValues.getFromForm("customfield_10101:1").getValue()<br>
      8 - $cfValues.getFromForm("cascade test")<br>
      9 - $cfValues.getFromForm("cascade test:1")<br>
      <br>
      10 - $cfValues.getFromFormOrDefault("customfield_10101", "defaultOption")<br>
      11 - $cfValues.getFromFormOrDefault("customfield_10101:1", "defaultOption")<br>
      12 - $cfValues.getFromFormOrDefault("cascade test", "defaultOption")<br>
      13 - $cfValues.getFromFormOrDefault("cascade test:1", "defaultOption")<br>
      14 - $cfValues.getFromFormOrDefault("cascade test1:1", "defaultOption")<br>
      15 - $cfValues.getFromFormOrDefault("cascade test1:12", "defaultOption")<br>
      <br>
      16 - $cfValues.get(10101)<br>
      17 - $cfValues.get(10101).get(null)<br>
      18 - $cfValues.get(10101).get("1")<br>
      19 - $cfValues.get("customfield_10101")<br>
      20 - $cfValues.get("customfield_10101").get(null).getValue()<br>
      21 - $cfValues.get("customfield_10101").get("1").getValue()<br>
      22 - $cfValues.get("customfield_10101").get(null).getOptionId()<br>
      23 - $cfValues.get("customfield_10101").get("1").getOptionId()<br>
      <br>
      24 - $cfValues.getOrDefault("customfield_10101", "defaultValue")<br>
      25 - $cfValues.getOrDefault("customfield_10101", 10000).get(null).getOptionId()<br>
      26 - $cfValues.getOrDefault("customfield_10101", 10000).get("1").getOptionId()<br>
      27 - $cfValues.getOrDefault("cascade test", "defaultOption")<br>
      28 - $cfValues.getOrDefault("cascade test", "defaultOption").get(null).getValue()<br>
      29 - $cfValues.getOrDefault("cascade test", "defaultOption").get("1").getValue()<br>
      30 - $cfValues.getOrDefault("cascade test123123", "defaultOption")<br>
      31 - $cfValues.getOrDefault("cascade test1:12", 10000)<br>

#### Working with $form object directly:

When working with cascade select fields through the `$form` object, you access the raw option IDs:

```velocity
## Get parent option ID from form
#set($parentOptionId = $form.get("customfield_10101"))
#if($parentOptionId)
    Parent option ID: $parentOptionId
#end

## Get child option ID from form
#set($childOptionId = $form.get("customfield_10101:1"))
#if($childOptionId)
    Child option ID: $childOptionId
#end

## Example: Conditional logic based on cascade select values
#if($form.get("customfield_10101") == "10000")
    ## Parent option with ID 10000 is selected
    #if($form.get("customfield_10101:1") == "10100")
        ## Child option with ID 10100 is selected
        <p>You selected: Category A -> Subcategory 1</p>
    #elseif($form.get("customfield_10101:1") == "10101")
        <p>You selected: Category A -> Subcategory 2</p>
    #end
#elseif($form.get("customfield_10101") == "10001")
    ## Parent option with ID 10001 is selected
    <p>You selected Category B</p>
#end

## Example: Validate cascade select combinations
#set($parentId = $form.get("customfield_10101"))
#set($childId = $form.get("customfield_10101:1"))

#if($parentId == "10000" && (!$childId || $childId == ""))
    <div style="color: red;">
        ⚠️ Please select a subcategory for Category A
    </div>
#end

## Example: Dynamic message based on cascade selection
#set($cascadeMessages = {
    "10000": {
        "10100": "Development -> Frontend: Please follow React guidelines",
        "10101": "Development -> Backend: Ensure API documentation is updated",
        "10102": "Development -> Database: Include migration scripts"
    },
    "10001": {
        "10200": "Testing -> Manual: Create test cases in TestRail",
        "10201": "Testing -> Automated: Add to regression suite"
    }
})

#set($parentId = $form.get("customfield_10101"))
#set($childId = $form.get("customfield_10101:1"))

#if($parentId && $childId)
    #set($message = $cascadeMessages.get($parentId).get($childId))
    #if($message)
        <div style="background: #e3f2fd; padding: 10px;">
            📌 $message
        </div>
    #end
#end

## Example: Get all form values for debugging
#foreach($key in $form.keys())
    #if($key.startsWith("customfield_10101"))
        Form key: $key = $form.get($key)<br>
    #end
#end
```


<b>Issue create screen</b>: 
<a href="/uploads/message-field/dynamic-templates-examples/cascadeselect-create.webp" target="_blank">
<img src="/uploads/message-field/dynamic-templates-examples/cascadeselect-create.webp" alt="screenshot" width="50%" loading="lazy"></a>   

<b>Other issue screens</b>:
<a href="/uploads/message-field/dynamic-templates-examples/cascadeselect-edit-view.webp" target="_blank">
<img src="/uploads/message-field/dynamic-templates-examples/cascadeselect-edit-view.webp" alt="screenshot" width="50%" loading="lazy"></a>   

<b>Conditions</b>:


      #if($cfValues.getFromForm(10101) == "parent1")
         message<br>
      #end
      #if($cfValues.getOrDefault("cascade test", "defaultOption").get("1").getValue() == "child1")
         message2<br>
      #end
      #if($cfValues.getFromForm("customfield_10101").getOptionId() == 10000)
         message3<br>
      #end

### Insight Service ($insightService)

[see Java doc $insightService](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/InsightService.html)

      $insightService.findObjects("key = TEST-1", 1) ##find (1) object by IQL
      <br>
      $insightService.findObjects("key = TEST-1", 1).get(0).getObjectAttributeBeans() ##get all attribute's ids from first object
      <br>
      $insightService.getIQLAsTableHtml("key = TEST-1", 1, "Key", "Created", "Name", "Updated") ## use attribute's names
      <br>
      $insightService.getIQLAsTableHtml("key = TEST-1", 1, 3, 2, 1, 4) ## use attribute's ids
      <br>
      $insightService.getIQLAsTableHtml("key = TEST-1", 1, 3, 2, 1, 4) ## use attribute's ids
      <br>
      search by objectId:<br>
      $insightService.getIQLAsTableHtml("objectId = 1", 1, "Key", "Created", "Name", "Updated") ## search by objectId and display attributes by names
      <br>
      Work with insight object custom field:<br>
      #if($cfValues.getFromForm(10200))#insight custom field. If value isn't empty IQL will use id from insight object(value).
	     $insightService.getIQLAsTableHtml("objectId = $cfValues.getFromForm(10200).id", 1, "Key", "Created", "Name", "Updated") ## search by objectId and display attributes by names
      #end


### User Group Service ($userGroupService)

[see Java doc $userGroupService](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/UserGroupService.html)

**Get user by username:**
```velocity
#set($user = $userGroupService.getUserByName("john.doe"))
#if($user)
    User found: $user.displayName ($user.emailAddress)
#else
    User not found
#end
```

**Result (if user exists):**

User found: John Doe (john.doe@company.com)

**Result (if user doesn't exist):**

User not found

**Check if user is in group:**
```velocity
## Check if specific user is in administrators group
#if($userGroupService.isUserInGroup("john.doe", "jira-administrators"))
    User john.doe is an administrator
#else
    User john.doe is not an administrator
#end

## Check if current user is in specific group
#if($userGroupService.isUserInGroup($currentUser, "developers"))
    Current user is a developer
#else
    Current user is not a developer
#end
```

**Result (if john.doe is admin and current user is developer):**

User john.doe is an administrator<br>
Current user is a developer

**Result (if john.doe is not admin and current user is not developer):**

User john.doe is not an administrator<br>
Current user is not a developer

**Show different messages based on user group membership:**
```velocity
#if($userGroupService.isUserInGroup($currentUser, "jira-administrators"))
    $fieldDisplayConfig.setMessageType("info")
    <strong>Administrator Access:</strong> You have full system privileges.
#elseif($userGroupService.isUserInGroup($currentUser, "project-managers"))
    $fieldDisplayConfig.setMessageType("success")
    <strong>Project Manager:</strong> You can manage project settings and user assignments.
#elseif($userGroupService.isUserInGroup($currentUser, "developers"))
    $fieldDisplayConfig.setMessageType("warning")
    <strong>Developer Access:</strong> Please follow coding standards and review guidelines.
#else
    $fieldDisplayConfig.setMessageType("error")
    <strong>Limited Access:</strong> Contact your administrator for additional permissions.
#end
```

**Result (for administrator):**

<div class="aui-message aui-message-info" style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; background: #d4edda;">
    <strong>Administrator Access:</strong> You have full system privileges.
</div>

**Result (for project manager):**

<div class="aui-message aui-message-success" style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; background: #d1ecf1;">
    <strong>Project Manager:</strong> You can manage project settings and user assignments.
</div>

**Result (for developer):**

<div class="aui-message aui-message-warning" style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; background: #fff3cd;">
    <strong>Developer Access:</strong> Please follow coding standards and review guidelines.
</div>

**Result (for regular user):**

<div class="aui-message aui-message-error" style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; background: #f8d7da;">
    <strong>Limited Access:</strong> Contact your administrator for additional permissions.
</div>

**Validate assignee group membership:**
```velocity
#if($formIssue.assignee)
    #if($userGroupService.isUserInGroup($formIssue.assignee, "developers"))
        ✓ Assignee is a developer - ready for development
    #elseif($userGroupService.isUserInGroup($formIssue.assignee, "qa-team"))
        ✓ Assignee is a QA team member - ready for testing
    #else
        ⚠️ Warning: Assignee is not in development or QA team
    #end
#else
    ❌ No assignee selected
#end
```

**Result (assignee is developer):**

✓ Assignee is a developer - ready for development

**Result (assignee is QA team member):**

✓ Assignee is a QA team member - ready for testing

**Result (assignee is in other group):**

⚠️ Warning: Assignee is not in development or QA team

**Result (no assignee):**

❌ No assignee selected

**Dynamic user mentions based on group:**
```velocity
#set($supportUsers = ["admin", "support.manager", "help.desk"])
#set($supportTeamMembers = [])

#foreach($username in $supportUsers)
    #if($userGroupService.isUserInGroup($username, "jira-servicedesk-users"))
        #set($user = $userGroupService.getUserByName($username))
        #if($user)
            $supportTeamMembers.add($user)
        #end
    #end
#end

#if($supportTeamMembers.size() > 0)
    <p>Available support team members:</p>
    <ul>
    #foreach($member in $supportTeamMembers)
        <li>$member.displayName - $member.emailAddress</li>
    #end
    </ul>
#else
    <p>No support team members are currently available.</p>
#end
```

**Result (when support members are found):**

<div style="border: 1px solid #ddd; padding: 15px; margin: 10px 0; background: #f9f9f9;">
<p>Available support team members:</p>
<ul>
    <li>System Administrator - admin@company.com</li>
    <li>Support Manager - support.manager@company.com</li>
    <li>Help Desk - help.desk@company.com</li>
</ul>
</div>

**Result (when no support members are found):**

<div style="border: 1px solid #ddd; padding: 15px; margin: 10px 0; background: #f9f9f9;">
<p>No support team members are currently available.</p>
</div>

### Cast Utility ($cast)

[see Java doc $cast](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/Cast.html)

The Cast utility provides methods for safe type conversion in Velocity templates.

#### Available methods:

**toInteger(Object object)**
Converts an object to Integer. Returns null if conversion fails.
```velocity
$cast.toInteger("123")     ## returns 123
$cast.toInteger("abc")     ## returns null
$cast.toInteger(null)      ## returns null
```

**toLong(Object object)**
Converts an object to Long. Returns null if conversion fails.
```velocity
$cast.toLong("9999999999")  ## returns 9999999999L
$cast.toLong("abc")         ## returns null
$cast.toLong(null)          ## returns null
```

**toString(Object object)**
Converts an object to String. Returns null if object is null.
```velocity
$cast.toString(123)         ## returns "123"
$cast.toString($issue)      ## returns string representation
$cast.toString(null)        ## returns null
```

#### Example: Dynamic messages based on issue type and custom field

      #set ($messages = {
          "Story" : {
              10000: "Message for story with option id 10000",
              10001: "Message for story with option id 10001"
          } ,
           "Task" : {
              10000: "Message for task with option id 10000",
              10001: "Message for task with option id 10001"
           }
      })
      
      
      #set($message = $messages.get($formIssue.issueType.name).get(
      $cast.toInteger($cfValues.getFromForm("customfield_10200").optionId)
      ))
      
      #if($message)
         $message
      #else
         $fieldDisplayConfig.setHidden(true)##hide
      #end

### JSON Parser ($JSON)

The JSON utility provides JSON parsing capabilities in Velocity templates.

#### Available methods:

**parse(String jsonString)**
Parses a JSON string and returns a JSONObject. Returns null if parsing fails.

```velocity
#set($jsonString = '{"name": "John", "age": 30, "active": true}')
#set($jsonObject = $JSON.parse($jsonString))

#if($jsonObject)
    Name: $jsonObject.get("name")
    Age: $jsonObject.get("age")
    Active: $jsonObject.get("active")
#else
    Failed to parse JSON
#end
```

#### Example: Working with JSON data from custom fields

```velocity
## Assuming a text field contains JSON data
#set($jsonData = $cfValues.get("JSON Data Field"))
#if($jsonData)
    #set($parsedData = $JSON.parse($jsonData))
    #if($parsedData)
        <h4>Parsed Configuration:</h4>
        <ul>
        #foreach($key in $parsedData.keys())
            <li>$key: $parsedData.get($key)</li>
        #end
        </ul>
    #else
        <p style="color: red;">Invalid JSON format in custom field</p>
    #end
#end
```

### Permission Helper ($permissionHelper)

The Permission Helper provides methods to check user permissions in templates. This utility is only available in non-delegated mode.

#### Available methods:

**hasPermission(String permission)**
Checks if the current user has the specified permission for the current issue.
```velocity
#if($permissionHelper.hasPermission("EDIT_ISSUES"))
    You can edit this issue
#else
    You cannot edit this issue
#end
```

**hasPermission(String permission, ApplicationUser user)**
Checks if the specified user has the permission for the current issue.
```velocity
#if($permissionHelper.hasPermission("ASSIGN_ISSUES", $formIssue.assignee))
    The assignee can assign issues
#end
```

**hasPermission(String permission, Issue issue)**
Checks if the current user has the permission for the specified issue.
```velocity
#set($parentIssue = $formIssue.parentObject)
#if($parentIssue && $permissionHelper.hasPermission("VIEW_ISSUES", $parentIssue))
    You can view the parent issue
#end
```

**hasPermission(String permission, Issue issue, ApplicationUser user)**
Checks if the specified user has the permission for the specified issue.
```velocity
#if($permissionHelper.hasPermission("COMMENT_ISSUES", $linkedIssue, $currentUser))
    You can comment on the linked issue
#end
```

#### Common permission types:
- VIEW_ISSUES - View issues
- CREATE_ISSUES - Create issues  
- EDIT_ISSUES - Edit issues
- ASSIGN_ISSUES - Assign issues
- RESOLVE_ISSUES - Resolve issues
- CLOSE_ISSUES - Close issues
- COMMENT_ISSUES - Add comments
- DELETE_ISSUES - Delete issues
- WORK_ON_ISSUES - Work on issues
- LINK_ISSUES - Link issues

#### Example: Display content based on permissions

```velocity
#if($permissionHelper.hasPermission("EDIT_ISSUES"))
    <div style="background: #e8f5e8; padding: 10px;">
        <h4>✏️ Editor Actions</h4>
        <p>You have permission to edit this issue.</p>
        <p>Remember to follow the editing guidelines.</p>
    </div>
#elseif($permissionHelper.hasPermission("COMMENT_ISSUES"))
    <div style="background: #fff3cd; padding: 10px;">
        <h4>💬 Commenter Access</h4>
        <p>You can add comments but cannot edit the issue.</p>
        <p>Please use comments for suggestions.</p>
    </div>
#else
    <div style="background: #f8d7da; padding: 10px;">
        <h4>👁️ View Only</h4>
        <p>You have read-only access to this issue.</p>
    </div>
#end
```

### Component Accessor ($ComponentAccessor)

The Component Accessor provides access to various Jira components and services. This powerful utility is only available in non-delegated mode.

#### Common usage examples:

**Get Jira managers and services:**
```velocity
## Get various Jira managers
#set($projectManager = $ComponentAccessor.getProjectManager())
#set($userManager = $ComponentAccessor.getUserManager())
#set($groupManager = $ComponentAccessor.getGroupManager())
#set($customFieldManager = $ComponentAccessor.getCustomFieldManager())
#set($versionManager = $ComponentAccessor.getVersionManager())
#set($componentManager = $ComponentAccessor.getProjectComponentManager())
```

**Working with application properties:**
```velocity
#set($appProperties = $ComponentAccessor.getApplicationProperties())
#set($baseUrl = $appProperties.getString("jira.baseurl"))
#set($jiraVersion = $appProperties.getString("jira.version"))

Base URL: $baseUrl
Jira Version: $jiraVersion
```

**Get user information:**
```velocity
#set($userManager = $ComponentAccessor.getUserManager())
#set($user = $userManager.getUserByName("john.doe"))
#if($user)
    User: $user.displayName ($user.emailAddress)
    Active: $user.isActive()
#end
```

**Access custom components:**
```velocity
## Get any component by class
#set($myService = $ComponentAccessor.getComponent("com.example.MyService"))
#if($myService)
    ## Use your custom service
#end

## Get OSGi component
#set($osgiService = $ComponentAccessor.getOSGiComponentInstanceOfType("com.example.MyOsgiService"))
```

#### Example: Display project and version information

```velocity
#set($project = $issue.projectObject)

#if($project)
    <h4>Project Information</h4>
    <p><strong>Project:</strong> $project.name ($project.key)</p>
    <p><strong>Lead:</strong> #if($project.lead) $project.lead.displayName #else Not assigned #end</p>
    
    #set($versions = $versionManager.getVersions($project))
    #if($versions && $versions.size() > 0)
        <h5>Available Versions:</h5>
        <ul>
        #foreach($version in $versions)
            <li>$version.name 
                #if($version.isReleased()) 
                    (Released)
                #else 
                    (Unreleased)
                #end
            </li>
        #end
        </ul>
    #end
#end
```

## Real-World Example Scenarios

### Priority-Based Warning Messages

      #if($issue.getPriorityObject().name == "High")
      <b style="color:red;">Warning: the issue priority is High!</b>
      #else
      <p>Normal priority. Work as usual.</p>
      #end

### Priority-Dependent Validation


<a href="/uploads/message-field/dynamic-template-demo1.gif" target="_blank"><img src="/uploads/message-field/dynamic-template-demo1.gif" alt="dynamic template demo.gif" width="50%" loading="lazy"></a>
      
    #if($formIssue.priority.name == "Blocker")
    	$fieldDisplayConfig.setMessageType("error")
    	#if(!$formIssue.description || $formIssue.description.isEmpty())
    		$fieldDisplayConfig.setShowForFieldId("description")
    		State the reason for the Blocker priority.
    	#elseif(!$formIssue.assignee)
    		$fieldDisplayConfig.setShowForFieldId("assignee")
    		Indicate the responsible employee
    	#else
    	  $fieldDisplayConfig.setHidden(true)
    	#end
    #elseif($formIssue.priority.name == "High")
    	$fieldDisplayConfig.setMessageType("warning")
    	#if($formIssue.description.isEmpty())
    		$fieldDisplayConfig.setShowForFieldId("description")
    		State the reason for the High priority.
    	#else
    	  	  $fieldDisplayConfig.setHidden(true)
    	#end
    #elseif($formIssue.priority.name == "Medium" || $formIssue.priority.name == "Low")
    	$fieldDisplayConfig.setHidden(true)
    #end

### Assignee Information with External Links

      #if($issue.assignee)
        <p>Assignee: $issue.assignee.displayName</p>
        <p>Email: $issue.assignee.emailAddress</p>
      
         #set($slackLink = $issue.assignee.getPropertyValue("slackLink"))
         #if($slackLink)
            <p>Slack: <a href="$slackLink" target="_blank">$slackLink</a></p>
         #else
            <p>No Slack link specified.</p>
         #end
      #else
        <p><i>No assignee</i></p>
      #end

### Issue Type-Specific Messages

      #set($typeName = $issue.issueTypeObject.name)
      
      #if($typeName == "Bug")
      <p>Important for bugs: ensure reproducible steps are provided.</p>
      #elseif($typeName == "Task")
      <p>Task: verify deadlines and resources.</p>
      #else
      <p>Issue type: $typeName. No extra instructions required.</p>
      #end

### Component-Based Team Assignments

      #set($components = $issue.getComponents())
      #if($components && $components.size() > 0)
        <p>Selected components:</p>
        <ul>
          #foreach($comp in $components)
            <li>
              $comp.name
              #if($comp.name == "UI/UX")
                - The design team is responsible for mockup review
              #elseif($comp.name == "Backend")
                - The backend team handles microservices
              #elseif($comp.name == "Mobile")
                - The mobile team checks compatibility with iOS/Android
              #end
            </li>
          #end
        </ul>
      #else
        <p style="color:orange;">No components selected. Please specify at least one!</p>
      #end

### Due Date Warnings

      #set($dueDate = $issue.getDueDate())
      #if($dueDate && $dueDate.before($actionDate))
      <p>The issue is overdue! Date: $dueDate</p>
      #else
      <p>The issue is on schedule or no due date is set.</p>
      #end

### Fix Version Validation

      #set($fixVersions = $issue.getFixVersions())
      #if($fixVersions && $fixVersions.size() > 0)
      <p>Planned for versions:
        #foreach($ver in $fixVersions)
          <strong>$ver.name</strong><br/>
        #end
      </p>
      #else
      <p>No version selected. Please specify the release.</p>
      #end

### Issue Type Requirements

      #set($type = $issue.issueTypeObject.name)
      #if($type == "Bug")
      <p>Please provide reproducible steps.</p>
      #elseif($type == "Story")
      <p>Please describe the expected result and acceptance criteria.</p>
      #else
      <p>No special requirements for type: $type</p>
      #end

### Budget Threshold Alerts

      #set($budgetField = $cfValues.getFromForm("Budget")))
      #if($budgetField && $budgetField > 100000)
      <p style="color:red;">Warning! Budget exceeded 100,000. Additional check required.</p>
      #else
      <p>Budget is within acceptable limits.</p>
      #end

### Component-Specific Reminders

      #set($componentList = $issue.getComponents())
      #set($hasUIUX = false)
      #set($hasBackend = false)
      
      #foreach($comp in $componentList)
         #if($comp.name == "UI/UX")
            #set($hasUIUX = true)
         #elseif($comp.name == "Backend")
            #set($hasBackend = true)
         #end
      #end
      
      #if($hasUIUX)
      <p style="color:purple;">Please coordinate mockups with the design team.</p>
      #end
      #if($hasBackend)
      <p style="color:green;">Check compatibility with the microservices architecture.</p>
      #end
      #if(!$hasUIUX && !$hasBackend)
      <p>No specific components selected, proceeding under standard workflow.</p>
      #end

### Attachment Type Detection

      #set($attachments = $issue.getAttachments())
      #if($attachments && $attachments.size() > 0)
         Attachments in this issue:
         #foreach($attachment in $attachments)
            #if($attachment.filename.endsWith(".xlsx"))
            - Excel File: <a href="$attachment.url" target="_blank">$attachment.filename</a>
            #elseif($attachment.filename.endsWith(".pdf"))
            - PDF Document: <a href="$attachment.url" target="_blank">$attachment.filename</a>
            #else
            - File: <a href="$attachment.url" target="_blank">$attachment.filename</a>
            #end
         #end
      #else
         No attachments found.
      #end

### Additional variables

Apart from the services described above, the following variables are also available in templates:

#### Context and Transition Variables
- `$context` - Current context (CREATE, EDIT, VIEW, TRANSITION, etc.)
- `$transitionId` - ID of the current transition (if in transition context)
- `$transitionName` - Name of the current transition (if in transition context)
- `$previousStatusId` - ID of the previous status (from issue history)
- `$previousStatusName` - Name of the previous status (from issue history)
- `$dateOfLastTransition` - Date when the last transition occurred
- `$secAfterLastTransition` - Seconds elapsed since last transition

#### User and Locale Variables
- `$currentUser` - Currently logged-in user
- `$locale` - Current user's locale
- `$language` - Current language code (e.g., "en", "de")
- `$country` - Current country code
- `$timeZone` - Current user's timezone
- `$nowInUserTimeZone` - Current date/time in user's timezone
- `$currentDateTime` - Current date/time

#### URLs and Base Information
- `$baseUrl` - Jira base URL

#### Show different approval workflows based on user group membership. ####

      #if($userGroupService.isUserInGroup($currentUser, "executives"))
        <div style="border: 2px solid gold; padding: 10px; background: #fff8dc;">
          <h4>🏆 Executive Approval Process</h4>
          <p>As an executive, you can approve high-priority requests immediately.</p>
          <p>Your approval supersedes all other requirements.</p>
        </div>
      #elseif($userGroupService.isUserInGroup($currentUser, "managers"))
        <div style="border: 2px solid blue; padding: 10px; background: #e6f3ff;">
          <h4>👔 Manager Approval Required</h4>
          <p>As a manager, you can approve requests up to $10,000.</p>
          <p>For amounts above $10,000, executive approval is required.</p>
        </div>
      #elseif($userGroupService.isUserInGroup($currentUser, "team-leads"))
        <div style="border: 2px solid green; padding: 10px; background: #e6ffe6;">
          <h4>🎯 Team Lead Review</h4>
          <p>As a team lead, you can approve team resource requests.</p>
          <p>Budget requests require manager approval.</p>
        </div>
      #else
        <div style="border: 2px solid orange; padding: 10px; background: #fff4e6;">
          <h4>📋 Standard Process</h4>
          <p>Your request will go through the standard approval workflow:</p>
          <p>Team Lead → Manager → Executive (if required)</p>
        </div>
      #end

**Result (for executive user):**

<div style="border: 2px solid gold; padding: 10px; background: #fff8dc; margin: 10px 0;">
  <h4>🏆 Executive Approval Process</h4>
  <p>As an executive, you can approve high-priority requests immediately.</p>
  <p>Your approval supersedes all other requirements.</p>
</div>

**Result (for manager user):**

<div style="border: 2px solid blue; padding: 10px; background: #e6f3ff; margin: 10px 0;">
  <h4>👔 Manager Approval Required</h4>
  <p>As a manager, you can approve requests up to $10,000.</p>
  <p>For amounts above $10,000, executive approval is required.</p>
</div>

**Result (for team lead user):**

<div style="border: 2px solid green; padding: 10px; background: #e6ffe6; margin: 10px 0;">
  <h4>🎯 Team Lead Review</h4>
  <p>As a team lead, you can approve team resource requests.</p>
  <p>Budget requests require manager approval.</p>
</div>

**Result (for regular user):**

<div style="border: 2px solid orange; padding: 10px; background: #fff4e6; margin: 10px 0;">
  <h4>📋 Standard Process</h4>
  <p>Your request will go through the standard approval workflow:</p>
  <p>Team Lead → Manager → Executive (if required)</p>
</div>

#### Restrict issue creation based on user group and show appropriate guidance. ####

      #if($context == "CREATE")
        #if($userGroupService.isUserInGroup($currentUser, "restricted-users"))
          $fieldDisplayConfig.setMessageType("error")
          <h4>❌ Access Restricted</h4>
          <p>Your account has limited permissions for creating issues in this project.</p>
          <p>Please contact your project administrator to request access.</p>
          <p>Administrator: <strong>admin@company.com</strong></p>
        #elseif($userGroupService.isUserInGroup($currentUser, "external-contractors"))
          $fieldDisplayConfig.setMessageType("warning")
          <h4>⚠️ External Contractor Guidelines</h4>
          <p>As an external contractor, please ensure:</p>
          <ul>
            <li>All issues are clearly described with acceptance criteria</li>
            <li>Estimated hours are provided in the "Story Points" field</li>
            <li>Contact person is specified in the description</li>
          </ul>
        #elseif($userGroupService.isUserInGroup($currentUser, "new-employees"))
          $fieldDisplayConfig.setMessageType("info")
          <h4>👋 Welcome New Team Member!</h4>
          <p>As a new employee, here are some tips for issue creation:</p>
          <ul>
            <li>Use clear, descriptive summaries</li>
            <li>Select appropriate issue types (Bug, Task, Story)</li>
            <li>Set priority based on business impact</li>
            <li>Ask your mentor if you're unsure about any field</li>
          </ul>
        #end
      #end

**Result (for restricted user on create screen):**

<div class="aui-message aui-message-error" style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; background: #f8d7da;">
  <h4>❌ Access Restricted</h4>
  <p>Your account has limited permissions for creating issues in this project.</p>
  <p>Please contact your project administrator to request access.</p>
  <p>Administrator: <strong>admin@company.com</strong></p>
</div>

**Result (for external contractor on create screen):**

<div class="aui-message aui-message-warning" style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; background: #fff3cd;">
  <h4>⚠️ External Contractor Guidelines</h4>
  <p>As an external contractor, please ensure:</p>
  <ul>
    <li>All issues are clearly described with acceptance criteria</li>
    <li>Estimated hours are provided in the "Story Points" field</li>
    <li>Contact person is specified in the description</li>
  </ul>
</div>

**Result (for new employee on create screen):**

<div class="aui-message aui-message-info" style="border: 1px solid #ccc; padding: 10px; margin: 10px 0; background: #d4edda;">
  <h4>👋 Welcome New Team Member!</h4>
  <p>As a new employee, here are some tips for issue creation:</p>
  <ul>
    <li>Use clear, descriptive summaries</li>
    <li>Select appropriate issue types (Bug, Task, Story)</li>
    <li>Set priority based on business impact</li>
    <li>Ask your mentor if you're unsure about any field</li>
  </ul>
</div>

#### Display team-specific notifications based on assignee's group membership. ####

      #if($formIssue.assignee)
        #set($assignee = $formIssue.assignee)
        
        #if($userGroupService.isUserInGroup($assignee, "mobile-team"))
          <div style="background: #e8f5e8; border-left: 4px solid #4caf50; padding: 10px;">
            <h4>📱 Mobile Team Assignment</h4>
            <p><strong>Assigned to:</strong> $assignee.displayName (Mobile Team)</p>
            <p><strong>Important:</strong> Please test on both iOS and Android platforms</p>
            <p><strong>Review Checklist:</strong></p>
            <ul>
              <li>Cross-platform compatibility</li>
              <li>Performance on low-end devices</li>
              <li>App store compliance</li>
            </ul>
          </div>
        #elseif($userGroupService.isUserInGroup($assignee, "backend-team"))
          <div style="background: #e8f4fd; border-left: 4px solid #2196f3; padding: 10px;">
            <h4>⚙️ Backend Team Assignment</h4>
            <p><strong>Assigned to:</strong> $assignee.displayName (Backend Team)</p>
            <p><strong>Important:</strong> Consider microservices architecture</p>
            <p><strong>Review Checklist:</strong></p>
            <ul>
              <li>API documentation</li>
              <li>Database migration scripts</li>
              <li>Performance and scalability</li>
              <li>Security considerations</li>
            </ul>
          </div>
        #elseif($userGroupService.isUserInGroup($assignee, "qa-team"))
          <div style="background: #fef7e8; border-left: 4px solid #ff9800; padding: 10px;">
            <h4>🧪 QA Team Assignment</h4>
            <p><strong>Assigned to:</strong> $assignee.displayName (QA Team)</p>
            <p><strong>Testing Focus:</strong></p>
            <ul>
              <li>Functional testing based on acceptance criteria</li>
              <li>Regression testing for related features</li>
              <li>Cross-browser/device compatibility</li>
              <li>Performance testing if applicable</li>
            </ul>
          </div>
        #else
          <div style="background: #f5f5f5; border-left: 4px solid #9e9e9e; padding: 10px;">
            <h4>👤 General Assignment</h4>
            <p><strong>Assigned to:</strong> $assignee.displayName</p>
            <p>Please follow standard development practices and contact your team lead if you need guidance.</p>
          </div>
        #end
      #else
        <div style="background: #ffebee; border-left: 4px solid #f44336; padding: 10px;">
          <h4>⚠️ No Assignee</h4>
          <p>This issue needs to be assigned to a team member before work can begin.</p>
        </div>
      #end

**Result (assignee is mobile team member - John Smith):**

<div style="background: #e8f5e8; border-left: 4px solid #4caf50; padding: 10px; margin: 10px 0;">
  <h4>📱 Mobile Team Assignment</h4>
  <p><strong>Assigned to:</strong> John Smith (Mobile Team)</p>
  <p><strong>Important:</strong> Please test on both iOS and Android platforms</p>
  <p><strong>Review Checklist:</strong></p>
  <ul>
    <li>Cross-platform compatibility</li>
    <li>Performance on low-end devices</li>
    <li>App store compliance</li>
  </ul>
</div>

**Result (assignee is backend team member - Sarah Johnson):**

<div style="background: #e8f4fd; border-left: 4px solid #2196f3; padding: 10px; margin: 10px 0;">
  <h4>⚙️ Backend Team Assignment</h4>
  <p><strong>Assigned to:</strong> Sarah Johnson (Backend Team)</p>
  <p><strong>Important:</strong> Consider microservices architecture</p>
  <p><strong>Review Checklist:</strong></p>
  <ul>
    <li>API documentation</li>
    <li>Database migration scripts</li>
    <li>Performance and scalability</li>
    <li>Security considerations</li>
  </ul>
</div>

**Result (assignee is QA team member - Mike Wilson):**

<div style="background: #fef7e8; border-left: 4px solid #ff9800; padding: 10px; margin: 10px 0;">
  <h4>🧪 QA Team Assignment</h4>
  <p><strong>Assigned to:</strong> Mike Wilson (QA Team)</p>
  <p><strong>Testing Focus:</strong></p>
  <ul>
    <li>Functional testing based on acceptance criteria</li>
    <li>Regression testing for related features</li>
    <li>Cross-browser/device compatibility</li>
    <li>Performance testing if applicable</li>
  </ul>
</div>

**Result (assignee is general user - Jane Doe):**

<div style="background: #f5f5f5; border-left: 4px solid #9e9e9e; padding: 10px; margin: 10px 0;">
  <h4>👤 General Assignment</h4>
  <p><strong>Assigned to:</strong> Jane Doe</p>
  <p>Please follow standard development practices and contact your team lead if you need guidance.</p>
</div>

**Result (no assignee):**

<div style="background: #ffebee; border-left: 4px solid #f44336; padding: 10px; margin: 10px 0;">
  <h4>⚠️ No Assignee</h4>
  <p>This issue needs to be assigned to a team member before work can begin.</p>
</div>

