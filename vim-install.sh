#!/bin/bash

# usage: sudo ./vim-install.sh <path/to/vim>
# must be run with elevated privileges to install correctly
# see https://vim.org/git.php
# if you run into package errors, you may have to examine /etc/aptsources.list
# ensure deb-src lines are not commented out
apt update
apt build-dep vim
cd $1/src
git pull
make distclean
./configure --enable-gui=gtk3
make
make install

