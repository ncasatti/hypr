#!/bin/bash

# Variables
TITLE="KDE CONFIGURATOR"
CONFIG_DIR="$HOME/.config"

# Menu
menu(){
  clear
  echo "=== $TITLE ==="
  echo "1. Rofi"
  echo "2. Waybar"
  echo "0. Exit"
}

sub_menu(){
  echo "=== $1 ==="
  echo "1. <-"
  echo "2. ->"
}

# 1. Rofi
rofi_config(){
  sub_menu "Rofi"
  read -p "Select an option: " option

  case $option in
    1)
      rm -rf ./rofi
      cp -r $CONFIG_DIR/rofi ./
      ;;
    2)
      rm -rf $CONFIG_DIR/rofi
      cp -r ./rofi $CONFIG_DIR/
      ;;
  esac
  read -p "Done..."
}

# 2. Waybar
waybar_config(){
  sub_menu "Waybar"
  read -p "Select an option: " option

  case $option in
    1)
      rm -rf ./waybar
      cp -r $CONFIG_DIR/waybar ./
      ;;
    2)
      rm -rf $CONFIG_DIR/waybar
      cp -r ./waybar $CONFIG_DIR/
      ;;
  esac
  read -p "Done..."
}

main(){
  while true; do
      menu
      read -p "Select an option: " option

      case $option in
          1)
              rofi_config
              ;;
          2)
              waybar_config
              ;;
          0)
              echo "Exiting..."
              exit 0
              ;;
          *)
              echo "Invalid option"
              read -p "Press Enter to continue..."
              ;;
      esac
  done
}

main