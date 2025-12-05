#!/usr/bin/env bash

# Get the currently running kernel version
RUNNING_KERNEL=$(uname -r)

# Find the highest installed kernel version
# This assumes kernel images are named vmlinuz-<version> in /boot
# and uses 'sort -V' for proper version sorting.
HIGHEST_INSTALLED_KERNEL=$(find /boot/vmlinuz-* -type f | sort -V | tail -n 1 | sed 's|.*vmlinuz-||')

reboot_needed=0;
if [ "$RUNNING_KERNEL" = "$HIGHEST_INSTALLED_KERNEL" ]; then
        message="The running kernel is the latest installed kernel."
else
        message="The running kernel is NOT the latest installed kernel. A reboot may be required."
        reboot_needed=1;
fi;

# print result as JSON
printf '{"RunningKernel":"%s","LatestKernel":"%s","Message":"%s","RebootNeeded":%d}\n' "$RUNNING_KERNEL" "$HIGHEST_INSTALLED_KERNEL" "$message" $reboot_needed;
exit $reboot_needed;

# __END__
