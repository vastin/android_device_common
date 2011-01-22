#
# Copyright (C) 2011 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

LOCAL_KEYMAPS_DIR := device/common/keymaps
LOCAL_KEYMAPS     := $(if $(PRODUCT_KEYMAPS),$(PRODUCT_KEYMAPS),$(wildcard $(LOCAL_KEYMAPS_DIR)/*.kcm))

PRODUCT_PACKAGES  := $(notdir $(LOCAL_KEYMAPS))
