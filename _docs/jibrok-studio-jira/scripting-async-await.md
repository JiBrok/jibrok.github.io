---
title: "JS: Async/Await"
key: jibrok-studio-jira
excerpt: Auto-await, async functions, Promise API, delay, and async patterns
category: administration
tags:
  - doc
  - cloud
  - scripting
  - async
  - await
  - promises
---

* TOC
{:toc}

> Part of the [Scripting Language](/docs/jibrok-studio-jira/scripting-language) reference.

The engine supports async operations with **auto-await** - all function calls that return a Promise are automatically resolved. The `await` and `async` keywords are supported but optional.

---

## Auto-await

Function calls that return a native Promise (e.g. `requestJira()`, `Issues.get()`) are automatically awaited. You do not need to write `await` or mark functions as `async`:

```js
// Both forms are equivalent:
const issue = Issues.get("TEST-1")
const issue = await Issues.get("TEST-1")

// Chaining works:
const summary = Issues.get("TEST-1").summary

// Works inside regular functions (no async keyword needed):
function getIssueSummary(key) {
  const issue = Issues.get(key)
  return issue.summary
}
log(getIssueSummary("TEST-1"))
```

**Important limitations:**

- `Promise.all()` works, but does not provide parallelism - all calls inside are resolved sequentially before `Promise.all` receives them. Use `await` with `Promise.all()`.
- For async operations inside `.map()` / `.filter()` callbacks, use `for...of` loop instead (array callbacks run in sync context).

```js
// For async in loops, use for...of instead of .map():
const keys = ["TEST-1", "TEST-2"]
const issues = []
for (const key of keys) {
  issues.push(Issues.get(key))
}
```

---

## Async functions

The `async` keyword is supported but optional. Both forms work identically:

```js
// Without async keyword (works thanks to auto-await):
function fetchValue() {
  return Promise.resolve(10)
}

// With explicit async/await:
async function fetchValue() {
  return await Promise.resolve(10)
}

const val = fetchValue()
log(val)   // => 10
```

### Async arrow functions

```js
const double = (x) => Promise.resolve(x * 2)
const val = double(5)
log(val)   // => 10
```

---

## Top-level await

`await` can be used at the top level of a script. It is optional for native Promise values but required for boxed promises (`Promise.resolve`, `Promise.reject`, `Promise.all`, etc.):

```js
const x = await Promise.resolve(42)
log(x)   // => 42
```

### Await with non-promise values

`await` on a non-promise value returns that value as-is:

```js
const x = await 42
log(x)   // => 42

const y = await null
log(y)   // => null
```

---

## Promise API

| Method | Description |
|--------|-------------|
| `Promise.resolve(value)` | Creates a resolved promise |
| `Promise.reject(reason)` | Creates a rejected promise |
| `Promise.create(executor)` | Creates a promise with executor (replaces `new Promise()`) |
| `Promise.all(array)` | Resolves when all promises resolve, rejects on first rejection |
| `Promise.race(array)` | Resolves/rejects with the first settled promise |
| `Promise.allSettled(array)` | Resolves when all promises settle (fulfilled or rejected) |
| `Promise.any(array)` | Resolves with the first fulfilled promise |
| `Promise.withResolvers()` | Returns `{ promise, resolve, reject }` for deferred resolution |

### Promise.resolve / Promise.reject

```js
const val = await Promise.resolve("hello")
log(val)   // => hello

try {
  await Promise.reject("oops")
} catch (e) {
  log(e)   // => oops
}
```

### Promise.create

Replaces `new Promise()`:

```js
const p = Promise.create((resolve, reject) => {
  resolve(99)
})
const val = await p
log(val)   // => 99
```

### Promise.all

```js
const results = await Promise.all([
  Promise.resolve(1),
  Promise.resolve(2),
  Promise.resolve(3),
])
log(results)   // => [1, 2, 3]
```

Rejects immediately when any promise rejects:

```js
try {
  await Promise.all([
    Promise.resolve(1),
    Promise.reject("error"),
    Promise.resolve(3),
  ])
} catch (e) {
  log(e)   // => error
}
```

### Promise.race

```js
const result = await Promise.race([
  Promise.resolve("first"),
  Promise.resolve("second"),
])
log(result)   // => first
```

### Promise.allSettled

```js
const results = await Promise.allSettled([
  Promise.resolve(1),
  Promise.reject("fail"),
  Promise.resolve(3),
])
log(results[0].status)   // => fulfilled
log(results[0].value)    // => 1
log(results[1].status)   // => rejected
log(results[1].reason)   // => fail
```

### Promise.any

```js
const val = await Promise.any([
  Promise.reject("err1"),
  Promise.resolve("success"),
  Promise.reject("err2"),
])
log(val)   // => success
```

When all promises reject:

```js
try {
  await Promise.any([Promise.reject("a"), Promise.reject("b")])
} catch (e) {
  log(e)   // => All promises were rejected
}
```

### Promise.withResolvers

```js
const { promise, resolve } = Promise.withResolvers()
resolve(42)
const val = await promise
log(val)   // => 42
```

---

## Promise instance methods

Promises support `.then()`, `.catch()`, and `.finally()` for chaining:

```js
const result = await Promise.resolve(1)
  .then(v => v + 1)
  .then(v => v * 3)
log(result)   // => 6

const fallback = await Promise.reject("error")
  .catch(e => "caught: " + e)
log(fallback)   // => caught: error

await Promise.resolve(42).finally(() => log("done"))
// => done
```

---

## delay()

Pauses execution for the specified number of milliseconds.

```js
await delay(100)
log("100ms later")
```

**Rules:**

- `ms` must be a finite non-negative number
- If `ms` exceeds the remaining execution time (depends on trigger type - see [Limits](/docs/jibrok-studio-jira/limits)), a timeout error is thrown immediately
- Each `delay()` call counts toward `maxPendingPromises`

**Sequential delays:**

```js
await delay(50)
log("first")
await delay(50)
log("second")
// Total: ~100ms
```

**Parallel delays with Promise.all:**

```js
await Promise.all([delay(50), delay(50), delay(50)])
log("done")
// Total: ~50ms (parallel, not 150ms)
```

**Error handling:**

```js
// Validation errors are catchable:
try {
  await delay(-1)
} catch (e) {
  log(e)   // => delay(ms) requires a finite non-negative number
}

// Timeout errors are NOT catchable (same as other resource limits)
```

---

## Error handling

Errors from async functions are caught with `try/catch`:

```js
async function failing() {
  throw "boom"
}
try {
  await failing()
} catch (e) {
  log(e)   // => boom
}
```

The `finally` block works as expected:

```js
let x = 0
try {
  await Promise.reject("fail")
} catch (e) {
  x = 1
} finally {
  x = x + 10
}
log(x)   // => 11
```

---

## Patterns

### Parallel execution

Use `Promise.all` with array methods:

```js
async function processItem(item) {
  return await Promise.resolve(item * 2 + 1)
}

const processed = await Promise.all([
  processItem(10),
  processItem(20),
  processItem(30),
])
log(processed)   // => [21, 41, 61]
```

### Async map with Promise.all

```js
const asyncDouble = async (x) => x * 2
const results = [1, 2, 3].map(asyncDouble)
const resolved = await Promise.all(results)
log(resolved)   // => [2, 4, 6]
```

### Sequential async loop

```js
const keys = ["TEST-1", "TEST-2", "TEST-3"]
for (const key of keys) {
  const issue = await Issues.get(key)
  log(issue.summary)
}
```

---

## Next steps

- [JS: Language Basics](/docs/jibrok-studio-jira/scripting-language-basics) - Core language features
- [JS: Functions & Classes](/docs/jibrok-studio-jira/scripting-functions-classes) - Function syntax and classes
- [Scripting API: Issues](/docs/jibrok-studio-jira/scripting-api-issues) - Async API methods
- [Limits](/docs/jibrok-studio-jira/limits) - `maxPendingPromises` and timeout limits
