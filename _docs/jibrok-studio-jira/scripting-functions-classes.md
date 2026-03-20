---
title: "JS: Functions & Classes"
seo_title: "Functions and Classes in Jira Scripts"
key: jibrok-studio-jira
excerpt: Function declarations, arrow functions, closures, recursion, classes, and inheritance
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - functions
  - classes
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

> Part of the [Scripting Language](/docs/jibrok-studio-jira/scripting-language) reference.

## Function declarations

```js
function greet(name) {
  return "Hello, " + name + "!"
}

log(greet("Alice"))   // => Hello, Alice!
```

## Arrow functions

```js
let double = (x) => x * 2
log(double(5))   // => 10

let add = (a, b) => a + b
log(add(3, 4))   // => 7

// Multi-line arrow with block body
let factorial = (n) => {
  if (n <= 1) return 1
  return n * factorial(n - 1)
}
log(factorial(5))   // => 120
```

Single-parameter arrows do not require parentheses:

```js
let square = x => x * x
log(square(4))   // => 16
```

No-parameter arrows require empty parentheses:

```js
let greet = () => "Hello!"
log(greet())   // => Hello!
```

## Function expressions

Functions can be used as expressions - assigned to variables, passed as arguments, or used inline.

**Anonymous function expression:**

```js
const double = function(x) { return x * 2 }
log(double(5))   // => 10
```

**Named function expression** - the name is only visible inside the function body (useful for recursion):

```js
const f = function fact(n) {
  return n <= 1 ? 1 : n * fact(n - 1)
}
log(f(5))           // => 120
log(typeof fact)    // => undefined  (name not visible outside)
```

**Async function expression:**

```js
const fetchVal = async function(x) { return await Promise.resolve(x) }
log(await fetchVal(42))   // => 42
```

**IIFE (Immediately Invoked Function Expression):**

```js
const result = (function(x) { return x + x })(10)
log(result)   // => 20
```

Function expressions can be used in any expression context:

```js
const obj = { calc: function(x) { return x * 2 } }
log(obj.calc(5))   // => 10
```

## Default parameters

```js
function greet(name = "world") {
  return `Hello, ${name}!`
}

log(greet())          // => Hello, world!
log(greet("Alice"))   // => Hello, Alice!
```

## Rest parameters

Collects remaining arguments into an array.

```js
function sum(...nums) {
  return nums.reduce((a, b) => a + b, 0)
}

log(sum(1, 2, 3))       // => 6
log(sum(10, 20, 30, 40)) // => 100
```

Rest parameter must be the last parameter:

```js
function first(head, ...tail) {
  log("head:", head)
  log("tail:", tail)
}

first(1, 2, 3, 4)
// => head: 1
// => tail: [2, 3, 4]
```

## arguments Object

Every function receives an implicit `arguments` array containing all passed arguments.

```js
function showArgs() {
  log(arguments)
}

showArgs(1, "two", true)   // => [1, two, true]
```

> **Note:** In the engine, arrow functions also have their own `arguments` object (unlike standard JavaScript). See [Differences from JavaScript](/docs/jibrok-studio-jira/scripting-differences-from-js).

## Tagged template literals

A function can be called with a template literal as its argument:

```js
function tag(strings, ...values) {
  let result = ""
  for (let i = 0; i < strings.length; i++) {
    result += strings[i]
    if (i < values.length) result += String(values[i]).toUpperCase()
  }
  return result
}

let name = "world"
log(tag`hello ${name}!`)   // => hello WORLD!
```

## Closures

Functions capture variables from their enclosing scope.

```js
function makeCounter() {
  let count = 0
  return () => {
    count++
    return count
  }
}

let counter = makeCounter()
log(counter())   // => 1
log(counter())   // => 2
log(counter())   // => 3
```

## Recursion

```js
function fib(n) {
  if (n <= 1) return n
  return fib(n - 1) + fib(n - 2)
}

log(fib(10))   // => 55
```

## Higher-order functions

Functions can be passed as arguments and returned from other functions.

```js
function apply(fn, value) {
  return fn(value)
}

log(apply(x => x * 3, 7))   // => 21

function multiplier(factor) {
  return (x) => x * factor
}

let triple = multiplier(3)
log(triple(5))   // => 15
```

## Hoisting

**Function declarations** are fully hoisted - they can be called before their definition:

```js
log(greet("Alice"))   // => Hello, Alice!

function greet(name) {
  return "Hello, " + name + "!"
}
```

**`var` declarations** are hoisted as `undefined`:

```js
log(x)     // => undefined
var x = 5
log(x)     // => 5
```

**`let` / `const`** are NOT hoisted:

```js
// log(y)   // ReferenceError: 'y' is not defined
let y = 10
```

---

## Classes

### Class declarations

```js
class Dog {
  constructor(name) {
    this.name = name
  }
  bark() {
    return this.name + " says woof"
  }
}

const d = new Dog("Rex")
log(d.bark())   // => Rex says woof
```

A class without an explicit constructor gets a default empty one.

### The new operator

`new` creates instances of user-defined classes, built-in types, and error constructors.

```js
const p = new Point(3, 4)      // User-defined class
const d = new Date(2024, 0, 15) // Built-in type
const re = new RegExp("^hello", "i")
const s = new Set([1, 2, 3])
const err = new TypeError("bad type")  // Error constructor
```

### The this keyword

`this` refers to the current instance inside constructors and methods.

**Method chaining** - methods that return `this` enable fluent APIs:

```js
class Builder {
  constructor() { this.parts = [] }
  add(p) { this.parts.push(p); return this }
  build() { return this.parts.join("-") }
}

log(new Builder().add("a").add("b").add("c").build())   // => a-b-c
```

### Inheritance (extends)

```js
class Animal {
  speak() { return "generic sound" }
}
class Dog extends Animal {
  speak() { return "woof" }
}

log(new Dog().speak())   // => woof
```

Multi-level inheritance:

```js
class A { base() { return "base" } }
class B extends A { whoAmI() { return "B" } }
class C extends B {}

const c = new C()
log(c.whoAmI() + "," + c.base())   // => B,base
```

### super

`super()` calls the parent constructor. `super.method()` calls a parent method.

```js
class Animal {
  constructor(name) { this.name = name }
}
class Dog extends Animal {
  constructor(name, breed) {
    super(name)
    this.breed = breed
  }
}

const d = new Dog("Rex", "Lab")
log(d.name + " is a " + d.breed)   // => Rex is a Lab
```

### Static methods

Static methods belong to the class itself, not to instances.

```js
class MathHelper {
  static add(a, b) { return a + b }
}

log(MathHelper.add(3, 4))   // => 7
```

### Getters and setters

```js
class Circle {
  constructor(radius) { this.radius = radius }
  get area() { return 3.14 * this.radius * this.radius }
}

log(new Circle(10).area)   // => 314
```

```js
class Person {
  constructor(name) { this._name = name }
  get name() { return this._name }
  set name(val) { this._name = val.toUpperCase() }
}

const p = new Person("alice")
p.name = "bob"
log(p.name)   // => BOB
```

### Class fields

```js
class Counter {
  count = 0
  increment() { this.count++ }
}

const c = new Counter()
log(c.count)     // => 0
c.increment()
log(c.count)     // => 1
```

**Static fields:**

```js
class Config {
  static defaultTimeout = 5000
}
log(Config.defaultTimeout)   // => 5000
```

**Private fields** (`#` prefix) - not accessible outside the class:

```js
class Secret {
  #value = 42
  getValue() { return this.#value }
}

const s = new Secret()
log(s.getValue())   // => 42
log(s.value)         // => undefined  (private field not exposed)
```

### Class expressions

```js
const Foo = class {
  getValue() { return 42 }
}
log(new Foo().getValue())   // => 42
```

### instanceof with Classes

```js
class Animal {}
class Dog extends Animal {}

const d = new Dog()
log(d instanceof Dog)      // => true
log(d instanceof Animal)   // => true  (inheritance chain)
```

### Async methods

```js
class Fetcher {
  async getData() {
    return await Promise.resolve(42)
  }
}

const result = await new Fetcher().getData()
log(result)   // => 42
```

---

## Next steps

- [JS: Language Basics](/docs/jibrok-studio-jira/scripting-language-basics) - Variables, operators, control flow
- [JS: Async/Await](/docs/jibrok-studio-jira/scripting-async-await) - Async functions and Promise API
- [JS: Differences from Standard JS](/docs/jibrok-studio-jira/scripting-differences-from-js) - What works differently
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Overview and sandbox details
