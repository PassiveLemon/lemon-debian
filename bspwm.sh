#!/usr/bin/env bash

if [ $EUID = 0 ]; then
  echo "====================================="
  echo "Please do not run this script as Sudo"
  echo "====================================="
  exit
fi

sudo mkdir $HOME/lemontemp/
sudo chmod 777 $HOME/lemontemp/
pushd $HOME/lemontemp/

echo "|| Install dependencies ||"
sudo apt install -y xorg bspwm sxhkd kitty rofi polybar feh psmisc alsa-utils network-manager
sudo alsactl init

echo "|| Ly ||"
sudo apt install -y build-essential libpam0g-dev libxcb-xkb-dev git
sudo git clone --recurse-submodules https://github.com/fairyglade/ly
cd ly
sudo make
sudo make install installsystemd
sudo systemctl enable ly.service
cd ..

echo "|| Picom Fork ||"
sudo apt -y install ninja-build gcc meson python3 cmake libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
sudo git clone https://github.com/ibhagwan/picom
cd picom
sudo git submodule update --init --recursive
sudo meson --buildtype=release . build
sudo ninja -C build
sudo ninja -C build install
cd ..

sudo rm -r $HOME/lemontemp/
popd
