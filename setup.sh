#!/bin/bash

# setup.sh Jeff W. Doak jeff.w.doak@gmail.com

# Script to initialize my settings on a new server.

safe_copy_file(){
  # copy a file and create time-stamped copy if destination already exists
  source_file=$1
  destination_file=$2
  timestamp=`date +%F`
  if [ -e $destination_file ]
  then
    mv $destination_file $destination_file.$timestamp
  fi
  cp $source_file $destination_file
}

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

# setup config files
safe_copy_file "$script_dir/bashrc" ~/.bashrc
safe_copy_file "$script_dir/vimrc" ~/.vimrc
safe_copy_file "$script_dir/tmux.conf" ~/.tmux.conf

cp -r $script_dir/vim ~/.vim

# install vundle
echo "Installing Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# setup tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm



