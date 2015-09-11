#!/bin/bash

# script to create directories and move files around when setting up my vim
# stuff on a new computer

cp vimrc ../.vimrc

mkdir tmp

git submodule init
git submodule update
