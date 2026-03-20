---
title: "Python Engine"
seo_title: "Python Scripts for Jira Cloud"
key: jibrok-studio-jira
excerpt: Python-like syntax engine - supported constructs, built-in functions, stdlib modules, and type methods
category: scripting
tags:
  - doc
  - cloud
  - scripting
  - python
last_modified_at: 2026-03-19
date: 2026-03-16
seo:
  date_modified: 2026-03-19
---

* TOC
{:toc}

## Overview

The Python engine provides Python-like syntax for writing scripts in JiBrok Studio. Scripts have access to the same Jira APIs and built-in utilities as the JavaScript engine, but use familiar Python constructs and standard library modules.

Select **Python** from the engine dropdown in the [Script Console](/docs/jibrok-studio-jira/script-console) or script configuration to use this engine.

> **Note:** The Python engine implements a Python-like syntax within the JiBrok sandbox. It is not a full CPython runtime - see [Sandbox Constraints](#sandbox-constraints) for details.

---

## Supported constructs

### Variables and functions

```python
# Variables
x = 10
name = "Hello"

# Functions
def greet(name):
    return f"Hello, {name}!"

# Lambda
square = lambda x: x * 2

# Default arguments, *args, **kwargs
def create_issue(summary, *labels, **fields):
    return {"summary": summary, "labels": labels, "fields": fields}
```

### Control flow

```python
# if/elif/else
if priority == "High":
    log("Urgent")
elif priority == "Medium":
    log("Normal")
else:
    log("Low")

# for loops
for item in items:
    log(item)

for i in range(10):
    log(i)

# while loops
while count > 0:
    count -= 1

# match/case (pattern matching)
match status:
    case "Open":
        log("New issue")
    case "In Progress":
        log("Working")
    case _:
        log("Other")
```

### Collections

```python
# List comprehensions
names = [issue.summary for issue in issues]
high_priority = [i for i in issues if i.priority == "High"]

# Dictionaries
data = {"key": "PROJ-1", "summary": "Test"}

# Sets
unique_labels = set(["bug", "feature", "bug"])

# Tuples
point = (10, 20)

# Enumerate and zip
for i, item in enumerate(items):
    log(f"{i}: {item}")

for key, value in zip(keys, values):
    log(f"{key} = {value}")
```

### F-strings

```python
issue_key = "PROJ-123"
status = "Open"
log(f"Issue {issue_key} is {status}")
log(f"Count: {len(items)}")
```

### Exception handling

```python
try:
    result = Issues.get(key)
except Exception as e:
    log(f"Error: {e}")
finally:
    log("Done")

# Raise exceptions
raise ValueError("Invalid input")

# Assert
assert len(items) > 0, "No items found"
```

### Async/await

```python
# Async functions
async def process_issues():
    issues = await Issues.search("project = PROJ")
    return issues

# Auto-await is supported
result = Issues.search("project = PROJ")
```

---

## Built-in functions

### Type conversion

| Function | Description |
|----------|-------------|
| `type(obj)` | Get object type |
| `isinstance(obj, cls)` | Check type |
| `int(x)` | Convert to integer |
| `float(x)` | Convert to float |
| `str(obj)` | Convert to string |
| `bool(x)` | Convert to boolean |
| `list(iterable)` | Create list |
| `dict(**kwargs)` | Create dictionary |
| `tuple(iterable)` | Create tuple |
| `set(iterable)` | Create set |
| `frozenset(iterable)` | Create frozen set |

### Sequence operations

| Function | Description |
|----------|-------------|
| `len(obj)` | Length of object |
| `range(stop)` / `range(start, stop, step)` | Generate range |
| `enumerate(iterable, start)` | Index-value pairs |
| `zip(*iterables)` | Zip iterables together |
| `sorted(iterable, key, reverse)` | Return sorted copy |
| `reversed(seq)` | Return reversed iterator |

### Functional

| Function | Description |
|----------|-------------|
| `map(fn, iterable)` | Apply function to each element |
| `filter(fn, iterable)` | Filter elements by predicate |
| `any(iterable)` | True if any element is truthy |
| `all(iterable)` | True if all elements are truthy |

### Arithmetic

| Function | Description |
|----------|-------------|
| `sum(iterable, start)` | Sum of elements |
| `abs(x)` | Absolute value |
| `min(*args)` | Minimum value |
| `max(*args)` | Maximum value |
| `round(x, ndigits)` | Round number |
| `pow(base, exp, mod)` | Power |
| `divmod(a, b)` | Quotient and remainder |

### Character and encoding

| Function | Description |
|----------|-------------|
| `chr(code)` | Character from code point |
| `ord(char)` | Code point from character |
| `hex(x)` | Convert to hex string |
| `oct(x)` | Convert to octal string |
| `bin(x)` | Convert to binary string |

### Object introspection

| Function | Description |
|----------|-------------|
| `repr(obj)` | String representation |
| `hasattr(obj, name)` | Has attribute? |
| `getattr(obj, name, default)` | Get attribute |
| `setattr(obj, name, value)` | Set attribute |
| `callable(obj)` | Is callable? |
| `id(obj)` | Object identity |
| `hash(obj)` | Hash value |

### Other

| Function | Description |
|----------|-------------|
| `format(value, spec)` | Format value |
| `iter(obj)` | Get iterator |
| `next(iterator, default)` | Next value from iterator |
| `eval(code)` | Evaluate code / include script by UUID |
| `delay(ms)` | Async delay in milliseconds |
| `deepcopy(obj)` | Deep copy object |

---

## Standard library modules

### math

Mathematical functions and constants.

```python
import math

math.sqrt(16)        # 4
math.floor(3.7)      # 3
math.ceil(3.2)       # 4
math.factorial(5)    # 120
math.gcd(12, 8)      # 4
math.pi              # 3.14159...
```

**Functions:** `sqrt`, `floor`, `ceil`, `trunc`, `fabs`, `pow`, `exp`, `log`, `log2`, `log10`, `sin`, `cos`, `tan`, `asin`, `acos`, `atan`, `atan2`, `sinh`, `cosh`, `tanh`, `hypot`, `factorial`, `gcd`, `lcm`, `isclose`, `comb`, `perm`, `copysign`, `fmod`, `isqrt`, `prod`, `degrees`, `radians`, `isinf`, `isnan`, `isfinite`, `cbrt`, `sign`, `abs`

**Constants:** `pi`, `e`, `tau`, `inf`, `nan`

### random

Random number generation.

```python
import random

random.randint(1, 100)         # Random int between 1 and 100
random.choice(["a", "b", "c"]) # Random element
random.shuffle(my_list)         # Shuffle in place
random.sample(items, 3)         # 3 unique random elements
random.uniform(0.0, 1.0)       # Random float
```

**Functions:** `seed`, `random`, `randint`, `choice`, `shuffle`, `sample`, `uniform`, `randrange`

### re

Regular expressions.

```python
import re

re.search(r"\d+", "Issue 123")       # Find pattern
re.findall(r"PROJ-\d+", text)        # Find all matches
re.sub(r"\s+", " ", text)            # Replace
re.split(r"[,;]", "a,b;c")          # Split by pattern
pattern = re.compile(r"PROJ-\d+")    # Compile for reuse
```

**Functions:** `search`, `match`, `fullmatch`, `findall`, `sub`, `split`, `compile`, `escape`

**Flags:** `IGNORECASE`, `MULTILINE`, `DOTALL`

### datetime

Date and time types.

```python
import datetime

today = datetime.date.today()
now = datetime.datetime.now()
delta = datetime.timedelta(days=7)
next_week = today + delta
```

**Types:** `date`, `time`, `datetime`, `timedelta`

### collections

Specialized container types.

```python
import collections

counter = collections.Counter(["a", "b", "a", "c", "a"])
# Counter({"a": 3, "b": 1, "c": 1})

dd = collections.defaultdict(list)
dd["key"].append("value")

Point = collections.namedtuple("Point", ["x", "y"])
p = Point(10, 20)

dq = collections.deque([1, 2, 3], maxlen=5)
```

**Classes:** `Counter`, `defaultdict`, `namedtuple`, `deque`, `OrderedDict`

### itertools

Iterator utilities.

```python
import itertools

itertools.chain([1, 2], [3, 4])           # [1, 2, 3, 4]
itertools.zip_longest([1, 2], [3], fillvalue=0)  # [(1,3), (2,0)]
itertools.product([1, 2], ["a", "b"])      # Cartesian product
itertools.combinations([1, 2, 3], 2)       # 2-element combos
itertools.groupby(items, key=lambda x: x.status)
```

**Functions:** `chain`, `zip_longest`, `accumulate`, `product`, `combinations`, `permutations`, `groupby`, `starmap`, `takewhile`, `dropwhile`, `islice`, `count`, `cycle`, `repeat`, `compress`, `filterfalse`

### functools

Higher-order functions.

```python
import functools

total = functools.reduce(lambda a, b: a + b, [1, 2, 3, 4])  # 10
add_ten = functools.partial(lambda a, b: a + b, 10)
```

**Functions:** `reduce`, `partial`

### copy

Object copying.

```python
import copy

shallow = copy.copy(original)
deep = copy.deepcopy(original)
```

**Functions:** `copy`, `deepcopy`

### string

String constants.

```python
import string

string.ascii_lowercase   # "abcdefghijklmnopqrstuvwxyz"
string.ascii_uppercase   # "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
string.digits            # "0123456789"
string.punctuation       # Punctuation characters
```

**Constants:** `ascii_lowercase`, `ascii_uppercase`, `ascii_letters`, `digits`, `hexdigits`, `octdigits`, `punctuation`, `whitespace`

### urllib.parse

URL handling.

```python
from urllib import parse

parse.quote("hello world")          # "hello%20world"
parse.unquote("hello%20world")      # "hello world"
parse.urlencode({"q": "test", "page": 1})  # "q=test&page=1"
```

**Functions:** `quote`, `unquote`, `quote_plus`, `unquote_plus`, `urlencode`

---

## Type methods

### String methods

| Method | Description |
|--------|-------------|
| `upper()` | Convert to upper case |
| `lower()` | Convert to lower case |
| `strip(chars)` | Strip whitespace (or specified chars) |
| `lstrip(chars)` | Strip from left |
| `rstrip(chars)` | Strip from right |
| `title()` | Title case |
| `capitalize()` | Capitalize first character |
| `swapcase()` | Swap case |
| `casefold()` | Aggressive lowercase for comparison |
| `split(sep, maxsplit)` | Split string |
| `splitlines(keepends)` | Split by lines |
| `partition(sep)` | Split at first separator |
| `rpartition(sep)` | Split at last separator |
| `find(sub, start, end)` | Find index (-1 if not found) |
| `rfind(sub, start, end)` | Find from right |
| `index(sub, start, end)` | Find index (raises if not found) |
| `count(sub, start, end)` | Count occurrences |
| `startswith(prefix)` | Starts with prefix? |
| `endswith(suffix)` | Ends with suffix? |
| `isdigit()` | All digits? |
| `isalpha()` | All letters? |
| `isalnum()` | All alphanumeric? |
| `isupper()` | All uppercase? |
| `islower()` | All lowercase? |
| `isspace()` | All whitespace? |
| `join(iterable)` | Join iterable with string |
| `replace(old, new, count)` | Replace substring |
| `format(*args, **kwargs)` | Format string |
| `center(width, fillchar)` | Center in width |
| `ljust(width, fillchar)` | Left justify |
| `rjust(width, fillchar)` | Right justify |
| `zfill(width)` | Zero-fill to width |
| `removeprefix(prefix)` | Remove prefix |
| `removesuffix(suffix)` | Remove suffix |

### List methods

| Method | Description |
|--------|-------------|
| `append(item)` | Add item to end |
| `extend(iterable)` | Extend with iterable |
| `insert(index, item)` | Insert at index |
| `pop(index)` | Remove and return item |
| `remove(value)` | Remove first occurrence |
| `clear()` | Remove all items |
| `sort(key, reverse)` | Sort in place |
| `reverse()` | Reverse in place |
| `copy()` | Shallow copy |
| `index(value, start, end)` | Find index of value |
| `count(value)` | Count occurrences |

### Dict methods

| Method | Description |
|--------|-------------|
| `keys()` | Dict keys |
| `values()` | Dict values |
| `items()` | Key-value pairs |
| `get(key, default)` | Get value with default |
| `setdefault(key, default)` | Get or set default |
| `update(other)` | Update from another dict |
| `pop(key, default)` | Remove and return value |
| `clear()` | Remove all items |
| `copy()` | Shallow copy |
| `fromkeys(keys, value)` | Create dict from keys |

### Set methods

| Method | Description |
|--------|-------------|
| `add(elem)` | Add element |
| `remove(elem)` | Remove element (raises if missing) |
| `discard(elem)` | Remove if present |
| `pop()` | Remove arbitrary element |
| `clear()` | Remove all |
| `union(*others)` | Union of sets |
| `intersection(*others)` | Intersection of sets |
| `difference(*others)` | Difference of sets |
| `symmetric_difference(other)` | Symmetric difference |
| `issubset(other)` | Is subset? |
| `issuperset(other)` | Is superset? |
| `isdisjoint(other)` | No common elements? |

### Tuple methods

| Method | Description |
|--------|-------------|
| `count(value)` | Count occurrences |
| `index(value, start, end)` | Find index of value |

---

## Jira API access

All Jira APIs are available in the Python engine with the same syntax:

```python
# Search issues
issues = Issues.search("project = PROJ AND status = Open")

for issue in issues:
    log(f"{issue.key}: {issue.summary}")

# Get and update an issue
issue = Issues.get("PROJ-123")
issue.update({"summary": "Updated title"})

# Create an issue
new_issue = Issues.create("PROJ", "Task", {"summary": "New task"})

# Use requestJira for low-level API calls
response = requestJira("/rest/api/3/myself")
log(response.displayName)
```

All built-in API namespaces (`Issues`, `Users`, `Projects`, `Fields`, `Components`, `Versions`, `Boards`, `Sprints`, `DateUtils`, `CSV`, `Adf`, `Arrays`, `Strings`, `Validator`, `tables`, `queue`, `asyncEvent`) work identically to the JavaScript engine.

---

## Sandbox constraints

The Python engine runs within the same sandbox as the JavaScript engine. The same [resource limits](/docs/jibrok-studio-jira/limits) and [security restrictions](/docs/jibrok-studio-jira/security) apply:

- No filesystem, network, or browser API access
- No `import` of arbitrary Python packages - only the listed stdlib modules are available
- Resource limits (execution time, loop iterations, API calls) are enforced per trigger type
- Method whitelisting applies to all type methods

---

## Next steps

- [Scripting Language](/docs/jibrok-studio-jira/scripting-language) - Language hub and engine comparison
- [Groovy Engine](/docs/jibrok-studio-jira/scripting-groovy) - Groovy-like syntax engine
- [Scripting API](/docs/jibrok-studio-jira/scripting-api) - Full API reference
- [Scripting Examples](/docs/jibrok-studio-jira/scripting-examples) - Practical recipes
- [Script Console](/docs/jibrok-studio-jira/script-console) - Interactive editor
