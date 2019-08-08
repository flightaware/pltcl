# Stand-alone version of Postgres pl/tcl
This repository is meant to facilitate development and potential release of pl/tcl
features outside of the normal Postgres release process.

# Requirements

* PostgreSQL source tree, 11.5, configured and made
* Tcl 8.6 or later

# Building
In order to build from this repository, you must have a checkout of the full Postgres
source code. In that checkout, make certain that you can build and run pl/tcl. IE:

```
cd src/pl/tcl
make install installcheck
```

Once you're satisfied that mainline pltcl works, switch to a checkout of this repository.
You will need to set the `top_builddir` environment variable, and then you can run make.
Unlike mainline pl/tcl, `make check` is not supported; use the installcheck target instead:

```
top_builddir=$HOME/pgsql/HEAD make installcheck
```

# Accidental use of mainline pl/tcl
Because this repository depends on the main Postgres source, it's possible to accidentally
be working with the mainline pl/tcl without realizing it. The simplest way to verify that
installcheck is running the right code is to temporarily move the original pl/tcl somewhere
else:

```
top_builddir=$HOME/pgsql/HEAD mv "$top_builddir"/src/pl/tcl ${TEMP:-/tmp}
```

NOTE: even if the mainline pltcl is accidentally being used, `make` will probably still be
working within this repository. Just because make works don't assume you have the correct
pl/tcl!
