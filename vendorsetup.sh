#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's twrp device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

#
# OrangeFox Vars
#
FDEVICE="cannong"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

    export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1

    # Maintaining Info
    export OF_MAINTAINER=Crypton
    export FOX_VERSION=$(date +%y.%m.%d)
    export FOX_BUILD_TYPE=Unofficial

    # Device
    export FOX_VARIANT="A12"
    export FOX_ARCH=arm64

    # Funtions
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1

    # Removed LED Support
    export OF_USE_GREEN_LED=0

    # Display Settings
    export OF_SCREEN_H=2340
    export OF_STATUS_H=120
    export OF_STATUS_INDENT_LEFT=150
    export OF_STATUS_INDENT_RIGHT=20
    export OF_HIDE_NOTCH=1
    export OF_CLOCK_POS=1
    export OF_ALLOW_DISABLE_NAVBAR=0

    # Device Codename (Redmi Note 9T)
    export TARGET_DEVICE_ALT="cannon,cannong"

    # Patch
    export OF_FORCE_MAGISKBOOT_BOOT_PATCH_MIUI=1
    export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
    export OF_OTA_RES_DECRYPT=1
    export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=1
    export OF_NO_RELOAD_AFTER_DECRYPTION=1
    export FOX_BUGGED_AOSP_ARB_WORKAROUND="1546300800"; # Tuesday, January 1, 2019 12:00:00 AM GMT+00:00
    export OF_FBE_METADATA_MOUNT_IGNORE=1
    export OF_PATCH_AVB20=1
    export OF_NO_SPLASH_CHANGE=1
    export OF_DEFAULT_KEYMASTER_VERSION=4.1

# let's see what are our build VARs
    if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
        export | grep "FOX" >> $FOX_BUILD_LOG_FILE
        export | grep "OF_" >> $FOX_BUILD_LOG_FILE
        export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
        export | grep "TW_" >> $FOX_BUILD_LOG_FILE
    fi
fi
#
