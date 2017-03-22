#!/usr/bin/env bash

# \n is used prevent multiple echo
echo "p" && echo "d" && echo "2" && echo "n" && echo "p" && echo "2" && echo " " && echo " " && echo "p" && echo "w" && echo "q" | fdisk /dev/mmcblk0
#   p # print
#   d # delete partition
#   2 # partition number 2
#   n # new partition
#   p # primary partition
#   2 # partition number 2
#    # default
#    # default
#   p # print
#   w # write changes
#   q # quit

# REBOOT REQUIRED