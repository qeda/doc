Inductor
========

```yaml
schematic:
  symbol: inductor
```

Pinout restrictions
-------------------

* Generally there is no need to define `pinout` section when we have an element with only two pins.
* If there is `pinout` section then some naming conventions are to be respected.
* **Left** side pin name should begin with letter `L`. Example: `L`, `L1`
* **Right** side pin name should begin with letter `R`. Example: `R`, `R1`
* There may be **not connected** pin(s) whose name should begin with `NC`. Example: `NC`, `NC1`
* If there are any other pins then a symbol with enclosure and annotated pins will be generated.

Real example
------------

[Inductor L0805](https://github.com/qeda/library/blob/master/inductor/l0805.yaml):

```yaml
schematic:
  symbol: inductor
```

<center><img src="/img/symbols/inductor/l0805.svg" width="92" alt="Inductor L0805"></center>
