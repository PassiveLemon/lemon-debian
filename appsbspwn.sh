#!/bin/sh

# Run script as sudo

if [ `whoami` != root ]; then
    echo Please run this script as Sudo
    exit
fi

echo "Installing package managers"

# Flatpak
apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Package managers installed"
echo "Installing apps"

# Firefox
apt install firefox-esr

# Wget
apt install wget

# Bpytop
apt install bpytop
mkdir -p /home/lemon/.config/bpytop
mkdir -p /home/lemon/.config/bpytop/themes
cp -r bspwm/bpytop/bashtop.cfg /home/lemon/.config/bpytop
cp -r bspwm/bpytop/catppuccin.theme /home/lemon/.config/bpytop/themes

# Neofetch
apt install neofetch
mkdir -p /home/lemon/.config/neofetch
rm -r /home/lemon/.config/neofetch/config.conf
cp -r bspwm/neofetch/config.conf /home/lemon/.config/neofetch

# Scrot
apt install scrot

# Gparted
apt install gparted

# VLC
apt install vlc

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