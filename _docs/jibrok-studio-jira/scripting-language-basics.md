---
title: "JS: Language Basics"
key: jibrok-studio-jira
excerpt: Variables, operators, control flow, collections, destructuring, and core syntax
category: administration
tags:
  - doc
  - cloud
  - scripting
  - language
  - syntax
  - basics
---

* TOC
{:toc}

> Part of the [Scripting Language](/docs/jibrok-studio-jira/scripting-language) reference.

## Output

Output is produced via `log()`, `print()`, `debug()`, `info()`, `warn()`, and `error()`. Each call appends an entry with a log level to the `logs[]` array returned after execution. `log()` and `print()` are identical (level `log`); the others set their respective levels.

```js
log("Hello, world!")
// => Hello, world!

let x = 2 + 2
print("Result:", x)
// => Result: 4

log("a", "b", "c")   // => a b c
log(42, true, null)   // => 42 true null
log([1, 2], { x: 3 }) // => [1, 2] {"x":3}
```

## Result

The `result` field is set by the value of the last expression in the script (implicit return), or by an explicit `return` statement. If the last statement is a declaration (not an expression), `result` is not set.

```js
x + 1
// result: 5 (implicit return - last expression value)
```

```js
return 42
// result: 42 (explicit return)
```

```js
var x = 5
// result: undefined (last statement is a declaration, not an expression)
```

---

## Literals and data types

### Numbers

Integer and floating-point numbers, including scientific notation.

```js
log(42)        // => 42
log(3.14)      // => 3.14
log(.5)        // => 0.5
log(1e5)       // => 100000
log(1E-3)      // => 0.001
```

**Hex, binary, and octal literals:**

```js
log(0xFF)      // => 255
log(0b1010)    // => 10
log(0o777)     // => 511
```

**Numeric separators** (underscores for readability):

```js
log(1_000_000)     // => 1000000
log(0xFF_FF)       // => 65535
```

### Strings

Double-quoted, single-quoted, and template literals.

```js
log("double quotes")   // => double quotes
log('single quotes')   // => single quotes
```

**Escape sequences:**

| Escape     | Description              |
|------------|--------------------------|
| `\n`       | Newline                  |
| `\t`       | Tab                      |
| `\r`       | Carriage return          |
| `\0`       | Null character           |
| `\\`       | Backslash                |
| `\"`       | Double quote             |
| `\'`       | Single quote             |
| `\/`       | Forward slash            |
| `\xHH`     | Hex escape (2 hex digits) |
| `\uHHHH`   | Unicode escape (4 hex digits) |
| `\u{HHHHH}` | Extended unicode escape (1-6 hex digits) |

### Template literals

Backtick strings with `${expression}` interpolation.

```js
let name = "world"
log(`Hello, ${name}!`)           // => Hello, world!
log(`2 + 2 = ${2 + 2}`)         // => 2 + 2 = 4
log(`nested: ${`inner ${1}`}`)   // => nested: inner 1
```

### Booleans

```js
log(true)    // => true
log(false)   // => false
```

### null and undefined

```js
log(null)        // => null
log(undefined)   // => undefined
```

### Arrays

```js
let arr = [1, 2, 3]
log(arr)   // => [1, 2, 3]
```

### Objects

```js
let obj = { name: "Alice", age: 30 }
log(obj)   // => {"name":"Alice","age":30}
```

---

## Variables

### var - function-scoped

```js
var x = 10
x = 20       // reassignment allowed
log(x)       // => 20
```

### let - block-scoped

```js
let y = 5
y = 10
log(y)   // => 10

if (true) {
  let z = 99
  log(z)   // => 99
}
// z is not accessible here
```

### const - block-scoped, constant

Requires an initializer. Reassignment throws an error.

```js
const PI = 3.14159
log(PI)   // => 3.14159

// const BAD        // Error: 'const' declaration must have an initializer
// PI = 3           // Error: Assignment to constant variable 'PI'
```

### Multi-declarations

All three declaration types support multiple declarations in one statement:

```js
var a = 1, b = 2, c = 3
let x = 10, y = 20
const PI = 3.14, TAU = 6.28
```

---

## Operators

### Arithmetic

| Operator | Description    | Example        |
|----------|----------------|----------------|
| `+`      | Addition       | `3 + 2` => `5` |
| `-`      | Subtraction    | `5 - 2` => `3` |
| `*`      | Multiplication | `4 * 3` => `12` |
| `/`      | Division       | `10 / 3` => `3.333...` |
| `%`      | Modulo         | `10 % 3` => `1` |
| `**`     | Exponentiation | `2 ** 10` => `1024` |

### String concatenation

The `+` operator concatenates when either operand is a string.

```js
log("Hello" + " " + "world")   // => Hello world
log("Count: " + 42)            // => Count: 42
```

### Comparison

| Operator | Description           |
|----------|-----------------------|
| `===`    | Strict equal          |
| `!==`    | Strict not equal      |
| `==`     | Loose equal           |
| `!=`     | Loose not equal       |
| `>`      | Greater than          |
| `>=`     | Greater or equal      |
| `<`      | Less than             |
| `<=`     | Less or equal         |

### Logical

| Operator | Description     |
|----------|-----------------|
| `&&`     | Logical AND     |
| `\|\|`  | Logical OR      |
| `!`      | Logical NOT     |

### Bitwise

| Operator | Description          |
|----------|----------------------|
| `&`      | Bitwise AND          |
| `\|`     | Bitwise OR           |
| `^`      | Bitwise XOR          |
| `~`      | Bitwise NOT          |
| `<<`     | Left shift           |
| `>>`     | Right shift (signed) |
| `>>>`    | Right shift (unsigned) |

### Nullish coalescing

Returns the right operand when the left is `null` or `undefined`.

```js
log(null ?? "default")       // => default
log(undefined ?? "fallback") // => fallback
log(0 ?? "nope")             // => 0
```

### Ternary

```js
let age = 20
log(age >= 18 ? "adult" : "minor")   // => adult
```

### typeof

Returns the type of a value as a string.

```js
log(typeof 42)          // => number
log(typeof "hello")     // => string
log(typeof true)        // => boolean
log(typeof null)        // => object
log(typeof undefined)   // => undefined
```

**Note:** `typeof` parses with primary precedence. Use parentheses for method calls: `typeof(x.toString())`.

### instanceof

Checks if an object is an instance of a given type. Works with user-defined classes (including inheritance), error types, wrapper types (`Date`, `RegExp`, `Set`, `Map`), and `Array`.

```js
let d = Date.create()
log(d instanceof Date)   // => true

log([1, 2] instanceof Array)   // => true
```

### in

Checks membership in arrays or key existence in objects.

```js
log(2 in [1, 2, 3])           // => true
log("name" in { name: "A" })  // => true
log("age" in { name: "A" })   // => false
```

> **Note:** The `in` operator for arrays checks **value existence** (like `array.includes()`), not index existence as in standard JavaScript. See [Differences from JavaScript](/docs/jibrok-studio-jira/scripting-differences-from-js) for details.

### delete

Deletes a property from an object. Returns `true` on success.

```js
let obj = { a: 1, b: 2, c: 3 }
delete obj.b
log(obj)   // => {"a":1,"c":3}
```

### void

Evaluates an expression and returns `undefined`.

```js
log(void 0)   // => undefined
```

### Increment / decrement

```js
let a = 5
log(++a)   // => 6 (pre-increment: increment, then return)
log(a++)   // => 6 (post-increment: return, then increment)
log(a)     // => 7
```

### Compound assignment

| Operator | Equivalent     |
|----------|----------------|
| `+=`     | `x = x + val`  |
| `-=`     | `x = x - val`  |
| `*=`     | `x = x * val`  |
| `/=`     | `x = x / val`  |
| `%=`     | `x = x % val`  |
| `**=`    | `x = x ** val` |
| `&=`     | `x = x & val`  |
| `\|=`    | `x = x \| val` |
| `^=`     | `x = x ^ val`  |
| `<<=`    | `x = x << val` |
| `>>=`    | `x = x >> val` |
| `>>>=`   | `x = x >>> val` |

### Logical assignment

| Operator | Description                            |
|----------|----------------------------------------|
| `&&=`    | Assign if current value is truthy      |
| `\|\|=`  | Assign if current value is falsy       |
| `??=`    | Assign if current value is null/undefined |

```js
let a = 1
a &&= 42
log(a)   // => 42  (a was truthy, so assigned)

let b = 0
b ||= 99
log(b)   // => 99  (b was falsy, so assigned)

let c = null
c ??= "default"
log(c)   // => default  (c was null, so assigned)
```

### Spread

Expands arrays and objects.

```js
let arr = [1, 2, 3]
log([...arr, 4, 5])   // => [1, 2, 3, 4, 5]

let obj = { a: 1, b: 2 }
log({ ...obj, c: 3 })   // => {"a":1,"b":2,"c":3}
```

### Regex operators

| Operator | Description                              |
|----------|------------------------------------------|
| `=~`     | Find - `true` if pattern is found in string |
| `==~`    | Full match - `true` if entire string matches pattern |

The right operand can be a RegExp literal or a string.

```js
log("PROJ-123 is a ticket" =~ /PROJ-\d+/)   // => true  (found in string)
log("PROJ-123" ==~ /PROJ-\d+/)       // => true  (full match)
log("PROJ-123 extra" ==~ /PROJ-\d+/) // => false (not full match)
```

With flags:

```js
log("Hello World" =~ /hello/i)   // => true
```

Useful in filtering:

```js
const emails = ["user@example.com", "not-email", "admin@test.org"]
const valid = emails.filter(e => e =~ /[^@]+@[^@]+/)
log(valid.length)   // => 2
```

### Range operators

| Operator | Description                     |
|----------|---------------------------------|
| `a..b`   | Inclusive range (a to b, both included) |
| `a..<b`  | Exclusive range (a to b, b excluded)   |

Ranges can be iterated with `for...of` and used for array/string slicing.

**Iteration:**

```js
const items = []
for (const i of 1..5) { items.push(i) }
log(items.join(","))   // => 1,2,3,4,5

const items2 = []
for (const i of 1..<5) { items2.push(i) }
log(items2.join(","))   // => 1,2,3,4
```

Reverse ranges iterate downward:

```js
const items = []
for (const i of 5..1) { items.push(i) }
log(items.join(","))   // => 5,4,3,2,1
```

**Range indexing (slicing):**

```js
const arr = [10, 20, 30, 40, 50]
log(arr[1..3])    // => [20, 30, 40]  (inclusive)
log(arr[1..<3])   // => [20, 30]      (exclusive)

const str = "Hello World"
log(str[0..4])    // => Hello   (inclusive)
log(str[0..<5])   // => Hello   (exclusive)
```

### Optional chaining

Safe property access on `null` / `undefined` values.

```js
let user = { address: { city: "NYC" } }
log(user?.address?.city)     // => NYC
log(user?.phone?.number)     // => undefined

// Optional method call
let obj = { greet: null }
log(obj.greet?.())   // => undefined

// Optional index access
let arr = null
log(arr?.[0])   // => undefined
```

### Comma

Evaluates expressions left-to-right, returns the last value.

```js
let x = (1, 2, 3)
log(x)   // => 3
```

---

## Control flow

### if / else if / else

```js
let x = 15

if (x > 20) {
  log("big")
} else if (x > 10) {
  log("medium")
} else {
  log("small")
}
// => medium
```

### for (C-style)

```js
for (let i = 0; i < 5; i++) {
  log(i)
}
// => 0, 1, 2, 3, 4
```

### for...of

Iterates over arrays, strings, Set, Map, and ranges.

```js
let fruits = ["apple", "banana", "cherry"]
for (let fruit of fruits) {
  log(fruit)
}
// => apple, banana, cherry
```

**Strings** (character-by-character):

```js
for (let ch of "Hi!") { log(ch) }
// => H, i, !
```

**Set:**

```js
let s = Set.create([10, 20, 30])
for (let v of s) { log(v) }
```

**Map** (`[key, value]` pairs):

```js
let m = Map.create([["a", 1], ["b", 2]])
for (let [k, v] of m) { log(`${k}=${v}`) }
```

**Range:**

```js
for (let i of 1..3) { log(i) }
// => 1, 2, 3
```

### for await...of

Async iteration - awaits each element in the iterable. Only valid in async context.

```js
let promises = [Promise.resolve(1), Promise.resolve(2), Promise.resolve(3)]
let sum = 0
for await (let val of promises) {
  sum += val
}
log(sum)   // => 6
```

### for...in

Iterates over object keys.

```js
let person = { name: "Alice", age: 30 }
for (let key in person) {
  log(key)
}
// => name, age
```

### while

```js
let i = 0
while (i < 3) {
  log(i)
  i++
}
```

### do...while

Executes at least once before checking the condition.

```js
let i = 5
do {
  log(i)
  i++
} while (i < 3)
// => 5
```

### switch / case / default

```js
let color = "green"

switch (color) {
  case "red":
    log("stop")
    break
  case "green":
    log("go")
    break
  default:
    log("unknown")
}
// => go
```

Without `break`, execution falls through to the next case.

### break and continue

```js
for (let i = 0; i < 10; i++) {
  if (i === 3) continue   // skip 3
  if (i === 6) break      // stop at 6
  log(i)
}
// => 0, 1, 2, 4, 5
```

### Labeled statements

Labels allow `break` and `continue` to target a specific outer loop.

```js
outer: for (let i = 0; i < 3; i++) {
  for (let j = 0; j < 3; j++) {
    if (i === 1 && j === 1) break outer
    log(`${i},${j}`)
  }
}
// => 0,0  0,1  0,2  1,0
```

### return

Exits from a function (or the top-level script).

```js
function findFirst(arr, target) {
  for (let item of arr) {
    if (item === target) return item
  }
  return null
}

log(findFirst([1, 2, 3], 2))   // => 2
```

### try / catch / finally

```js
try {
  throw "something went wrong"
} catch (e) {
  log("Caught:", e)
} finally {
  log("Cleanup done")
}
```

`catch` receives the thrown value. `finally` always executes.

**Note:** Some engine errors cannot be caught: timeout, security violations, and resource limit errors.

### Typed catch (multi-catch)

`catch` can filter by error type. If the thrown error does not match, the block is skipped and the error propagates.

**Single type:**

```js
try {
  throw new TypeError("bad type")
} catch (TypeError e) {
  log("caught: " + e.message)
}
```

**Multiple types** (separated by `|`):

```js
try {
  throw new RangeError("out of range")
} catch (TypeError | RangeError e) {
  log("caught: " + e.message)
}
```

Available error types: `Error`, `TypeError`, `RangeError`, `SyntaxError`, `ReferenceError`.

### Error constructors

Error objects are created with `new`. All error types have `name`, `message`, `stack` (empty string), and `toString()`.

```js
const e = new Error("something went wrong")
log(e.name)      // => Error
log(e.message)   // => something went wrong
log(e.toString())   // => Error: something went wrong
```

`instanceof` respects the error type hierarchy:

```js
log(new TypeError("a") instanceof TypeError)   // => true
log(new TypeError("a") instanceof Error)       // => true  (inheritance)
log(new TypeError("a") instanceof RangeError)  // => false
```

### throw

Throws a user error that can be caught by `try/catch`.

```js
function divide(a, b) {
  if (b === 0) throw "Division by zero"
  return a / b
}

try {
  divide(10, 0)
} catch (e) {
  log(e)   // => Division by zero
}
```

---

## Collections

### Array creation and access

```js
let arr = [10, 20, 30]
log(arr[0])       // => 10
log(arr.length)   // => 3

arr[1] = 99
log(arr)   // => [10, 99, 30]
```

### Object creation and access

```js
let user = { name: "Alice", age: 30 }
log(user.name)      // => Alice
log(user["age"])     // => 30

user.email = "a@b.c"
log(user)   // => {"name":"Alice","age":30,"email":"a@b.c"}
```

Shorthand property syntax:

```js
let x = 1
let y = 2
let point = { x, y }
log(point)   // => {"x":1,"y":2}
```

Computed property keys:

```js
let key = "status"
let obj = { [key]: "active" }
log(obj)   // => {"status":"active"}
```

Shorthand methods:

```js
let calc = {
  add(a, b) { return a + b },
  mul(a, b) { return a * b }
}
log(calc.add(2, 3))   // => 5
```

Getters, setters, and async methods in object literals:

```js
let obj = {
  _name: "Alice",
  get name() { return this._name },
  set name(v) { this._name = v.toUpperCase() },
  async fetchData() { return await Promise.resolve(42) }
}
log(obj.name)       // => Alice
obj.name = "bob"
log(obj.name)       // => BOB
```

---

## Destructuring

### Array destructuring

```js
let [a, b, c] = [1, 2, 3]
log(a, b, c)   // => 1 2 3
```

Skipping elements:

```js
let [first, , third] = [10, 20, 30]
log(first, third)   // => 10 30
```

Default values:

```js
let [x = 0, y = 0] = [42]
log(x, y)   // => 42 0
```

Rest elements:

```js
let [head, ...tail] = [1, 2, 3, 4, 5]
log(head)   // => 1
log(tail)   // => [2, 3, 4, 5]
```

### Object destructuring

```js
let { name, age } = { name: "Alice", age: 30 }
log(name)   // => Alice
```

Aliasing:

```js
let { name: fullName } = { name: "Bob" }
log(fullName)   // => Bob
```

Default values:

```js
let { x = 10, y = 20 } = { x: 5 }
log(x, y)   // => 5 20
```

Rest elements:

```js
let { a, ...rest } = { a: 1, b: 2, c: 3 }
log(rest)   // => {"b":2,"c":3}
```

### Nested destructuring

```js
let { address: { city } } = { address: { city: "NYC" } }
log(city)   // => NYC

let [[a, b], [c, d]] = [[1, 2], [3, 4]]
log(a, b, c, d)   // => 1 2 3 4
```

---

## Comments and semicolons

Both single-line and multi-line comments are supported:

```js
// This is a single-line comment

/* This is a
   multi-line comment */

let x = 42   // inline comment
```

Semicolons are optional:

```js
let a = 1;
let b = 2
log(a + b)   // => 3
```

---

## Next steps

- [JS: Functions & Classes](/docs/jibrok-studio-jira/scripting-functions-classes) - Function declarations, arrow functions, closures, classes
- [JS: Type Methods](/docs/jibrok-studio-jira/scripting-type-methods) - Available methods on strings, arrays, numbers
- [JS: Differences from Standard JS](/docs/jibrok-studio-jira/scripting-differences-from-js) - What works differently
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Overview and sandbox details
