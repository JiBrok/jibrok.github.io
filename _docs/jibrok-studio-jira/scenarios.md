---
title: Scenarios
seo_title: "Jira Bulk Scenarios - Process Thousands of Issues"
key: jibrok-studio-jira
category: core-features
tags:
  - doc
  - cloud
  - scripting
  - scenarios
  - bulk
excerpt: Split long-running scripts into managed steps for processing large datasets without timeouts
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Overview

Scenarios split long-running scripts into managed steps. Each step runs independently, avoiding execution timeouts when processing large datasets.

A scenario script defines a sequence of steps using `step()`, `loop()`, and `batch()` functions. When you run the script, the system:

1. Analyzes the script to extract all step definitions
2. Creates a scenario run with step records in the database
3. Executes steps sequentially
4. Passes results from completed steps to subsequent steps via `ctx`

---

## Step types

### `step(name, fn)`

A simple one-time step. The callback receives `ctx` - an object with results from all completed previous steps.

```js
step('count', (ctx) => {
  return Issues.count('project = PROJ')
})

step('report', (ctx) => {
  log(`Total: ${ctx.count}`)
})
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `name` | string | Unique step name (used as key in `ctx`) |
| `fn` | function | `(ctx) => result` - step callback |

The return value is stored as `ctx[name]` for subsequent steps.

### `loop(name, fn, initialState)`

A step that can re-execute multiple times. Use `next(state)` to continue the loop or return a value to finish.

```js
loop('paginate', (state, ctx) => {
  var result = Issues.search('project = PROJ', {
    maxResults: 100,
    nextPageToken: state.cursor,
  })
  var keys = state.keys.concat(result.map(i => i.key))

  if (result.hasMore) {
    return next({ cursor: result.nextPageToken, keys })
  }
  return { allKeys: keys }
}, { cursor: null, keys: [] })
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `name` | string | Unique step name |
| `fn` | function | `(state, ctx) => result` - loop callback |
| `initialState` | any | Initial state for the first iteration |

- Call `next(newState)` to schedule another iteration with updated state
- Return any other value to complete the step (stored in `ctx[name]`)
- Each iteration runs independently

### `batch(name, config, fn)`

Processes issues in pages with automatic pagination, error handling, and progress tracking.

Config can be a **JQL string** (shorthand) or a **config object** with source, fields, and options.

```js
// JQL string shorthand:
batch('cleanup', 'project = PROJ AND updated < -180d', (issue, ctx) => {
  issue.transition('Done')
})

// Config object with fields and options:
batch('export', {
  jql: 'project = PROJ',
  fields: ['summary', 'status'],
  expand: ['changelog'],
  batchSize: 50,
}, (issue, ctx) => {
  log(issue.key + ': ' + issue.summary)
})
```

| Parameter | Type | Description |
|-----------|------|-------------|
| `name` | string | Unique step name |
| `config` | string / object | JQL string or config object (see below) |
| `fn` | function | `(issue, ctx) => void` - called for each issue |

### Config object properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `jql` | string | - | JQL query (one of jql/keys/source required) |
| `keys` | string[] | - | Array of issue keys |
| `source` | function | - | `(ctx) => keys[]` - dynamic source from previous steps |
| `fields` | string[] | all | Fields to load per issue |
| `expand` | string[] | none | Expand options (e.g. `["changelog"]`) |
| `batchSize` | number | 100 | Issues per page (max 100) |
| `maxIssues` | number | unlimited | Stop after processing this many issues |
| `continueOnError` | boolean | true | Continue processing if an issue callback fails |

### Batch result

The batch step stores its result in `ctx[name]`:

```js
{
  processed: 4523,    // successfully processed issues
  failed: 12,         // failed issues
  errors: ["PROJ-5: transition failed", ...],  // first 100 error messages
  errorsCapped: true, // true when there are more errors than shown
  totalPages: 46      // number of batch iterations
}
```

---

## Context (`ctx`)

Each step callback receives `ctx` - an object containing results from all previously completed steps.

```js
step('find', () => {
  return { total: Issues.count('project = PROJ') }
})

step('report', (ctx) => {
  // ctx.find.total is available here
  log(`Found ${ctx.find.total} issues`)
})
```

- Keys are step names, values are return values from those steps
- Only completed steps appear in `ctx`
- The context is serialized to JSON between steps (max 20MB)

---

## `emit(value)` and `getStepData(stepName, opts?)`

Transfer data between steps without storing it in `ctx`. Useful when a step processes many items and you need to pass individual results to the next step.

`emit(value)` saves a value to the step's data buffer. Call it multiple times inside `step()`, `loop()`, or `batch()` callbacks.

`getStepData(stepName, opts?)` reads emitted data from a previous step with pagination. Returns `{ items, total }`.

```js
batch('collect', 'project = PROJ', (issue, ctx) => {
  emit({ key: issue.key, summary: issue.summary })
})

step('report', (ctx) => {
  var page = getStepData('collect', { offset: 0, limit: 100 })
  // page = { items: [{key:'PROJ-1', summary:'...'}, ...], total: 1500 }
  log('Total collected: ' + page.total)
})
```

### `emit(value)` Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `value` | any | JSON-serializable value to save |

### `getStepData(stepName, opts?)` Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `stepName` | string | required | Name of the step that emitted data |
| `opts.offset` | number | 0 | Number of items to skip |
| `opts.limit` | number | 1,000 | Max items to return (max 10,000) |

### When to use `emit()` vs `return`

- Use `return` when the step result is small (configuration, counts, a short list of keys)
- Use `emit()` when the step generates many individual items (issue data, processing results) and you need paginated access

---

## `progress(data)`

Report custom progress data from within a step callback. The data is stored and visible in the UI during execution.

```js
step('process', (ctx) => {
  var keys = ctx.find.keys
  for (var i = 0; i < keys.length; i++) {
    Issues.get(keys[i]).addLabel('processed')
    progress({ current: i + 1, total: keys.length })
  }
})
```

For `batch()` steps, progress is reported automatically (processed/failed counts).

---

## Lifecycle

1. **Compile** - script is compiled and analyzed for step definitions
2. **Create** - a scenario run is created with status `running`
3. **Execute** - steps are executed sequentially via Forge Queue events
4. **Complete** - run status becomes `completed` when last step finishes
5. **Failed** - if any step fails, run status becomes `failed`

### Cancellation

Running scenarios can be cancelled. After cancellation:
- The current step finishes (cancellation is checked between steps)
- Remaining steps are marked as `skipped`
- Run status becomes `cancelled`

### Retry

Failed and completed scenarios can be retried from any step:
- Steps from the retry point onward are reset to `pending`
- The scenario resumes using the **original script version** stored with the run
- Previously completed steps before the retry point keep their results

### Stale recovery

If a step stays in `running` status for more than 10 minutes (e.g., due to a Forge timeout or OOM), the system automatically resets it to `pending` on the next queue delivery attempt.

---

## Concurrency

Only one scenario run per script can be active at a time. Starting a new scenario while one is already running returns an error. Cancel the running scenario first or wait for it to complete.

---

## Limits

See [Limits](/docs/jibrok-studio-jira/limits) for all scenario limits including step count, result sizes, batch sizes, emit limits, and API call budgets.

---

## Notes

- `async`/`await` in scenario callbacks is optional - API calls are auto-awaited
- Step names must be unique within a scenario
- Steps are always executed in declaration order
- Each step runs with a fresh API call budget
- `next()` can only be used inside `loop()`, not in `step()`
- Scripts must be saved before running as a scenario

---

## See also

- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical examples including bulk scenarios
- [Async Events](/docs/jibrok-studio-jira/triggers-async) - Lower-level async execution
- [Limits](/docs/jibrok-studio-jira/limits) - All system limits
