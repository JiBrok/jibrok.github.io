---
title: "Scripting API: Smart Value Methods"
seo_title: "Smart Value Methods - Jira Automation Compatible"
key: jibrok-studio-jira
excerpt: String, Array, and Date instance methods compatible with Jira Automation
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - api
  - smart-values
  - dates
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.
> [Issues](/docs/jibrok-studio-jira/scripting-api-issues) | [Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira) | [Utilities](/docs/jibrok-studio-jira/scripting-api-utilities) | **Smart Values**

## String smart value methods (28)

Automation-compatible instance methods callable on any string. All methods returning strings are chainable.

**Text manipulation:**

| Method | Description |
|--------|-------------|
| `s.capitalize()` | First letter uppercase, rest unchanged |
| `s.abbreviate(maxLen)` | Shorten with "..." suffix (maxLen >= 4) |
| `s.left(n)` | First n characters |
| `s.right(n)` | Last n characters |
| `s.remove(sub)` | Remove all occurrences of sub |
| `s.reverse()` | Reverse string (unicode-safe) |

**Substring extraction:**

| Method | Description |
|--------|-------------|
| `s.substringBefore(sep)` | Text before first occurrence of sep |
| `s.substringAfter(sep)` | Text after first occurrence of sep |
| `s.substringBetween(open, close?)` | Text between delimiters (null if not found) |

**Checks:**

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

**Conversion:**

| Method | Description |
|--------|-------------|
| `s.asNumber()` | Convert to number, null if invalid |

**Encoding:**

| Method | Description |
|--------|-------------|
| `s.htmlEncode()` | Escape `& < > " '` as HTML entities |
| `s.jsonEncode()` | Escape for JSON embedding |
| `s.xmlEncode()` | Escape as XML entities |
| `s.urlEncode()` | URL-encode (encodeURIComponent) |
| `s.quote()` | Escape regex special characters |

**Case conversion:**

| Method | Description |
|--------|-------------|
| `s.camelCase()` | "hello world" -> "helloWorld" |
| `s.kebabCase()` | "helloWorld" -> "hello-world" |
| `s.snakeCase()` | "helloWorld" -> "hello_world" |
| `s.words()` | Split into array of words (camelCase-aware) |
| `s.lines()` | Split by newline into array |

```js
log("hello world".capitalize())     // "Hello world"
log("hello world".abbreviate(8))    // "hello..."
log("user@example.com".substringBefore("@"))  // "user"
log("  ".isBlank())                 // true
log("42".asNumber())                // 42
log("<b>A</b>".htmlEncode())        // "&lt;b&gt;A&lt;/b&gt;"
log("helloWorld".kebabCase())       // "hello-world"
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
| `a.min()` | number/null | Minimum numeric value |
| `a.max()` | number/null | Maximum numeric value |

```js
log([10, 20, 30].first())          // 10
log([10, 20, 30].last())           // 30
log([1, 2, 2, 3, 1].distinct())   // [1, 2, 3]
log([10, 20, 30].sum())            // 60
log([10, 20, 30].average())        // 20
log([5, 2, 8, 1].min())           // 1
```

---

## Date instance methods

All Date objects support these instance methods for arithmetic, navigation, formatting, and comparison.

**Arithmetic:**

| Method | Description |
|--------|-------------|
| `d.plusDays(n)` | Add n days |
| `d.minusDays(n)` | Subtract n days |
| `d.plusHours(n)` | Add n hours |
| `d.plusWeeks(n)` | Add n weeks |
| `d.plusMonths(n)` | Add n months |
| `d.plusYears(n)` | Add n years |

**Withers:**

| Method | Description |
|--------|-------------|
| `d.withDayOfMonth(day)` | Set day of month |
| `d.withMonth(month)` | Set month (1-12) |
| `d.withYear(year)` | Set year |

**Navigation:**

| Method | Description |
|--------|-------------|
| `d.startOfDay()` | Midnight (00:00:00) |
| `d.endOfDay()` | End of day (23:59:59.999) |
| `d.startOfMonth()` | First day of month |
| `d.endOfMonth()` | Last day of month |
| `d.startOfYear()` | January 1st |
| `d.endOfYear()` | December 31st |

**Day-of-week navigation:**

| Method | Description |
|--------|-------------|
| `d.withNextDayOfWeek(day)` | Next given weekday (min +1 day) |
| `d.firstOfTheMonth(day)` | First given weekday in month |
| `d.lastOfTheMonth(day)` | Last given weekday in month |

Day names: `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday` (or short: `mon`, `tue`, `wed`, `thu`, `fri`, `sat`, `sun`).

**Business days:**

| Method | Description |
|--------|-------------|
| `d.isBusinessDay()` | True if Mon-Fri |
| `d.toBusinessDay()` | Move weekend to next Monday |
| `d.toBusinessDayBackwards()` | Move weekend to previous Friday |
| `d.plusBusinessDays(n)` | Add n business days |
| `d.minusBusinessDays(n)` | Subtract n business days |
| `d.firstBusinessDayOfMonth()` | First business day (Mon-Fri) of the month |
| `d.lastBusinessDayOfMonth()` | Last business day (Mon-Fri) of the month |

**Format presets:**

| Method | Example Output |
|--------|---------------|
| `d.jiraDate()` | `2024-06-15` |
| `d.jiraDateTime()` | `2024-06-15T14:30:45.123Z` |
| `d.shortDate()` | `6/15/24` |
| `d.mediumDate()` | `Jun 15, 2024` |
| `d.longDate()` | `June 15, 2024` |
| `d.fullDate()` | `Saturday, June 15, 2024` |
| `d.shortTime()` | `2:30 PM` |
| `d.mediumTime()` | `2:30:45 PM` |
| `d.shortDateTime()` | `6/15/24 2:30 PM` |
| `d.mediumDateTime()` | `Jun 15, 2024 2:30:45 PM` |
| `d.longDateTime()` | `June 15, 2024 2:30:45 PM UTC` |
| `d.fullDateTime()` | `Saturday, June 15, 2024 2:30:45 PM UTC` |

**Custom format tokens** for `d.format(pattern)`:

| Token | Output | Example |
|-------|--------|---------|
| `yyyy` | 4-digit year | `2024` |
| `yy` | 2-digit year | `24` |
| `MMMM` | Full month name | `June` |
| `MMM` | Short month name | `Jun` |
| `MM` | Month (zero-padded) | `06` |
| `M` | Month | `6` |
| `dd` | Day (zero-padded) | `05` |
| `d` | Day | `5` |
| `EEEE` | Full weekday name | `Saturday` |
| `EEE` | Short weekday name | `Sat` |
| `HH` | Hour 24h (zero-padded) | `14` |
| `H` | Hour 24h | `14` |
| `hh` | Hour 12h (zero-padded) | `02` |
| `h` | Hour 12h | `2` |
| `mm` | Minutes (zero-padded) | `30` |
| `m` | Minutes | `30` |
| `ss` | Seconds (zero-padded) | `05` |
| `s` | Seconds | `5` |
| `SSS` | Milliseconds | `123` |
| `a` | AM/PM | `PM` |

```js
let d = Date.create("2024-06-15T14:30:05.123Z")
log(d.format("yyyy-MM-dd"))           // "2024-06-15"
log(d.format("dd/MM/yyyy HH:mm"))     // "15/06/2024 14:30"
log(d.format("EEEE, MMMM d, yyyy"))   // "Saturday, June 15, 2024"
log(d.format("h:mm a"))               // "2:30 PM"
```

**Timezones:**

| Method | Description |
|--------|-------------|
| `d.setTimeZone(tz)` | Set display timezone (does not shift timestamp) |
| `d.convertToTimeZone(tz)` | Convert to timezone (shifts timestamp) |

**Comparison:**

| Method | Description |
|--------|-------------|
| `d.isAfter(other)` | True if after other date |
| `d.isBefore(other)` | True if before other date |
| `d.isEqual(other)` | True if same time |
| `d.compareTo(other)` | Returns -1, 0, or 1 |
| `d.diff(other)` | Difference in milliseconds |

**String-to-Date conversion:**

| Method | Description |
|--------|-------------|
| `"2024-06-15".toDate()` | Parse ISO date string to Date |

```js
let d = Date.create("2024-06-15T14:30:00Z")

// Arithmetic
log(d.plusDays(7).jiraDate())           // "2024-06-22"
log(d.plusMonths(1).jiraDate())         // "2024-07-15"
log(d.plusBusinessDays(5).jiraDate())   // "2024-06-24"

// Navigation
log(d.startOfMonth().jiraDate())       // "2024-06-01"
log(d.endOfMonth().jiraDate())         // "2024-06-30"
log(d.withNextDayOfWeek("monday").jiraDate())  // "2024-06-17"

// Formatting
log(d.mediumDate())                    // "Jun 15, 2024"
log(d.setTimeZone("America/New_York").format("HH:mm"))  // "10:30"

// Comparison
log(d.isAfter(d.minusDays(1)))         // true
log(d.diff(d.plusDays(1)))             // -86400000
```

---

## Groovy-specific date types

> **Note:** The following date types are only available in the Groovy engine. JavaScript and Python engines use the standard Date object documented above.

When using the Groovy engine, `LocalDate` and `LocalDateTime` have additional methods matching the Date wrapper API:

### LocalDate methods

| Method | Return | Description |
|--------|--------|-------------|
| `toDate()` | DateWrapper | Convert to DateWrapper |
| `compareTo(other)` | number | -1, 0, or 1 |
| `jiraDate()` | string | "2024-06-15" |
| `shortDate()` | string | "6/15/24" |
| `mediumDate()` | string | "Jun 15, 2024" |
| `longDate()` | string | "June 15, 2024" |
| `fullDate()` | string | "Saturday, June 15, 2024" |
| `isBusinessDay()` | boolean | Mon-Fri? |
| `toBusinessDay()` | DateWrapper | Weekend -> Monday |
| `plusBusinessDays(n)` | DateWrapper | Add business days |
| `minusBusinessDays(n)` | DateWrapper | Subtract business days |
| `startOfMonth()` | DateWrapper | First day of month |
| `endOfMonth()` | DateWrapper | Last day of month |
| `startOfYear()` | DateWrapper | January 1st |
| `endOfYear()` | DateWrapper | December 31st |
| `withNextDayOfWeek(day)` | DateWrapper | Next given weekday |

### LocalDateTime additional methods

All LocalDate methods above, plus:

| Method | Return | Description |
|--------|--------|-------------|
| `jiraDateTime()` | string | ISO format |
| `shortTime()` | string | "2:30 PM" |
| `shortDateTime()` | string | "6/15/24 2:30 PM" |
| `mediumTime()` | string | "2:30:45 PM" |
| `mediumDateTime()` | string | "Jun 15, 2024 2:30:45 PM" |
| `longDateTime()` | string | "June 15, 2024 2:30:45 PM" |
| `fullDateTime()` | string | "Saturday, June 15, 2024 2:30:45 PM" |
| `startOfDay()` | DateWrapper | Midnight |
| `endOfDay()` | DateWrapper | 23:59:59.999 |

```groovy
def date = LocalDate.of(2024, 6, 15)
println date.mediumDate()       // => Jun 15, 2024
println date.isBusinessDay()    // => false (Saturday)

def dt = LocalDateTime.of(2024, 6, 15, 14, 30, 45)
println dt.shortTime()          // => 2:30 PM
println dt.startOfDay().jiraDate()  // => 2024-06-15
```

---

## Next steps

- [JS: Type Methods](/docs/jibrok-studio-jira/scripting-type-methods) - All whitelisted methods per type (strings, arrays, numbers, dates, objects)
- [Scripting API: Issues](/docs/jibrok-studio-jira/scripting-api-issues) - Search, create, update, and transition issues
- [Scripting API: Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira) - Users, Projects, Fields, Boards, Sprints
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
