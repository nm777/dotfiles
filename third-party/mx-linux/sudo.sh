#!/usr/bin/env bash

sudo addgroup freesudo
sudo usermod -aG freesudo $USER
echo "%unrestricted ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

