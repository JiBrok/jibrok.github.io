---
title: Template Filters
key: message-field-cloud
excerpt: Transform values with filters for strings, numbers, arrays, dates, and Jira data
category: templates
tags:
  - doc
  - cloud
  - templates
  - filters
---

* TOC
{:toc}

{% raw %}

Transform values using `|` (pipe) syntax: `{{ value | filter }}`.

---

## General Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `default(value)` | Fallback for null/empty | `{{ name \| default("Unknown") }}` |
| `coalesce(v1, v2, ...)` | First non-empty value | `{{ a \| coalesce(b, c) }}` |
| `empty` | Check if value is empty | `{% if items \| empty %}No items{% endif %}` |
| `len` | Get length | `{{ items \| len }}` |

---

## String Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `upper` | Uppercase | `{{ "hello" \| upper }}` → HELLO |
| `lower` | Lowercase | `{{ "HELLO" \| lower }}` → hello |
| `capitalize` | Capitalize first letter | `{{ "hello" \| capitalize }}` → Hello |
| `trim` | Remove whitespace | `{{ "  text  " \| trim }}` → text |
| `truncate(n, suffix)` | Truncate to n chars | `{{ text \| truncate(50) }}` |
| `replace(old, new)` | Replace substring | `{{ text \| replace("a", "b") }}` |
| `split(separator)` | Split into array | `{{ "a,b,c" \| split(",") }}` |
| `join(separator)` | Join array to string | `{{ labels \| join(", ") }}` |
| `match(regex)` | Test regex match | `{% if key \| match("^PROJ-") %}...{% endif %}` |

---

## Number Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `round` | Round to nearest integer | `{{ 3.7 \| round }}` → 4 |
| `ceil` | Round up | `{{ 3.2 \| ceil }}` → 4 |
| `floor` | Round down | `{{ 3.9 \| floor }}` → 3 |
| `formatNumber(locale)` | Format with locale | `{{ 1234.5 \| formatNumber("en-US") }}` → 1,234.5 |
| `percent(digits)` | Format as percentage | `{{ 0.75 \| percent(1) }}` → 75.0% |

---

## Array Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `first` | First element | `{{ items \| first }}` |
| `last` | Last element | `{{ items \| last }}` |
| `uniq` | Remove duplicates | `{{ labels \| uniq }}` |
| `reverse` | Reverse order | `{{ items \| reverse }}` |
| `slice(start, count)` | Get slice of array | `{{ items \| slice(0, 5) }}` |
| `take(n)` | Take first n items | `{{ items \| take(3) }}` |
| `sortBy(path, desc)` | Sort by property | `{{ issues \| sortBy("fields.priority.id") }}` |
| `map(path)` | Extract property from each | `{{ issues \| map("key") }}` |
| `filter(path, op, value)` | Filter by condition | `{{ issues \| filter("fields.status.name", "==", "Done") }}` |

**Filter operators:** `==`, `!=`, `>`, `>=`, `<`, `<=`, `includes`, `contains`

---

## Date Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `date(format, timezone)` | Format date | `{{ created \| date("yyyy-MM-dd") }}` |
| `fromNow` | Relative time | `{{ updated \| fromNow }}` → "2 hours ago" |
| `addDays(n)` | Add days | `{{ duedate \| addDays(7) }}` |
| `addHours(n)` | Add hours | `{{ created \| addHours(24) }}` |

**Date format tokens:** `yyyy`, `MM`, `dd`, `HH`, `mm`, `ss`

---

## HTML Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `nl2br` | Newlines to `<br/>` | `{{ text \| nl2br }}` |
| `escapeAttr` | Escape for HTML attributes | `<a title="{{ text \| escapeAttr }}">` |
| `urlEncode` | URL encode | `{{ text \| urlEncode }}` |
| `json(indent)` | Convert to JSON | `{{ data \| json(2) }}` |
| `jsonHtml(indent)` | JSON with `<br/>` | `{{ data \| jsonHtml }}` |

---

## Jira-Specific Filters

| Filter | Description | Example |
|--------|-------------|---------|
| `statusBadge` | Status lozenge HTML | `{{ issue.fields.status \| statusBadge }}` |
| `avatar(size)` | User avatar HTML | `{{ issue.fields.assignee \| avatar(24) }}` |
| `issueLink` | Issue browse URL | `{{ linked.key \| issueLink }}` |
| `formatField(fieldId)` | Format field value | `{{ value \| formatField("customfield_10001") }}` |

> **Context-Dependent Filters**: The filters `statusBadge`, `avatar`, and `formatField` require runtime context to render properly. When used in Message Panel templates, this context is automatically provided. If the context is unavailable, these filters return the input value unchanged.

**Filter Details:**

- **`statusBadge`** - Renders a Jira status lozenge with appropriate colors. Pass the full status object, not just the name.
- **`avatar(size)`** - Renders a user avatar image. Size is in pixels (default: 24). Pass a user object with `avatarUrls` property.
- **`formatField(fieldId)`** - Formats a value according to Jira's field type. Useful for custom fields that need special rendering.

---

## Chaining Filters

Filters can be chained together:

```
{{ linkedIssues | filter("fields.status.name", "!=", "Done") | sortBy("fields.priority.id") | take(5) }}
```

```
{{ issue.fields.summary | lower | truncate(50) }}
```

```
{{ issue.fields.labels | uniq | join(", ") | default("No labels") }}
```

---

## Next Steps

- [Templates](templates) - Basic syntax and variables
- [Template Advanced](template-advanced) - Functions, JQL templates, display conditions

{% endraw %}
