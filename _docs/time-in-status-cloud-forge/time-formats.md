---
title: Time formats
key: time-in-status-cloud-forge
excerpt: "All 46 time display formats supported by Time in Status (Forge) - from raw seconds to full long-form strings with years, months, weeks, days, hours, minutes, and seconds."
category: field-configuration
tags: [doc, cloud, time-in-status, forge, status-tracking, field-creation, business-calendar]
---

Every field setting in the Forge version lets you pick one of **46 time formats**. The format decides how the stored number of seconds is rendered in the custom field, in the issue panel, and in the Issue Navigator.

The same format catalogue is used across Time in Status, Stopwatch, Timer, and Time Between Dates fields.

* TOC
{:toc}

---

## Default format

`DEFAULT` renders time as `HH:MM:SS`, for example `13:48:03`. This is the built-in default if no format is chosen.

---

## Format catalogue

Examples in the table below assume a stored value of **50 000 seconds** (13 hours 48 minutes 3 seconds, or roughly 0.58 days). Long-form examples further down the table use larger values to show how the format handles days, weeks, months, and years.

### Seconds and minutes

| ID | Example | Notes |
|---|---|---|
| `D1` | `50000s` | Total seconds with `s` suffix |
| `D2` | `50000` | Total seconds, bare number |
| `D3` | `833` | Total minutes, bare number |
| `D4` | `833m` | Total minutes with `m` suffix |

### Hours

| ID | Example | Notes |
|---|---|---|
| `D5` | `13` | Whole hours, bare number |
| `D6` | `13h` | Whole hours with `h` suffix |
| `D7` | `13.8` | Decimal hours, dot separator |
| `D8` | `13,8` | Decimal hours, comma separator |
| `D9` | `13.8h` | Decimal hours with `h` suffix |
| `D10` | `13,8h` | Decimal hours with `h` suffix, comma separator |

### Hours and minutes

| ID | Example | Notes |
|---|---|---|
| `DEFAULT` | `13:48:03` | `HH:MM:SS` |
| `D0` | `13h 48m 03s` | Hours, minutes, seconds in verbose form |
| `D11` | `13:48` | `HH:MM` |
| `D12` | `13h 48m` | Common default - hours and minutes with suffixes |

### Days

| ID | Example | Notes |
|---|---|---|
| `D13` | `10d` | Whole days, `d` suffix |
| `D14` | `10 days` | Whole days, verbose |
| `D15` | `10d 15h` | Days and hours |
| `D16` | `10 days 15 hours` | Days and hours, verbose |

### Weeks

| ID | Example | Notes |
|---|---|---|
| `D18` | `8w` | Whole weeks |
| `D19` | `8 weeks` | Whole weeks, verbose |
| `D20` | `8w 6d` | Weeks and days |
| `D21` | `8 weeks 6 days` | Weeks and days, verbose |
| `D23` | `8w 6d 13h` | Weeks, days, hours |
| `D24` | `8 weeks 6 days 13 hours` | Weeks, days, hours, verbose |

### Months

| ID | Example | Notes |
|---|---|---|
| `D26` | `2m 3w` | Months and weeks |
| `D27` | `2 month 3 weeks` | Months and weeks, verbose |
| `D29` | `2m 3w 6d` | Months, weeks, days |
| `D30` | `2 month 3 weeks 6 days` | Months, weeks, days, verbose |

### Years

| ID | Example | Notes |
|---|---|---|
| `D32` | `1y 2m 3w` | Years, months, weeks |
| `D33` | `1 year 2 month 3 weeks` | Verbose |
| `D35` | `1y 2m 3w 6d` | Years, months, weeks, days |
| `D36` | `1 year 2 month 3 weeks 6 days` | Verbose |
| `D38` | `1y 2m 3w 6d 13h` | With hours |
| `D39` | `1 year 2 month 3 weeks 6 days 13 hours` | Verbose |
| `D41` | `1y 2m 3w 6d 13h 5m` | With hours and minutes |
| `D42` | `1 year 2 month 3 weeks 6 days 13 hours 5 minutes` | Verbose |
| `D44` | `1y 2M 3w 6d 13h 5m 7s` | Full - years, months, weeks, days, hours, minutes, seconds |
| `D45` | `1 year 2 month 3 weeks 6 days 13 hours 5 minutes 7 seconds` | Verbose full |
| `D46` | `1y 2MONTH 3w 6d 13h 5m 7s` | Uppercase month token |

---

## Choosing a format

- **Small time spans (under 24 hours)**: `D11` (`13:48`), `D12` (`13h 48m`), or `DEFAULT` (`13:48:03`).
- **SLA-style numeric comparisons and exports**: `D2` (`50000`), `D1` (`50000s`), or `D4` (`833m`). Bare numbers are easiest to aggregate in external BI tools.
- **Days or weeks-long values**: `D15` (`10d 15h`), `D24` (`8 weeks 6 days 13 hours`), or `D30` (`2 month 3 weeks 6 days`).
- **Multi-year values**: `D36` (`1 year 2 month 3 weeks 6 days`), `D42`, or `D45`.

---

## Unit calibration

Formats that include days, weeks, months, or years honour the **unit conversions** configured on the work calendar. If your business day is 8 hours instead of 24, configure `secInDay` on the calendar so `D13` (`10d`) reflects business days. See [Work calendars → Advanced](/docs/time-in-status-cloud-forge/work-calendar#advanced-unit-conversions).

---

## Panel format override

Each TIS field setting has an optional **Panel format override**. Use it when you want the custom field to store one format (for example `D11` - `13:48` for the Issue Navigator) but the issue panel to display another (for example `D14` - `10 days`). See [Field setting reference → Panel format override](/docs/time-in-status-cloud-forge/time-in-status-field-settings#panel-format-override).
