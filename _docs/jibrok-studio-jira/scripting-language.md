---
title: Scripting Language
key: jibrok-studio-jira
excerpt: Language reference - engines, syntax, built-in APIs, and sandbox details
category: administration
tags:
  - doc
  - cloud
  - scripting
  - language
  - api
  - javascript
---

* TOC
{:toc}

## Script Engines

Three language engines are available:

| Engine | Description |
|--------|-------------|
| **JavaScript** | Primary engine, most complete feature set |
| **Python** | Python-like syntax support |
| **Groovy** | Groovy-like syntax support |

JavaScript is recommended for most use cases and has the widest API coverage.

---

## Language Basics

The scripting language is JavaScript-like and runs in a secure sandbox. It supports:

- **Variables**: `var`, `let`, `const`
- **Arrow functions**: `(x) => x * 2`
- **Classes**: `class Animal { constructor(name) { this.name = name } }`
- **Async/await**: `const data = await Jira.search(jql)`
- **Destructuring**: `const { key, summary } = issue`
- **Template literals**: `` `Issue ${issue.key} is ${issue.status}` ``
- **Spread/rest**: `[...arr, 4, 5]`, `function(...args) {}`
- **Optional chaining**: `issue?.fields?.priority?.name`
- **Nullish coalescing**: `value ?? "default"`
- **Try/catch/finally** with typed catch and multi-catch

### Typed Catch

```js
try {
  throw new TypeError("bad type")
} catch (TypeError | RangeError e) {
  log("caught: " + e.message)
}
```

Available error types: `Error`, `TypeError`, `RangeError`, `SyntaxError`, `ReferenceError`.

---

## Script Inclusion via `eval(uuid)`

One script can call another saved script by its UUID:

```js
// Include a utility script by its ID
eval("550e8400-e29b-41d4-a716-446655440000")

// Now use functions/variables defined in that script
let result = myUtilityFunction(data)
```

| Limit | Value |
|-------|-------|
| Max eval calls per script | 20 |
| Max nesting depth | 5 |

Circular includes are detected and prevented.

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
| `Boards` | `list()`, `get()`, `getSprints()`, `getIssues()` |
| `Sprints` | `get()`, `getIssues()`, `moveIssues()` |

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

### Built-in Globals

`Math`, `JSON`, `Date`, `RegExp`, `Set`, `Map`, `String.format()`, `structuredClone`, `parseInt`, `parseFloat`, `isNaN`, `isFinite`, `encodeURIComponent`, `decodeURIComponent`, and more.

---

## Script Context Variables

Variables available in scripts depending on context:

| Variable | Available when | Description |
|----------|---------------|-------------|
| `issueKey` | Issue key provided | The issue key string |
| `issue` | Issue context loaded | Issue data object |
| `context` | Always | Execution context metadata |
| `event` | Event/scheduled/async triggers | Event payload |
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
- **No generators, Symbol, WeakMap, Proxy** - not supported
- **Division by zero returns `0`** - not `Infinity`
- **Resource limits** - execution time, loop iterations, API calls are capped (see [Limits](/docs/jibrok-studio-jira/limits))
- **Method whitelisting** - only approved methods can be called
- **Auto-await** - promises are automatically resolved

---

## Notable Differences from Standard JavaScript

| Behavior | Standard JS | JiBrok Studio for Jira Cloud Script |
|----------|------------|-------------------|
| Division by zero | `Infinity` | `0` |
| `parseInt` radix | Defaults to auto-detect | Defaults to `10` |
| Arrow function `arguments` | Not available | Has own `arguments` |
| Generators | Supported | Not supported |
| `import`/`export` | Supported | Not supported (use `eval(uuid)`) |
| `Symbol` | Supported | Not supported |
| `WeakMap`/`WeakRef` | Supported | Not supported |
| `Proxy` | Supported | Not supported |
| Range operators (`..`, `..<`) | Not available | Supported |
| Regex operators (`=~`, `==~`) | Not available | Supported |
| `String.format(pattern, ...args)` | Not available | Supported (Java-style formatting) |

---

## Next Steps

- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference with examples
- [Script Engine Reference](/docs/jibrok-studio-jira/script-engine-reference) - Built-in interactive reference with examples
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
- [Limits](/docs/jibrok-studio-jira/limits) - All execution and storage limits
- [Script Console](/docs/jibrok-studio-jira/script-console) - Interactive editor and execution
- [Data Storage](/docs/jibrok-studio-jira/data-storage) - Tables and queues API usage
