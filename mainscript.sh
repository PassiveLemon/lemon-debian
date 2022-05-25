#!/bin/sh

if [ `whoami` = root ]; then
    echo Please do not run this script as Sudo
    exit
fi

echo "Setting up system"

sudo mkdir -p /media/usb

echo "Installing sudo"

# Install sudo
sudo apt install sudo
sudo rm -f /etc/sudoers
sudo cp main/config/sudoers /etc/
sudo usermod -aG sudo lemon
# If you aren't me, "lemon" with your user account. Don't forget to modify the suoders file in main/configs/.

echo "Sudo installed"
echo "Setting up internet"

# Setup internet
sudo rm -f /etc/network/interfaces
sudo cp main/config/interfaces /etc/network/

sudo rm -f /etc/NetworkManager/NetworkManager.conf
sudo cp main/config/NetworkManager.config /etc/NetworkManager/

echo "Internet set up"
echo "Adding mirrors"

# Add mirrors
sudo rm -f /etc/apt/sources.list
sudo cp main/config/sources.list /etc/apt/

echo "Mirrors added"
# echo "Changing swap space"

# Change swap space
	# swapon --show
	# ls /swapfile
	# swapoff /swapfile
	# fallocate -l 4G /swapfile
	# mkswap /swapfile
	# swapon /swapfile

# echo "Swap space changed"
echo "System setup"
echo "Restarting..."

# Restart
sudo shutdown -r now
