# Because this is a stand-alone build, top_builddir must be set manually!
#
#top_builddir = ../../..
#
ifndef top_builddir
$(error top_builddir is not set)
endif
#
#
# We also need to over-ride the main build system's idea of where we're located.
subdir = $(shell pwd)
#
#
# Similar to PGXS, make check is also not supported. Define a dependency that
# will trigger a failure.
#
# However, by default Gnumake runs the first rule that's defined, so make sure
# that 'all' is the first rule. (presumably we could get around this by
# splitting up the modifications).
all:

check: check-fail

.PHONY: check-fail
check-fail:
	@echo
	@echo
	@echo '"$(MAKE) check" is not supported.'
	@echo 'Do "$(MAKE) install", then "$(MAKE) installcheck" instead.'
	@exit 1
