#!/bin/bash

# Copy files to home
rsync --exclude ".git/" \
      --exclude ".gitignore" \
      --exclude "*.swp" \
      --exclude "install.sh" \
      --exclude "third-party/" \
      -avh --no-perms . ~

# Install tmux plugins
echo "Installing tmux plugins"
mkdir -p $HOME/.tmux/plugins 2>/dev/null
if [ ! -d $HOME/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi
$HOME/.tmux/plugins/tpm/bin/install_plugins

# Refresh settings, in case new ones were loaded
source ~/.bash_profile;
