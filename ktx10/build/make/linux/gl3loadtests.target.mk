# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := gl3loadtests
DEFS_Debug := \
	'-DGL_CONTEXT_PROFILE=SDL_GL_CONTEXT_PROFILE_CORE' \
	'-DGL_CONTEXT_MAJOR_VERSION=3' \
	'-DGL_CONTEXT_MINOR_VERSION=3' \
	'-DDEBUG' \
	'-D_DEBUG'

# Flags passed to all source files.
CFLAGS_Debug := \
	-Og \
	-g

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug :=

INCS_Debug := \
	-I$(srcdir)/tests/loadtests/glloadtests \
	-I$(srcdir)/tests/loadtests/common \
	-I$(srcdir)/tests/loadtests/geom \
	-I$(srcdir)/tests/loadtests/appfwSDL \
	-I$(srcdir)/tests/loadtests/appfwSDL/VulkanAppSDL \
	-I$(srcdir)/other_include \
	-I$(srcdir)/include

DEFS_Release := \
	'-DGL_CONTEXT_PROFILE=SDL_GL_CONTEXT_PROFILE_CORE' \
	'-DGL_CONTEXT_MAJOR_VERSION=3' \
	'-DGL_CONTEXT_MINOR_VERSION=3' \
	'-DNDEBUG'

# Flags passed to all source files.
CFLAGS_Release := \
	-O3

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release :=

INCS_Release := \
	-I$(srcdir)/tests/loadtests/glloadtests \
	-I$(srcdir)/tests/loadtests/common \
	-I$(srcdir)/tests/loadtests/geom \
	-I$(srcdir)/tests/loadtests/appfwSDL \
	-I$(srcdir)/tests/loadtests/appfwSDL/VulkanAppSDL \
	-I$(srcdir)/other_include \
	-I$(srcdir)/include

OBJS := \
	$(obj).target/$(TARGET)/tests/loadtests/common/LoadTestSample.o \
	$(obj).target/$(TARGET)/tests/loadtests/glloadtests/GLLoadTests.o \
	$(obj).target/$(TARGET)/tests/loadtests/glloadtests/shader-based/DrawTexture.o \
	$(obj).target/$(TARGET)/tests/loadtests/glloadtests/shader-based/GL3LoadTests.o \
	$(obj).target/$(TARGET)/tests/loadtests/glloadtests/shader-based/GL3LoadTestSample.o \
	$(obj).target/$(TARGET)/tests/loadtests/glloadtests/shader-based/TextureArray.o \
	$(obj).target/$(TARGET)/tests/loadtests/glloadtests/shader-based/TexturedCube.o \
	$(obj).target/$(TARGET)/tests/loadtests/glloadtests/shader-based/shaders.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/libappfwSDL.a $(builddir)/lib.target/libktx.gl.so $(obj).target/libgl.stamp $(obj).target/testimages.stamp $(obj).target/libsdl.stamp $(obj).target/vulkan_headers.stamp $(obj).target/libktx.gl.so

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-Wl,-rpath,. \
	-g \
	-Wl,-rpath=\$$ORIGIN/lib.target/ \
	-Wl,-rpath-link=\$(builddir)/lib.target/ \
	-L$(srcdir)/other_lib/linux/$(BUILDTYPE)-x64

LDFLAGS_Release := \
	-Wl,-rpath,. \
	-Wl,-rpath=\$$ORIGIN/lib.target/ \
	-Wl,-rpath-link=\$(builddir)/lib.target/ \
	-L$(srcdir)/other_lib/linux/$(BUILDTYPE)-x64

LIBS := \
	-lSDL2-2.0 \
	-lSDL2main \
	-ldl \
	-lpthread \
	-lGL

$(builddir)/gl3loadtests: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(builddir)/gl3loadtests: LIBS := $(LIBS)
$(builddir)/gl3loadtests: LD_INPUTS := $(OBJS) $(obj).target/libappfwSDL.a $(obj).target/libktx.gl.so
$(builddir)/gl3loadtests: TOOLSET := $(TOOLSET)
$(builddir)/gl3loadtests: $(OBJS) $(obj).target/libappfwSDL.a $(obj).target/libktx.gl.so FORCE_DO_CMD
	$(call do_cmd,link)

all_deps += $(builddir)/gl3loadtests
# Add target alias
.PHONY: gl3loadtests
gl3loadtests: $(builddir)/gl3loadtests

# Add executable to "all" target.
.PHONY: all
all: $(builddir)/gl3loadtests
