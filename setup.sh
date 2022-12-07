#!/usr/bin/env bash

if [ $EUID = 0 ]; then
  echo "====================================="
  echo "Please do not run this script as Sudo"
  echo "====================================="
  exit
fi

echo "|| Update and upgrade ||"
sudo apt update -y && sudo apt upgrade -y

PS3="|| Choose a system ||"
select opt in "Bspwm - WM" "Xfce - DE" "Quit"; do
  case $opt in
    "Bspwm - WM")
      echo "Bspwm selected"
      bash bspwm.sh
      ;;
     "Xfce - DE")
      echo "Xfce selected"
      bash xfce.sh
      ;;
    "Quit")
      break
      ;;
    *)
      echo "Invalid option"
      ;;
  esac
  break
done

echo "|| Dotfiles ||"
while true; do
  read -p "Do you want to install my dotfiles? [Y/n]" yn
  case $yn in
    [Yy]* ) bash lemondots.sh;;
    [Nn]* ) break;;
    "" ) bash lemondots.sh;;
    * ) echo "Invalid response";;
  esac
  break
done

echo "|| Programs ||"
while true; do
  read -p "Do you want to install my programs? [Y/n]" yn
  case $yn in
    [Yy]* ) bash apps.sh;;
    [Nn]* ) break;;
    "" ) bash apps.sh;;
    * ) echo "Invalid response";;
  esac
  break
done

echo "|| Restart ||"
while true; do
  read -p "Do you want to restart now? [Y/n]" yn
  case $yn in
    [Yy]* ) sudo shutdown -r now;;
    [Nn]* ) break;;
    "" ) sudo shutdown -r now;;
    * ) echo "Invalid response";;
  esac
  break
done
