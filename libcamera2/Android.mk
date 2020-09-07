
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CLANG_CFLAGS += -Wno-c++11-narrowing

# HAL module implemenation stored in
# hw/<COPYPIX_HARDWARE_MODULE_ID>.<ro.product.board>.so

LOCAL_C_INCLUDES += \
	hardware/samsung_slsi-cm/exynos3470/include \
	frameworks/native/include \
        frameworks/native/libs/arect/include \
        frameworks/native/libs/nativebase/include \
        system/libhidl/transport/token/1.0/utils/include \
	system/media/camera/include

LOCAL_SRC_FILES := \
	SignalDrivenThread.cpp \
	MetadataConverter.cpp \
	ExynosCameraHWInterface2.cpp \
	ExynosCamera2.cpp \
	ExynosJpegEncoderForCamera.cpp


LOCAL_SHARED_LIBRARIES := libutils libcutils libbinder liblog libcamera_client libhardware

LOCAL_CFLAGS += -DGAIA_FW_BETA
LOCAL_CFLAGS += -Wno-unused-parameter

LOCAL_SHARED_LIBRARIES += libexynosutils libhwjpeg libexynosv4l2 libcsc libion_exynos libcamera_metadata

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

LOCAL_MODULE := camera.exynos.universal3470

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS      := optional
LOCAL_PROPRIETARY_MODULE := true

include $(BUILD_SHARED_LIBRARY)
