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

REBOOTCHECK=`cat ~/Downloads/reboot-check`

init() {
    touch ~/Downloads/reboot-check
    echo "0" > ~/Downloads/reboot-check

    touch /etc/init.d/mystartup.sh
    echo "#!/bin/bash" >> /etc/init.d/mystartup.sh
    echo "echo “Setting up customized environment…”" >> /etc/init.d/mystartup.sh
    echo "bash ~/home/ubuntu/Raspberry-INSTALL-SCRIPTS/INSTALL-ALL-P12-Ubuntu14.04.2.sh"

    chmod +x /etc/init.d/mystartup.sh
    update-rc.d mystartup.sh defaults 100
}

reboot() {
   NUM=`cat ~/Downloads/reboot-check`
   NUM=`expr ${NUM} + 1`
   echo ${NUM} > ~/Downloads/reboot-check
   reboot now
}

clean() {
   rm /etc/init.d/mystartup.sh
   rm ~/Downloads/reboot-check
}



#    Manual steps
# 1.Setup network connection (Ethernet REQUIRED)
# 2.Move these scripts on a USB key on the freshly installed raspberry
# 3.Launch this script



# === INIT ===
# Create reboot check file and startup script
init
reboot

# === PART I ===
if REBOOTCHECK=="1"
 then
    #    Resize file system with parted
    bash Part-I-Resize_filesystem.sh
    # REBOOT REQUIRED
    reboot
fi

# === PART II ===

if REBOOTCHECK=="2"
 then
    bash Part-II-Configure_bash_and_swap.sh
    # REBOOT REQUIRED
    reboot
fi

# === PART III ===

if REBOOTCHECK=="3"
 then
    #    Install wifi drivers
    bash Part-III-Wifi_drivers.sh
    #REBOOT ?
    reboot
fi

# === PART IV ===

if REBOOTCHECK=="4"
 then
    #    Main installation
    bash Part-IV.sh
fi

# === END ===
# Remove the script from initrd
clean