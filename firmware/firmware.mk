#
# Copyright (C) 2009-2011 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

LOCAL_FIRMWARES_DIR ?= $(call my-dir)
LOCAL_PATH := $(LOCAL_FIRMWARES_DIR)
LOCAL_FIRMWARES ?= $(filter-out firmware.mk,$(subst $(LOCAL_PATH)/,,$(shell find $(LOCAL_PATH) -type f)))

PRODUCT_COPY_FILES += $(foreach f,$(LOCAL_FIRMWARES),$(LOCAL_PATH)/$(f):system/lib/firmware/$(f))
