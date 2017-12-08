#!/bin/bash

# setup.sh Jeff W. Doak jeff.w.doak@gmail.com

# Script to initialize my settings on a new server.

me=`whoami`

# initialize directories
if [ ! -e ~/src ]
then
  mkdir ~/src
fi
if [ ! -e ~/bin ]
then
  mkdir ~/bin
fi

# solarized color scheme
git clone https://github.com/seebi/dircolors-solarized.git ~/src/dircolors-solarized/
ln -s ~/src/dircolors-solarized/dircolors.256dark ~/.dircolors

# setup bashrc
cp ~/.bashrc ~/.bashrc_`date +%F`  # keep copy of old bashrc
cp bashrc ~/.bashrc

# setup vim
cp -r vim ~/.vim
cp ~/.vimrc ~/.vimrc_`date +%F`  # keep copy of old vimrc
cp vim/vimrc ~/.vimrc

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim



