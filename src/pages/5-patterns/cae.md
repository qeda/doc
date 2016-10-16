Capacitor, Aluminum Electrolytic (CAE) land pattern
===================================================

```yaml
housing:
  pattern: CAE
```

<!--<center><img src="/img/doc/patterns/cae.svg" width="60%" alt="CAE Package"></center>-->

Required parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `bodyDiameter` | dimension | Body cylinder diameter |
| `bodyLength` | dimension | Package base length (key position at top) |
| `bodyWidth` | dimension | Package base width (key position at top) |
| `height` | dimension | Overall package height |
| `leadLength` | dimension | Length of lead |
| `leadSpace` | dimension | Space between leads |
| `leadWidth` | dimension | Width of lead |

Optional parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `padDistance` | float | Distance between pad centers recommended by component manufacturer.<br/>Not needed if `padSpace` or `padSpan` parameter defined |
| `padHeight` | float | Width of pad recommended by component manufacturer |
| `padSpan` | float | Distance between opposite pad edges recommended by component manufacturer.<br/>Not needed if `padDistance` or `padSpace` parameter defined |
| `padSpace` | float | Space between pads recommended by component manufacturer.<br/>Not needed if `padDistance` or `padSpan` parameter defined |
| `padWidth` | float | Width of pad recommended by component manufacturer |

Real example
------------

<a class="ext" href="https://github.com/qeda/library/blob/master/capacitor/cae-a.yaml" target="_blank">Capacitor CAE-A</a><!--_-->:

```yaml
housing:
  pattern: CAE
  bodyDiameter: 2.5-3.5
  bodyLength: 3.1-3.5
  bodyWidth: 3.1-3.5
  height: 5.2-5.5
  leadWidth: 0.45-0.65
  leadLength: 1.3-1.7
  leadSpace: 0.4-0.8
```
