#!/bin/sh

# If you aren't me, replace all "lemon" with your user account.

# Run script as sudo

if [ `whoami` != root ]; then
    echo Please run this script as Sudo
    exit
fi

echo "Updating..."

# Update and upgrade
apt update
apt upgrade

echo "Updated"
echo "Installing LightDM and customizations"

# LightDM
apt install lightdm

dpkg -i bspwm/lightdm/lightdm-webkit2-greeter_2.2.5-1+15.8_amd64.deb
apt -f install

rm -rf /usr/share/lightdm-webkit/themes/minimal/
mkdir -p /usr/share/lightdm-webkit/themes/
cp -r bspwm/lightdm/minimal /usr/share/lightdm-webkit/themes/

rm -f /etc/lightdm/lightdm.conf
rm -f /etc/lightdm/lightdm-webkit2-greeter.conf
cp bspwm/lightdm/lightdm.conf /etc/lightdm/
cp bspwm/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/

sudo dpkg-reconfigure lightdm

echo "LightDM and customizations installed"
echo "Installing bspwm components"

apt install xorg bspwm sxhkd kitty rofi polybar picom feh psmisc

echo "bspwm components installed"
echo "Installing alsa"

apt install alsa-utils alsamixergui
alsactl init

echo "Alsa installed"
echo "Installing bspwm customizations"

# Xorg
rm -f /home/lemon/.xinitrc
cp bspwm/xorg/xinitrc /home/lemon/
mv /home/lemon/xinitrc /home/lemon/.xinitrc
chmod 777 /home/lemon/.xinitrc
chmod +x /home/lemon/.xinitrc

# Config
mkdir -p /home/lemon/.config/

# Bspwm
mkdir -p /home/lemon/.config/bspwm/
rm -f /home/lemon/.config/bspwm/bspwmrc
cp bspwm/bspwm/bspwmrc /home/lemon/.config/bspwm/
chmod 777 /home/lemon/.config/bspwm/bspwmrc
chmod +x /home/lemon/.config/bspwm/bspwmrc

# Sxhkd
mkdir -p /home/lemon/.config/sxhkd/
rm -f /home/lemon/.config/sxhkd/sxhkdrc
cp bspwm/sxhkd/sxhkdrc /home/lemon/.config/sxhkd/
chmod 777 /home/lemon/.config/sxhkd/sxhkdrc
chmod +x /home/lemon/.config/sxhkd/sxhkdrc

# Kitty
mkdir -p /home/lemon/.config/kitty/
rm -f /home/lemon/.config/kitty/kitty.conf
cp bspwm/kitty/kitty.conf /home/lemon/.config/kitty/

# Polybar
mkdir -p /home/lemon/.config/polybar/
rm -rf /home/lemon/.config/polybar/modules/
rm -f /home/lemon/.config/polybar/colors.ini
rm -f /home/lemon/.config/polybar/config
rm -f /home/lemon/.config/polybar/incmods.ini
rm -f /home/lemon/.config/polybar/launch.sh
cp -r bspwm/polybar/modules/ /home/lemon/.config/polybar/
cp bspwm/polybar/colors.ini /home/lemon/.config/polybar/
cp bspwm/polybar/config /home/lemon/.config/polybar/
cp bspwm/polybar/incmods.ini /home/lemon/.config/polybar/
cp bspwm/polybar/launch.sh /home/lemon/.config/polybar/

# Rofi
mkdir -p /home/lemon/.config/rofi/
rm -f /home/lemon/.config/rofi/themes/minimal.rasi
cp bspwm/rofi/minimal.rasi /home/lemon/.config/rofi/

# Autostart scripts
mkdir -p /home/lemon/.config/autostart/
rm -f /home/lemon/.config/autostart/resolution.sh
cp bspwm/autostart/resolution.sh /home/lemon/.config/autostart/

# Fonts
rm -rf /home/lemon/.fonts/
mkdir -p /home/lemon/.fonts/
cp -r main/fonts/* /home/lemon/.fonts/

# Backgrounds
mkdir -p /home/lemon/Pictures/
cp -r bspwm/backgrounds/ /home/lemon/Pictures/

echo "bspwm customizations installed"
echo "Restarting..."

sudo shutdown -r now
