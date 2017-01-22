Pushbutton
==========

```yaml
schematic:
  symbol: pushbutton
```

Pinout restrictions
-------------------

* Generally there is no need to define `pinout` section when we have an element with only two pins.
* If number of pins is more than two then a symbol with enclosure and named pins will be generated.

Optional parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `bottom` | list | List of pins on the **bottom** side of symbol enclosure |
| `left` | list | List of pins on the **left** side of symbol enclosure |
| `right` | list | List of pins on the **right** side of symbol enclosure |
| `top` | list | List of pins on the **top** side of symbol enclosure |

Real example
------------

[CK KMR2](https://github.com/qeda/library/blob/master/ck/kmr2.yaml):

```yaml
schematic:
  symbol: pushbutton
  left: S1
  right: S2
  bottom: CASE
```

<center><img src="/img/symbols/pushbutton/kmr2.svg" width="182" alt="CK KMR2"></center>
