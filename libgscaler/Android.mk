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

ifeq ($(filter-out exynos3,$(TARGET_BOARD_PLATFORM)),)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CLANG_CFLAGS += -Wno-int-conversion

LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libexynosutils libexynosv4l2

# to talk to secure side
LOCAL_SHARED_LIBRARIES += libMcClient
LOCAL_STATIC_LIBRARIES := libsecurepath

LOCAL_C_INCLUDES := \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include \
	$(LOCAL_PATH)/../include \
	$(LOCAL_PATH)/../libexynosutils

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

LOCAL_SRC_FILES := exynos_gscaler.c

LOCAL_CFLAGS += -Wno-format
LOCAL_CFLAGS += -Wno-unused-parameter
LOCAL_CFLAGS += -Wno-unused-variable

LOCAL_MODULE := libexynosgscaler
include $(BUILD_SHARED_LIBRARY)

endif
