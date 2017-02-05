SOP (Small Outline Package)
===========================

```yaml
housing:
  pattern: SOP
```

**Note:** Pins not defined in pinout will skipped on land pattern too.

Required parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `bodyLength` | dimension | Package body length (key position in top left) |
| `bodyWidth` | dimension | Package body width (key position in top left) |
| `height` | dimension | Overall package height |
| `leadCount` | integer | Nominal lead count (as it would be without skipping if any) |
| `leadLength` | dimension | Length of lead |
| `leadSpan` | dimension | Distance between opposite lead edges |
| `leadWidth` | dimension | Width of lead |
| `pitch` | float | Pitch between leads |

Optional parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `padHeight` | float | Height of pad recommended by component manufacturer |
| `padSpan` | float | Distance between opposite pad edges recommended by component manufacturer.<br/>Not needed if `padDistance` or `padSpace` parameter defined |
| `padSpace` | float | Space between pads recommended by component manufacturer.<br/>Not needed if `padDistance` or `padSpan` parameter defined |
| `padWidth` | float | Width of pad recommended by component manufacturer |
| `tabLength` | dimension | Length of thermal tab |
| `tabWidth` | dimension | Width of thermal tab |

Available outlines
------------------

- `JEDEC MO-137`
- `JEDEC MO-150`
- `JEDEC MO-153`
- `JEDEC MO-187`
- `JEDEC MO-194`
- `JEITA SC-88`

Real example
------------

[Toshiba TLP160G](https://github.com/qeda/library/blob/master/toshiba/tlp160g.yaml):

```yaml
housing:
  pattern: SOP
  bodyWidth: 4.4
  bodyLength: 3.4-3.8
  height: 2.4-2.8
  leadWidth: 0.4
  leadLength: 0.5
  leadSpan: 6.6-7.4
  leadCount: 6
  pitch: 1.27
```

<center><img src="/img/patterns/sop/tlp160g.png" width="1066" alt="Toshiba TLP160G"></center>
