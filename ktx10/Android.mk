LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := ktx

LOCAL_CFLAGS :=  -DKTX_OPENGL_ES2

LOCAL_C_INCLUDES :=     $(LOCAL_PATH)/include/ \
                        $(LOCAL_PATH)//other_include


LOCAL_SRC_FILES := \
    lib/checkheader.c \
	lib/errstr.c \
	lib/etcdec.cxx \
	lib/etcunpack.cxx \
	lib/filestream.c \
	lib/glloader.c \
	lib/hashlist.c \
	lib/hashtable.c \
	lib/memstream.c \
	lib/swap.c \
	lib/texture.c \
	lib/writer.c \
	lib/writer_v1.c



LOCAL_LDLIBS := -lGLESv2 -lEGL -ldl

include $(BUILD_STATIC_LIBRARY)


include 
