Connector
=========

```yaml
schematic:
  symbol: connector
```

Default connector symbol has pins located on two sides with left to right, top to bottom numbering order.

Optional parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `bottom` | list | List of pins on the **bottom** side of symbol |
| `left` | list | List of pins on the **left** side of symbol |
| `options` | list | Symbol options (see below) |
| `right` | list | List of pins on the **right** side of symbol |
| `top` | list | List of pins on the **top** side of symbol |

`options`
---------

| Option | Description | Symbol |
|--------|-------------|--------|
| `ccw` | Counter-clockwise pin numbering | <img src="/img/symbols/connector/ccw.svg" width="128" alt="Counter-clockwise connector"> |
| `cw` | Clockwise pin numbering | <img src="/img/symbols/connector/cw.svg" width="128" alt="Clockwise connector"> |
| `mirror` | Mirror symbol | <img src="/img/symbols/connector/mirror.svg" width="128" alt="Mirrored connector"> |
| `single` | Single sided symbol | <img src="/img/symbols/connector/single.svg" width="74" alt="Single-sided connector"> |
| `square-pin` | Square pin shape | <img src="/img/symbols/connector/square-pin.svg" width="128" alt="Square pin connector"> |
| `no-pin` | No pin shape | <img src="/img/symbols/connector/no-pin.svg" width="128" alt="No pin connector"> |

Real example
------------

[Harting 09682537613](https://github.com/qeda/library/blob/master/harting/09682537613.yaml):

```yaml
schematic:
  symbol: connector
  left: 1-8
  right: 9-15
  top: 16
  bottom: 17
```

<center><img src="/img/symbols/connector/09682537613.svg" width="182" alt="Harting 09682537613"></center>
