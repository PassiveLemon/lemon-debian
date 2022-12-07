#!/usr/bin/env bash

if [ $EUID = 0 ]; then
  echo "====================================="
  echo "Please do not run this script as Sudo"
  echo "====================================="
  exit
fi

sudo mkdir $HOME/lemontemp/
pushd $HOME/lemontemp/

echo "|| Install package managers ||"

echo "|| Flatpak ||"
sudo apt install -y flatpak

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "|| Install utilities ||"

echo "|| Git, wget, curl, make ||"
sudo apt install -y git wget curl make

# echo "|| Nvidia drivers ||"
# sudo ...

echo "|| Scrot ||"
sudo apt install -y scrot

echo "|| Install apps ||"

echo "|| Firefox ||"
sudo apt install -y firefox-esr

echo "|| Htop ||"
sudo apt install -y htop

echo "|| Neofetch ||"
sudo apt install -y neofetch

echo "|| Gparted ||"
sudo apt install -y gparted

echo "|| VLC ||"
sudo apt install -y vlc

echo "|| Spotify ||"
flatpak install flathub com.spotify.Client

echo "|| Discord ||"
flatpak install flathub com.discordapp.Discord

echo "|| Steam ||"
flatpak install flathub com.valvesoftware.Steam

sudo rm -r $HOME/lemontemp/
popd
