#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y tmux

mkdir -p $HOME/.tmux/plugins

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

$HOME/.tmux/plugins/tpm/bin/install_plugins
