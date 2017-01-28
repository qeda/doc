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
| `igbt` | Insulated-gate bipolar transistor | <img src="/img/symbols/transistor/igbt.svg" width="96" alt="Insulated-gate bipolar transistor"> |
| `npn` | NPN | <img src="/img/symbols/transistor/npn.svg" width="92" alt="NPN"> |
| `pnp` |  PNP | <img src="/img/symbols/transistor/pnp.svg" width="92" alt="PNP"> |

Real example
------------

[IRF IRFL014N](https://github.com/qeda/library/blob/master/irf/irfl014n.yaml):

```yaml
schematic:
  symbol: FET
  options: n, diode
```

<center><img src="/img/symbols/fet/irfl014n.svg" width="110" alt="IRF IRFL014N"></center>
