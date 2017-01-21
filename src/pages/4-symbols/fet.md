FET (Field-Effect Transistor)
=============================

```yaml
schematic:
  symbol: FET
```

Optional parameters
-------------------

| Name | Type | Description |
|------|------|-------------|
| `options` | list | Symbol options (see below) |

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
