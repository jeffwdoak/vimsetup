#!/bin/bash

# script to create directories and move files around when setting up my vim
# stuff on a new computer

mkdir tmp

id=`whoami`
sed "s/xxxx/$id/g/" vimrc > ../.vimrc


git submodule init
git submodule update
