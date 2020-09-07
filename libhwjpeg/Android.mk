# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	hardware/samsung_slsi-cm/exynos3470/include

LOCAL_SRC_FILES := \
	ExynosJpegBase.cpp \
	ExynosJpegEncoder.cpp \
	ExynosJpegDecoder.cpp \
        ExynosJpegBase_Dependence.cpp

LOCAL_SHARED_LIBRARIES :=    \
	libcutils	\
	libion_exynos \
        liblog \
        libexynosutils

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

LOCAL_CFLAGS += -Wno-null-pointer-arithmetic

LOCAL_MODULE := libhwjpeg

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
