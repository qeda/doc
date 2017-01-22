Diode
=====

```yaml
schematic:
  symbol: diode
```

Pinout restrictions
-------------------

* Generally there is no need to define `pinout` section when we have an element with only two pins.
* If there is `pinout` section then some naming conventions are to be respected.
* **Anode** pin name should begin with letter `A`. Example: `A`, `A1`
* **Cathode** pin name should begin with letter `C` or `K`. Example: `K`, `C1`
* There may be **not connected** pin(s) whose name should begin with `NC`. Example: `NC`, `NC1`
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
| `led` | Light-emitting diode (equal to [LED symbol](/symbols/led/)) | <img src="/img/symbols/diode/led.svg" width="46" alt="LED"> |
| `schottky` |  Shottky diode | <img src="/img/symbols/diode/schottky.svg" width="54" alt="Shottky diode"> |
| `tvs` | Transient voltage suppressor | <img src="/img/symbols/diode/tvs.svg" width="56" alt="TVS diode"> |
| `zener` | Zener diode | <img src="/img/symbols/diode/zener.svg" width="38" alt="Zener diode"> |

Real example
------------

[ON Semiconductor BAS40L](https://github.com/qeda/library/blob/master/onsemi/bas40l.yaml):

```yaml
pinout:
  A: 1
  C: 3
  NC: 2

schematic:
  symbol: diode
  options: schottky
```

<center><img src="/img/symbols/diode/bas40l.svg" width="56" alt="ON Semiconductor BAS40L"></center>
