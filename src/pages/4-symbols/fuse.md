Fuse
====

```yaml
schematic:
  symbol: fuse
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

[TE 1206SFH](https://github.com/qeda/library/blob/master/te/1206sfh.yaml):

```yaml
schematic:
  symbol: fuse
```

<center><img src="/img/symbols/fuse/1206sfh.svg" width="58" alt="TE 1206SFH"></center>
