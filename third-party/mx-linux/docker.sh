#!/bin/bash

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

if ! apt-key fingerprint 0EBFCD88 | grep -q "9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88"; then
	echo "WARNING! Docker key fingerprint doesn't match. Aborting!"
	exit 1;
fi

echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" | sudo tee -a /etc/apt/sources.list.d/docker-ce.list

sudo apt-get update && sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker $USER

sudo systemctl enable docker

