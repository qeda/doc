Twin Diode
==========

```yaml
schematic:
  symbol: twin-diode
```

Pinout restrictions
-------------------

* **Anode** pin names should be either `A`, `A1`, `A2`, `A3`.
* **Cathode** pin names should be either `C`, `C1, `C2` or `K`, `K1`, `K2`.
* There are also **anode-cathode** pins with names either `AC`, `CA`, or `AK`, `KA`.
* If there are any other pins then a symbol with enclosure and annotated pins will be generated.

<center><img class="spaced" src="/img/symbols/twin-diode/a-ca-c.svg" width="156" alt="A-CA-C twin diode"></center>
<center><img class="spaced" src="/img/symbols/twin-diode/c1-a-c2.svg" width="192" alt="C1-A-C2 twin diode"></center>
<center><img class="spaced" src="/img/symbols/twin-diode/a1-c-a2.svg" width="188" alt="A1-C-A2 twin diode"></center>
<center><img class="spaced" src="/img/symbols/twin-diode/a1-a3-a2.svg" width="224" alt="A1-A3-A2 twin diode"></center>


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
| `schottky` |  Shottky twin diode | <img src="/img/symbols/twin-diode/schottky.svg" width="116" alt="Shottky twin diode"> |
| `tvs` | Twin transient voltage suppressor | <img src="/img/symbols/twin-diode/tvs.svg" width="146" alt="TVS twin diode"> |
| `zener` | Zener twin diode | <img src="/img/symbols/twin-diode/zener.svg" width="110" alt="Zener twin diode"> |

Real example
------------

[Diode BAS40-04](https://github.com/qeda/library/blob/master/diode/bas40-04.yaml):

```yaml
pinout:
  A: 1
  CA: 3
  C: 2

schematic:
  symbol: twin-diode
  options: schottky
```

<center><img src="/img/symbols/twin-diode/bas40-04.svg" width="132" alt="Diode BAS40-04"></center>
