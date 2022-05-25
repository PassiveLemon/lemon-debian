#!/bin/sh

# If you aren't me, replace all "lemon" with your user account.

# Run script as SU

if [ `whoami` != root ]; then
    echo Please run this script as SU
    exit
fi

echo "Setting up system"

mkdir -p /home/lemon/usb

echo "Installing sudo"

# Install sudo
apt install sudo
rm -f /etc/sudoers
cp main/config/sudoers /etc/
sudo usermod -aG sudo lemon

echo "Sudo installed"
echo "Setting up internet"

# Setup internet
rm -f /etc/network/interfaces
cp main/config/interfaces /etc/network/

rm -f /etc/NetworkManager/NetworkManager.conf
cp main/config/NetworkManager.config /etc/NetworkManager/

echo "Internet set up"
echo "Adding mirrors"

# Add mirrors
rm -f /etc/apt/sources.list
cp main/config/sources.list /etc/apt/

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
