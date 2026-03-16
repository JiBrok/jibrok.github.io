---
title: "Scripting API: Utilities"
key: jibrok-studio-jira
excerpt: Adf, DateUtils, Arrays, Strings, CSV, Validator
category: administration
tags:
  - doc
  - cloud
  - scripting
  - api
  - utilities
---

* TOC
{:toc}

> Part of the [Scripting API](/docs/jibrok-studio-jira/scripting-api) reference.
> [Issues](/docs/jibrok-studio-jira/scripting-api-issues) | [Jira Entities](/docs/jibrok-studio-jira/scripting-api-jira) | **Utilities** | [Smart Values](/docs/jibrok-studio-jira/scripting-api-smart-values)

## Adf

Build Atlassian Document Format documents for rich text comments and descriptions.

**Document & Block Nodes:**

| Method | Description |
|--------|-------------|
| `Adf.doc(...blocks)` | Create a document |
| `Adf.paragraph(...content)` | Paragraph block |
| `Adf.heading(level, ...content)` | Heading (level 1-6) |
| `Adf.bulletList(...items)` | Unordered list |
| `Adf.orderedList(...items)` | Ordered list |
| `Adf.listItem(...content)` | List item |
| `Adf.codeBlock(text, language?)` | Code block |
| `Adf.blockquote(...content)` | Blockquote |
| `Adf.rule()` | Horizontal rule |
| `Adf.panel(type, ...content)` | Panel (info, note, warning, success, error) |

**Table Nodes:**

| Method | Description |
|--------|-------------|
| `Adf.table(...rows)` | Table |
| `Adf.tableRow(...cells)` | Table row |
| `Adf.tableHeader(...content)` | Table header cell |
| `Adf.tableCell(...content)` | Table cell |

**Inline Formatting:**

| Method | Description |
|--------|-------------|
| `Adf.text(content)` | Plain text node |
| `Adf.bold(text)` | Bold text |
| `Adf.italic(text)` | Italic text |
| `Adf.code(text)` | Inline code |
| `Adf.strike(text)` | Strikethrough text |
| `Adf.link(text, href)` | Hyperlink |
| `Adf.mention(accountId)` | User mention |
| `Adf.status(text, color)` | Status lozenge (neutral, purple, blue, red, yellow, green) |
| `Adf.emoji(shortName)` | Emoji |
| `Adf.fromText(plainText)` | Convert plain text to ADF document |

**Reader Functions:**

| Method | Description |
|--------|-------------|
| `Adf.toText(adf)` | Extract plain text from ADF document |
| `Adf.extractLinks(adf)` | Extract all link URLs from ADF |
| `Adf.extractMentions(adf)` | Extract all mention account IDs from ADF |
| `Adf.contains(adf, text)` | Check if ADF contains text (case-insensitive) |

```js
// Build a formatted comment
const doc = Adf.doc(
  Adf.heading(2, "Report"),
  Adf.paragraph("Hello ", Adf.bold("world"), "!"),
  Adf.bulletList(
    Adf.listItem("Item 1"),
    Adf.listItem("Item 2")
  ),
  Adf.table(
    Adf.tableRow(Adf.tableHeader("Name"), Adf.tableHeader("Status")),
    Adf.tableRow(Adf.tableCell("Task A"), Adf.tableCell(Adf.status("Done", "green")))
  )
)

await issue.addComment(doc)

// Reader functions
const issue = await Issues.get("PROJ-1")
const text = Adf.toText(issue.fields.description)
const links = Adf.extractLinks(issue.fields.description)
const mentions = Adf.extractMentions(issue.fields.description)
const hasKeyword = Adf.contains(issue.fields.description, "urgent")
```

---

## DateUtils

Date arithmetic and formatting utilities.

| Method | Description |
|--------|-------------|
| `DateUtils.diff(date1, date2)` | Difference in milliseconds |
| `DateUtils.diffDays(date1, date2)` | Difference in days |
| `DateUtils.businessDays(date1, date2)` | Business days between dates |
| `DateUtils.addDays(date, n)` | Add days to a date |
| `DateUtils.addBusinessDays(date, n)` | Add business days to a date |
| `DateUtils.isWithinRange(date, start, end)` | Check if date is within range |
| `DateUtils.isWeekend(date)` | Check if date is a weekend |
| `DateUtils.startOfDay(date)` | Start of day (00:00:00) |
| `DateUtils.endOfDay(date)` | End of day (23:59:59) |
| `DateUtils.format(date, pattern)` | Format date (YYYY, MM, DD, HH, mm, ss) |
| `DateUtils.parse(value)` | Parse string to Date |

**Constants:** `DateUtils.DAY_MS`, `DateUtils.HOUR_MS`, `DateUtils.MINUTE_MS`

```js
const now = new Date()
const due = DateUtils.addDays(now, 14)
log(DateUtils.format(due, "YYYY-MM-DD"))

const days = DateUtils.diffDays(issue.created, now)
const bdays = DateUtils.businessDays(issue.created, now)

const deadline = DateUtils.addBusinessDays(now, 5)
```

---

## Arrays

Array manipulation utilities.

| Method | Description |
|--------|-------------|
| `Arrays.sortBy(array, key)` | Sort by property or function |
| `Arrays.keyBy(array, key)` | Index by property (object lookup) |
| `Arrays.groupBy(array, key)` | Group by property |
| `Arrays.unique(array)` | Remove duplicates |
| `Arrays.uniqueBy(array, key)` | Remove duplicates by property |
| `Arrays.sum(array, key?)` | Sum values |
| `Arrays.avg(array, key?)` | Average values |
| `Arrays.min(array, key?)` | Minimum value |
| `Arrays.max(array, key?)` | Maximum value |
| `Arrays.pluck(array, key)` | Extract property values |
| `Arrays.chunk(array, size)` | Split into chunks |
| `Arrays.partition(array, predicate)` | Split by condition into two arrays |
| `Arrays.countBy(array, key)` | Count by property |
| `Arrays.flatten(array)` | Flatten nested arrays |
| `Arrays.intersection(arr1, arr2)` | Common elements |
| `Arrays.difference(arr1, arr2)` | Elements in arr1 not in arr2 |

```js
const issues = results.issues

const sorted = Arrays.sortBy(issues, "priority")
const byStatus = Arrays.groupBy(issues, "status")
const keys = Arrays.pluck(issues, "key")
const totalPoints = Arrays.sum(issues, "storyPoints")
const [bugs, others] = Arrays.partition(issues, i => i.issueType === "Bug")
const batches = Arrays.chunk(keys, 10)
```

---

## Strings

String transformation utilities.

| Method | Description |
|--------|-------------|
| `Strings.capitalize(string)` | Capitalize first letter |
| `Strings.truncate(string, maxLen, suffix?)` | Truncate with suffix |
| `Strings.isBlank(string)` | Check if blank/empty |
| `Strings.padStart(string, len, char?)` | Pad from start |
| `Strings.padEnd(string, len, char?)` | Pad from end |
| `Strings.words(string)` | Split into words |
| `Strings.camelCase(string)` | Convert to camelCase |
| `Strings.kebabCase(string)` | Convert to kebab-case |
| `Strings.snakeCase(string)` | Convert to snake_case |

```js
log(Strings.capitalize("hello"))       // "Hello"
log(Strings.truncate("Long text", 6))  // "Lon..."
log(Strings.camelCase("my variable"))  // "myVariable"
log(Strings.kebabCase("myVariable"))   // "my-variable"
```

---

## CSV

Parse and generate CSV data.

| Method | Description |
|--------|-------------|
| `CSV.parse(text, options?)` | Parse CSV text to array of objects |
| `CSV.stringify(data, options?)` | Convert array of objects to CSV text |

Options: `{ separator: "," }` (default comma)

```js
// Parse CSV
const data = CSV.parse("name,age\nAlice,30\nBob,25")
// => [{name: "Alice", age: "30"}, {name: "Bob", age: "25"}]

// Generate CSV
const csv = CSV.stringify([
  { name: "Alice", age: 30 },
  { name: "Bob", age: 25 }
])
// => "name,age\nAlice,30\nBob,25"
```

---

## Validator

Value validation utilities.

| Method | Description |
|--------|-------------|
| `Validator.isEmail(value)` | Check if valid email |
| `Validator.isUrl(value)` | Check if valid URL |
| `Validator.isJiraKey(value)` | Check if valid Jira issue key (e.g., `PROJ-123`) |
| `Validator.isAccountId(value)` | Check if valid Atlassian account ID |

```js
log(Validator.isEmail("user@example.com"))  // true
log(Validator.isUrl("https://jira.com"))    // true
log(Validator.isJiraKey("TEST-123"))        // true
log(Validator.isAccountId("5b10ac8d82e05b22cc7d4ef5"))  // true
```

---

## Next steps

- [Scripting API: Smart Values](/docs/jibrok-studio-jira/scripting-api-smart-values) - String, Array, and Date instance methods
- [Scripting API: Issues](/docs/jibrok-studio-jira/scripting-api-issues) - Search, create, update, and transition issues
- [Use Cases](/docs/jibrok-studio-jira/use-cases) - Practical scripting examples
