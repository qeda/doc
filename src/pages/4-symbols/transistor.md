Transistor
==========

```yaml
schematic:
  symbol: transitor
```

Pinout restrictions
-------------------

* **Base** pin name should begin with letter `B`. Example: `B`, `B1`
* **Collector** pin name should begin with letter `C`. Example: `C`, `C1`
* **Emitter** pin name should begin with letter `E`. Example: `E`, `E1`
* There may be **gate** pin instead of base in IGBT with name starting with `G`. Example: `G`, `G1`
* If there are any other pins then a symbol with enclosure and annotated pins will be generated.

Optional parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `bottom` | list | List of pins on the **bottom** side of symbol enclosure |
| `left` | list | List of pins on the **left** side of symbol enclosure |
| `options` | list | Symbol options (see below) |
| `right` | list | List of pins on the **right** side of symbol enclosure |
| `top` | list | List of pins on the **top** side of symbol enclosure |

`options`
---------

| Option | Description | Symbol |
|--------|-------------|--------|
| `igbt` | Insulated-gate bipolar transistor | <img src="/img/symbols/transistor/igbt.svg" width="92" alt="Insulated-gate bipolar transistor"> |
| `npn` | NPN transistor | <img src="/img/symbols/transistor/npn.svg" width="92" alt="NPN transistor"> |
| `pnp` |  PNP transistor | <img src="/img/symbols/transistor/pnp.svg" width="92" alt="PNP transistor"> |

Real example
------------

[NXP BC846](https://github.com/qeda/library/blob/master/nxp/bc846.yaml):

```yaml
pinout:
  B: 1
  E: 2
  C: 3

schematic:
  symbol: transistor
  options: npn
```

<center><img src="/img/symbols/transistor/bc846.svg" width="92" alt="NXP BC846"></center>
