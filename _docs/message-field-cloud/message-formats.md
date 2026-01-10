---
title: Message Formats
key: message-field-cloud
excerpt: Choose the right format for your messages - Plain Text, HTML, Markdown, or ADF
category: configuration
tags:
  - doc
  - cloud
  - formatting
  - html
  - markdown
  - adf
---

# Message Formats
{:.no_toc}

* TOC
{:toc}

Choose how your message content is rendered.

![Message Settings Tab](/uploads/message-field-cloud/configuration/panel%20settings%20message.png)

## Available Formats

| Format | Best For |
|--------|----------|
| **Plain Text** | Simple messages, no formatting needed |
| **HTML** | Rich formatting with full control |
| **Markdown** | Easy formatting with simple syntax |
| **ADF** | Advanced Atlassian formatting |

---

## Plain Text

No formatting applied. Text displays exactly as written.

### Example

**Input:**
```
This is a warning message.
Please check the issue details.
```

**Output:**
```
This is a warning message.
Please check the issue details.
```

### When to Use

- Simple informational messages
- When formatting is not needed
- Quick messages without styling

---

## HTML

Full HTML support with inline styles.

### Basic Tags

{% raw %}
```html
<b>Bold text</b>
<i>Italic text</i>
<u>Underlined text</u>
<br> Line break
```
{% endraw %}

### Styled Box

{% raw %}
```html
<div style="padding: 12px; background: #FFFAE6; border-left: 4px solid #FF8B00; margin: 8px 0;">
  <strong>Warning:</strong> {{ issue.fields.summary }}
</div>
```
{% endraw %}

### Colored Text

{% raw %}
```html
<span style="color: #DE350B;">Critical issue</span>
<span style="color: #00875A;">Completed</span>
<span style="color: #0052CC;">In progress</span>
```
{% endraw %}

### Table

{% raw %}
```html
<table style="width: 100%; border-collapse: collapse;">
  <tr style="background: #F4F5F7;">
    <th style="padding: 8px; text-align: left;">Field</th>
    <th style="padding: 8px; text-align: left;">Value</th>
  </tr>
  <tr>
    <td style="padding: 8px;">Status</td>
    <td style="padding: 8px;">{{ issue.fields.status.name }}</td>
  </tr>
  <tr>
    <td style="padding: 8px;">Priority</td>
    <td style="padding: 8px;">{{ issue.fields.priority.name }}</td>
  </tr>
</table>
```
{% endraw %}

### Alert Styles

**Success (Green):**
{% raw %}
```html
<div style="padding: 12px; background: #E3FCEF; border-left: 4px solid #00875A;">
  ✅ All blockers resolved
</div>
```
{% endraw %}

**Warning (Yellow):**
{% raw %}
```html
<div style="padding: 12px; background: #FFFAE6; border-left: 4px solid #FF8B00;">
  ⚠️ Due date approaching
</div>
```
{% endraw %}

**Error (Red):**
{% raw %}
```html
<div style="padding: 12px; background: #FFEBE6; border-left: 4px solid #DE350B;">
  ❌ SLA breach detected
</div>
```
{% endraw %}

**Info (Blue):**
{% raw %}
```html
<div style="padding: 12px; background: #DEEBFF; border-left: 4px solid #0052CC;">
  ℹ️ This issue is part of Sprint 12
</div>
```
{% endraw %}

### When to Use HTML

- Complex layouts and styling
- Custom colors and backgrounds
- Tables and structured data
- Maximum formatting control

---

## Markdown

GitHub-flavored Markdown syntax.

### Basic Formatting

{% raw %}
```markdown
**Bold text**
*Italic text*
~~Strikethrough~~
`Code`
```
{% endraw %}

### Headers

{% raw %}
```markdown
# Heading 1
## Heading 2
### Heading 3
```
{% endraw %}

### Lists

{% raw %}
```markdown
- Bullet item 1
- Bullet item 2
  - Nested item

1. Numbered item 1
2. Numbered item 2
```
{% endraw %}

### Links

{% raw %}
```markdown
[Link text](https://example.com)
```
{% endraw %}

### Code Blocks

{% raw %}
```markdown
```
Code block
```
```
{% endraw %}

### Full Example

{% raw %}
```markdown
## {{ issue.fields.summary }}

**Status**: {{ issue.fields.status.name }}
**Priority**: {{ issue.fields.priority.name }}

{% if issue.fields.assignee %}
**Assigned to**: {{ issue.fields.assignee.displayName }}
{% endif %}

---

### Linked Issues
{% for linked in linkedIssues %}
- [{{ linked.key }}] {{ linked.fields.summary }}
{% endfor %}
```
{% endraw %}

### When to Use Markdown

- Easy-to-write formatted content
- Simple formatting without HTML knowledge
- Lists and structured text
- Readable source text

---

## ADF (Atlassian Document Format)

JSON-based format for advanced Atlassian-native formatting.

### Basic Structure

```json
{
  "version": 1,
  "type": "doc",
  "content": [
    {
      "type": "paragraph",
      "content": [
        {
          "type": "text",
          "text": "Hello World"
        }
      ]
    }
  ]
}
```

### Paragraph with Bold

```json
{
  "version": 1,
  "type": "doc",
  "content": [
    {
      "type": "paragraph",
      "content": [
        {
          "type": "text",
          "text": "Important: ",
          "marks": [{"type": "strong"}]
        },
        {
          "type": "text",
          "text": "This is a critical issue."
        }
      ]
    }
  ]
}
```

### Info Panel

```json
{
  "version": 1,
  "type": "doc",
  "content": [
    {
      "type": "panel",
      "attrs": {"panelType": "info"},
      "content": [
        {
          "type": "paragraph",
          "content": [
            {"type": "text", "text": "This is an info panel"}
          ]
        }
      ]
    }
  ]
}
```

### Panel Types

- `info` - Blue info panel
- `note` - Purple note panel
- `warning` - Yellow warning panel
- `error` - Red error panel
- `success` - Green success panel

### When to Use ADF

- Native Atlassian panels and styling
- Complex document structures
- Integration with Jira's native formatting
- Maximum compatibility with Atlassian products

---

## Format Comparison

| Feature | Plain Text | HTML | Markdown | ADF |
|---------|------------|------|----------|-----|
| Ease of use | Easy | Medium | Easy | Hard |
| Formatting | None | Full | Basic | Full |
| Colors | No | Yes | No | Limited |
| Tables | No | Yes | Yes | Yes |
| Atlassian panels | No | No | No | Yes |
| Template support | Yes | Yes | Yes | Limited |

---

## Tips

### Dynamic Content

All formats support [template syntax](templates):

{% raw %}
```
Status: {{ issue.fields.status.name }}
```
{% endraw %}

### Escaping HTML in Templates

{% raw %}
- Use `{{ value }}` for auto-escaped output (safe)
- Use `{{{ value }}}` for raw output (HTML formatting preserved)
{% endraw %}

### Testing

Use **Preview Panel** to test your message formatting before saving.

---

## Next Steps

- [Templates](templates) - Dynamic content syntax
- [Use Cases](use-cases) - Ready-to-use examples
- [Configuration Basics](configuration-basics) - Panel settings
