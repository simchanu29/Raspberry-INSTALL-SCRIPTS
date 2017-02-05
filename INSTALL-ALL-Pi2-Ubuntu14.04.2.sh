#!/usr/bin/env bash

# Install script for arm7 systems on ubuntu mate 16.04

# It should be ok as well for other iterations of ubuntu
# In our case the best should be to use archlinux and add later a x server or use Lubuntu for ARM
# RUN the script wit sudo !

# Installed by this script  :
# - parted
# REBOOT
# - git
# - nomachine
# - zsh
# - oh-my-zsh
# - opencv3
# - ROS Indigo
# - terminator
# - LXDE desktop

init() {
    touch ~/Downloads/reboot-check
    echo "0" > ~/Downloads/reboot-check
}
reboot() {
   NUM=`cat ~/Downloads/reboot-check`
   NUM=`expr ${NUM} + 1`
   echo ${NUM} > ~/Downloads/reboot-check
   reboot now
}

clean() {
   rm
}
#    Manual steps
# 1.Setup network connection (Ethernet REQUIRED)
# 2.Move these scripts on a USB key on the freshly installed raspberry
# 3.Launch this script

# === INIT ===
# Create reboot check file
init

# === PART I ===

#    Resize file system with parted
bash Part-I-Resize_filesystem.sh
# REBOOT REQUIRED

# === PART II ===

bash Part-II-Configure_bash_and_swap.sh
# REBOOT REQUIRED

# === PART III ===

#    Install wifi drivers
bash Part-III-Wifi_drivers.sh
#REBOOT ?

# === PART IV ===
# Main installation

bash Part-IV.sh

# === END ===
# Remove the script from initrd
clean