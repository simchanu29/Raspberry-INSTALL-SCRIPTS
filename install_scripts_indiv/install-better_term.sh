#!/usr/bin/env bash

#    git
# The following packages should be installed :
# git git-man liberror-perl
apt-get -y install  git

#    aptitude
# The following packages should be installed :
# aptitude
apt-get -y install aptitude

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