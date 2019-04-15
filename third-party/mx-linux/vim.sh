#!/bin/bash

sudo apt-get update
sudo apt-get install -y vim python3 python3-dev cmake vim-gtk

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "" | vim +PluginInstall +qall

cd ${HOME}/.vim/bundle/YouCompleteMe
python3 install.py --all

