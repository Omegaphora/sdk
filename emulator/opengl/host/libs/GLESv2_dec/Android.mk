LOCAL_PATH := $(call my-dir)

host_common_debug_CFLAGS :=

#For gl debbuging
#host_common_debug_CFLAGS += -DCHECK_GL_ERROR
#host_common_debug_CFLAGS += -DDEBUG_PRINTOUT


### host library ##########################################
$(call emugl-begin-host-static-library,libGLESv2_dec)
$(call emugl-import, libOpenglCodecCommon libOpenglOsUtils)
$(call emugl-gen-decoder,$(LOCAL_PATH),gl2)

# For gl2_types.h !
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))

$(call emugl-export,CFLAGS,$(host_common_debug_CFLAGS))

LOCAL_SRC_FILES := GL2Decoder.cpp

$(call emugl-end-module)

### host library, 64-bit ####################################
ifdef EMUGL_BUILD_64BITS
    $(call emugl-begin-host64-static-library,lib64GLESv2_dec)
    $(call emugl-import, lib64OpenglCodecCommon lib64OpenglOsUtils)
    $(call emugl-gen-decoder,$(LOCAL_PATH),gl2)

    # For gl2_types.h !
    $(call emugl-export,C_INCLUDES,$(LOCAL_PATH))

    $(call emugl-export,CFLAGS,$(host_common_debug_CFLAGS) -m64)

    LOCAL_SRC_FILES := GL2Decoder.cpp

    $(call emugl-end-module)
endif