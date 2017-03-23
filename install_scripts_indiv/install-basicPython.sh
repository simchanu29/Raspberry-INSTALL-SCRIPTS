#!/usr/bin/env bash

#apt-get -y upgrade python-pip
# Il est possible de devoir réinstaller pip si ça marche pas :
#sudo apt-get purge -y python-pip
#wget https://bootstrap.pypa.io/get-pip.py
#sudo python ./get-pip.py
#sudo apt-get install python-pip

pip install numpy
apt-get -y install ipython3