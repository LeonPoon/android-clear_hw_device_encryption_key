MY_LOCAL_LDLIBS := -llog -ldl -landroid
MY_LOCAL_STATIC_LIBRARIES = libvold
MY_SHARED_LIBRARIES = libcryptfs_hw


LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := mymod-common

LOCAL_SRC_FILES := \
  mymod.cpp
LOCAL_HEADER_LIBRARIES := libhardware_headers
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

# Enable PIE manually. Will get reset on $(CLEAR_VARS). This
# is what enabling PIE translates to behind the scenes.
LOCAL_CFLAGS += -fPIE
LOCAL_LDFLAGS += -fPIE -pie

LOCAL_MODULE := mymod
LOCAL_LDLIBS := $(MY_LOCAL_LDLIBS)
LOCAL_SHARED_LIBRARIES += $(MY_SHARED_LIBRARIES)
LOCAL_STATIC_LIBRARIES := mymod-common $(MY_LOCAL_STATIC_LIBRARIES)

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := mymod-nopie
LOCAL_LDLIBS := $(MY_LOCAL_LDLIBS)
LOCAL_SHARED_LIBRARIES += $(MY_SHARED_LIBRARIES)
LOCAL_STATIC_LIBRARIES := mymod-common $(MY_LOCAL_STATIC_LIBRARIES)

include $(BUILD_EXECUTABLE)
