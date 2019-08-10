Custom
======

```yaml
housing:
  pattern: custom
```

For parts with no specific pattern, the custom pattern allows to specify the individual leads.

Global parameters
-----------------

| Name | Type | Description |
|------|------|-------------|
| `options` | list | Pattern options (see below) |
| `polarized` | boolean | If the pad for the first hole or slot pin should be a rectangle instead of a circle (or oblong) |
| `bodyLength` | dimension | Package body length |
| `bodyWidth` | dimension | Package body width |
| `bodyPosition` | list | X, Y position of the body center |
| `height` | dimension | Overall package height |

`options`
---------

| Option | Description |
|--------|--------|
| `polarized` | If the pad for the first hole/slot pin should be a rectangle instead of a circle (or oblong) |

Lead group parameters
---------------------

Leads can be holes, slots, or pads.

**Note:** The names require an integer number suffix after the first group.

| Name | Type | Description |
|------|------|-------------|
| `number` | integer | Pin numbers |
| `holeDiameter` | float | Round hole diameter |
| `padDiameter` | float | Pad diameter |
| `padWidth` | float | Pad width (overrides width calculated from hole/slot; hole/slot becomes a `mounting-hole` instead of a `through-hole` if the pad is smaller than the hole/slot) |
| `padHeight` | float | Pad height (overrides height calculated from hole/slot; hole/slot becomes a `mounting-hole` instead of a `through-hole` if the pad is smaller than the hole/slot) |
| `slotWidth` | float | Oblong hole width |
| `slotHeight` | float | Oblong hole height |
| `padPosition` | list | X, Y lead positions (can be multiple couples) |
| `rowCount` | integer | Count of rows |
| `columnCount` | integer | Count of columns |
| `pitch` | float | Pitch between leads (when equal for rows and columns).<br/>Not needed if both `columnPitch` and `rowPitch` parameters defined |
| `verticalPitch` | float | Pitch between rows.<br/>Not needed if `pitch` parameter defined |
| `horizontalPitch` | float | Pitch between columns.<br/>Not needed if `pitch` parameter defined |
| `rowDX` | float | Horizontal relative distance between leads in a row |
| `rowDY` | float | Vertical relative distance between leads in a row |
| `columnDX` | float | Horizontal relative distance between leads in a column |
| `columnDY` | float | Vertical relative distance between leads in a column |

Real example
------------

[JST PUD connector S30B-PUDSS-1](https://github.com/qeda/library/blob/master/jst/s30b-pudss-1.yaml):

```yaml
housing:
  pattern: custom
  options: polarized
  bodyWidth: 12.7
  bodyLength: 32
  height: 8.5

  holeDiameter: 0.8
  horizontalPitch: -2
  verticalPitch: 2
  rowCount: 15
  columnCount: 2
  columnDX: 4.75

  holeDiameter1: 1.7
  padDiameter1: 0
  padPosition1: -3.95, -14.9, -3.95, 14.9
```

<center><img src="/img/patterns/custom/s30b-pudss-1.png" alt="JST PUD connector S30B-PUDSS-1"></center>
