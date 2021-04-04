#!/bin/bash

# Developed by Matt Snowball - Fall/Winter 2020/2021 

DATE=$(date -I)
sudo tar -cvvf /var/backup/home.tar ~/testing/*
sudo mv /var/backup/home.tar /var/backup/home.$DATE.tar
sudo ls -ls >> /var/backup/file_report.$DATE.log
sudo df -h >> /var/backup/disk_report.$DATE.log
