#!/usr/bin/env bash

# Install script for arm7 systems on ubuntu mate 16.04

# It should be ok as well for other iterations of ubuntu
# In our case the best should be to use archlinux and add later a x server or use Lubuntu for ARM
# RUN the script wit sudo !

# ENSTA Bretagne : see http://www.ensta-bretagne.fr/lebars/Share/Ubuntu.txt
# modify and reboot

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
    rm /etc/init.d/mystartup.sh
    rm ~/Downloads/reboot-check
    mkdir ~/Downloads
    touch ~/Downloads/reboot-check
    echo "0" > ~/Downloads/reboot-check
    echo "[INFO] reboot-check created"

    touch /etc/init.d/mystartup.sh
    chmod 755 /etc/init.d/mystartup.sh
    echo "#!/bin/bash" >> /etc/init.d/mystartup.sh
    echo "echo “Setting up customized environment…”" >> /etc/init.d/mystartup.sh
    echo "bash ~/home/ubuntu/Raspberry-INSTALL-SCRIPTS/INSTALL-ALL-P12-Ubuntu14.04.2.sh"

    chmod +x /etc/init.d/mystartup.sh
    update-rc.d mystartup.sh defaults 100

    apt-get -y update
    apt-get -y upgrade

    echo "[INFO] startup script configured"
    echo "[INFO] init done"
}

reboot() {
   NUM=`cat ~/Downloads/reboot-check`
   NUM=`expr ${NUM} + 1`
   echo ${NUM} > ~/Downloads/reboot-check

   echo "[INFO] Reboot number"$NUM
   shutdown -r now
   echo "[INFO] Rebooting"
}

clean() {
   rm /etc/init.d/mystartup.sh
   rm ~/Downloads/reboot-check
   sed -i '$ d' ~/.basrc
}

#    Manual steps
# 1.Setup network connection (Ethernet REQUIRED)
# 2.Move these scripts on a USB key on the freshly installed raspberry
# 3.Launch this script

export REBOOTCHECK="0"
echo "REBOOT : "$REBOOTCHECK
# === INIT ===
# Create reboot check file and startup script
if [ $REBOOTCHECK = "0" ]; then
    init
    export REBOOTCHECK=`cat ~/Downloads/reboot-check`
    echo "REBOOT : "$REBOOTCHECK
    reboot
fi

# === PART I ===
if [ $REBOOTCHECK = "1" ]; then
    echo "INSTAL SCRIPT PART "$REBOOTCHECK
    #    Resize file system with parted
    bash Part-I-Resize_filesystem.sh
    # REBOOT REQUIRED
    reboot
fi

# === PART II ===

if [ $REBOOTCHECK = "2" ]; then
    echo "INSTAL SCRIPT PART "$REBOOTCHECK
    bash Part-II-Configure_bash_and_swap.sh
    # REBOOT REQUIRED
    reboot
fi

# === PART III ===

if [$REBOOTCHECK == "3"]; then
    echo "INSTAL SCRIPT PART "$REBOOTCHECK
    #    Install wifi drivers
    bash Part-III-Wifi_drivers.sh
    #REBOOT ?
    reboot
fi

# === PART IV ===

if [ $REBOOTCHECK = "4" ]; then
    echo "INSTAL SCRIPT PART "$REBOOTCHECK
    #    Main installation
    bash Part-IV.sh

    clean
fi
