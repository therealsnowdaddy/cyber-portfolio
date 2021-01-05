#!/bin/bash

############################################################################
### installbeats.sh (ver. 0.1) -- Matt Snowball on Dec 19, 2020          ###
### -------------------------------------------------------------------- ###
### INSTALL Filebeat & Metricbeat on Jumpbox                             ###
############################################################################

## Check for sudo privs

if [ $EUID -ne 0 ]
then
	echo "Please run as root."
	exit
fi

## DECLARE operational variables

# GENERAL script config - CHANGE CONTAINER ID on next line

containerid="cool_lichterman" #replace with your container Name or (partial) numerical ID

dockerdir=/etc/ansible/files


# FILEBEAT options

filebeatimg="filebeat-7.4.0-amd64.deb"
filebeaturl="https://artifacts.elastic.co/downloads/beats/filebeat"

filebeatdir="/etc/filebeat"
filebeatconfigsrc="filebeat-config.yml"
filebeatconfigdest="filebeat.yml"


# METRICBEAT options

metricbeatimg="metricbeat-7.4.0-amd64.deb"
metricbeaturl="https://artifacts.elastic.co/downloads/beats/metricbeat"

metricbeatdir="/etc/metricbeat"
metricbeatconfigsrc="metricbeat-config.yml"
metricbeatconfigdest="metricbeat.yml"

##### DEBUG

if [ $containerid == "groovy_einstein" ]
then
	echo "Please change the containerid line to reflect your docker container."
	exit
fi


#echo "$containerid $dockerdir"
#echo "$filebeatdir $metricbeatdir"
#echo "-----"
#echo "$filebeaturl/$filebeatimg"
#echo "$filebeatconfigsrc"
#echo "$filebeatconfigdest"
#echo "$metricbeaturl/$metricbeatimg"
#echo "$metricbeatconfigsrc"
#echo "$metricbeatconfigdest"



## INSTALL Filebeat

echo "Installing Filebeat..."

# Download package
curl -O -L ${filebeaturl}/${filebeatimg}

# Install package
dpkg -i ${filebeatimg}

echo "Copying config file from Docker..."

# Copy configuration file from Ansible Docker container
docker cp ${containerid}:/etc/ansible/files/${filebeatconfigsrc} ${filebeatdir}/${filebeatconfigdest}

echo "Setting up..."

# Setup Filebeat
filebeat modules enable system
filebeat setup

echo "Starting service..."

# Start service
service filebeat start

echo "Making persistent..."

# Persist across reboots
systemctl enable filebeat



## INSTALL Metricbeat

echo "Installing Metricbeat..."

# Download package
curl -O -L ${metricbeaturl}/${metricbeatimg}

# Install package
dpkg -i ${metricbeatimg}

echo "Copying config file from Docker..."

# Copy configuration file from Ansible Docker container
docker cp ${containerid}:/etc/ansible/files/${metricbeatconfigsrc} ${metricbeatdir}/${metricbeatconfigdest}

echo "Setting up..."

# Setup Metricbeat
metricbeat modules enable system
metricbeat setup

echo "Starting service..."

# Start service
service metricbeat start


# Persist across reboots
systemctl enable metricbeat


## VERIFY Installation

read -p "Test configuration [y/n]? " testinstall


if [ "$testinstall" == "y" ]
then
	clear
        echo -e "\n Type 'q' to exit. \n"
        systemctl status filebeat
	clear
        echo -e "\n Type 'q' to exit. \n"
        systemctl status metricbeat
	clear
fi
