#!/usr/bin/env bash

#    Install LXDE
# LOADS of packages should be installed
agyi lubuntu-desktop
dpkg --configure -a

#    Enable autologin
perl -i -pe 's/.*/autologin=ubuntu/ if $.==3' /etc/lxdm/default.conf