#!/usr/bin/env bash

#    Install LXDE
# LOADS of packages should be installed
apt-get -y install lubuntu-desktop
dpkg --configure -a

#    Enable autologin
# Or /etc/lightdm/lightdm.conf
perl -i -pe 's/.*/autologin=ubuntu/ if $.==3' /etc/lxdm/default.conf