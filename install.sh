#!/bin/bash

# Update & Upgrade
read -p "Are you want to Update this system [y/n] " update
if [[ $update =~ ^[Yy]$ ]]
	then
		sudo apt-get update -y
		read -p "Are you want to upgrade this system [y/n] " upgrade
		if [[ $upgrade =~ ^[Yy]$ ]]
		then 
			sudo apt-get upgrade -y
		fi

fi  

# Install modul
read -p "Install wget, git, zip, unzip [y/n] " modul
if [[ $modul =~ ^[Yy]$ ]]
	then
		sudo apt-get install -y wget git zip unzip
fi

mount -t tmpfs tmpfs /tmp/

cd /tmp

wget https://download.mikrotik.com/routeros/6.48/chr-6.48.img.zip

unzip chr-6.48.img.zip

if [ -e "/dev/vda" ]
then
dd if=chr-6.47.7.img of=/dev/vda bs=4M oflag=sync
else
dd if=chr-6.47.7.img of=/dev/sda bs=4M oflag=sync
fi

sleep 2
echo 1 > /proc/sys/kernel/sysrq
echo ">>> Finished Installing MIkrotik CHR <<<"
echo b > /proc/sysrq-trigger



