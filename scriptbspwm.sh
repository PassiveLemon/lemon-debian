#!/bin/sh

if [ `whoami` = root ]; then
    echo "Please do not run this script as Sudo"
    exit
fi

echo "Updating..."

# Update and upgrade
sudo apt update
sudo apt upgrade

echo "Updated"
echo "Installing LightDM and customizations"

# LightDM
sudo apt install lightdm

sudo dpkg -i bspwm/lightdm/lightdm-webkit2-greeter_2.2.5-1+15.8_amd64.deb
sudo apt -f install

sudo rm -rf /usr/share/lightdm-webkit/themes/minimal/
sudo mkdir -p /usr/share/lightdm-webkit/themes/
sudo cp -r bspwm/lightdm/minimal /usr/share/lightdm-webkit/themes/

sudo rm -f /etc/lightdm/lightdm.conf
sudo rm -f /etc/lightdm/lightdm-webkit2-greeter.conf
sudo cp bspwm/lightdm/lightdm.conf /etc/lightdm/
sudo cp bspwm/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/

sudo dpkg-reconfigure lightdm

echo "LightDM and customizations installed"
echo "Installing bspwm components"

sudo apt install xorg bspwm sxhkd kitty rofi polybar picom feh psmisc

echo "bspwm components installed"
echo "Installing alsa"

sudo apt install alsa-utils alsamixergui
sudo alsactl init

echo "Alsa installed"
echo "Installing bspwm customizations"

# Xorg
rm -f ~/.xinitrc
sudo cp bspwm/xorg/xinitrc ~/
mv ~/xinitrc ~/.xinitrc
sudo chmod 777 ~/.xinitrc
sudo chmod +x ~/.xinitrc

# Config
mkdir ~/.config/

# Bspwm
mkdir -p ~/.config/bspwm/
rm -f ~/.config/bspwm/bspwmrc
sudo cp bspwm/bspwm/bspwmrc ~/.config/bspwm/
sudo chmod 777 ~/.config/bspwm/bspwmrc
sudo chmod +x ~/.config/bspwm/bspwmrc

# Sxhkd
mkdir -p ~/.config/sxhkd/
rm -f ~/.config/sxhkd/sxhkdrc
sudo cp bspwm/sxhkd/sxhkdrc ~/.config/sxhkd/
sudo chmod 777 ~/.config/sxhkd/sxhkdrc
sudo chmod +x ~/.config/sxhkd/sxhkdrc

# Kitty
mkdir -p ~/.config/kitty/
rm -f ~/.config/kitty/kitty.conf
sudo cp bspwm/kitty/kitty.conf ~/.config/kitty/

# Polybar
mkdir -p ~/.config/polybar/
rm -rf ~/.config/polybar/modules/
rm -f ~/.config/polybar/colors.ini
rm -f ~/.config/polybar/config
rm -f ~/.config/polybar/incmods.ini
rm -f ~/.config/polybar/launch.sh
sudo cp -r bspwm/polybar/modules/ ~/.config/polybar/
sudo cp bspwm/polybar/colors.ini ~/.config/polybar/
sudo cp bspwm/polybar/config ~/.config/polybar/
sudo cp bspwm/polybar/incmods.ini ~/.config/polybar/
sudo cp bspwm/polybar/launch.sh ~/.config/polybar/

# Rofi
mkdir -p ~/.config/rofi/
rm -f ~/.config/rofi/themes/minimal.rasi
sudo cp bspwm/rofi/minimal.rasi ~/.config/rofi/

# Autostart scripts
mkdir -p ~/.config/autostart/
rm -f ~/.config/autostart/resolution.sh
sudo cp bspwm/autostart/resolution.sh ~/.config/autostart/

# Fonts
rm -rf ~/.fonts/
mkdir -p ~/.fonts/
sudo cp -r bspwm/fonts/* ~/.fonts/

# Backgrounds
mkdir -p ~/Pictures/
sudo cp -r bspwm/backgrounds/ ~/Pictures/

echo "bspwm customizations installed"
echo "Restarting..."

sudo shutdown -r now
