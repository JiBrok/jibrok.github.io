---
title: "Groovy Engine"
seo_title: "Groovy Scripts for Jira Cloud - Migrate from DC"
key: jibrok-studio-jira
excerpt: Groovy-like syntax engine - supported constructs, Java/Groovy classes, GDK methods, and type extensions
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - groovy
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Overview

The Groovy engine provides Groovy-like syntax for writing scripts in JiBrok Studio. It supports closures, GDK-style collection methods, Java date/time classes, JSON handling, and other Groovy/Java idioms. Scripts have access to the same Jira APIs as the JavaScript engine.

Select **Groovy** from the engine dropdown in the [Script Console](/docs/jibrok-studio-jira/script-console) or script configuration to use this engine.

> **Note:** The Groovy engine implements a Groovy-like syntax within the JiBrok sandbox. It is not a full Groovy/JVM runtime - see [Sandbox Constraints](#sandbox-constraints) for details.

---

## Supported constructs

### Variables and functions

```groovy
// Dynamic typing with def
def name = "Hello"
def count = 42

// Type declarations
String message = "World"
int total = 0

// Functions
def greet(name) {
    return "Hello, ${name}!"
}

// Default parameters
def createIssue(summary, priority = "Medium") {
    return [summary: summary, priority: priority]
}
```

### GString (String Interpolation)

```groovy
def key = "PROJ-123"
def status = "Open"
log "Issue ${key} is ${status}"
log "Count: ${items.size()}"

// Multi-line strings
def description = """
Issue: ${key}
Status: ${status}
"""
```

### Closures

```groovy
// Basic closure
def square = { x -> x * x }
log square(5)  // 25

// Closures with multiple params
def add = { a, b -> a + b }

// it - implicit single parameter
def doubled = items.collect { it * 2 }

// Method references
def names = issues.collect { it.summary }
```

### Ranges

```groovy
def range = 1..10           // inclusive: 1 to 10
def halfOpen = 1..<10       // exclusive: 1 to 9

for (i in 1..5) {
    log i
}

// Range methods
(1..10).each { log it }
(1..10).collect { it * 2 }
```

### Collections

```groovy
// Lists
def list = [1, 2, 3, 4, 5]
def names = ["Alice", "Bob", "Charlie"]

// Maps
def map = [name: "PROJ-123", status: "Open"]
def config = ["key": value, "another": 42]

// Sets
def uniqueItems = [1, 2, 3] as Set

// GDK collection methods
list.each { log it }
list.collect { it * 2 }
list.findAll { it > 3 }
list.find { it > 3 }
list.any { it > 3 }
list.every { it > 0 }
list.groupBy { it % 2 == 0 ? "even" : "odd" }
list.sum()
list.unique()
```

### Operators

```groovy
// Safe navigation
def name = issue?.fields?.priority?.name

// Elvis operator
def value = input ?: "default"

// Spaceship operator (comparison)
items.sort { a, b -> a.key <=> b.key }

// Spread operator
def names = issues*.summary

// in operator
if ("bug" in labels) { log "Has bug label" }

// instanceof
if (value instanceof String) { log "Is string" }
```

### Control flow

```groovy
// if/else
if (priority == "High") {
    log "Urgent"
} else if (priority == "Medium") {
    log "Normal"
} else {
    log "Low"
}

// switch/case
switch (status) {
    case "Open":
        log "New issue"
        break
    case "In Progress":
        log "Working"
        break
    default:
        log "Other"
}

// for loops
for (item in items) {
    log item
}

for (def i = 0; i < 10; i++) {
    log i
}

// while
while (count > 0) {
    count--
}

// times, upto, downto
5.times { log "Repeat ${it}" }
1.upto(5) { log it }
5.downto(1) { log it }
```

### Exception handling

```groovy
try {
    def result = Issues.get(key)
} catch (Exception e) {
    log "Error: ${e.message}"
} finally {
    log "Done"
}

throw new RuntimeException("Something went wrong")
assert items.size() > 0, "No items found"
```

### Classes

```groovy
class IssueProcessor {
    String projectKey

    def process(issues) {
        return issues.findAll { it.key.startsWith(projectKey) }
    }
}

def processor = new IssueProcessor(projectKey: "PROJ")
def filtered = processor.process(allIssues)
```

---

## Java/Groovy classes

### JSON handling

```groovy
// Parse JSON
def slurper = new JsonSlurper()
def data = slurper.parseText('{"name": "test", "value": 42}')
log data.name  // "test"

// Generate JSON
def json = JsonOutput.toJson([name: "test", value: 42])
def pretty = JsonOutput.prettyPrint(json)
```

| Class | Methods |
|-------|---------|
| `JsonSlurper` | `parseText(text)` |
| `JsonOutput` | `toJson(obj)`, `prettyPrint(json)` |

### Date and time

```groovy
// LocalDate
def today = LocalDate.now()
def date = LocalDate.parse("2024-06-15")
def nextWeek = today.plusDays(7)
def formatted = today.format("dd MMM yyyy")

// LocalDateTime
def now = LocalDateTime.now()
def meeting = LocalDateTime.of(2024, 6, 15, 14, 30, 0)
log now.format("yyyy-MM-dd HH:mm")

// ZonedDateTime
def zonedNow = ZonedDateTime.now("America/New_York")
def utc = ZonedDateTime.now("UTC")

// Duration and Period
def duration = Duration.ofHours(2)
def period = Period.ofDays(30)
def between = Duration.between(start, end)

// Formatting
def fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")
log now.format(fmt)

// Business days
log today.isBusinessDay()
def nextBizDay = today.plusBusinessDays(5)
```

#### LocalDate

**Class methods:** `now()`, `parse(str)`

| Method | Description |
|--------|-------------|
| `getYear()` | Get year |
| `getMonth()` | Get month (1-12) |
| `getDayOfMonth()` | Get day of month |
| `getDayOfWeek()` | Get ISO day of week (1-7) |
| `plusDays(n)` / `minusDays(n)` | Add/subtract days |
| `plusMonths(n)` / `minusMonths(n)` | Add/subtract months |
| `plusYears(n)` / `minusYears(n)` | Add/subtract years |
| `isAfter(other)` / `isBefore(other)` | Compare dates |
| `isEqual(other)` | Check equality |
| `format(pattern)` | Format with pattern |
| `jiraDate()` | Format as "2024-06-15" |
| `shortDate()` | Format as "6/15/24" |
| `mediumDate()` | Format as "Jun 15, 2024" |
| `longDate()` | Format as "June 15, 2024" |
| `fullDate()` | Format as "Saturday, June 15, 2024" |
| `isBusinessDay()` | Is Monday-Friday? |
| `plusBusinessDays(n)` | Add business days |
| `minusBusinessDays(n)` | Subtract business days |
| `startOfMonth()` / `endOfMonth()` | Month boundaries |
| `startOfYear()` / `endOfYear()` | Year boundaries |

#### LocalDateTime

**Class methods:** `now()`, `of(year, month, day, hour, min, sec)`, `parse(str)`

Includes all LocalDate methods plus:

| Method | Description |
|--------|-------------|
| `getHour()` / `getMinute()` / `getSecond()` | Time accessors |
| `plusHours(n)` / `minusHours(n)` | Add/subtract hours |
| `toLocalDate()` | Extract date part |
| `jiraDateTime()` | ISO-like date-time |
| `shortTime()` | Format as "2:30 PM" |
| `shortDateTime()` | Format as "6/15/24 2:30 PM" |
| `mediumTime()` | Format as "2:30:45 PM" |
| `mediumDateTime()` | Format as "Jun 15, 2024 2:30:45 PM" |
| `startOfDay()` / `endOfDay()` | Day boundaries |

#### ZonedDateTime

**Class methods:** `now(zoneId)`, `of(y, m, d, h, mi, s, zoneId)`, `parse(str, formatter)`

| Method | Description |
|--------|-------------|
| `getYear()`, `getMonth()`, `getDayOfMonth()` | Date accessors |
| `getHour()`, `getMinute()`, `getSecond()` | Time accessors |
| `getZone()` | Get timezone |
| `plusDays(n)` / `minusDays(n)` | Add/subtract days |
| `plusHours(n)` / `minusHours(n)` | Add/subtract hours |
| `plusMinutes(n)` / `minusMinutes(n)` | Add/subtract minutes |
| `plusMonths(n)` / `minusMonths(n)` | Add/subtract months |
| `isAfter(other)` / `isBefore(other)` | Compare |
| `toLocalDate()` | Extract date |
| `toLocalDateTime()` | Extract date-time |
| `toInstant()` | Convert to Instant |
| `format(pattern)` | Format with pattern |

#### Other date/time classes

| Class | Static methods |
|-------|---------|
| `Duration` | `ofDays(n)`, `ofHours(n)`, `ofMinutes(n)`, `ofSeconds(n)`, `ofMillis(n)`, `between(start, end)` |
| `Period` | `ofDays(n)`, `ofWeeks(n)`, `ofMonths(n)`, `ofYears(n)`, `between(start, end)` |
| `Instant` | `now()`, `ofEpochMilli(ms)`, `ofEpochSecond(s)`, `parse(str)` |
| `ChronoUnit` | `DAYS`, `HOURS`, `MINUTES`, `SECONDS`, `MILLIS`, `MONTHS`, `YEARS` |

**Duration instance methods:** `toDays()`, `toHours()`, `toMinutes()`, `toSeconds()`, `toMillis()`, `plus(other)`, `minus(other)`, `abs()`, `isNegative()`, `isZero()`, `toString()`

**Period instance methods:** `getYears()`, `getMonths()`, `getDays()`, `plus(other)`, `minus(other)`, `isNegative()`, `isZero()`, `toString()`

**Instant instance methods:** `plusSeconds(n)`, `isBefore(other)`, `getEpochSecond()`, `toEpochMilli()`

```groovy
def d = Duration.ofHours(25)
println d.toDays()     // 1
println d.toHours()    // 25
println d.toString()   // PT25H

def p = Period.ofMonths(3).plus(Period.ofDays(10))
println p.getMonths()  // 3
println p.getDays()    // 10

println ChronoUnit.MONTHS.between(
    LocalDate.of(2024, 1, 1),
    LocalDate.of(2024, 6, 15)
)   // 5
```
| `ZoneId` | `of(id)`, `systemDefault()`, `getAvailableZoneIds()` |
| `DateTimeFormatter` | `ofPattern(pattern)`, `ISO_LOCAL_DATE`, `ISO_LOCAL_DATE_TIME`, `ISO_ZONED_DATE_TIME`, `ISO_INSTANT` |
| `SimpleDateFormat` | `create(pattern)` |

### Numeric wrappers

```groovy
def n = Integer.parseInt("42")
def d = Double.parseDouble("3.14")
def isDigit = Character.isDigit('5' as char)
```

| Class | Methods |
|-------|---------|
| `Integer` | `parseInt(str, radix)`, `valueOf(str)`, `MAX_VALUE`, `MIN_VALUE` |
| `Long` | `parseLong(str)`, `valueOf(str)`, `MAX_VALUE`, `MIN_VALUE` |
| `Double` | `parseDouble(str)`, `valueOf(str)`, `isNaN(v)`, `isInfinite(v)`, `isFinite(v)` |
| `Character` | `isDigit(ch)`, `isLetter(ch)`, `isLetterOrDigit(ch)`, `isUpperCase(ch)`, `isLowerCase(ch)`, `isWhitespace(ch)`, `toUpperCase(ch)`, `toLowerCase(ch)` |

### Collections utilities

```groovy
Collections.sort(myList)
Collections.reverse(myList)
Collections.frequency(myList, "item")
Collections.min(myList)
Collections.max(myList)

Arrays.asList(1, 2, 3)
Arrays.sort(myArray)
```

| Class | Methods |
|-------|---------|
| `Collections` | `sort(list)`, `reverse(list)`, `frequency(collection, obj)`, `min(collection)`, `max(collection)`, `unmodifiableList(list)`, `singletonList(obj)`, `emptyList()` |
| `Arrays` | `asList(array)`, `sort(array)`, `binarySearch(array, key)`, `fill(array, value)`, `equals(a, b)`, `toString(array)` |

### XML/HTML building and parsing

```groovy
// Build XML
def builder = MarkupBuilder.create()
builder.element("root", [:], null) {
    builder.element("item", [id: "1"], "First")
    builder.element("item", [id: "2"], "Second")
}
log builder.toString()

// Parse XML
def slurper = XmlSlurper.create()
def root = slurper.parseText(xmlString)
log root.child("item").text()
log root.child("item").attr("id")
```

### Cryptographic hashing

```groovy
// Quick hash functions
def sha = Hash.sha256("my string")
def md5 = Hash.md5("my string")

// Full MessageDigest
def digest = MessageDigest.getInstance("SHA-256")
```

| Class | Methods |
|-------|---------|
| `Hash` | `sha256(str)`, `sha1(str)`, `md5(str)`, `sha512(str)` |
| `MessageDigest` | `getInstance(algorithm)` - supports SHA-256, SHA-1, MD5, SHA-512 |

### URL encoding

```groovy
def encoded = URLEncoder.encode("hello world", "UTF-8")  // "hello+world"
def decoded = URLDecoder.decode("hello+world", "UTF-8")   // "hello world"
```

### UUID

```groovy
def id = UUID.randomUUID()
println id.toString()   // e.g. "550e8400-e29b-41d4-a716-446655440000"
```

### Base64

```groovy
def encoded = Base64.getEncoder().encodeToString("Hello World")
println encoded   // "SGVsbG8gV29ybGQ="

def decoded = Base64.getDecoder().decode(encoded)
println decoded   // "Hello World"
```

### StringBuilder

Mutable string builder with size limits.

```groovy
def sb = StringBuilder.create("Hello")
sb.append(" ").append("World")
println sb.toString()   // "Hello World"
println sb.length()     // 11

sb.insert(5, ",")
println sb.toString()   // "Hello, World"

sb.reverse()
println sb.toString()   // "dlroW ,olleH"
```

| Method | Description |
|--------|-------------|
| `StringBuilder.create(initial?)` | Create builder |
| `sb.append(str)` | Append string (chainable) |
| `sb.insert(index, str)` | Insert at position (chainable) |
| `sb.delete(start, end)` | Delete range (chainable) |
| `sb.reverse()` | Reverse in place (chainable) |
| `sb.length()` | Current length |
| `sb.toString()` | Get result string |

### DecimalFormat

Number formatting with patterns.

```groovy
def fmt = DecimalFormat.create("#,##0.00")
println fmt.format(1234567.8)   // "1,234,567.80"

def pct = DecimalFormat.create("0.##")
println pct.format(3.14159)     // "3.14"
```

### Optional

Java-style Optional for nullable values.

```groovy
def opt = Optional.of("hello")
println opt.isPresent()     // true
println opt.get()           // "hello"
println opt.map({ it.toUpperCase() }).get()   // "HELLO"

def empty = Optional.empty()
println empty.isEmpty()     // true
println empty.orElse("default")   // "default"
```

| Method | Description |
|--------|-------------|
| `Optional.of(value)` | Create with non-null value |
| `Optional.ofNullable(value)` | Create from nullable value |
| `Optional.empty()` | Create empty |
| `opt.isPresent()` / `opt.isEmpty()` | Check presence |
| `opt.get()` | Get value (throws if empty) |
| `opt.orElse(default)` | Get value or default |
| `opt.orElseThrow(msg?)` | Get value or throw |
| `opt.map(fn)` | Transform value |
| `opt.filter(fn)` | Filter by predicate |
| `opt.flatMap(fn)` | Transform returning Optional |

### Random

```groovy
def rng = new Random()
println rng.nextInt(100)    // random 0-99
println rng.nextDouble()    // random 0.0-1.0
println rng.nextBoolean()   // true or false
```

---

## GDK type methods

The Groovy engine extends standard types with GDK-style methods.

### String methods

In addition to standard string methods, the Groovy engine adds:

| Method | Description |
|--------|-------------|
| `size()` | String length |
| `contains(str)` | Contains substring? |
| `padLeft(size, padding)` | Pad from left |
| `padRight(size, padding)` | Pad from right |
| `center(size, padding)` | Center in width |
| `count(str)` | Count occurrences |
| `minus(str)` | Remove first occurrence |
| `plus(str)` | Concatenate |
| `matches(regex)` | Matches pattern? |
| `toInteger()` | Parse to Integer |
| `toLong()` | Parse to Long |
| `toDouble()` | Parse to Double |
| `take(n)` | First n characters |
| `drop(n)` | Skip first n characters |
| `toList()` | Convert to char list |
| `isNumber()` | Is numeric string? |
| `isInteger()` | Is integer string? |
| `stripIndent()` | Strip common indentation |
| `stripMargin(marginChar)` | Strip margin characters |
| `tokenize(delimiters)` | Tokenize string |
| `readLines()` | Split into lines |

### List/array methods

GDK collection methods available on lists:

| Method | Description |
|--------|-------------|
| `each(closure)` | Iterate elements |
| `eachWithIndex(closure)` | Iterate with index |
| `collect(closure)` | Transform elements (map) |
| `findAll(closure)` | Filter elements |
| `find(closure)` | First matching element |
| `any(closure)` | Any element matches? |
| `every(closure)` | All elements match? |
| `size()` | List size |
| `isEmpty()` | Is empty? |
| `contains(value)` | Contains value? |
| `first()` / `last()` | First/last element |
| `head()` / `tail()` | Head/rest of list |
| `flatten()` | Flatten nested lists |
| `unique()` | Remove duplicates |
| `plus(list)` / `minus(list)` | Add/remove elements |
| `intersect(list)` | Intersection |
| `disjoint(list)` | No common elements? |
| `sum(closure)` | Sum values |
| `max(closure)` / `min(closure)` | Max/min value |
| `count(closure)` | Count matching |
| `groupBy(closure)` | Group by key |
| `countBy(closure)` | Count by key |
| `collectEntries(closure)` | Transform to map |
| `collectMany(closure)` | FlatMap |
| `inject(initial, closure)` | Fold/reduce |
| `split(closure)` | Partition by predicate |
| `take(n)` / `drop(n)` | First n / skip n elements |
| `takeWhile(closure)` / `dropWhile(closure)` | Take/drop while predicate |
| `indexed()` / `withIndex()` | Add indices |
| `collate(size)` | Split into chunks |
| `tap(closure)` | Apply and return self |

### Number methods

| Method | Description |
|--------|-------------|
| `abs()` | Absolute value |
| `intdiv(divisor)` | Integer division |
| `power(exp)` | Power |
| `times(closure)` | Execute n times |
| `upto(to, closure)` | Iterate up to value |
| `downto(to, closure)` | Iterate down to value |
| `step(to, step, closure)` | Step iterate |
| `intValue()` / `longValue()` | Convert to int/long |
| `floatValue()` / `doubleValue()` | Convert to float/double |

### Map methods

| Method | Description |
|--------|-------------|
| `each(closure)` | Iterate entries |
| `collect(closure)` | Transform entries |
| `findAll(closure)` | Filter entries |
| `find(closure)` | First matching entry |
| `any(closure)` / `every(closure)` | Test entries |
| `get(key)` / `put(key, value)` | Access entries |
| `getOrDefault(key, default)` | Get with default |
| `remove(key)` | Remove entry |
| `size()` / `isEmpty()` | Size queries |
| `containsKey(key)` / `containsValue(value)` | Contains checks |
| `keySet()` / `values()` / `entrySet()` | Views |
| `subMap(keys)` | Sub-map by keys |
| `collectEntries(closure)` | Transform to map |
| `groupBy(closure)` | Group by key |
| `inject(initial, closure)` | Fold/reduce |
| `with(closure)` | Execute with map as delegate |
| `tap(closure)` | Apply and return self |

### Closure methods

| Method | Description |
|--------|-------------|
| `call(...args)` | Invoke closure |
| `curry(...args)` | Curry from left |
| `rcurry(...args)` | Curry from right |
| `ncurry(n, ...args)` | Curry at position n |

---

## Jira API access

All Jira APIs are available in the Groovy engine:

```groovy
// Search issues
def issues = Issues.search("project = PROJ AND status = Open")

issues.each { issue ->
    log "${issue.key}: ${issue.summary}"
}

// Get and update an issue
def issue = Issues.get("PROJ-123")
issue.update([summary: "Updated title"])

// Create an issue
def newIssue = Issues.create("PROJ", "Task", [summary: "New task"])

// Use requestJira for low-level API calls
def response = requestJira("/rest/api/3/myself")
log response.displayName

// Process with closures
def highPriority = issues.findAll { it.priority == "High" }
def summaries = issues.collect { it.summary }
def grouped = issues.groupBy { it.status }
```

All built-in API namespaces (`Issues`, `Users`, `Projects`, `Fields`, `Components`, `Versions`, `Boards`, `Sprints`, `DateUtils`, `CSV`, `Adf`, `Arrays`, `Strings`, `Validator`, `tables`, `queue`, `asyncEvent`) work identically to the JavaScript engine.

---

## Sandbox constraints

The Groovy engine runs within the same sandbox as the JavaScript engine. The same [resource limits](/docs/jibrok-studio-jira/limits) and [security restrictions](/docs/jibrok-studio-jira/security) apply:

- No filesystem, network, or browser API access
- No `import` of arbitrary Java/Groovy packages - only the listed classes are available
- Resource limits (execution time, loop iterations, API calls) are enforced per trigger type
- Method whitelisting applies to all type methods
- No JVM access, no reflection, no class loading

---

## Next steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language hub and engine comparison
- [Python Engine](/docs/jibrok-studio-jira/scripting-python) - Python-like syntax engine
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference
- [Scripting Examples](/docs/jibrok-studio-jira/scripting-examples) - Practical recipes
- [Script Console](/docs/jibrok-studio-jira/script-console) - Interactive editor
