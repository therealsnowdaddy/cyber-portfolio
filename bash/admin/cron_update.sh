#!/bin/bash



sudo apt update -y
sudo apt upgrade --assume-yes
sudo apt dist-upgrade --yes
sudo apt autoremove -q=2

#sudo apt {update,upgrade,dist-upgrade,autoremove}
