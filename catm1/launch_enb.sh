#!/bin/bash
# Copyright (C) 2018 Nutaq
# LTE-ENB Launch Script

DIR=$(dirname $0)

if [ -z "$1" ]; then
	ENB_DIR=/root/enb
else
	RELEASE=$1
	echo "Release ${RELEASE} is used..."
   	LTE_DIR="/opt/nutaq/picolte/bin/enb"
   	ENB_DIR=${LTE_DIR}/${RELEASE}
fi

# Checking, installing and mounting the PCIe 
lspci | grep "Memory controller: Device 1ae2:2525"

if [[ $? != 0 ]]; then
	echo "Perseus PCIe is not mounted.";
	echo "You must restart the embedded computer";
	echo "The embedded computer is restarting...";
	#sudo reboot
else
	echo "****************************************************";
	echo "Perseus PCIe is mounted...";
	echo "****************************************************";
    
    ls /dev/perseus*
	if [[ $? != 0 ]]; then #! -d "/dev/perseus*" 
		echo "Perseus PCIe Driver is not loaded.";
		echo "Loading the Perseus PCIe kernel module...";
		sudo bash /opt/nutaq/picolte/firmware/host/pcie/install.sh
		sudo modprobe host_drv
	else
		echo "****************************************************";
		echo "PERSEUS PCIe is installed and ready to use!";
		echo "****************************************************";
	fi
fi

cd enb/

sudo ${ENB_DIR}/lte_init.sh
sudo ${ENB_DIR}/lteenb enb.cfg
