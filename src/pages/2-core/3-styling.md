Styling
=======

The power of QEDA that the output library is always generated. Thus one can easily customize the output using configuration parameters.

But these parameters may not be sufficient to produce some significantly customized library. There is styling feature available for that purposes.

Both schematic symbols and land patterns can be customized using styles.

Schematic symbols styling
-------------------------

Schematic symbol style is controlled by `symbol.style` configuration parameter (see [Parameters list](/core/utility/#parameters-list) for details).

In order to create your own style you should clone QEDA repository (see [Advanced customization](/core/advanced/)) and create style subdirectory in `src/symbol/` directory.

For example refer to [GOST](https://github.com/qeda/qeda/tree/master/src/symbol/gost) style

Land patterns styling
---------------------

Land pattern are able to be customized too. Workflow is similar to schematic symbols styling: clone QEDA repository and create style subdirectory in `src/pattern/` directory.

Add style to QEDA Core
----------------------

If you find your style useful for community and you are ready to share and support it feel free to make pull request to add your own style to master branch.
