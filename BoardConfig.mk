#
# Copyright (C) 2019 The LineageOS Project
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
#

DEVICE_PATH := device/tecno/ra8

BOARD_VENDOR := tecno

# Assert
TARGET_OTA_ASSERT_DEVICE := n11,ra8

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_VARIANT_RUNTIME := cortex-a15

#TARGET_2ND_ARCH := arm64
#TARGET_2ND_ARCH_VARIANT := armv8-2a
#TARGET_2ND_CPU_ABI := arm64-v8a
#TARGET_2ND_CPU_ABI2 := 
#TARGET_2ND_CPU_VARIANT := generic
#TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := CY-RA8-H613-U
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE						:= 0x40000000
BOARD_KERNEL_OFFSET						:= 0x00080000
BOARD_RAMDISK_OFFSET					:= 0x11b00000
BOARD_RAMDISK_SECOND_OFFSET				:= 0x00f00000
BOARD_DTB_OFFSET						:= 0x01000000
BOARD_TAGS_OFFSET						:= 0x07880000
BOARD_KERNEL_CMDLINE					:= bootopt=64S3,32S1,32S1
BOARD_KERNEL_PAGESIZE 					:= 2048
BOARD_KERNEL_IMAGE_NAME					:= zImage
TARGET_KERNEL_ARCH						:= arm
TARGET_KERNEL_CONFIG					:= ra8_defconfig
TARGET_KERNEL_SOURCE					:= kernel/tecno/ra8
BOARD_BOOTIMG_HEADER_VERSION			:= 1
BOARD_INCLUDE_RECOVERY_DTBO				:= true
BOARD_PREBUILT_DTBOIMAGE				:= $(DEVICE_PATH)/prebuilt/recovery_dtbo
BOARD_PREBUILT_DTIMAGE					:= $(DEVICE_PATH)/prebuilt/dt.img
HAS_PREBUILT_KERNEL						:= true
ifeq ($(HAS_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL					:= $(DEVICE_PATH)/prebuilt/kernel
NEEDS_KERNEL_COPY						:= true
else
TARGET_BOARD_KERNEL_HEADERS				+= \
	$(LOCAL_PATH)/kernel-headers \
	device/mediatek/common/kernel-headers
			
#ifeq ($(TARGET_PREBUILT_KERNEL),)
#TARGET_KERNEL_CLANG_COMPILE				:= true
endif

BOARD_MKBOOTIMG_ARGS					:= \
	--cmdline $(BOARD_KERNEL_CMDLINE) \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--second_offset $(BOARD_RAMDISK_SECOND_OFFSET) \
	--tags_offset $(BOARD_TAGS_OFFSET) \
	--board $(TARGET_BOOTLOADER_BOARD_NAME) \
	--dt $(BOARD_PREBUILT_DTIMAGE)
	#--header_version $(BOARD_BOOTIMG_HEADER_VERSION) \
	#--dtb_offset $(BOARD_DTB_OFFSET) \

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Audio
AUDIO_FEATURE_ENABLED_AAC_ADTS_OFFLOAD := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_HDMI_SPK := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
TARGET_PROVIDES_AUDIO_EXTNS := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth/include
BOARD_HAVE_BLUETOOTH_MTK := true

# Camera
TARGET_FACE_UNLOCK_CAMERA_ID := 5

# Charger Mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Display
TARGET_HAS_WIDE_COLOR_DISPLAY := true

# Dex
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT ?= true
  endif
endif
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= true

# DRM
#TARGET_ENABLE_MEDIADRM_64 := true

# Graphics
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

# General
BOARD_CHARGER_SHOW_PERCENTAGE := true
ALLOW_MISSING_DEPENDENCIES := true
LLVM_ENABLE_THREADS := 1
ALLOW_ADBD_NO_AUTH := true
#PRODUCT_ADB_KEYS := $(DEVICE_PATH)/configs/adbkey

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/compatibility_matrix.xml

# Mediatek
TARGET_BOARD_PLATFORM := mt6761
TARGET_BOARD_PLATFORM_GPU := IMGPowerVR
MTK_PLATFORM							:= mt6761
MTK_PROJECT								:= ra8s_h613
MTK_TARGET_PROJECT						:= $(MTK_PROJECT)
MTK_PROJECT_NAME						:= trans_ra8

# Partitions
BOARD_BUILD_SYSTEM_ROOT_IMAGE			:= true
BOARD_FLASH_BLOCK_SIZE					:= 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_USES_METADATA_PARTITION			:= true
BOARD_USES_PRODUCTIMAGE					:= false
BOARD_USES_VENDORIMAGE					:= true
TARGET_COPY_OUT_VENDOR					:= vendor
TARGET_FS_CONFIG_GEN					:= $(DEVICE_PATH)/config.fs

# sizes
BOARD_BOOTIMAGE_PARTITION_SIZE			:= 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE			:= 209715200
BOARD_DTBOIMG_PARTITION_SIZE			:= 8388608
BOARD_OEMIMAGE_PARTITION_SIZE			:= 352321536
BOARD_RECOVERYIMAGE_PARTITION_SIZE		:= 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE		:= 2875195392
BOARD_USERDATAIMAGE_PARTITION_SIZE		:= 11270077952
BOARD_VBMETAIMAGE_PARTITION_SIZE		:= 10485760
BOARD_VENDORIMAGE_PARTITION_SIZE		:= 402653184

# filesystems
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE		:= ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE		:= ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE		:= ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE	:= f2fs
TARGET_USERIMAGES_USE_EXT4				:= true
TARGET_USERIMAGES_USE_F2FS				:= true
#TARGET_USERIMAGES_SPARSE_EXT_DISABLED	:= true
TARGET_USES_MKE2FS						:= true

# Properties
TARGET_DEFAULT_PROP := $(DEVICE_PATH)/configs/default.prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/configs/system.prop
TARGET_VENDOR_PROP := $(DEVICE_PATH)/configs/vendor.prop
TARGET_PRODUCT_PROP := $(DEVICE_PATH)/configs/product.prop

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO				:= true
BOARD_USES_RECOVERY_AS_BOOT				:= true
TARGET_RECOVERY_FSTAB 					:= $(DEVICE_PATH)/rootdir/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT			:= "BGRA_8888"
#RECOVERY_VARIANT						:= twrp

# TWRP
ifeq ($(RECOVERY_VARIANT),twrp)
	RECOVERY_GRAPHICS_USE_LINELENGTH := true
	RECOVERY_SDCARD_ON_DATA := true
	TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/twrp.fstab
	TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
	TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data=ordered"
	TW_CRYPTO_FS_TYPE := "f2fs"
	TW_MAX_BRIGHTNESS := 255
	TW_MIN_BRIGHTNESS := 75
	TW_CRYPTO_MNT_POINT := "/data"
	TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/bootdevice/by-name/userdata"
	TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
	TW_EXCLUDE_SUPERSU := true
	TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
	TW_EXTERNAL_STORAGE_PATH := "/external_sd"
	TW_INCLUDE_CRYPTO := true
	TW_INCLUDE_FB2PNG := true
	TW_INTERNAL_STORAGE_MOUNT_POINT := "emmc"
	TW_INTERNAL_STORAGE_PATH := "/emmc"
	TW_THEME := portrait_hdpi
	TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
	TW_USE_TOOLBOX := true
endif

# Releasetools
#TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater
#TARGET_RELEASETOOLS_EXTENSIONS := $(COMMON_PATH)

# RenderScript
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Treble
DEVICE_FRAMEWORK_MANIFEST_FILE += $(DEVICE_PATH)/configs/framework_manifest.xml
BOARD_VNDK_VERSION := current

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA512_RSA4096
BOARD_AVB_KEY_PATH := $(DEVICE_PATH)/configs/rsa_key_4096bits.pem
#BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 2

# WiFi
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_HOSTAPD_DRIVER := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WPA_SUPPLICANT_VERSION := VER_0_8_X
