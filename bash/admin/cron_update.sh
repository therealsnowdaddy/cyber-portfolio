#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 


sudo apt update -y
sudo apt upgrade --assume-yes
sudo apt dist-upgrade --yes
sudo apt autoremove -q=2

#sudo apt {update,upgrade,dist-upgrade,autoremove}
