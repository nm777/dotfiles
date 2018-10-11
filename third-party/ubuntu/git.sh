#!/bin/bash

sudo apt-get -y remove git
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > $HOME/git-completion.bash

