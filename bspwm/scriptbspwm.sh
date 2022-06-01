#!/bin/bash

if [ $EUID = 0 ]; then
  echo "====================================="
  echo "Please do not run this script as Sudo"
  echo "====================================="
  exit
fi

echo "|| Updating and upgrading ||"

# Update and upgrade
sudo apt update
sudo apt upgrade

echo "|| Updated and upgraded ||"
echo "|| Installing LightDM and configurations ||"

# LightDM
sudo apt install lightdm

sudo dpkg -i lightdm/lightdm-webkit2-greeter_2.2.5-1+15.8_amd64.deb
sudo apt -f install

sudo rm -rf /usr/share/lightdm-webkit/themes/minimal/
sudo mkdir -p /usr/share/lightdm-webkit/themes/
sudo cp -r lightdm/minimal /usr/share/lightdm-webkit/themes/

sudo rm -f /etc/lightdm/lightdm.conf
sudo rm -f /etc/lightdm/lightdm-webkit2-greeter.conf
sudo cp lightdm/lightdm.conf /etc/lightdm/
sudo cp lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/

sudo dpkg-reconfigure lightdm

echo "|| LightDM and configurations installed ||"
echo "|| Installing components ||"

sudo apt install xorg bspwm sxhkd kitty rofi polybar picom feh psmisc

echo "|| Components installed ||"
echo "|| Installing alsa ||"

sudo apt install alsa-utils
sudo alsactl init

echo "|| Alsa installed ||"
echo "|| Installing configurations ||"

# Xorg
echo "|| Xorg ||"
rm -f ~/.xinitrc
sudo cp xorg/xinitrc ~/
mv ~/xinitrc ~/.xinitrc
sudo chmod 777 ~/.xinitrc
sudo chmod +x ~/.xinitrc

# Config
echo "|| Configs ||"
mkdir ~/.config/

# Bspwm
echo "|| Bspwm ||"
rm -rf ~/.config/bspwm/
sudo cp -r bspwm/ ~/.config/
sudo chmod +x ~/.config/bspwm/bspwmrc

# Sxhkd
echo "|| Sxhkd ||"
rm -rf ~/.config/sxhkd/
sudo cp -r sxhkd/ ~/.config/
sudo chmod +x ~/.config/sxhkd/sxhkdrc

# Kitty
echo "|| Kitty ||"
rm -rf ~/.config/kitty/
sudo cp -r kitty/ ~/.config/

# Polybar
echo "|| Polybar ||"
rm -rf ~/.config/polybar/
sudo cp -r polybar/ ~/.config/

# Rofi
echo "|| Rofi ||"
rm -rf ~/.config/rofi/themes/
sudo cp -r rofi/ ~/.config/

# Autostart scripts
echo "|| Autostart scripts ||"
rm -rf ~/.config/autostart/
sudo cp -r autostart/ ~/.config/

# Fonts
echo "|| Fonts ||"
rm -rf ~/.fonts/
mkdir -p ~/.fonts/
sudo cp -r fonts/* ~/.fonts/

# Backgrounds
echo "|| Backgrounds ||"
rm -rf ~/Pictures/backgrounds/
mkdir -p ~/Pictures/
sudo cp -r backgrounds/ ~/Pictures/

echo "|| Configurations installed ||"
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
