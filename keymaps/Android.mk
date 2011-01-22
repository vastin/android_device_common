#
# Copyright (C) 2009-2011 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#

define include-keymap

keymap := $$(notdir $$(basename $(1)))

ifneq ($$(filter $$(keymap).kcm,$$(PRODUCTS.$$(INTERNAL_PRODUCT).PRODUCT_PACKAGES)),)

include $$(CLEAR_VARS)
LOCAL_SRC_FILES := $$(keymap).kcm
LOCAL_MODULE_TAGS := optional
include $$(BUILD_KEY_CHAR_MAP)

PRODUCT_COPY_FILES += $$(basename $(1)).kl:system/usr/keylayout/$$(keymap).kl

endif

endef

define add-keymap
$(eval $(include-keymap))
endef

define add-keymaps
$(foreach f,$(1),$(call add-keymap,$(f)))
endef

LOCAL_PATH := $(call my-dir)

$(call add-keymaps,$(LOCAL_KEYMAPS))
