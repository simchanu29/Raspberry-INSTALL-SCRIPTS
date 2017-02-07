#!/usr/bin/env bash

#    Resize file system with parted
parted /dev/mmcblk0 -s p
parted /dev/mmcblk0 -s rm 2
parted /dev/mmcblk0 -s mkpart p ext4 1 -1
parted /dev/mmcblk0 -s p
# REBOOT REQUIRED