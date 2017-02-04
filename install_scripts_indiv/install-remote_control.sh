#!/usr/bin/env bash

#    Install ssh
# The following packages should be installed :
# ncurses-term openssh-client openssh-sftp-server ssh-import-id
apt-get -y install openssh-server

#    nomachine
# The following packages should be installed :
# git git-man liberror-perl
wget http://download.nomachine.com/download/5.1/Linux/nomachine_5.1.62_1_armhf.deb
dpkg -i nomachine_5.1.62_1_armhf.deb
