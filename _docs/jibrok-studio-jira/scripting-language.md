---
title: Scripting Language
key: jibrok-studio-jira
excerpt: Language reference - engines, syntax, built-in APIs, and sandbox details
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - language
  - api
  - javascript
seo_title: JS, Python, Groovy - Jira Scripting Engines
last_modified_at: 2026-03-19
date: 2026-02-23
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Script engines

Four language engines are available:

| Engine | Description |
|--------|-------------|
| **JavaScript** | Primary engine, most complete feature set |
| **[Python](/docs/jibrok-studio-jira/scripting-python)** | Python-like syntax - `def`/`lambda`, f-strings, list comprehensions, `*args`/`**kwargs`, `match`/`case`, stdlib modules (`math`, `random`, `re`, `datetime`, `collections`, `itertools`, and more) |
| **[Groovy](/docs/jibrok-studio-jira/scripting-groovy)** | Groovy-like syntax - closures, GString, ranges, GDK collection methods, safe navigation/Elvis operators, Java date/time classes (`LocalDate`, `Duration`, `ZonedDateTime`), `JsonSlurper`/`JsonOutput`, `MarkupBuilder`, and more |
| **Jira Expressions** | Native Jira expression language (Workflow Condition only) |

All three sandbox engines (JavaScript, Python, Groovy) share the same Jira APIs, resource limits, and security model. JavaScript is recommended for most use cases and has the widest API coverage.

> **Note:** The Jira Expressions engine is a special engine exclusively available with the [Workflow Condition](/docs/jibrok-studio-jira/triggers-workflow-condition) trigger. Unlike the other three engines, Jira Expressions are evaluated natively by Jira - they do not run in the JiBrok sandbox and have no sandbox engine limits. See [Jira Expressions documentation](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/) for the language reference.

---

## Getting started by engine

| Engine | Get started |
|--------|-------------|
| **JavaScript** | [Language Basics](/docs/jibrok-studio-jira/scripting-language-basics) - variables, operators, control flow, collections, destructuring |
| **Python** | [Python Engine](/docs/jibrok-studio-jira/scripting-python) - `def`/`lambda`, f-strings, list comprehensions, stdlib modules |
| **Groovy** | [Groovy Engine](/docs/jibrok-studio-jira/scripting-groovy) - closures, GString, ranges, GDK methods, Java date/time classes |

---

## Script inclusion via `eval(uuid)`

One script can call another saved script by its UUID:

```js
// Include a utility script by its ID
eval("550e8400-e29b-41d4-a716-446655440000")

// Now use functions/variables defined in that script
let result = myUtilityFunction(data)
```

Circular includes are detected and prevented. See [Limits](/docs/jibrok-studio-jira/limits) for eval call and nesting depth limits.

---

## Built-in APIs

The scripting platform provides a rich set of APIs. See [Scripting API](/docs/jibrok-studio-jira/scripting-api) for full details and examples.

### Jira API

| API | Description |
|-----|-------------|
| `requestJira(path, options)` | Low-level Jira REST API call |
| `Issues` | Issue search, get, create, link + RichIssue methods (update, transition, addComment, assign, clone, delete, reload) |
| `Users` | `current()`, `get()`, `find()`, `findAssignable()` |
| `Projects` | `get()`, `list()` + project methods (getComponents, getVersions, getStatuses, getRoles) |
| `Fields` | `list()`, `get()`, `id()` - field metadata and ID resolution |
| `Components` | `get()`, `create()`, `update()`, `delete()` |
| `Versions` | `get()`, `create()`, `update()`, `release()` |
| `Boards` | `list()`, `get()`, `getSprints()`, `getIssues()`, `moveToBacklog()` |
| `Sprints` | `get()`, `getIssues()`, `moveIssues()`, `create()`, `update()` |
| `Epics` | `get()`, `getIssues()`, `moveIssues()`, `removeIssues()` |
| `Links` | `types()`, `create()`, `get()`, `delete()` |
| `Groups` | `find()`, `get()`, `getBulk()`, `getMembers()`, `create()`, `addUser()`, `removeUser()` |
| `Filters` | `get()`, `getMy()`, `getFavourites()`, `create()`, `update()`, `delete()` |
| `Labels` | `list()` |
| `JQL` | `validate()`, `autocomplete()` |
| `Permissions` | `my()` - check current user's permissions |

> **Note:** `Jira.search(jql, options?)` and `Jira.getIssue(key, options?)` are low-level convenience wrappers that return raw Jira REST API responses. For rich functionality (RichIssue, auto-transform, chainable promises), use the `Issues` namespace instead.

### Domain APIs

| API | Description |
|-----|-------------|
| `tables` | Custom table operations: `rows()`, `addRow()`, `addRows()`, `updateRow()`, `deleteRow()`, `deleteRows()`, `findRow()`, `count()`, `get()` |
| `queue` | Message queue operations: `push()`, `pull()`, `consume()`, `peek()`, `ack()`, `reject()`, `requeue()`, `size()`, `stats()` |
| `asyncEvent` | Async event operations: `push()`, `pushSelf()` |
| `uim` | UI Modification methods: `setValue()`, `setVisible()`, `setRequired()`, `setReadOnly()`, `setName()`, `setDescription()`, `setOptionsVisibility()` |

### Utilities

| Utility | Description |
|---------|-------------|
| `Adf` | Atlassian Document Format builder - rich text for comments and descriptions |
| `DateUtils` | Date operations - `diff()`, `diffDays()`, `businessDays()`, `addDays()`, `addBusinessDays()`, `format()`, `parse()` |
| `Arrays` | Array operations - `sortBy()`, `groupBy()`, `unique()`, `sum()`, `avg()`, `pluck()`, `chunk()`, `partition()` |
| `Strings` | String transforms - `capitalize()`, `truncate()`, `camelCase()`, `kebabCase()`, `snakeCase()` |
| `CSV` | CSV processing - `parse()`, `stringify()` |
| `Validator` | Value validation - `isEmail()`, `isUrl()`, `isJiraKey()`, `isAccountId()` |

### Built-in globals

`Math`, `JSON`, `Date`, `RegExp`, `Set`, `Map`, `String.format()`, `structuredClone`, `parseInt`, `parseFloat`, `isNaN`, `isFinite`, `encodeURIComponent`, `decodeURIComponent`, and more.

### String.format()

Java-style string formatting with format specifiers:

| Specifier | Description | Example |
|-----------|-------------|---------|
| `%s` | String | `String.format("Hello %s", "World")` - "Hello World" |
| `%d` | Integer (truncated) | `String.format("Count: %d", 42)` - "Count: 42" |
| `%f` | Float (default 6 decimals) | `String.format("Pi: %.2f", 3.14159)` - "Pi: 3.14" |
| `%b` | Boolean | `String.format("Active: %b", true)` - "Active: true" |
| `%%` | Literal % | `String.format("100%%")` - "100%" |
| `%n` | Newline | `String.format("Line1%nLine2")` |

Supports width (`%10s`) and precision (`%.2f`). Flags: `-` (left-align), `0` (zero-pad for numbers).

```js
log(String.format("%-10s | %05d | %.2f", "item", 42, 3.14))
// => "item       | 00042 | 3.14"
```

### createFile()

Generate file attachments from scripts. Files are returned alongside script output.

```js
// Create a CSV file
let csv = "Name,Email\nAlice,alice@example.com\nBob,bob@example.com"
createFile("report.csv", csv)

// Create a JSON file with explicit MIME type
createFile("data.json", JSON.stringify(data, null, 2), "application/json")
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `name` | string | Filename (max 255 chars) |
| `content` | string | File content |
| `mimeType` | string? | MIME type (auto-detected from extension if omitted) |

**Limits:** max 4MB per file, max 10 files per execution, max 8MB total.

**Auto-detected extensions:** `.txt`, `.csv`, `.json`, `.xml`, `.html`, `.md`, `.js`, `.css`, `.svg`, `.tsv`, `.log`, `.yaml`, `.yml`. Unknown extensions default to `text/plain`.

### Logger

The `logger` object provides structured logging with named log levels. Available in all engine types (JavaScript, Python, Groovy).

| Method | Log Level |
|--------|-----------|
| `logger.log(...)` | `log` |
| `logger.debug(...)` | `debug` |
| `logger.info(...)` | `info` |
| `logger.warn(...)` | `warn` |
| `logger.error(...)` | `error` |

```js
logger.info("Processing issue", issue.key)
logger.warn("Field missing", fieldName)
logger.error("Failed to update", error.message)
```

These methods behave identically to the top-level `log()`, `debug()`, `info()`, `warn()`, `error()` functions. Multiple arguments are joined with a space. Each call counts toward the `maxLogCalls` limit.

---

## Script context variables

Variables available in scripts depending on context:

| Variable | Available when | Description |
|----------|---------------|-------------|
| `issueKey` | Issue key provided | The issue key string |
| `issue` | Issue context loaded | Issue data object |
| `context` | Always | Execution context metadata |
| `event` | Event/async/workflow post function/workflow validator triggers | Event payload |
| `event.transition` | Workflow post function/workflow validator trigger | Transition details (`from_status`, `to_status`, `transitionName`) |
| `event.modifiedFields` | Workflow validator trigger | Fields modified during the transition |
| `issue` (Jira Expressions) | Workflow condition trigger | Jira-native issue object (not sandbox `issue`) |
| `project` (Jira Expressions) | Workflow condition trigger | Project of the transitioning issue |
| `user` (Jira Expressions) | Workflow condition trigger | User performing the transition |
| `now()` (Jira Expressions) | Workflow condition trigger | Current date and time |
| `uim` | UIM triggers | UI modification methods |
| `uimData` | UIM triggers | Form field values and callback info |
| `currentUser` | Always | Current user info |
| Global vars | When defined | Variables from the global script |

---

## Sandbox

Scripts run in a secure, isolated sandbox:

- **No network access** - except through `requestJira()` and built-in API namespaces
- **No filesystem** - scripts cannot read or write files
- **No `import`/`export`** - use `eval(uuid)` for script inclusion
- **Some advanced JS features unavailable** - see [Differences from JS](/docs/jibrok-studio-jira/scripting-differences-from-js) for the full list
- **Division by zero returns `0`** - not `Infinity`
- **Resource limits** - execution time, loop iterations, API calls are capped (see [Limits](/docs/jibrok-studio-jira/limits))
- **Method whitelisting** - only approved methods can be called
- **Auto-await** - promises are automatically resolved

For a detailed breakdown of the security pipeline and tenant isolation, see [Forge Platform & Security Architecture](/docs/jibrok-studio-jira/forge-platform-security).

---

## Detailed reference

### JavaScript Engine

- **[JS: Language Basics](/docs/jibrok-studio-jira/scripting-language-basics)** - Variables, operators, control flow, collections, destructuring
- **[JS: Functions & Classes](/docs/jibrok-studio-jira/scripting-functions-classes)** - Function declarations, arrow functions, closures, classes, inheritance
- **[JS: Async/Await](/docs/jibrok-studio-jira/scripting-async-await)** - Auto-await, Promise API, delay, async patterns
- **[JS: Differences from Standard JS](/docs/jibrok-studio-jira/scripting-differences-from-js)** - All known differences from standard JavaScript
- **[JS: Type Methods](/docs/jibrok-studio-jira/scripting-type-methods)** - Whitelisted methods on strings, arrays, numbers, dates

### Other Engines

- **[Python Engine](/docs/jibrok-studio-jira/scripting-python)** - Python-like syntax, stdlib modules, type methods
- **[Groovy Engine](/docs/jibrok-studio-jira/scripting-groovy)** - Groovy-like syntax, Java classes, GDK methods

### Scripting API (all engines)

- **[Scripting API](/docs/jibrok-studio-jira/scripting-api)** - Full API reference with examples

---

## Next steps

- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference with examples
- [Scripting Examples](/docs/jibrok-studio-jira/scripting-examples) - Practical recipes and patterns
- [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) - Built-in interactive reference with examples
- [Limits](/docs/jibrok-studio-jira/limits) - All execution and storage limits
- [Script Console](/docs/jibrok-studio-jira/script-console) - Interactive editor and execution
- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Tables and queues API usage
