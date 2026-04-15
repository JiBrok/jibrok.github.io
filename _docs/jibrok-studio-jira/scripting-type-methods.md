---
title: "JS: Type Methods"
seo_title: "Type Methods - String, Array, Date in Jira Scripts"
key: jibrok-studio-jira
excerpt: Whitelisted methods for strings, arrays, numbers, dates, objects, and wrapper types
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - methods
  - strings
  - arrays
  - dates
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

> Part of the [Scripting Language](/docs/jibrok-studio-jira/scripting-language) reference.

Only whitelisted methods can be called on values. Calling a non-whitelisted method throws a security error.

---

## String methods (30)

| Method | Description |
|--------|-------------|
| `s.charAt(i)` | Character at index |
| `s.charCodeAt(i)` | Character code at index |
| `s.codePointAt(i)` | Unicode code point at index |
| `s.concat(...strs)` | Concatenate strings |
| `s.endsWith(str)` | Check if ends with substring |
| `s.includes(str)` | Check if contains substring |
| `s.indexOf(str)` | First index of substring (-1 if absent) |
| `s.lastIndexOf(str)` | Last index of substring |
| `s.localeCompare(str)` | Locale-aware comparison (-1, 0, or 1) |
| `s.match(regex)` | Match against regex |
| `s.matchAll(regex)` | All matches as array of arrays |
| `s.normalize(form)` | Unicode normalization (NFC, NFD, etc.) |
| `s.padEnd(len, fill)` | Pad end to target length |
| `s.padStart(len, fill)` | Pad start to target length |
| `s.repeat(n)` | Repeat string n times |
| `s.replace(find, rep)` | Replace first occurrence |
| `s.replaceAll(find, rep)` | Replace all occurrences |
| `s.search(regex)` | Search for regex match position |
| `s.slice(start, end)` | Extract substring by indices |
| `s.split(sep)` | Split into array |
| `s.startsWith(str)` | Check if starts with substring |
| `s.substring(start, end)` | Extract substring |
| `s.toLowerCase()` | Convert to lowercase |
| `s.toUpperCase()` | Convert to uppercase |
| `s.trim()` | Remove whitespace from both ends |
| `s.trimStart()` | Remove whitespace from start |
| `s.trimEnd()` | Remove whitespace from end |
| `s.at(i)` | Character at index (negative supported) |
| `s.toString()` | Convert to string |
| `s.toDate()` | Parse ISO date string to Date object |

```js
let s = "Hello, World!"

log(s.charAt(0))          // => H
log(s.includes("World"))  // => true
log(s.indexOf("World"))   // => 7
log(s.slice(0, 5))        // => Hello
log(s.split(", "))        // => [Hello, World!]
log(s.toLowerCase())      // => hello, world!
log(s.toUpperCase())      // => HELLO, WORLD!
log(s.trim())             // => Hello, World!
log(s.replace("World", "there"))   // => Hello, there!
log(s.at(-1))             // => !

log("42".padStart(5, "0"))   // => 00042
log("ha".repeat(3))         // => hahaha
```

**matchAll** - returns all regex matches:

```js
let text = "cat bat hat"
let re = RegExp.create("[a-z]at", "g")
let matches = text.matchAll(re)
log(matches.length)   // => 3
```

---

## String smart value methods (28)

Automation-compatible methods callable on any string. All methods returning strings are chainable.

### Text manipulation

| Method | Description |
|--------|-------------|
| `s.capitalize()` | First letter uppercase, rest unchanged |
| `s.abbreviate(maxLen)` | Shorten with "..." suffix (maxLen >= 4) |
| `s.left(n)` | First n characters |
| `s.right(n)` | Last n characters |
| `s.remove(sub)` | Remove all occurrences of sub |
| `s.reverse()` | Reverse string (unicode-safe) |

```js
log("hello world".capitalize())     // => Hello world
log("hello world".abbreviate(8))    // => hello...
log("hello".left(3))                 // => hel
log("hello".right(3))                // => llo
log("a.b.c".remove("."))            // => abc
log("hello".reverse())               // => olleh
```

### Substring extraction

| Method | Description |
|--------|-------------|
| `s.substringBefore(sep)` | Text before first occurrence of sep |
| `s.substringAfter(sep)` | Text after first occurrence of sep |
| `s.substringBetween(open, close?)` | Text between delimiters (null if not found) |

```js
log("user@example.com".substringBefore("@"))    // => user
log("user@example.com".substringAfter("@"))     // => example.com
log("(hello)".substringBetween("(", ")"))        // => hello
log("*bold*".substringBetween("*"))              // => bold
```

### Checks

| Method | Description |
|--------|-------------|
| `s.isEmpty()` | True if length is 0 |
| `s.isNotEmpty()` | True if length > 0 |
| `s.isBlank()` | True if empty or whitespace only |
| `s.isNotBlank()` | True if contains non-whitespace |
| `s.equalsIgnoreCase(other)` | Case-insensitive comparison |
| `s.isAlpha()` | Only letters (a-zA-Z), non-empty |
| `s.isAlphanumeric()` | Only letters and digits, non-empty |
| `s.isNumeric()` | Only digits (0-9), non-empty |

```js
log("".isEmpty())                     // => true
log("  ".isBlank())                   // => true
log("Hello".equalsIgnoreCase("HELLO"))   // => true
log("abc".isAlpha())                  // => true
log("abc123".isAlphanumeric())        // => true
log("12345".isNumeric())              // => true
```

### Conversion

| Method | Description |
|--------|-------------|
| `s.asNumber()` | Convert to number, null if invalid |

```js
log("42".asNumber())       // => 42
log("3.14".asNumber())     // => 3.14
log("abc".asNumber())      // => null
```

### Encoding

| Method | Description |
|--------|-------------|
| `s.htmlEncode()` | Escape `& < > " '` as HTML entities |
| `s.jsonEncode()` | Escape `\ " \n \r \t` for JSON embedding |
| `s.xmlEncode()` | Escape `& < > " '` as XML entities |
| `s.urlEncode()` | URL-encode (encodeURIComponent) |
| `s.quote()` | Escape regex special characters |

```js
log("<b>A & B</b>".htmlEncode())    // => &lt;b&gt;A &amp; B&lt;/b&gt;
log('say "hello"'.jsonEncode())      // => say \"hello\"
log("<tag>".xmlEncode())             // => &lt;tag&gt;
log("hello world".urlEncode())       // => hello%20world
log("a.b*c".quote())                 // => a\.b\*c
```

### Case conversion and word splitting

| Method | Description |
|--------|-------------|
| `s.camelCase()` | "hello world" -> "helloWorld" |
| `s.kebabCase()` | "helloWorld" -> "hello-world" |
| `s.snakeCase()` | "helloWorld" -> "hello_world" |
| `s.words()` | Split into array of words (camelCase-aware) |
| `s.lines()` | Split by newline into array |

```js
log("hello world".camelCase())       // => helloWorld
log("helloWorld".kebabCase())         // => hello-world
log("helloWorld".snakeCase())         // => hello_world
log("helloWorld".words())             // => [hello, World]
log("a\nb\nc".lines())               // => [a, b, c]
```

### Chaining

All methods returning strings can be chained with each other and with native string methods:

```js
log("  hello world  ".trim().capitalize().abbreviate(8))   // => Hello...
log("user@example.com".substringBefore("@").capitalize())   // => User
log("HELLO WORLD".toLowerCase().capitalize())                // => Hello world
```

---

## Array methods

### Non-callback methods (23)

| Method | Description |
|--------|-------------|
| `a.push(...vals)` | Add to end, return new length |
| `a.pop()` | Remove and return last element |
| `a.shift()` | Remove and return first element |
| `a.unshift(...vals)` | Add to start, return new length |
| `a.concat(...arrs)` | Merge arrays |
| `a.slice(start, end)` | Extract sub-array |
| `a.splice(i, del, ...add)` | Remove/insert elements |
| `a.indexOf(val)` | First index of value |
| `a.lastIndexOf(val)` | Last index of value |
| `a.includes(val)` | Check if contains value |
| `a.join(sep)` | Join elements into string |
| `a.reverse()` | Reverse in place |
| `a.at(i)` | Element at index (negative supported) |
| `a.flat(depth)` | Flatten nested arrays |
| `a.fill(val, start, end)` | Fill with value |
| `a.copyWithin(t, s, e)` | Copy elements within array |
| `a.with(index, value)` | Return copy with one element replaced |
| `a.toReversed()` | Return reversed copy (original unchanged) |
| `a.toSpliced(i, del, ...add)` | Return spliced copy (original unchanged) |
| `a.keys()` | Array of indices |
| `a.values()` | Array of values |
| `a.entries()` | Array of `[index, value]` pairs |
| `a.toString()` | String representation |

```js
let arr = [3, 1, 4, 1, 5]

log(arr.indexOf(4))      // => 2
log(arr.includes(5))     // => true
log(arr.slice(1, 3))     // => [1, 4]
log(arr.join("-"))        // => 3-1-4-1-5
log(arr.at(-1))           // => 5

let nested = [[1, 2], [3, [4, 5]]]
log(nested.flat())        // => [1, 2, 3, [4, 5]]
log(nested.flat(2))       // => [1, 2, 3, 4, 5]
```

**Immutable methods:**

```js
let arr = [3, 1, 4]
log(arr.toReversed())   // => [4, 1, 3]
log(arr)                 // => [3, 1, 4]  (unchanged)

log(arr.with(1, 99))   // => [3, 99, 4]
log(arr)                 // => [3, 1, 4]  (unchanged)
```

### Callback methods (16)

| Method | Description |
|--------|-------------|
| `a.map(fn)` | Transform each element |
| `a.filter(fn)` | Keep elements where fn returns true |
| `a.find(fn)` | First element where fn returns true |
| `a.findIndex(fn)` | Index of first match |
| `a.findLast(fn)` | Last element where fn returns true |
| `a.findLastIndex(fn)` | Index of last match |
| `a.every(fn)` | True if fn returns true for all |
| `a.some(fn)` | True if fn returns true for any |
| `a.forEach(fn)` | Execute fn for each element |
| `a.reduce(fn, init)` | Reduce to single value (left to right) |
| `a.reduceRight(fn, init)` | Reduce to single value (right to left) |
| `a.flatMap(fn)` | Map then flatten one level |
| `a.sort(fn)` | Sort in place with comparator |
| `a.toSorted(fn)` | Return sorted copy (original unchanged) |
| `a.group(fn)` | Group elements into object by key function |
| `a.collectEntries(fn)` | Transform to object via `[key, value]` pairs |

```js
let nums = [1, 2, 3, 4, 5]

log(nums.map(x => x * 2))           // => [2, 4, 6, 8, 10]
log(nums.filter(x => x > 3))        // => [4, 5]
log(nums.find(x => x > 3))          // => 4
log(nums.every(x => x > 0))         // => true
log(nums.some(x => x > 4))          // => true
log(nums.reduce((sum, x) => sum + x, 0))   // => 15
```

**group** - group elements by key:

```js
let nums = [1, 2, 3, 4, 5]
let grouped = nums.group(n => n % 2 === 0 ? "even" : "odd")
log(grouped.odd)    // => [1, 3, 5]
log(grouped.even)   // => [2, 4]
```

**collectEntries** - build object from `[key, value]` pairs:

```js
let users = [{name: "Alice", age: 30}, {name: "Bob", age: 25}]
let map = users.collectEntries(u => [u.name, u.age])
log(map)   // => {Alice: 30, Bob: 25}
```

**toSorted** - sorted copy without mutating:

```js
let arr = [3, 1, 4]
let sorted = arr.toSorted((a, b) => a - b)
log(sorted)   // => [1, 3, 4]
log(arr)       // => [3, 1, 4]  (unchanged)
```

---

## Array smart value methods (9)

Automation-compatible aggregation and access methods on arrays.

| Method | Returns | Description |
|--------|---------|-------------|
| `a.first()` | any/null | First element, null if empty |
| `a.last()` | any/null | Last element, null if empty |
| `a.size()` | number | Number of elements |
| `a.isEmpty()` | boolean | True if empty |
| `a.distinct()` | array | Unique elements (preserves order) |
| `a.sum()` | number | Sum of numeric elements (skips non-numeric) |
| `a.average()` | number | Average of numeric elements |
| `a.min()` | number/null | Minimum numeric value, null if none |
| `a.max()` | number/null | Maximum numeric value, null if none |

```js
log([10, 20, 30].first())          // => 10
log([10, 20, 30].last())           // => 30
log([].first())                     // => null

log([1, 2, 3].size())              // => 3
log([].isEmpty())                   // => true

log([1, 2, 2, 3, 1].distinct())   // => [1, 2, 3]

log([10, 20, 30].sum())            // => 60
log([10, 20, 30].average())        // => 20
log([5, 2, 8, 1].min())           // => 1
log([5, 2, 8, 1].max())           // => 8

// Non-numeric values are skipped in sum/average/min/max
log([1, "two", 3].sum())           // => 4

// Chaining with native methods
log([3, 1, 2, 1].distinct().toSorted((a,b) => a-b).first())   // => 1
```

---

## Date standard methods

Standard JavaScript Date getters and setters are available on all Date objects.

### Getters

| Method | Description |
|--------|-------------|
| `d.getTime()` | Milliseconds since epoch |
| `d.getFullYear()` | 4-digit year |
| `d.getMonth()` | Month (0-11) |
| `d.getDate()` | Day of month (1-31) |
| `d.getDay()` | Day of week (0=Sun, 6=Sat) |
| `d.getHours()` | Hours (0-23) |
| `d.getMinutes()` | Minutes (0-59) |
| `d.getSeconds()` | Seconds (0-59) |
| `d.getMilliseconds()` | Milliseconds (0-999) |
| `d.getTimezoneOffset()` | UTC offset in minutes |

UTC variants: `getUTCFullYear()`, `getUTCMonth()`, `getUTCDate()`, `getUTCDay()`, `getUTCHours()`, `getUTCMinutes()`, `getUTCSeconds()`, `getUTCMilliseconds()`.

### Setters

| Method | Description |
|--------|-------------|
| `d.setFullYear(y, m?, d?)` | Set year (optionally month, day) |
| `d.setMonth(m, d?)` | Set month (0-11, optionally day) |
| `d.setDate(d)` | Set day of month |
| `d.setHours(h, m?, s?, ms?)` | Set hours (optionally min, sec, ms) |
| `d.setMinutes(m, s?, ms?)` | Set minutes |
| `d.setSeconds(s, ms?)` | Set seconds |
| `d.setMilliseconds(ms)` | Set milliseconds |
| `d.setTime(ms)` | Set time from epoch milliseconds |

UTC variants: `setUTCFullYear()`, `setUTCMonth()`, `setUTCDate()`, `setUTCHours()`, `setUTCMinutes()`, `setUTCSeconds()`, `setUTCMilliseconds()`.

### Conversion

| Method | Description |
|--------|-------------|
| `d.toISOString()` | ISO 8601 format |
| `d.toDateString()` | Date portion as string |
| `d.toTimeString()` | Time portion as string |
| `d.toLocaleString(locale?, options?)` | Locale-formatted string |
| `d.toLocaleDateString(locale?, options?)` | Locale-formatted date |
| `d.toLocaleTimeString(locale?, options?)` | Locale-formatted time |
| `d.toUTCString()` | UTC string |
| `d.toJSON()` | JSON representation (ISO string) |
| `d.valueOf()` | Milliseconds since epoch |

---

## Date navigation and presets

### Comparison

| Method | Returns | Description |
|--------|---------|-------------|
| `d.compareTo(other)` | number | -1, 0, or 1 |

### Start/end navigation

| Method | Returns | Description |
|--------|---------|-------------|
| `d.startOfDay()` | Date | Midnight UTC |
| `d.endOfDay()` | Date | 23:59:59.999 UTC |
| `d.startOfMonth()` | Date | First day of month |
| `d.endOfMonth()` | Date | Last day of month |
| `d.startOfYear()` | Date | January 1st |
| `d.endOfYear()` | Date | December 31st |

### Day-of-week navigation

| Method | Returns | Description |
|--------|---------|-------------|
| `d.withNextDayOfWeek(day)` | Date | Next given weekday (min +1 day) |
| `d.firstOfTheMonth(day)` | Date | First given weekday in month |
| `d.lastOfTheMonth(day)` | Date | Last given weekday in month |

Day names: `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday` (or short: `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`).

### Format presets

| Method | Example Output | Description |
|--------|---------------|-------------|
| `d.jiraDate()` | `2024-06-15` | YYYY-MM-DD |
| `d.jiraDateTime()` | `2024-06-15T14:30:45.123Z` | ISO 8601 |
| `d.shortDate()` | `6/15/24` | M/D/YY |
| `d.shortTime()` | `2:30 PM` | h:mm AM/PM |
| `d.shortDateTime()` | `6/15/24 2:30 PM` | Short date + time |
| `d.mediumDate()` | `Jun 15, 2024` | MMM D, YYYY |
| `d.mediumTime()` | `2:30:45 PM` | h:mm:ss AM/PM |
| `d.mediumDateTime()` | `Jun 15, 2024 2:30:45 PM` | Medium date + time |
| `d.longDate()` | `June 15, 2024` | Full month name |
| `d.longDateTime()` | `June 15, 2024 2:30:45 PM UTC` | Long date + time + UTC |
| `d.fullDate()` | `Saturday, June 15, 2024` | Day + full date |
| `d.fullDateTime()` | `Saturday, June 15, 2024 2:30:45 PM UTC` | Full day + date + time |

### Format tokens

Additional tokens for `format()`:

| Token | Description | Example |
|-------|-------------|---------|
| `MMMM` | Full month name | June |
| `MMM` | Short month name | Jun |
| `M` | Month without padding | 6 |
| `d` | Day without padding | 5 |
| `H` | 24h hour without padding | 9 |
| `h` | 12h hour without padding | 2 |
| `m` | Minute without padding | 5 |
| `s` | Second without padding | 3 |

### Business days

| Method | Returns | Description |
|--------|---------|-------------|
| `d.isBusinessDay()` | boolean | Mon-Fri |
| `d.toBusinessDay()` | Date | Move weekend to next Monday |
| `d.toBusinessDayBackwards()` | Date | Move weekend to previous Friday |
| `d.plusBusinessDays(n)` | Date | Add n business days (max 10000) |
| `d.minusBusinessDays(n)` | Date | Subtract n business days (max 10000) |
| `d.firstBusinessDayOfMonth()` | Date | First weekday of month |
| `d.lastBusinessDayOfMonth()` | Date | Last weekday of month |

```js
let d = Date.create("2024-06-15T14:30:00Z")  // Saturday

// Navigation
log(d.startOfDay().toISOString())    // => 2024-06-15T00:00:00.000Z
log(d.endOfMonth().jiraDate())       // => 2024-06-30
log(d.withNextDayOfWeek("monday").jiraDate())   // => 2024-06-17

// Format presets
log(d.jiraDate())        // => 2024-06-15
log(d.mediumDate())      // => Jun 15, 2024
log(d.fullDate())        // => Saturday, June 15, 2024

// Business days
log(d.isBusinessDay())              // => false (Saturday)
log(d.toBusinessDay().jiraDate())   // => 2024-06-17 (Monday)
log(d.startOfMonth().plusBusinessDays(3).jiraDate())   // => 2024-06-05
```

---

## Date timezone

Two methods for working with timezones. Both accept IANA timezone names (e.g. `"America/New_York"`, `"Asia/Tokyo"`, `"Europe/London"`).

### setTimeZone - display only

Changes how the date is **displayed** without changing the underlying timestamp. Affects `format()`, all format presets, and `toString()`. Does not affect `getTime()`, `getUTC*()`, arithmetic, or navigation.

```js
let d = Date.create("2024-06-15T14:30:00Z")

// UTC 14:30 -> New York (UTC-4) = 10:30
log(d.setTimeZone("America/New_York").format("HH:mm"))   // => 10:30

// Timestamp is unchanged
log(d.setTimeZone("Asia/Tokyo").getTime() === d.getTime())   // => true

// longDateTime/fullDateTime show timezone name
log(d.setTimeZone("America/New_York").longDateTime())
// => June 15, 2024 10:30:00 AM America/New_York
```

### convertToTimeZone - real conversion

Converts to another timezone by **shifting the timestamp**. The UTC components of the new Date equal the wall clock in the target timezone. Useful for navigation operations like getting midnight in a specific timezone.

```js
let d = Date.create("2024-06-15T14:30:00Z")

// UTC 14:30 -> New York (UTC-4): getUTCHours() = 10
let ny = d.convertToTimeZone("America/New_York")
log(ny.getUTCHours())    // => 10

// Get midnight in Tokyo
log(d.convertToTimeZone("Asia/Tokyo").startOfDay().jiraDate())
// => 2024-06-15
```

### Difference between setTimeZone and convertToTimeZone

- **`setTimeZone`**: Same moment in time, different display. Use for formatting output.
- **`convertToTimeZone`**: Different moment in time, UTC components = wall clock. Use before navigation (`startOfDay`, `endOfMonth`) when you need timezone-aware boundaries.

---

## Number methods (6)

| Method | Description |
|--------|-------------|
| `n.toFixed(d)` | Format with d decimal places |
| `n.toPrecision(p)` | Format with p significant digits |
| `n.toExponential(d)` | Format in exponential notation |
| `n.toString(radix)` | Convert to string (optional radix) |
| `n.toLocaleString()` | Format with locale-specific formatting |
| `n.valueOf()` | Primitive numeric value |

```js
let pi = 3.14159
log(pi.toFixed(2))        // => 3.14
log(pi.toPrecision(4))    // => 3.142
log((255).toString(16))   // => ff
log((1234567).toLocaleString())   // => 1,234,567
```

---

## Object methods (4)

| Method | Description |
|--------|-------------|
| `o.hasOwnProperty(key)` | Check if object has own property |
| `o.toString()` | String representation |
| `o.valueOf()` | Primitive value |
| `o.collectEntries(fn)` | Transform entries to new object via `[key, value]` pairs |

```js
let obj = { a: 1, b: 2 }
log(obj.hasOwnProperty("a"))   // => true
log(obj.hasOwnProperty("c"))   // => false

// collectEntries - transform object entries
let prices = { apple: 1.5, banana: 2.0, cherry: 3.5 }
let doubled = prices.collectEntries((k, v) => [k, v * 2])
log(doubled)   // => {apple: 3, banana: 4, cherry: 7}
```

---

## Set methods

Create sets with `Set.create()`. Sets store unique values with O(1) lookup.

| Method | Returns | Description |
|--------|---------|-------------|
| `Set.create(arr?)` | Set | Create a new Set (optionally from array) |
| `s.add(value)` | Set | Add value, returns the set (chainable) |
| `s.has(value)` | boolean | Check if value exists |
| `s.delete(value)` | boolean | Remove value, returns true if existed |
| `s.clear()` | void | Remove all values |
| `s.size` | number | Number of elements |
| `s.values()` | array | All values as array |
| `s.toArray()` | array | All values as array (alias for values) |
| `s.forEach(fn)` | void | Execute fn for each value |

```js
let s = Set.create([1, 2, 3])
s.add(4)
log(s.has(2))        // => true
log(s.size)          // => 4
log(s.values())      // => [1, 2, 3, 4]
log(s.toArray())     // => [1, 2, 3, 4]

s.delete(2)
log(s.has(2))        // => false

// Deduplicate an array
let unique = Set.create([1, 2, 2, 3, 1]).toArray()
log(unique)          // => [1, 2, 3]
```

---

## Map methods

Create maps with `Map.create()`. Maps store key-value pairs with O(1) lookup.

| Method | Returns | Description |
|--------|---------|-------------|
| `Map.create(entries?)` | Map | Create a new Map (optionally from `[[key, value]]` array) |
| `m.set(key, value)` | Map | Set key-value pair, returns the map (chainable) |
| `m.get(key)` | any | Get value by key |
| `m.has(key)` | boolean | Check if key exists |
| `m.delete(key)` | boolean | Remove key, returns true if existed |
| `m.clear()` | void | Remove all entries |
| `m.size` | number | Number of entries |
| `m.keys()` | array | All keys as array |
| `m.values()` | array | All values as array |
| `m.entries()` | array | All `[key, value]` pairs as array |
| `m.forEach(fn)` | void | Execute fn(value, key) for each entry |
| `m.toObject()` | object | Convert to plain object |

```js
let m = Map.create([["a", 1], ["b", 2]])
m.set("c", 3)
log(m.get("a"))       // => 1
log(m.has("b"))       // => true
log(m.size)           // => 3
log(m.keys())         // => [a, b, c]
log(m.entries())      // => [[a, 1], [b, 2], [c, 3]]

// Convert to plain object
let obj = m.toObject()
log(obj)              // => {a: 1, b: 2, c: 3}
```

---

## User wrapper

`Users.current()` and `Users.get(accountId)` return frozen User objects with typed properties.

| Property | Description |
|----------|-------------|
| `displayName` | User display name |
| `accountId` | Atlassian account ID |
| `emailAddress` | User email address |
| `avatarUrl` | Avatar URL (48x48) |
| `active` | Is account active (default: false) |
| `timeZone` | User timezone |
| `locale` | User locale |
| `accountType` | Account type |
| `self` | REST API URL |

| Method | Return | Description |
|--------|--------|-------------|
| `toString()` | string | displayName or accountId or "Unknown User" |
| `toJSON()` | object | Plain object without internal fields |
| `equals(other)` | boolean | Compare by accountId |

RichIssue also exposes:

- `issue.assigneeUser` - Assignee as User wrapper (null if unassigned)
- `issue.reporterUser` - Reporter as User wrapper
- `issue.projectObj` - Project as Project wrapper

```js
const user = Users.current()
log(user.displayName)     // => John Doe
log(user.timeZone)        // => America/New_York

const issue = Issues.get("TEST-1")
log(issue.assigneeUser?.displayName)
log(issue.reporterUser?.equals(user))
```

---

## Project wrapper

`Projects.get(key)` returns a frozen Project object with typed properties and async methods.

| Property | Description |
|----------|-------------|
| `key` | Project key |
| `name` | Project name |
| `id` | Project ID |
| `projectTypeKey` | Project type (software, etc.) |
| `simplified` | Is simplified project (default: false) |
| `description` | Project description |
| `lead` | Project lead (User wrapper or null) |
| `avatarUrl` | Avatar URL (48x48) |
| `self` | REST API URL |
| `url` | Project URL |

| Method | Return | Description |
|--------|--------|-------------|
| `toString()` | string | Project key |
| `toJSON()` | object | Plain object without internal fields |
| `equals(other)` | boolean | Compare by key |
| `getComponents()` | array | Project components |
| `getVersions()` | array | Project versions |
| `getStatuses()` | array | Project statuses |
| `getRoles()` | object | Project roles |

```js
const proj = Projects.get("PROJ")
log(proj.name)                // => My Project
log(proj.lead?.displayName)   // => Jane Lead
const comps = proj.getComponents()
```

---

## Next steps

- [JS: Language Basics](/docs/jibrok-studio-jira/scripting-language-basics) - Core language features
- [JS: Functions & Classes](/docs/jibrok-studio-jira/scripting-functions-classes) - Function syntax
- [Smart Value Methods](/docs/jibrok-studio-jira/scripting-api-smart-values) - Additional smart value methods on dates
- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Overview and sandbox details
