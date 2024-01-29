#!/system/bin/sh

# TODO: This postrecoveryboot shell script is needed for devices that have recovery-from-boot.p file in /vendor instead of /system, to prevent the stock ROM from replacing TWRP.
# By default, TWRP has an automatic feature for this, only if recovery-from-boot.p is in /system.
# For EROFS devices, it might not work.

# Android 12+

# Target Partition
TARGET_PARTITION="vendor"

# Define Temporary Directory
TMP_VENDOR="/tmp/$TARGET_PARTITION"

# Create Temporary Directory
mkdir -p "$TMP_VENDOR"

# Function for mounting with write permission
mount_with_write_perm() {
  echo "I:postrecoveryboot: Mounting $TARGET_PARTITION with write permission to $TMP_VENDOR..." >> /tmp/recovery.log
  mount -w "/dev/block/mapper/$TARGET_PARTITION" "$TMP_VENDOR"
}

# Function to remove stock recovery files
remove_stock_recovery_files() {
  echo "I:postrecoveryboot: Removing stock recovery files in /vendor to prevent the stock ROM from replacing TWRP..." >> /tmp/recovery.log
  sleep 1
  rm "$TMP_VENDOR/bin/install-recovery.sh" \
     "$TMP_VENDOR/etc/init/vendor_flash_recovery.rc" \
     "$TMP_VENDOR/recovery-from-boot.p"
}

# Run mount_with_write_perm()
mount_with_write_perm

# Run the function
if [ -f "$TMP_VENDOR/recovery-from-boot.p" ]; then
  remove_stock_recovery_files
else
  echo "I:postrecoveryboot: Skipping the process, $TMP_VENDOR/recovery-from-boot.p doesn't exist." >> /tmp/recovery.log
fi

umount "$TMP_VENDOR"
rm -r "$TMP_VENDOR"

exit 0
