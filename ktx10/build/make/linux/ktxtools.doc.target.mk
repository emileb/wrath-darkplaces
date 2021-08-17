# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := ktxtools.doc
### Rules for action "buildDoc":
quiet_cmd_ktxtools_gyp_ktxtools_doc_target_buildDoc = ACTION Generating tools documentation with Doxygen $@
cmd_ktxtools_gyp_ktxtools_doc_target_buildDoc = LD_LIBRARY_PATH=$(builddir)/lib.host:$(builddir)/lib.target:$$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd $(srcdir)/.; mkdir -p build/docs/man/ktxtools/man1 build/docs/html build/docs; ./runDoxygen -t build/docs/.gentimestamp ktxtools.doxy

build/docs/html/ktxtools: obj := $(abs_obj)
build/docs/html/ktxtools: builddir := $(abs_builddir)
build/docs/html/ktxtools: TOOLSET := $(TOOLSET)
build/docs/html/ktxtools build/docs/man/ktxtools/man1/toktx.1 build/docs/.gentimestamp: ktxtools_gyp_ktxtools_doc_target_buildDoc.intermediate
	@:
.INTERMEDIATE: ktxtools_gyp_ktxtools_doc_target_buildDoc.intermediate
ktxtools_gyp_ktxtools_doc_target_buildDoc.intermediate: $(srcdir)/ktxtools.doxy $(srcdir)/runDoxygen $(srcdir)/tools/toktx/toktx.cpp FORCE_DO_CMD
	$(call do_cmd,touch)
	$(call do_cmd,ktxtools_gyp_ktxtools_doc_target_buildDoc)

all_deps += build/docs/html/ktxtools build/docs/man/ktxtools/man1/toktx.1 build/docs/.gentimestamp
action_ktxtools_gyp_ktxtools_doc_target_buildDoc_outputs := build/docs/html/ktxtools build/docs/man/ktxtools/man1/toktx.1 build/docs/.gentimestamp


### Rules for final target.
# Build our special outputs first.
$(obj).target/ktxtools.doc.stamp: | $(action_ktxtools_gyp_ktxtools_doc_target_buildDoc_outputs)

# Preserve order dependency of special output on deps.
$(action_ktxtools_gyp_ktxtools_doc_target_buildDoc_outputs): | 

$(obj).target/ktxtools.doc.stamp: TOOLSET := $(TOOLSET)
$(obj).target/ktxtools.doc.stamp:  FORCE_DO_CMD
	$(call do_cmd,touch)

all_deps += $(obj).target/ktxtools.doc.stamp
# Add target alias
.PHONY: ktxtools.doc
ktxtools.doc: $(obj).target/ktxtools.doc.stamp

# Add target alias to "all" target.
.PHONY: all
all: ktxtools.doc

