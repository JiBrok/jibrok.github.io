---
title: JavaScript - Examples
key: message-field
excerpt: "JavaScript examples for Message field customization including client-side logic, dynamic behavior, and interactive message functionality."
---

JavaScript examples for  the **Message Field** application are available at [GitHub](https://gist.github.com/JiBrok/public)

{:.no_toc}
* TOC
{:toc}


### MessageField v5 - JavaScript API Description and Usage Guide
<script src="https://gist.github.com/JiBrok/f838959156710786c66129eb77c25670.js"></script>

### New Public API Methods (v5.1+)

The Message Field now provides public API methods to retrieve form data programmatically. These methods are available on the global `MESSAGE_FIELD_OBJECT`:

#### getCurrentFormSelector()
Returns the current form selector based on the page context (Jira or Service Desk) and whether a dialog is opened.

```javascript
// Get current form selector
const formSelector = MESSAGE_FIELD_OBJECT.getCurrentFormSelector();
console.log('Current form selector:', formSelector);
```

**Returns:** 
- `string` - The form selector for the current context
- `null` - If page manager is not initialized

#### getDataFromDefaultForm()
Retrieves form data from the default form based on the current page context (Jira or Service Desk).

```javascript
// Get form data from default form
const formData = MESSAGE_FIELD_OBJECT.getDataFromDefaultForm();
console.log('Form data:', formData);
```

**Returns:** 
- `object` - Form data object containing field values
- `null` - If page manager is not initialized

#### getFullDataFromDefaultForm()
Retrieves complete form data including all field information from the default form.

```javascript
// Get full form data from default form
const fullFormData = MESSAGE_FIELD_OBJECT.getFullDataFromDefaultForm();
console.log('Full form data:', fullFormData);
```

**Returns:** 
- `object` - Complete form data object with detailed field information
- `null` - If page manager is not initialized

**Note:** These API methods work in both Jira and Service Desk contexts and automatically detect the appropriate form based on the current page environment.

### Update message on create
<script src="https://gist.github.com/JiBrok/bb8f6775509b8155c3b77cfcc69e931a.js"></script>

### Update message with priority
<script src="https://gist.github.com/JiBrok/87e486ffec161cfd430268ad1a3123ed.js"></script>

### Update message with priority and select field
<script src="https://gist.github.com/JiBrok/df30471f4cec93bf3c2d802803f9dba8.js"></script>

### Update message on create(SD)
<script src="https://gist.github.com/JiBrok/a50e94a5769486508b150de31d4ac838.js"></script>

### Update message with priority(SD)
<script src="https://gist.github.com/JiBrok/f3d6930ad91565ab539a5c8d30c5994d.js"></script>

### Update message with priority and select field(SD)

<script src="https://gist.github.com/JiBrok/cc3c2a1a02d99a0116d006ce708bd8ff.js"></script>

### Update and hide message with 2 conditions by select fields(Service Desk) 

<script src="https://gist.github.com/JiBrok/def78831a2e8d96b7e2fdd808b09adaf.js"></script>

### Update and hide message with 2 conditions by select fields

<script src="https://gist.github.com/JiBrok/56feb2f4510b5b435366329d671df0a8.js"></script>

### Hide message if all fields are empty(View issue)

The script will check the custom fields on the view issue screen. If all fields are empty the message banner will be hidden.


<a href="/uploads/message-field/message_field_video_dynamical.gif" target="_blank"><img src="/uploads/message-field/message_field_video_dynamical.gif" alt="Message Field dynamic template demonstration video" style="width:100%;" loading="lazy"></a>

<script src="https://gist.github.com/JiBrok/1d308d9e393c739790462d35b5cdb305.js"></script>


### Update message with bundled select(SD-create)


<a href="/uploads/message-field/example-extensions-for-jira.gif" target="_blank"><img src="/uploads/message-field/example-extensions-for-jira.gif" alt="Message Field extensions for Jira demo" width="100%" loading="lazy"></a>

<script src="https://gist.github.com/JiBrok/28232b1fee05ef8c45490ea91444a5ef.js"></script>



















