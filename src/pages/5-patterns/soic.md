SOIC (Small Outline Integrated Circuit)
=======================================

```yaml
housing:
  pattern: SOIC
```

SOIC land pattern is similar to [SOP](/patterns/sop/) one with pitch fixed to 1.27&nbsp;mm.

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

- `JEDEC MS-012`
- `JEDEC MO-013`

Real example
------------

[Cypress CY15B102Q](https://github.com/qeda/library/blob/master/cypress/cy15b102q.yaml):

```yaml
housing:
  pattern: SOIC
  suffix: -S
  bodyWidth: 5.13-5.33
  bodyLength: 5.13-5.33
  height: 2.03
  leadWidth: 0.36-0.48
  leadLength: 0.51-0.76
  leadSpan: 7.75-8.26
  leadCount: 8
```

<center><img src="/img/patterns/soic/cy15b102q.png" width="1068" alt="Cypress CY15B102Q"></center>
