FET (Field-Effect Transistor)
=============================

```yaml
schematic:
  symbol: FET
```

Pinout restrictions
-------------------

* **Gate** pin name should begin with letter `G`. Example: `G`, `G1`
* **Drive** pin name should begin with letter `D`. Example: `D`, `D1`
* **Source** pin name should begin with letter `S`. Example: `S`, `S1`
* If there are any other pins then a symbol with enclosure and annotated pins will be generated.

Example:

```yaml
pinout:
  G1: 2
  D1: 7, 8
  S1: 1

  G2: 4
  D2: 5, 6
  S2: 3
```

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
| `depletion` | Depletion-mode | <img src="/img/symbols/fet/depletion.svg" width="96" alt="Depletion-mode FET"> |
| `diode` | Diode between drain and source | <img src="/img/symbols/fet/diode.svg" width="92" alt="FET with diode"> |
| `jfet` |  Junction gate | <img src="/img/symbols/fet/jfet.svg" width="92" alt="JFET"> |
| `n` | N-channel | <img src="/img/symbols/fet/n.svg" width="92" alt="N-channel FET"> |
| `p` | P-channel | <img src="/img/symbols/fet/p.svg" width="92" alt="P-channel FET"> |

Real example
------------

[IRF IRFL014N](https://github.com/qeda/library/blob/master/irf/irfl014n.yaml):

```yaml
schematic:
  symbol: FET
  options: n, diode
```

<center><img src="/img/symbols/fet/irfl014n.svg" width="110" alt="IRF IRFL014N"></center>
