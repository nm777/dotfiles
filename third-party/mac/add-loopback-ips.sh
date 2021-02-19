#!/bin/sh

sudo cp org.my.ifconfig* /Library/LaunchDaemons

sudo /sbin/ifconfig lo0 alias 100.64.0.1
sudo /sbin/ifconfig lo0 alias 100.64.0.2
sudo /sbin/ifconfig lo0 alias 100.64.0.3
sudo /sbin/ifconfig lo0 alias 100.64.0.4
sudo /sbin/ifconfig lo0 alias 100.64.0.5
