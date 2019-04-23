#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y tmux

git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

$HOME/.tmux/plugins/tpm/bin/install_plugins
