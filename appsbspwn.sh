#!/bin/sh

if [ `whoami` = root ]; then
    echo Please do not run this script as Sudo
    exit
fi

echo "Installing package managers"

# Flatpak
sudo apt install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Package managers installed"
echo "Installing apps"

# Firefox
sudo apt install firefox-esr

# Wget
sudo apt install wget

# Bpytop
sudo apt install bpytop
mkdir -p ~/.config/bpytop/
mkdir -p ~/.config/bpytop/themes/
rm -f ~/.config/bpytop/bpytop.cfg
rm -f ~/.config/bpytop/catppuccin.theme
sudo cp -r bspwm/bpytop/bpytop.cfg ~/.config/bpytop
sudo cp -r bspwm/bpytop/catppuccin.theme ~/.config/bpytop/themes/

# Neofetch
sudo apt install neofetch
mkdir -p ~/.config/neofetch/
rm -f ~/.config/neofetch/config.conf
sudo cp -r bspwm/neofetch/config.conf ~/.config/neofetch/

# Scrot
sudo apt install scrot

# Gparted
sudo apt install gparted

# VLC
sudo apt install vlc

# Java 17
     # echo "deb http://ppa.launchpad.net/linuxuprising/java/ubuntu focal main" | tee /etc/apt/sources.list.d/linuxuprising-java.list
        # apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 73C3DB2A
        # apt update
        # exit
    # add-apt-repository ppa:linuxuprising/java
    	# apt update
   		# apt install oracle-java17-installer --install-recommends

# Spotify
# apt install curl
# curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
# echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
# apt update
# install spotify-client

# Spotify Flatpak
flatpak install flathub com.spotify.Client

# Discord
flatpak install flathub com.discordapp.Discord

echo "Apps installed"
echo "Restarting..."

sudo shutdown -r now
