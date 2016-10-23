BGA (Ball Grid Array)
=====================

```yaml
housing:
  pattern: BGA
```

<center><img src="/img/patterns/bga.svg" width="800" alt="BGA Package"></center>

Required parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `bodyLength` | dimension | Package body length (key position in top left) |
| `bodyWidth` | dimension | Package body width (key position in top left) |
| `columnCount` | integer | Count of columns |
| `columnPitch` | float | Pitch between columns.<br/>Not needed if `pitch` parameter defined |
| `height` | dimension | Overall package height |
| `leadDiameter` | dimension | Diameter of lead (ball) |
| `pitch` | float | Pitch between leads (when equal for rows and columns).<br/>Not needed if both `columnPitch` and `rowPitch` parameters defined |
| `rowCount` | integer | Count of rows |
| `rowPitch` | float | Pitch between rows.<br/>Not needed if `pitch` parameter defined |

Optional parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `leadCount` | integer | Actual lead count |
| `padDiameter` | float | Diameter of pad recommended by component manufacturer |

Available outlines
------------------

- `JEDEC MO-211`

Real example
------------

[Analog Devices AD9393](https://github.com/qeda/library/blob/master/analog/ad9393.yaml):

```yaml
housing:
  pattern: BGA
  bodyWidth: 5.90-6.10
  bodyLength: 5.90-6.10
  height: 1.40
  pitch: 0.5
  rowCount: 10
  columnCount: 10
  leadDiameter: 0.25-0.35
  leadCount: 76
```
