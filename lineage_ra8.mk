#
# Copyright (C) 2018 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/tecno/ra8

$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_ra8
PRODUCT_DEVICE := ra8
PRODUCT_BRAND := Orange
PRODUCT_MODEL := RA8
PRODUCT_MANUFACTURER := TECNO

PRODUCT_GMS_CLIENTID_BASE := android-ra8
PRODUCT_LOCALES := en_GB,en_US
PRODUCT_CHARACTERISTICS := nosdcard
TARGET_VENDOR := tecno
TARGET_VENDOR_PRODUCT_NAME := ra8
