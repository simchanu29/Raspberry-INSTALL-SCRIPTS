#! /bin/sh

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

#    Manual steps
# 1.Setup network connection (Ethernet REQUIRED)
# 2.Move this script on a USB key on the freshly installed raspberry
# 3.Launch this script

# === PART I ===

#    Resize file system with parted
parted /dev/mmcblk0 -s p
parted /dev/mmcblk0 -s rm 2
parted /dev/mmcblk0 -s mkpart p ext4 1 -1
parted /dev/mmcblk0 -s p
# REBOOT REQUIRED

# === PART II ===

resize2fs /dev/mmcblk0p2

#    Init
cd ~/Downloads
mkdir First_install_files
cd First_install_files
apt-get update
export alias agu="sudo apt-get update"
export alias agi="sudo apt-get install"
export alias agyi="sudo apt-get -y install"
export alias acs="sudo apt-cache search"
source ~/.bashrc

#    raspi-config est absent, configuration avec https://wiki.ubuntu.com/ARM/RaspberryPi
#    Install swap partition
# The following packages should be installed : 
# dphys-swapfile
apt-get -y install dphys-swapfile
# REBOOT REQUIRED

# === PART III ===

#    Install wifi drivers
# The following packages should be installed : 
# linux-firmware
apt-get -y install linux-firmware
#REBOOT

# === PART IV ===

#    Install ssh
# The following packages should be installed : 
# ncurses-term openssh-client openssh-sftp-server ssh-import-id
apt-get -y install openssh-server

#    Install LXDE
# LOADS of packages should be installed
agyi lubuntu-desktop
dpkg --configure -a

#    Enable autologin
perl -i -pe 's/.*/autologin=ubuntu/ if $.==3' /etc/lxdm/default.conf

#    nomachine
# The following packages should be installed :
# git git-man liberror-perl
wget http://download.nomachine.com/download/5.1/Linux/nomachine_5.1.62_1_armhf.deb #failed


#    git
# The following packages should be installed :
# git git-man liberror-perl
apt-get -y install  git

#    zsh
# The following packages should be installed : 
# zsh zsh-common
apt-get -y install  zsh
#sudo chsh -s $(which zsh) 
	# Set up zsh as default shell
    # Be careful : you will have trouble to get back your bash console if you uncomment this.

#    Oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	# A password will be needed here since zsh will be launched. 
	# ===== PASSWORD =====
	# I'm not sure how the following will work so be careful.
exit
# Theme and plugin configurations
perl -i -pe 's/.*/ZSH_THEME="agnoster"/ if $.==10' ~/.zshrc
# Fonts
git clone ...
cd fonts
./install.sh
	# To make the agnoster theme properly work you have to change the fonts used by your terminal
	# Droid Sans Mono for Powerline for example

#    Terminator
# The following packages should be installed : 
# libbonobo2-0 libbonobo2-common libbonoboui2-0 libbonoboui2-common libgnome-2-0 libgnome2-0
# libgnome2-bin libgnome2-common libgnomecanvas2-0 libgnomecanvas2-common libgnomeui-0 libgnomeui-common
# libgnomevfs2-0 libgnomevfs2-common libidl-2-0 libkeybinder0 liborbit-2-0 liborbit2 python-gconf
# python-gnome2 python-keybinder python-notify python-pyorbit python-vte terminator
apt-get -y install  terminator 

#    ROS-indigo-desktop
# enable universe and multiverse repositories (not useful for ROS)
#sudo add-apt-repository universe
#sudo add-apt-repository multiverse

update-locale LANG=C LANGUAGE=C LC_ALL=C LC_MESSAGES=POSIX # set local time
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
	# This is only for Ubuntu 14.04 so it might cause some problems
apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
	# add (adress):80 if there is some problems
apt-get update
apt-get -y install  ros-indigo-desktop 
	# test 1 : echoué sur Mate car broken packages.
	# test 2 : échoué sur Ubuntu 16.04 car broken packages
#agyi ros-indigo-ros-base
	# test 1 : échoué sur Ubuntu 16.04 car broken packages
