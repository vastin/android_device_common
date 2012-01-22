# config.mk
#
# Product-specific compile-time definitions.
#

# The generic product target doesn't have any hardware-specific pieces.

TARGET_CPU_ABI := x86
TARGET_ARCH := x86
USE_CAMERA_STUB := false
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_BOOTIMAGE_USE_EXT2 := true

TARGET_USE_DISKINSTALLER := false
TARGET_DISK_LAYOUT_CONFIG := $(SRC_TARGET_DIR)/board/vbox_x86/disk_layout.conf
BOARD_BOOTIMAGE_MAX_SIZE := 8388608
BOARD_SYSLOADER_MAX_SIZE := 7340032
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_USERDATAIMAGE_PARTITION_SIZE := 52428800
BOARD_INSTALLERIMAGE_PARTITION_SIZE := 524288000
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# the following variables could be overridden
TARGET_NO_BOOTLOADER ?= true
TARGET_NO_RECOVERY ?= true
TARGET_PROVIDES_INIT_RC ?= true
TARGET_HAS_THIRD_PARTY_APPS ?= false
TARGET_CPU_SMP ?= true

# Set /system/bin/sh to mksh
TARGET_SHELL := mksh

USE_CUSTOM_RUNTIME_HEAP_MAX ?= "128M"

BOARD_USES_GENERIC_AUDIO ?= false
BOARD_USES_ALSA_AUDIO ?= true
BUILD_WITH_ALSA_UTILS ?= true
BOARD_HAVE_BLUETOOTH ?= true

# This enables the wpa wireless driver
BOARD_WPA_SUPPLICANT_DRIVER ?= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB ?= private_lib_driver_cmd
WPA_SUPPLICANT_VERSION ?= VER_0_8_X
WIFI_DRIVER_MODULE_PATH ?= auto

ifneq ($(strip $(BOARD_GPU_DRIVERS)),)
TARGET_HARDWARE_3D := true
#USE_OPENGL_RENDERER := true
ifeq ($(strip $(BOARD_EGL_CFG)),)
BOARD_EGL_CFG ?= device/common/gpu/egl_mesa.cfg
endif
endif

BOARD_KERNEL_CMDLINE := root=/dev/ram0 androidboot.hardware=$(TARGET_PRODUCT) acpi_sleep=s3_bios,s3_mode $(if $(BOARD_GPU_DRIVERS),,video=-16)

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
WITH_DEXPREOPT := true
endif

# Build OpenGLES emulation host and guest libraries
BUILD_EMULATOR_OPENGL ?= false
