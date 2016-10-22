Command-line utility
====================

QEDA command line utility is installed by using NPM:

```bash
sudo npm install -g qeda
```

Run in order to list all available commands:

```bash
qeda --help
```

| Command | Description | Example |
|---------|-------------|---------|
| <nobr>[add](#-add-) _COMPONENT_</nobr> | Add component definition to configuration file (with preloading from [remote repository](/library/) if necessary) | <nobr>`qeda add ti/iso721`</nobr> |
| [completion](#-completion-) | Display completion script | <nobr>`source <(qeda completion)`</nobr> |
| <nobr>[config](#-config-) _PARAM_ [_VALUE_]</nobr> | Set/get configuration parameter (see [Parameters list](#parameters-list)) | <nobr>`qeda config output kicad`</nobr> |
| <nobr>[generate](#-generate-) _LIBRARY_</nobr> | Generate libraries for EDA according to configuration file | <nobr>`qeda generate mylib`</nobr> |
| <nobr>[ground](#-ground-) _NET_</nobr> | Add ground symbol to configuration file | <nobr>`qeda ground GND_DC`</nobr> |
| <nobr>[load](#-load-) _COMPONENT_</nobr> | Load component description from [remote repository](/library/) and caching to `library` subdirectory (without adding to configuration file) | <nobr>`qeda load ti/iso721`</nobr> |
| <nobr>[power](#-power-) _NET_</nobr> | Add power supply symbol to configuration file | `qeda power +5V_DC` |
| [reset](#-reset-) | Delete current configuration file (use with attention!) | <nobr>`qeda reset`</nobr> |
| [sort](#-sort-) | Sort components and nets in configuration file alphabetically | <nobr>`qeda sort`</nobr> |
| <nobr>[test](#-test-) _COMPONENT_</nobr> | Generate test library with one component only (does not affect current configuration file but can load some parameters from it) | <nobr>`qeda test ti/iso721`</nobr> |

All configuration parameters and list of added components are saved in `.qeda.yaml` configuration file which is created by the utility. It is a good idea to add this file to your source version control system.

`add`
-----

Firstly this command looks for _COMPONENT_'s YAML-description in `library` directory (relatively to current working directory). In case of its absence utility tries to download correspondent description from [remote repository](/library/). Successful downloading leads to caching this description file in `library` directory and add corresponding record to `.qeda.yaml` configuration file. When called for the second time, utility will use cached file instead of loading it from Internet.

If there is no appropriate description file in local `library` directory nor in remote library, utility will return an error.

Some components may be presented in several [variations](/core/component/#-variations-). In order to add only one variation to library you need to point this variation after `@` character:

    qeda add ti/sn74lvc1g07@sot-23

**See also**: [load](#-load-)

`completion`
------------

Generate completion script for shell and output it to stdout. Depending on Linux distribution one may save this script to system directory:

```bash
qeda completion | sudo tee /usr/local/etc/bash_completion.d/qeda
# or
qeda completion | sudo tee /etc/bash_completion.d/qeda
```

`config`
--------

This command allow to tune individual configuration parameters of future library of electronic components (see [Parameters list](#parameters-list)). To set _PARAM_ you need to provide _VALUE_ as second argument to command. To check the parameter set one should omit the _VALUE_ argument.

`generate`
----------

The final command which generates a library of electronic components according to settings found in `.qeda.yaml` configuration file.

`ground`
--------

Add global ground symbol. There are three optional prefixes for ground net name:

- `signal`
- `chassis`
- `earth`

```bash
qeda ground GND
qeda ground signal/GNDS
qeda ground chassis/GNDC
qeda ground earth/GNDE
```

<center><img src="/img/ground.png" width="300" alt="Ground Symbols"></center>

**See also**: [power](#-power-)

`load`
------

This command loads and caches component description from [remote repository](/library/) regardless of its existence in `library` directory **without** adding to configuration file.

**See also**: [add](#-add-)

`power`
-------

Add global power symbol.

**See also**: [ground](#-ground-)

`reset`
-------

This command completely deletes `.qeda.yaml` configuration file. It is good idea to use it after some experiments before creating release library.

**Use this command with caution because it can erase all your work.**

`sort`
------

This command sorts components and nets in `.qeda.yaml` configuration file in alphabetical order. This may be useful if you wish to edit this file manually in future. But sorting after starting schematic design may cause some direct annotation issues due to land pattern naming sequence.

**It is strongly recommended to use this command only before starting schematic design.**

`test`
------

This command will produce a library with the only _COMPONENT_. The purpose of this command is to check look and integrity of electronic component. Library will be named `test_<conponent>`.

This command does not use components list from `.qeda.yaml` configuration file nor affects it in any manner. But other parameters set by [config](#-config-) command are taken into account during library generation.

Parameters list
---------------

General parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| <nobr>`connection.timeout`</nobr> | integer (ms) | 5000 | Maximum connection timeout for component description loading from [remote repository](/library/) |
| `output` | string | 'kicad' | Output library format. The only option supported at the moment is `'kicad'`  |

Schematic symbol related parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| <nobr>`symbol.gridSize`</nobr> | float (mm) | 2.5 | Grid cell size. |
| <nobr>`symbol.fill`</nobr> | string | 'foreground' | Symbol contour filling type. <br/>Options: `foreground`, `background`, `none`<br/> <center><img src="/img/fill.png" width="330" alt="Filling Options"></center> |
| <nobr>`symbol.fontSize.default`</nobr> | float (mm) | 2.5 | Default font size |
| <nobr>`symbol.fontSize.name`</nobr> | float (mm) | 2.5 | Font size for component name |
| <nobr>`symbol.fontSize.pin`</nobr> | float (mm) | 2.5 | Font size for pin name |
| <nobr>`symbol.fontSize.refDes`</nobr> | float (mm) | 2.5 | Font size for reference designator |
| <nobr>`symbol.lineWidth.default`</nobr> | float (mm) | 0 | Default line width |
| <nobr>`symbol.lineWidth.thick`</nobr> | float (mm) | 0.6 | Thick line width |
| <nobr>`symbol.lineWidth.thin`</nobr> | float (mm) | 0.2 | Thin line width |
| <nobr>`symbol.shortPinNames`</nobr> | boolean | false | Do not use alternative pin names separated by `/` char |
| <nobr>`symbol.space.attribute`</nobr> | float (mm) | 2 | Space between symbol contour and attribute |
| <nobr>`symbol.space.default`</nobr> | float (mm) | 2 | Default space |
| <nobr>`symbol.space.pin`</nobr> | float (mm) | 1.5 | Space between symbol contour and pin number |
| <nobr>`symbol.style`</nobr> | string | 'default' | Symbol style.<br/> Options: `'default'`, `'GOST'` |

Land pattern related parameters:

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| <nobr>`pattern.ball.collapsible`</nobr> | boolean | true | Collapsing option for BGA packages (according to IPC-7351) |
| <nobr>`pattern.clearance.leadToHole`</nobr> | float (mm) | 0.1 | Gap between through-hole lead and hole |
| <nobr>`pattern.clearance.padToMask`</nobr> | float (mm) | 0.05 | Gap between pad's metal and mask edges |
| <nobr>`pattern.clearance.padToPad`</nobr> | float (mm) | 0.2 | Gap between neighboring pads |
| <nobr>`pattern.clearance.padToSilk`</nobr> | float (mm) | 0.2 | Gap between pad's metal and silkscreen drawing |
| <nobr>`pattern.decimals`</nobr> | integer | 3 | Number of digits after decimal point (precision) in generated files |
| <nobr>`pattern.densityLevel`</nobr> | string | 'N' | Component placement density level (according to IPC-7351).<br/> Options: `'L'`, `'N'`, `'M'` |
| <nobr>`pattern.fontSize.default`</nobr> | float (mm) | 1 | Default font size |
| <nobr>`pattern.fontSize.refDes`</nobr> | float (mm) | 1.2 | Font size for reference designator |
| <nobr>`pattern.fontSize.value`</nobr> | float (mm) | 1 | Font size for value |
| <nobr>`pattern.lineWidth.assembly`</nobr> | float (mm) | 0.1 | Line width for drawing in assembly layer |
| <nobr>`pattern.lineWidth.courtyard`</nobr> | float (mm) | 0.05 | Line width for drawing in courtyard layer |
| <nobr>`pattern.lineWidth.default`</nobr> | float (mm) | 0.2 | Default line width |
| <nobr>`pattern.lineWidth.silkscreen`</nobr> | float (mm) | 0.12 | Line width for drawing in silkscreen layer |
| <nobr>`pattern.minimum.drillDiameter`</nobr> | float (mm) | 0.2 | Minimal drill diameter (according to PCB manufacturer capabilities) |
| <nobr>`pattern.minimum.maskWidth`</nobr> | float (mm) | 0.2 | Minimal mask strip width (according to PCB manufacturer capabilities).<br/>Has higher priority over <nobr>`pattern.clearance.padToMask`</nobr> parameter |
| <nobr>`pattern.minimum.ringWidth`</nobr> | float (mm) | 0.2 | Minimal ring width for vias and through-hole pads (according to PCB manufacturer capabilities) |
| <nobr>`pattern.minimum.spaceForIron`</nobr> | float (mm) | 0 | Minimal space between lead and its pad edges |
| <nobr>`pattern.preferManufacturer`</nobr> | boolean | true | Prefer component manufacturer's dimensions rather than IPC-7351 standard while land pattern calculating |
| <nobr>`pattern.polarityMark`</nobr> | string | 'dot' | Shape of polarity mark (near to the first pad).<br/> Options: `'dot'` |
| <nobr>`pattern.ratio.padToHole`</nobr> | float | 1.5 | Proportion for pad size calculation from hole diameter |
| <nobr>`pattern.style`</nobr> | string | 'default' | Pattern style.<br/> Options: `'default'` |
| <nobr>`pattern.tolerance.default`</nobr> | float (mm) | 0.1 | Default size tolerance |
| <nobr>`pattern.tolerance.fabrication`</nobr> | float (mm) | 0.1 | Fabrication tolerance (provided by component manufacturer) |
| <nobr>`pattern.tolerance.placement`</nobr> | float (mm) | 0.1 | Placement tolerance (provided by component placement equipment) |
