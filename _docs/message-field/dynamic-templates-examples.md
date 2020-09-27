---
title: Dynamic templates - Examples

---

[Java doc for Message field](/jira/plugins/message-field/java/doc/).

You can see the official user guide for velocity [here](http://velocity.apache.org/engine/1.7/user-guide.html).

### Common ###

#### [How to set the value of variable?](http://velocity.apache.org/engine/1.7/user-guide.html#hello-velocity-world) ####

    
    #set( $foo = "Velocity" )
    Hello $foo World!
    
    
#### [Conditionals](http://velocity.apache.org/engine/1.7/user-guide.html#conditionals) ####

    #set( $foo = "Velocity" )
    
    Hello 
    #if( $foo )
        <strong>Velocity!</strong>
    #end
    World!
    
#### [Loops](http://velocity.apache.org/engine/1.7/user-guide.html#loops) ####

    <ul>
    #foreach( $product in $allProducts )
        <li>$product</li>
    #end
    </ul> 

### Getting data from the screens ###

####  How to use $form? Get raw data from issue screen. ####

    $form.summary <br>
    $form.customfield_10400
    
####  How to use $formIssue? Get valid data from the issue screen. [see Java doc $formIssue](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FormIssue.html) ####
    
    $formIssue.summary <br>
    $formIssue.priority.name <br>
    #if($formIssue.assignee)
        $formIssue.assignee.displayName<br>
    #else
        Unassigned<br>
    #end

#### How to use $cfValues? How to get the value of a custom field for an $issue? [see Java doc $cfValues](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/CFValues.html) ####
    
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
    
#### How to get the value of a custom field for an $formIssue? ####
    
    $cfValues.getFromForm(10100)<br>
    $cfValues.getFromForm("customfield_10100")<br>
    $cfValues.getFromForm("Custom field name")<br>
    
    $cfValues.getFromFormOrDefault(10100, "Default value")<br>
    $cfValues.getFromFormOrDefault("customfield_10100", 123)<br>
    $cfValues.getFromFormOrDefault("Custom field name", $issue.assignee)<br>

#### How to use $fieldDisplayConfig? How to change the display of a message? [see Java doc $fieldDisplayConfig](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FieldDisplayConfigDto.html) ####

    $fieldDisplayConfig.setAsFlag(true) ## true, false
    $fieldDisplayConfig.setMessageType("info") ## "info", "error", "success", "warning", "change", "SIMPLE_VIEW"
    $fieldDisplayConfig.setTitle("New title") 
    $fieldDisplayConfig.setShowForFieldId("summary") ## "customfield_10100"
    $fieldDisplayConfig.setInsert("before") ## "append", "prepend", "before", "after" 
    fieldDisplayConfig.setHidden(true)
    
#### How to hide a message? ####
    
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

#### How to use and check linked issues? [see Java doc $links](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/Links.html) ####
   
    #set ($blockedIssues = $links.getOutwardIssues("blocked"))
    #if($blockedIssues.size() > 0)
        #foreach($blockedIssue in $blockedIssues)
            $blockedIssue.status.name $cfValues.getOrDefault($blockedIssue, "developer custom field", "hasn't developer")<br>
        #end
    #end
  
#### Show message for "description" and "assignee" depending on the priority. ####

<a href="/uploads/message-field/dynamic-template-demo1.gif"><img src="/uploads/message-field/dynamic-template-demo1.gif" alt="dynamic template demo.gif" width="400"/></a>
      
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

#### How to use JQL in message? How to use $jqlService? [see Java doc $jqlService](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/JqlService.html) ####
   
    $jqlService.getIssuesByJQL("priority = $formIssue.priority.name ORDER BY Key DESC", 10)
    
#### How to show fields for issues by JQL in message? How to use $issueFieldRender? [see Java doc $issueFieldRender](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/IssueFieldRender.html) ####
   
    $issueFieldRender.getAsTableHtml( 
    	$jqlService.getIssuesByJQL("priority = $formIssue.priority.name ORDER BY Key DESC", 5), 
    	"issue key", "Priority", "Assignee", "customfield_10110", "Product categorization", "10110"
    	)
    


