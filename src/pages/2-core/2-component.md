Component description
=====================

The file that describes electronic component represents human readable <a class="ext" href="http://yaml.org/" target="_blank">YAML</a><!--_--> document. All description files should be located in `library` directory (relatively to current working directory). Path of description file inside `library` directory is pointed as parameter in `qeda add` command.

For example if you add file `my-element.yaml` to `library` subdirectory you have to run in order to add it:

```bash
qeda add my-element
```

If path to the new description file is `library/my-group/my-element.yaml` then command is modified to:

```bash
qeda add my-group/my-element
```

If you want to create a library with the only one element (for testing purposes) you may use `qeda test` command:

```bash
qeda test my-element
```

The good point of starting is to clone and examine [QEDA Library](/doc/library/):

```bash
git clone https://github.com/qeda/library.git --depth 1
```

General description structure
-----------------------------

Let's explore simple YAML definition of <a class="ext" href="https://github.com/qeda/library/blob/master/misc/tp-sm-1.yaml" target="_blank">test point</a><!--_-->.

```yaml
name: TP-SM-1
description: Surface Mount Test Point, 1 mm diameter
keywords: test point

schematic:
  symbol: test-point

housing:
  pattern: test-point
  padDiameter: 1
```

As we can see there are some top-level attributes as well as information about schematic symbol and land pattern.

Parameter types
---------------

- *boolean* &mdash; logical type, can be only `false` or `true`

  **Example**: `true`

- *list* &mdash; comma separated list of strings or numbers (or may contain only one item without comma)

  **Example**: `foo, bar, 10, baz`

- *number* &mdash; numerical integer or float

  **Example**: `1.35`

- *range* &mdash; range of numbers

  **Example**: `1.25-1.45`

- *string* &mdash; line of text (may be quoted or not; quotes are recommended for numerical string in order to avoid ambiguity)

  **Example**: `Bipolar transistor`

- *structure* &mdash; entity that has second-level fields

  **Example**:

  ```yaml
  struct:
    field1: foo
    field2: 10
    field3: bar, baz
    field4: 1-4
  ```

List of parameters
------------------

| Parameter name                | Type                  | Requirement  | Description                                                                   |
|-------------------------------|-----------------------|--------------|-------------------------------------------------------------------------------|
| [abstract](#-abstract-)       | boolean               | optional     | Attribute of abstract base description that cannot be added to library itself |
| [alias](#-alias-)             | list                  | optional     | Alternative name(s)                                                             |
| [base](#-base-)               | list                  | optional     | Name of base element(s)                                                          |
| [datasheet](#-datasheet-)     | string                | optional     | URL to datasheet                                                              |
| [description](#-description-) | string                | optional     | Detailed description                                                          |
| [groups](#-groups-)           | structure             | optional     | Pin groups                                                       |
| [housing](#-housing-)         | structure             | **required** | Land pattern parameters                                                       |
| [joint](#-joint-)             | structure             | optional     | Join symbol for composite pin names                                           |
| [keywords](#-keywords-)       | list                  | optional     | Keywords                                                                      |
| [name](#-name-)               | string                | **required** | Element name                                                                  |
| [parts](#-parts-)             | structure             | optional     | Part list (for multi-part symbols)                                                               |
| [pinout](#-pinout-)           | structure             | optional     | Pin assignment                                                                |
| [properties](#-properties-)   | structure             | optional     | Pin properties                                                                |
| [schematic](#-schematic-)     | structure             | **required** | Schematic symbol parameters                                                   |
| [suffix](#-suffix-)           | list                  | optional     | Name postfix(es)                                                                  |
| [variations](#-variations-)   | list                  | optional     | List of possible variations described in separate files                       |


`abstract`
----------

Abstract description may be used only as base for other description. It is useful when several components share common parameters. Abstract component can not be added to library.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/maxim/max607x.yaml" target="_blank">Maxim MAX607x</a><!--_-->:

```yaml
abstract: true
```

**See also**: [base](#-base-)

`alias`
-------

Alternative name (or names) of component. Creates separate record (records) in output library.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/ti/lm1117mpx.yaml" target="_blank">TI LM1117MPX</a><!--_-->:

```yaml
name: LM1117MPX
alias: LM1117IMPX
```

**See also**: [name](#-name-), [suffix](#-suffix-)

`base`
------

This directive allows to include parameters from other descriptions. Base description can be located in the same directory with component description (pointed by name without `.yaml` extension) as well as in other directory within `library` (pointed as `<dir>/<YAML name>`). Value is case insensitive.

One may override parameters defined in base description and add other parameters.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/maxim/max6070.yaml" target="_blank">Maxim MAX6070</a><!--_-->:

```yaml
base: MAX607x
```

**See also**: [abstract](#-abstract-)

`datasheet`
-----------

Link to the datasheet.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/ti/opa335.yaml" target="_blank">TI OPA335</a><!--_-->:

```yaml
datasheet: http://www.ti.com/lit/ds/symlink/opa335.pdf
```

`description`
-------------

Short text description of electronic component.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/atmel/atmega8.yaml" target="_blank">Atmel ATmega8A</a><!--_-->:

```yaml
description: 8-bit AVR Microcontroller
```

`groups`
--------

There are two possible ways to combine pins into the groups. One of them is using [pinout](#-pinout-) hierarchy. Another one is by virtue of `groups` structure.

Structure format:

```yaml
groups:
  <group name>: <pin name 1> [,  <pin name 2> ...] | <pin range>
```

It is useful to prefer this way over [pinout](#-pinout-) hierarchy in case of using several variations:

```yaml
variations: QFP, BGA

pinout@QFP:
  A: 1
  B: 2

pinout@BGA:
  A: G1
  B: D4
  C: F8

groups:
  DATA: A, B, C
```

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/ti/iso72x.yaml" target="_blank">TI ISO72x</a><!--_-->:

```yaml
groups:
  DATA1: IN
  DATA2: OUT, ~EN
  POWER1: Vcc1, GND1
  POWER2: Vcc2, GND2
```

**See also**: [pinout](#-pinout-)

`housing`
---------

One of the three **required** parameters.

This entry is responsible for land pattern generation.

Structure format:

```yaml
housing:
  suffix: <optional suffix>
  units: mm | inches # 'mm' by default
  pattern: <pattern handler script name>
  # or
  outline: <outline qualified name>
  ... # pattern dependent parameters
```

`pattern` value is a base name of script which is responsible for land pattern generation. For example `pattern: QFP` will run <a class="ext" href="https://github.com/qeda/qeda/blob/master/src/pattern/default/qfp.coffee" target="_blank">pattern/default/qfp.coffee</a><!--_--> script in order to generate QFP land pattern. If [style](/doc/qeda/styling/) is not `default` then pattern generator script will be searched in `pattern/<style>/` directory.

One may use his own generator written on CoffeeScript or JavaScript placed in local `pattern` directory. For `./pattern/my-generator.js` script one should point:

```yaml
housing:
  pattern: my-generator
```

Alternative way to specify land pattern generator is to point standard `outline` which cause parameters to be borrowed from corresponding outline description. For example `outline: JEDEC MS-026 AEB` setting will load housing parameters from <a class="ext" href="https://github.com/qeda/qeda/blob/master/share/outline/jedec/ms-026.yaml" target="_blank">share/outline/jedec/ms-026.yaml</a><!--_--> description (`AEB` will be matched to corresponding sections inside YAML-outline).

Please refer to [particular pattern documentation](/doc/patterns/) for detailed information about pattern dependent parameters.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/resistor/r0603.yaml" target="_blank">Resistor R0603</a><!--_-->:

```yaml
housing:
  pattern: chip
  bodyLength: 1.5-1.7
  bodyWidth: 0.7-0.9
  height: 0.35-0.55
  leadLength: 0.15-0.45
```

`joint`
-------

This parameter is for group name concatenation with pin name separated by delimiter character.

Structure format:

```yaml
joint:
  <group name>: <delimiter character>
```

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/altera/10m50sce144.yaml" target="_blank">Altera 10M50SCE144</a><!--_-->:

```yaml
pinout:
  DIFF:
    L1n: 6
    L1p: 7

joint:
  DIFF: '_'
```

This definition is equivalent to following:

```yaml
pinout:
  DIFF:
    DIFF_L1n: 6
    DIFF_L1p: 7
```

`keywords`
----------

Keywords related to the electronic component. May be used by [custom style handlers](/doc/qeda/styling/) for extra information about element.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/atmel/ata6670.yaml" target="_blank">Atmel ATA6670</a><!--_-->:

```yaml
keywords: IC, Digital, Transceiver
```

`name`
------

One of the three **required** parameters.

Unique name of electronic component. This is key which element is identified in library by.

This is a good practice to make combination of name and [suffix](#-suffix-) to be most similar to ordering part number (except tape and reel package options, Pb-free version etc.).

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/atmel/atmega128.yaml" target="_blank">Atmel ATmega128</a><!--_-->:

```yaml
name: ATmega128
```

**See also**: [alias](#-alias-), [suffix](#-suffix-)

`parts`
-------

This parameter is needed for multi-part schematic symbols.

Structure format:

```yaml
parts:
  <part name>: <pin name 1> [,  <pin name 2> ...] | <pin range>
  <part name>: <pin group name 1> [,  <pin group name 2> ...] | <pin group range>
```

Each entry with `part name` defines separate schematic symbol which incorporates pins (and/or pin groups) specified.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/ti/tms320f28374dptp.yaml" target="_blank">TI TMS320F28374DPTP</a><!--_-->:

```yaml
parts:
  GPIO: GPIO
  ADC: VREFA, ADCA, VREFB, ADCB, VREFC, ADCC, VREFD, ADCD, ADC
  CONTROL: RESET, CLOCK, JTAG, VREGENZ, ERRORSTS, FILTER
  POWER: VDD, VDD3VFL, VDDA, VDDIO, VDDOSC, VSS, VSSOSC, VSSA
```

`pinout`
--------

One of the central structures of component description. It defines component's pinout.

Structure format:

```yaml
pinout:
  <pin name>: <pin number 1> [, <pin number 2> ...]
  <pin name 1>, <pin name 2>: <pin number 1> , <pin number 2>
  <pin name from>-<pin name to>: <pin number from>-<pin number to>
  <pin group name>:
    <pin name 1>: <pin number> [...]
    <pin name 2>: <pin number> [...]
```

**Important**: Pin names as well as pin group names should be unique.

Pin numbers may be defined as comma separated list, range or combination of them.

```yaml
pinout:
  DATA: 1, 3-6, 10
```

Pin numbers may contain letters (for BGA packages):

```yaml
pinout:
  GND: B1, C10-C13, AA1-AC3
```

Several pins may be combined in group:

```yaml
pinout:
  SPI:
    CS: 1
    CLK: 2
    MOSI: 3
    MISO: 4
```

Pin names are also allowed to be combined. They will be converted to list automatically (its size should be equal to pin number list size on the right side).

```yaml
pinout:
  D16-0, CLK: 1-18
```

This will produce pins `D16` (pin number `1`), `D15` (`2`), `D14` (`3`) ... `D0`(`17`), `CLK` (`18`).

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/atmel/atmega8.yaml" target="_blank">Atmel ATmega8</a><!--_-->:

```yaml
pinout:
  PORTB:
    PB0-7: 12-17, 7, 8
  PORTC:
    PC0-6: 23-29
  PORTD:
    PD0-7: 30-32, 1, 2, 9-11
  ADC6: 19
  ADC7: 22

  AREF: 20
  VCC: 4, 6
  AVCC: 18
  GND: 3, 5, 21
```

**See also**: [groups](#-groups-)

`properties`
------------

Electrical properties of elements pins.

Structure format:

```yaml
properties:
  <property>: <pin name 1> [, <pin number 2> ...] | <pin range>
  <property>: <pin group name 1> [, <pin group name 2> ...] | <pin group range>
```

If pin group pointed then each pin of this group will have property specified.

Available properties:

- `analog` &mdash; analog pin (e.g. `AIN`)
- `bidir` &mdash; bidirectional digital pin (e.g. `GPIO`)
- `ground` &mdash; ground pin (e.g. `GND`)
- `in` &mdash; input pin (e.g. `CE`, `VIN`)
- `inverted` &mdash; inverted pin (e.g. `~RESET`)
- `nc`  &mdash; not connected pin (e.g. `NC`)
- `out` &mdash; output pin (e.g. `SCLK`, `VOUT`)
- `passive` &mdash; passive pin (e.g. `XTAL`)
- `power` &mdash; passive pin (e.g. `VDD`)
- `z` &mdash; high-impedance pin

Some signals may have multiple properties:

```yaml
properties:
  in: ~RESET, VIN
  out: VOUT
  power: VIN, VOUT
  inverted: ~RESET
```

`VIN` is voltage input, `VOUT` is voltage output, `~RESET` is inverted digital input.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/cypress/cy15b102q.yaml" target="_blank">Cypress CY15B102Q</a><!--_-->:

```yaml
properties:
  in: ~WP, ~CS, ~HOLD, SCK, SI
  out: SO
  power: VDD
  ground: VSS
  inverted: ~WP, ~CS, ~HOLD
```

`schematic`
-----------

One of the three **required** parameters.

This section describes schematic symbol generation parameters.

Structure format:

```yaml
schematic:
  symbol: <symbol handler script name>
  ... # symbol dependent parameters
```

`symbol` value is a base name of script which is responsible for schematic symbol generation. For example `symbol: IC` will run <a class="ext" href="https://github.com/qeda/qeda/blob/master/src/symbol/default/ic.coffee" target="_blank">symbol/default/ic.coffee</a><!--_--> script in order to generate integrated circuit schematic symbol. If style is not default then symbol generator script will be searched in `symbol/<style>/` directory (see <a class="ext" href="https://github.com/qeda/qeda/tree/master/src/symbol/gost" target="_blank">GOST style</a><!--_--> for example).

One may use his own generator written on CoffeeScript or JavaScript placed in local `symbol` directory. For `./symbol/my-generator.js` script one should point:

```yaml
schematic:
  symbol: my-generator
```
Please refer to [particular symbol documentation](/doc/symbols/) for detailed information about symbol dependent parameters.

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/infineon/kp235.yaml" target="_blank">Infineon KP235</a><!--_-->:

```yaml
schematic:
  symbol: IC
  left: SERIAL
  right: VOUT, TEST
  top: VDD
  bottom: GND
```

`suffix`
--------

One or multiple optional postfixes for component's aliases.

For example:

```yaml
name: COMP
suffix: -A, -B, -C
```

will produce library element with name `COMP` and three aliases with names `COMP-A`, `COMP-B`, `COMP-C`.

This suffix is placed after `housing`'s `suffix` (if any).

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/maxim/max1735.yaml" target="_blank">Maxim MAX1735</a><!--_-->:

```yaml
suffix: EUK50-T, EUK30-T, EUK25-T
```

**See also**: [alias](#-alias-), [name](#-name-)

`variations`
-----------

Some electronic components may be presented in several variations. For example the same integrated circuit may exist in various packages.

Variations are itemized as comma separated list:

```yaml
variations: <variation 1> [, <variation 2> ...]
```

Any top-level parameter may be specified only for one variation by using `@` character:

```yaml
datasheet@<variation>: ...

pinout@<variation>:
  ...

housing@<variation>:
  ...
```

Thus one may add to library only one variation instead of all of them:

```bash
qeda add group/component@variation
```

**Real example** <a class="ext" href="https://github.com/qeda/library/blob/master/ti/sn74lvc1g07.yaml" target="_blank">TI SN74LVC1G07</a><!--_-->:

```yaml
variations: SOT-23, SC70, SOT, SON1, SON2, DSBGA-6, DSBGA-4
```
