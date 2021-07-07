---
title: Dynamic templates - Examples
key: message-field
---
Examples of using variables that are available for use in dynamic templates.

{:.no_toc}
* TOC
{:toc}

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
    
#### [Comments](http://velocity.apache.org/engine/1.7/user-guide.html#comments) ####

    ## This is a single line comment.  
    
    #*
      Thus begins a multi-line comment. Online visitors won't
      see this text because the Velocity Templating Engine will
      ignore it.
    *#   

### Getting data from the screens ###

####  How to use $form? Get raw data from issue screen. ####

    $form.summary <br>
    $form.customfield_10400
    
####  How to use $formIssue? Get valid data from the issue screen. ####
[see Java doc $formIssue](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FormIssue.html) 
    
    $formIssue.summary <br>
    $formIssue.priority.name <br>
    #if($formIssue.assignee)
        $formIssue.assignee.displayName<br>
    #else
        Unassigned<br>
    #end

#### How to use $cfValues? How to get the value of a custom field for an $issue? ####
[see Java doc $cfValues](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/CFValues.html) 
    
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


####  How to use issue status? ####

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


#### How to use $fieldDisplayConfig? How to change the display of a message? ####
[see Java doc $fieldDisplayConfig](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FieldDisplayConfigDto.html) 

    $fieldDisplayConfig.setAsFlag(true) ## true, false
    $fieldDisplayConfig.setMessageType("info") ## "info", "error", "success", "warning", "change", "SIMPLE_VIEW"
    $fieldDisplayConfig.setTitle("New title") 
    $fieldDisplayConfig.setShowForFieldId("summary") ## "customfield_10100"
    $fieldDisplayConfig.setInsert("before") ## "append", "prepend", "before", "after" 
    $fieldDisplayConfig.setHidden(true)
    
#### How to hide a message? ####
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


#### How to change message colour? ####
[see Java doc $fieldDisplayConfig](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/config/dto/FieldDisplayConfigDto.html)

<a href="/uploads/message-field/message-field-random-colors.gif"><img src="/uploads/message-field/message-field-random-colors.gif" alt="dynamic template random message colors.gif" width="100%"/></a>


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

#### How to use $context, $transitionId and $transitionName? ####

    #if($context == "TRANSITION")
    	is transitionId 31 ? #if($transitionId == 31) Yes #else No #end <br>
    	is transitionName "In Progress" ? #if($transitionName == "In Progress") Yes #else No #end<br>
    #end

#### How to use and check linked issues? ####
[see Java doc $links](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/Links.html)
   
    #set ($blockedIssues = $links.getOutwardIssues("blocked"))
    #if($blockedIssues.size() > 0)
        #foreach($blockedIssue in $blockedIssues)
            $blockedIssue.status.name $cfValues.getOrDefault($blockedIssue, "developer custom field", "hasn't developer")<br>
        #end
    #end
  
#### Show message for "description" and "assignee" depending on the priority. ####

<a href="/uploads/message-field/dynamic-template-demo1.gif"><img src="/uploads/message-field/dynamic-template-demo1.gif" alt="dynamic template demo.gif" width="50%"/></a>
      
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

#### How to use JQL in message? How to use $jqlService? ####
[see Java doc $jqlService](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/JqlService.html)
   
    $jqlService.getIssuesByJQL("priority = $formIssue.priority.name ORDER BY Key DESC", 10)
   

You can use current issue in jql for conditions:    

    #if($jqlService.getIssueCountByJQL("key = $issue.key and updated < startOfDay(-2)") > 0)
        The problem has not been updated for more than two days.
    #end

          
    
#### How to show fields for issues by JQL in message? How to use $issueFieldRender? ####
[see Java doc $issueFieldRender](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/IssueFieldRender.html)
   
    $issueFieldRender.getAsTableHtml( 
    	$jqlService.getIssuesByJQL("priority = $formIssue.priority.name ORDER BY Key DESC", 5), 
    	"issue key", "Priority", "Assignee", "customfield_10110", "Product categorization", "10110"
    	)

#### How to show fields from linked issues(also on Service Desk Portal)? How to use $issueFieldRender? ####
[see Java doc $issueFieldRender](/jira/plugins/message-field/java/doc/com/jibrok/jira/plugins/messagefield/utils/IssueFieldRender.html)

This example uses a different our plugin: [Display linked issues](https://marketplace.atlassian.com/apps/1223203/display-linked-issues?hosting=server&tab=overview)
1) Create and configure field "Linked issues":

<a href="/uploads/message-field/dynamic-templates-examples/linked-issues-config.png"><img src="/uploads/message-field/dynamic-templates-examples/linked-issues-config.png" alt="linked-issues-config.png" width="50%"/></a>

2) After creating the "linked issues" field, you can display it in the message body:


    $issueFieldRender.getFieldValueHtml($issue,"customfield_10101")

3) Result:
   
   <table><tr>
   <td><a href="/uploads/message-field/dynamic-templates-examples/render-another-field-1.png"><img src="/uploads/message-field/dynamic-templates-examples/render-another-field-1.png" alt="render-another-field-1.png" width="100%"/></a></td>
   </tr>
   <tr>
   <td><a href="/uploads/message-field/dynamic-templates-examples/render-another-field-2.png"><img src="/uploads/message-field/dynamic-templates-examples/render-another-field-2.png" alt="render-another-field-2.png" width="100%"/></a></td>
   </tr></table>
   
   

#### Check priority ####

<a href="/uploads/message-field/dynamic-templates-examples/priority.gif"><img src="/uploads/message-field/dynamic-templates-examples/priority.gif" alt="Check priority.gif" width="50%"/></a>

      #if($formIssue.priority.name == "Blocker")
      $fieldDisplayConfig.setMessageType("error")
      
          State the reason for the Blocker priority. ##Message text
      #elseif($formIssue.priority.name == "High")
          $fieldDisplayConfig.setMessageType("warning")
        
          State the reason for the High priority. ##Message text
      #end

#### Check components ####

      #foreach($component in $formIssue.components)
         #if($component.name == "Test component")

            You have selected a test component ##Message text
         #end
      #end


#### Validate summary ####

<a href="/uploads/message-field/dynamic-templates-examples/summary.gif"><img src="/uploads/message-field/dynamic-templates-examples/summary.gif" alt="Validate summary.gif" width="50%"/></a>


      #if($formIssue.summary.contains("PROJECTKEY"))
         message contains PROJECTKEY<br> ##Message text
      #end

      #if($formIssue.summary.matches("(.*)PROJECTKEY(.*)"))
         message contains PROJECTKEY (cheked by regex)<br> ##Message text
      #end

      #if($formIssue.summary.length() < 10)
         Short summary<br> ##Message text
      #end

#### Check description and User Picker (single user) ####

<a href="/uploads/message-field/dynamic-templates-examples/description-and-user-picker(single).gif"><img src="/uploads/message-field/dynamic-templates-examples/description-and-user-picker(single).gif" alt="description-and-user-picker(single).gif" width="50%"/></a>

      #if(!$form.description || $form.description.trim() == "" || !$cfValues.getFromForm("User Picker (single user)"))
         You need to set data in the system description field and specify the user in the custom field "User Picker (single user)" ##Message text
      #end


#### Check number custom field ####

<a href="/uploads/message-field/dynamic-templates-examples/numbers.gif"><img src="/uploads/message-field/dynamic-templates-examples/numbers.gif" alt="Check number custom field.gif" width="50%"/></a>

      #if($cfValues.getFromForm("Number") > 10)
         number > 10 ##Message text
      #end

#### Check option from custom select field(checkbox or radio)  ####

<a href="/uploads/message-field/dynamic-templates-examples/selects.gif"><img src="/uploads/message-field/dynamic-templates-examples/selects.gif" alt="Check option from custom select field(checkbox or radio).gif" width="50%"/></a>

      #if($cfValues.getFromForm("Radio").optionId == 10102)
         Selected option with Id 10102<br> ##Message text
      #end

      #if($cfValues.getFromForm("Single select field").name == "yes")
          Selected option with name  "yes"<br> ##Message text
      #end

      #if($form.customfield_10202.indexOf("10301") > -1)
         "Select List (multiple choices)" contains otpion with id 10301(option2) ##Message text
      #end


#### Check how long ago the transition was made. Show message after transition. (How to use $secAfterLastTransition) ####


      $fieldDisplayConfig.setHidden(true)##hide message by default (Including cases when there were no transitions yet.)

      #if($secAfterLastTransition && $secAfterLastTransition < 1*60)##We check that less than 1 minute has passed since the last transition (the time is indicated as a number of seconds)
		$fieldDisplayConfig.setHidden(false)## Show a message if the transition was not long ago. (< 1 min ago)
		
		##message edit here
		data:<br>
		$secAfterLastTransition<br>
		$previousStatusId <br>
		$previousStatusName <br>

      #end