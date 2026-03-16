---
title: "JS: Differences from Standard JS"
key: jibrok-studio-jira
excerpt: All known differences between the script engine and standard JavaScript
category: administration
tags:
  - doc
  - cloud
  - scripting
  - javascript
  - differences
---

* TOC
{:toc}

> Part of the [Scripting Language](/docs/jibrok-studio-jira/scripting-language) reference.

The script engine is JS-like but not identical to standard JavaScript. This page documents all known differences.

---

## `in` Operator for Arrays

Checks if a **value exists** in the array (like `array.includes(val)`). In standard JavaScript, `in` checks if an **index exists** as a property:

```js
let arr = [10, 20, 30]
log(20 in arr)   // => true   (JavaScript would check if index "20" exists)
log(5 in arr)    // => false
```

For objects, `in` works the same as in JavaScript - checks if a key exists as a property.

---

## Division by zero

Returns `0` instead of `Infinity`.

```js
log(10 / 0)   // => 0  (JavaScript returns Infinity)
log(10 % 0)   // => 0  (JavaScript returns NaN)
```

## typeof Operator

Parses with primary precedence (like a function call). Use parentheses when applying to method call results:

```js
log(typeof 42)              // => number
// typeof x.toString()  - may not work as expected
// typeof(x.toString()) - use this form instead
```

## The new keyword

`new` works with user-defined classes, error constructors, and built-in types (`Date`, `RegExp`, `Set`, `Map`). Factory methods (`.create()`) remain available as an alternative:

```js
// Both forms are equivalent:
const d1 = new Date(2024, 0, 15)
const d2 = Date.create(2024, 0, 15)

const s1 = new Set([1, 2, 3])
const s2 = Set.create([1, 2, 3])
```

## instanceof behavior

Works with user-defined classes (including inheritance chains), error types, wrapper types (`Date`, `RegExp`, `Set`, `Map`), and `Array`.

## C-style for Loop Scope

`for (let i = ...)` creates a **single scope** for the entire loop (not per-iteration like in standard JS). Closures inside the loop will share the same variable:

```js
const fns = []
for (let i = 0; i < 3; i++) {
  fns.push(() => i)
}
log(fns[0]())   // => 3  (not 0 as in JavaScript)
log(fns[1]())   // => 3  (all closures share the same i)
```

**Workaround** - capture the value manually or use `for...of` with a range:

```js
// Option 1: capture in a local variable
const fns = []
for (let i = 0; i < 3; i++) {
  const captured = i
  fns.push(() => captured)
}
log(fns[0]())   // => 0

// Option 2: use for...of with range
const fns2 = []
for (const i of 0..<3) {
  fns2.push(() => i)
}
log(fns2[1]())   // => 1
```

## arguments in Arrow Functions

In the engine, **all functions** (including arrow functions) receive their own `arguments` object. In standard JavaScript, arrow functions do not have their own `arguments`.

```js
const fn = () => arguments.length
log(fn(1, 2, 3))   // => 3  (in JS this would reference outer arguments or throw)
```

## decodeURI / decodeURIComponent Error Handling

In standard JavaScript, these functions throw `URIError` on invalid input. In the engine, they return `undefined` instead:

```js
log(decodeURIComponent("%ZZ"))   // => undefined  (JavaScript throws URIError)
log(decodeURI("%ZZ"))            // => undefined  (JavaScript throws URIError)
```

## parseInt Default Radix

`parseInt` always uses radix 10 by default. Standard JavaScript auto-detects hex for `0x` prefix:

```js
log(parseInt("0xFF"))       // => 0   (JavaScript returns 255)
log(parseInt("0xFF", 16))   // => 255 (explicit radix works)
```

## Not supported

The following JavaScript features are **not available**:

- Generators (`function*`, `yield`)
- `import` / `export`
- Symbols
- WeakMap / WeakSet
- Proxy / Reflect
- `with` statement

## Method whitelisting

Only methods listed in [Type Methods](/docs/jibrok-studio-jira/scripting-type-methods) are callable. Any other method throws a security error.

## Additional features (not in standard JS)

The engine adds features not found in standard JavaScript:

- **Range operators** (`a..b`, `a..<b`) - for iteration and slicing
- **Regex match operators** (`=~`, `==~`) - pattern matching
- **Typed catch** (`catch (TypeError e)`) - catch specific error types
- **Multi-catch** (`catch (TypeError | RangeError e)`)
- **Auto-await** - promises automatically resolved
- **`String.format()`** - Java-style formatting

## Comments and semicolons

Both work the same as in JavaScript:

```js
// Single-line comment
/* Multi-line comment */
let a = 1;  // semicolons optional
let b = 2
```

---

## Next steps

- [JS: Language Basics](/docs/jibrok-studio-jira/scripting-language-basics) - Core language features
- [JS: Type Methods](/docs/jibrok-studio-jira/scripting-type-methods) - Available whitelisted methods
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Overview and sandbox details
