#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's twrp device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_cannong.mk

COMMON_LUNCH_CHOICES := \
    twrp_cannong-user \
    twrp_cannong-userdebug \
    twrp_cannong-eng
