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

echo "|| Install components ||"
sudo apt install -y kitty rofi polybar

echo "|| Ly ||"
sudo apt install -y build-essential libpam0g-dev libxcb-xkb-dev git
sudo git clone --recurse-submodules https://github.com/fairlyglade/ly.git
cd ly
sudo make
sudo make install installsystemd
sudo systemctl disable lightdm
sudo systemctl enable ly.service
cd ..

sudo rm -r $HOME/lemontemp/
popd
