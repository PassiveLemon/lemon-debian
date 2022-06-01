#!/bin/bash

if [ $EUID = 0 ]; then
    echo "====================================="
    echo "Please do not run this script as Sudo"
    echo "====================================="
    exit
fi

echo "|| Installing package managers ||"

# Flatpak
echo "|| Flatpak ||"
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "|| Package managers installed ||"
echo "|| Installing utilities ||"

# Wget, Curl
echo "|| Wget, curl ||"
sudo apt install wget curl

# Scrot
echo "|| Scrot ||"
sudo apt install scrot

# echo "Java 17"
     # echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu focal main" | tee /etc/apt/sources.list.d/linuxuprising-java.list
        # apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A
        # apt update
        # exit
    # add-apt-repository ppa:linuxuprising/java
    	# apt update
   		# apt install oracle-java17-installer --install-recommends

# Nvidia Drivers
# echo "Nvidia drivers"
# sudo apt install nvidia-driver

echo "|| Utilities installed ||"
echo "|| Installing apps ||"

# Firefox
echo "|| Firefox ||"
sudo apt install firefox-esr

# Bpytop
echo "|| Bpytop ||"
sudo apt install bpytop
rm -rf ~/.config/bpytop/
sudo cp -r bpytop ~/.config/

# Neofetch
echo "|| Neofetch ||"
sudo apt install neofetch
rm -rf ~/.config/neofetch/
sudo cp -r neofetch/ ~/.config/

# Gparted
echo "|| Gparted ||"
sudo apt install gparted

# VLC
echo "|| VLC ||"
sudo apt install vlc

# Spotify
echo "|| Spotify ||"
flatpak install flathub com.spotify.Client
# apt install curl
# curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
# echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# apt update
# install spotify-client

# Discord
echo "|| Discord ||"
flatpak install flathub com.discordapp.Discord

# Steam
echo "|| Steam ||"
flatpak install flathub com.valvesoftware.Steam

echo "|| Apps installed ||"
echo "|| Restarting ||"

while true; do
  read -p "Do you want to restart now? [Y/n]" yn
  case $yn in
    [Yy]* ) sudo shutdown -r now;;
    [Nn]* ) exit;break;;
    "" ) sudo shutdown -r now;;
    * ) echo "Invalid response";;
  esac
done