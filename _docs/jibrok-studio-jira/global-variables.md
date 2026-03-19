---
title: Global Variables
key: jibrok-studio-jira
excerpt: Define shared variables and functions accessible to all scripts
category: core-features
tags:
  - doc
  - cloud
  - global-variables
  - configuration
---

* TOC
{:toc}

## Overview

Global Variables let you define shared constants, values, and functions that are automatically available in every script across your site.

---

## How it works

A single **Global Script** returns an object whose keys become variables available in all other scripts.

```js
return {
  TEAM_PROJECT: "PROJ",
  MAX_RETRIES: 3,
  formatDate: (d) => DateUtils.format(d, 'YYYY-MM-DD'),
}
```

After saving, all scripts can use these variables directly:

```js
log(TEAM_PROJECT)              // => PROJ
log(MAX_RETRIES)               // => 3
log(formatDate(new Date()))    // => 2024-01-15
```

---

## Managing global variables

1. Navigate to the **Global Variables** tab
2. Edit the global script in the editor
3. Click **Run** to test - the output shows defined variables with types and preview values
4. Click **Save** to activate

<a href="/uploads/jibrok-studio-jira/global-variables-config.png" target="_blank">
<img src="/uploads/jibrok-studio-jira/global-variables-config.png" alt="Global Variables configuration page" style="width:100%;" loading="lazy"></a>

### Variable display

After running, a table shows the defined variables:

| Column | Description |
|--------|-------------|
| **Variable** | Variable name |
| **Type** | string, number, boolean, function, object, etc. |
| **Preview** | Value preview |

---

## Rules and limits

- The script **must return a plain object** (`return { key: value }`)
- Reserved variable names (engine built-ins) cannot be overridden
- Only one global script exists per site
- `eval()` (direct code evaluation) is not allowed in the global script. Use `eval(scriptId)` in regular scripts to include shared code.
- Version history tracks all changes

See [Limits](/docs/jibrok-studio-jira/limits) for global variable limits.

> **Note:** The global script runs before every other script execution and has strict reduced limits (1 second execution time, no logging, 1,000 loop iterations). Keep it simple - return constants and short helper functions.

---

## Next steps

- [Script Console](/docs/jibrok-studio-jira/script-console) - Using variables in scripts
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language reference
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
