#!/bin/bash

# setup.sh Jeff W. Doak jeff.w.doak@gmail.com

# Script to initialize my settings on a new server.

me=`whoami`
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# initialize directories
echo ""
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
if [ -e ~/.bashrc ]
then
  cp ~/.bashrc ~/.bashrc_`date +%F`  # keep copy of old bashrc
fi
cp $script_dir/bashrc ~/.bashrc

# setup vim
if [ -e ~/.vimrc ]
then
cp ~/.vimrc ~/.vimrc_`date +%F`  # keep copy of old vimrc
fi
cp -r $script_dir/vim ~/.vim
mv ~/.vim/vimrc ~/.vimrc

# install vundle
echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall



