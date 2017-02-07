#!/usr/bin/env bash

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
    # test 3 : réussi sur Ubuntu 14.04
#agyi ros-indigo-ros-base
	# test 1 : échoué sur Ubuntu 16.04 car broken packages

# Initialize Rosdep
apt-get -y install python-rosdep
rosdep init
rosdep update

# Environement setup
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "source /opt/ros/indigo/setup.zsh" >> ~/.zshrc
source ~/.zshrc

apt-get -y install python-rosinstall

