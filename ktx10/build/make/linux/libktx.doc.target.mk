# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := libktx.doc
### Rules for action "buildDoc":
quiet_cmd_libktx_gyp_libktx_doc_target_buildDoc = ACTION Generating documentation with Doxygen $@
cmd_libktx_gyp_libktx_doc_target_buildDoc = LD_LIBRARY_PATH=$(builddir)/lib.host:$(builddir)/lib.target:$$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd $(srcdir)/.; mkdir -p build/docs/html build/docs/man; ./runDoxygen -t build/docs/.gentimestamp libktx.doxy

build/docs/html/libktx: obj := $(abs_obj)
build/docs/html/libktx: builddir := $(abs_builddir)
build/docs/html/libktx: TOOLSET := $(TOOLSET)
build/docs/html/libktx build/docs/man/libktx: libktx_gyp_libktx_doc_target_buildDoc.intermediate
	@:
.INTERMEDIATE: libktx_gyp_libktx_doc_target_buildDoc.intermediate
libktx_gyp_libktx_doc_target_buildDoc.intermediate: $(srcdir)/libktx.doxy $(srcdir)/runDoxygen $(srcdir)/lib/mainpage.md $(srcdir)/LICENSE.md $(srcdir)/TODO.md $(srcdir)/include/ktx.h $(srcdir)/lib/checkheader.c $(srcdir)/lib/errstr.c $(srcdir)/lib/etcdec.cxx $(srcdir)/lib/etcunpack.cxx $(srcdir)/lib/filestream.c $(srcdir)/lib/filestream.h $(srcdir)/lib/gl_format.h $(srcdir)/lib/gl_funcptrs.h $(srcdir)/lib/gles1_funcptrs.h $(srcdir)/lib/gles2_funcptrs.h $(srcdir)/lib/gles3_funcptrs.h $(srcdir)/lib/glloader.c $(srcdir)/lib/hashlist.c $(srcdir)/lib/hashtable.c $(srcdir)/lib/ktxint.h $(srcdir)/lib/memstream.c $(srcdir)/lib/memstream.h $(srcdir)/lib/stream.h $(srcdir)/lib/swap.c $(srcdir)/lib/texture.c $(srcdir)/lib/uthash.h $(srcdir)/lib/writer.c $(srcdir)/lib/writer_v1.c $(srcdir)/include/ktxvulkan.h $(srcdir)/lib/vk_format.h $(srcdir)/lib/vkloader.c FORCE_DO_CMD
	$(call do_cmd,touch)
	$(call do_cmd,libktx_gyp_libktx_doc_target_buildDoc)

all_deps += build/docs/html/libktx build/docs/man/libktx
action_libktx_gyp_libktx_doc_target_buildDoc_outputs := build/docs/html/libktx build/docs/man/libktx


### Rules for final target.
# Build our special outputs first.
$(obj).target/libktx.doc.stamp: | $(action_libktx_gyp_libktx_doc_target_buildDoc_outputs)

# Preserve order dependency of special output on deps.
$(action_libktx_gyp_libktx_doc_target_buildDoc_outputs): | 

$(obj).target/libktx.doc.stamp: TOOLSET := $(TOOLSET)
$(obj).target/libktx.doc.stamp:  FORCE_DO_CMD
	$(call do_cmd,touch)

all_deps += $(obj).target/libktx.doc.stamp
# Add target alias
.PHONY: libktx.doc
libktx.doc: $(obj).target/libktx.doc.stamp
