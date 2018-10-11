#!/bin/sh

sudo apt-get update
sudo apt install -y \
    php7.2-common \
    php7.2-cli \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-dom \
    php7.2-sqlite

