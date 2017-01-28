Capacitor
=========

```yaml
schematic:
  symbol: capacitor
```

Pinout restrictions
-------------------

* Generally there is no need to define `pinout` section when we have an element with only two pins.
* If there is `pinout` section then some naming conventions are to be respected.
* **Left** side pin name should begin with letter `L`. Example: `L`, `L1`
* **Right** side pin name should begin with letter `R`. Example: `R`, `R1`
* There may be **not connected** pin(s) whose name should begin with `NC`. Example: `NC`, `NC1`
* If there are any other pins then a symbol with enclosure and annotated pins will be generated.

Optional parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `options` | list | Symbol options (see below) |

`options`
---------

| Option | Description | Symbol |
|--------|-------------|--------|
| `polarized` | Polarized capacitor | <img src="/img/symbols/capacitor/polarized.svg" width="60" alt="Polarized capacitor"> |

Real example
------------

[Capacitor C0603](https://github.com/qeda/library/blob/master/capacitor/c0603.yaml):

```yaml
schematic:
  symbol: capacitor
```

<center><img src="/img/symbols/capacitor/c0603.svg" width="42" alt="Capacitor C0603"></center>
