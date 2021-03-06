#!/usr/bin/env bash

resize2fs /dev/mmcblk0p2

#    Init
cd
mkdir ~/Downloads
mkdir ~/Programs
cd ~/Downloads
mkdir First_install_files
cd First_install_files
apt-get update
echo 'alias agu="sudo apt-get update"' >> ~/.bashrc
echo 'alias agi="sudo apt-get install"' >> ~/.bashrc
echo 'alias agyi="sudo apt-get -y install"' >> ~/.bashrc
echo 'alias acs="sudo apt-cache search"' >> ~/.bashrc
source ~/.bashrc

#    raspi-config est absent, configuration avec https://wiki.ubuntu.com/ARM/RaspberryPi
#    Install swap partition
# The following packages should be installed :
# dphys-swapfile
apt-get -y install dphys-swapfile
# Si il y a des problèmes utiliser dphys-swapfile uninstall puis dphys-swapfile setup
# Si il y a un problème c'est que le système de fichier n'a pas été redimensionné