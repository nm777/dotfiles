#!/bin/bash

sudo apt-get update && sudo apt-get install -y ca-certificates apt-transport-https 
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php.list

sudo apt update && sudo apt install -y php7.3

sudo apt install -y \
    php7.3-cli \
    php7.3-common \
    php7.3-curl \
    php7.3-mbstring \
    php7.3-mysql \
    php7.3-sqlite \
    php7.3-xml

