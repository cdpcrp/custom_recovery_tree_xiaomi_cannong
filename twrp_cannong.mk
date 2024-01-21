#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's twrp device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from cannong device
$(call inherit-product, device/xiaomi/cannong/device.mk)

PRODUCT_DEVICE := cannong
PRODUCT_NAME := twrp_cannong
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 9T
PRODUCT_MANUFACTURER := xiaomi