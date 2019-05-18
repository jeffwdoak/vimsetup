#!/bin/bash

# setup.sh Jeff W. Doak jeff.w.doak@gmail.com

# Script to initialize my settings on a new server.

safe_copy_file(){
  # copy a file and create time-stamped copy if destination already exists
  source_file=$1
  destination_file=$2
  timestamp=`date +%s`
  if [ -e $destination_file ]
  then
    mv $destination_file $destination_file.$timestamp
  fi
  cp $source_file $destination_file
}

safe_git_clone(){
  # clone a git repo if the directory is empty.
  # check if the correct git repo is there if the directory exists
  # pull latest from origin if it is correct
  git_repo=$1
  destination_dir=$2
  if [ ! -e $destination_dir ]
  then
    echo "Directory $destination_dir empty $current_repo"
    git clone $git_repo $destination_dir
  else
    # check if destination dir is git rep
    git -C $destination_dir rev-parse
    if [ $? -eq 0 ]
    then
      # check that repo is correct one
      current_repo=`git -C $destination_dir config --get remote.origin.url`
      if [ "$git_repo" == "$current_repo" ]
      then
        echo "Directory $destination_dir has git repo: $current_repo"
        echo "Pulling latest from origin"
        git -C $destination_dir pull
      else
        # not correct repo what do?
        echo "Directory $destination_dir has different repo: $current_repo"
        echo "than repo we are trying to clone: $git_repo"
        echo "Not cloning repo $git_repo into $destination_dir"
      fi
    else
      # not repo - what do?
      echo "Directory $destination_dir exists and is not empty"
      echo "but is not a git repository"
      echo "Not cloning repo $git_repo into $destination_dir"
    fi
  fi
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
#git clone https://github.com/seebi/dircolors-solarized.git ~/src/dircolors-solarized/
safe_git_clone https://github.com/seebi/dircolors-solarized.git ~/src/dircolors-solarized/
ln -s ~/src/dircolors-solarized/dircolors.256dark ~/.dircolors

# setup config files
safe_copy_file "$script_dir/bashrc" ~/.bashrc
safe_copy_file "$script_dir/vimrc" ~/.vimrc
safe_copy_file "$script_dir/tmux.conf" ~/.tmux.conf

cp -r $script_dir/vim ~/.vim

# install vundle
echo "Installing Vundle"
safe_git_clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# setup tmux
safe_git_clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
