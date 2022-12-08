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

sudo apt install -y git

echo "|| Getting dotfiles ||"
sudo git clone https://github.com/PassiveLemon/lemondots/

cp -r lemondots/.config/ $HOME/
cp -r lemondots/.local/ $HOME/
cp -r lemondots/.wallpapers/ $HOME/
cp lemondots/.gtkrc-2.0 $HOME/
cp lemondots/.xinitrc $HOME/

echo "|| Running sub-scripts ||"

bash $HOME/.local/fontsscript.sh
bash $HOME/.local/iconsscript.sh
bash $HOME/.local/themesscript.sh

#echo "|| Grub theme ||"

echo "|| Changing permissions ||"
sudo chmod u+x $HOME/.xinitrc
sudo chmod u+x $HOME/.config/bspwm/bspwmrc
sudo chmod u+x $HOME/.config/sxhkd/sxhkdrc

sudo rm -r $HOME/lemontemp/
popd
