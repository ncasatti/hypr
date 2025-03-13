#!/bin/bash

# Variables
TITLE="KDE CONFIGURATOR"
CONFIG_DIR="$HOME/.config"
EXTERNAL_CONFIGS="$HOME/.config/hypr/.configs"

# Menu
menu() {
  clear
  echo "=== $TITLE ==="
  echo "1. Rofi"
  echo "2. Waybar"
  echo "3. Kitty"
  echo "4. Wallust"
  echo "5. Themes"
  echo "6. Hyprshade"
  echo "0. Exit"
}

sub_menu() {
  echo "=== $1 ==="
  echo "1. <- GET CONFIG"
  echo "2. -> SET CONFIG"
}

main() {
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
    3)
      kitty_config
      ;;
    4)
      wallust_config
      ;;
    5)
      themes
      ;;
    6)
      hyprshade_config
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

# 1. Rofi
rofi_config() {
  sub_menu "Rofi"
  read -p "Select an option: " option

  case $option in
  1)
    rm -rf $EXTERNAL_CONFIGS/rofi
    cp -r $CONFIG_DIR/rofi $EXTERNAL_CONFIGS/
    ;;
  2)
    rm -rf $CONFIG_DIR/rofi
    cp -r $EXTERNAL_CONFIGS/rofi $CONFIG_DIR/
    ;;
  esac
  read -p "Done..."
}

# 2. Waybar
waybar_config() {
  sub_menu "Waybar"
  read -p "Select an option: " option

  case $option in
  1)
    rm -rf $EXTERNAL_CONFIGS/waybar
    cp -r $CONFIG_DIR/waybar $EXTERNAL_CONFIGS/
    ;;
  2)
    rm -rf $CONFIG_DIR/waybar
    cp -r $EXTERNAL_CONFIGS/waybar $CONFIG_DIR/
    ;;
  esac
  read -p "Done..."
}

# 3. Kitty
kitty_config() {
  sub_menu "Kitty"
  read -p "Select an option: " option

  case $option in
  1)
    rm -rf $EXTERNAL_CONFIGS/kitty
    cp -r $CONFIG_DIR/kitty $EXTERNAL_CONFIGS/
    ;;
  2)
    rm -rf $CONFIG_DIR/kitty
    cp -r $EXTERNAL_CONFIGS/kitty $CONFIG_DIR/
    ;;
  esac
  read -p "Done..."
}

# 4. Wallust
wallust_config() {
  sub_menu "Wallust"
  read -p "Select an option: " option

  case $option in
  1)
    rm -rf $EXTERNAL_CONFIGS/wallust
    cp -r $CONFIG_DIR/wallust $EXTERNAL_CONFIGS/
    ;;
  2)
    rm -rf $CONFIG_DIR/wallust
    cp -r $EXTERNAL_CONFIGS/wallust $CONFIG_DIR/
    ;;
  esac
  read -p "Done..."
}

# 5. Themes
themes() {
  sub_menu "Themes"
  read -p "Select an option: " option

  case $option in
  1)
    # GTK 2
    rm -rf $EXTERNAL_CONFIGS/gtk-2.0
    cp -r $CONFIG_DIR/gtk-2.0 $EXTERNAL_CONFIGS/
    # GTK 3
    rm -rf $EXTERNAL_CONFIGS/gtk-3.0
    cp -r $CONFIG_DIR/gtk-3.0 $EXTERNAL_CONFIGS/
    # GTK 4
    rm -rf $EXTERNAL_CONFIGS/gtk-4.0
    cp -r $CONFIG_DIR/gtk-4.0 $EXTERNAL_CONFIGS/
    # Kvantum
    rm -rf $EXTERNAL_CONFIGS/Kvantum
    cp -r $CONFIG_DIR/Kvantum $EXTERNAL_CONFIGS/
    ;;
  2)
    # GTK 2
    rm -rf $CONFIG_DIR/gtk-2.0
    cp -r $EXTERNAL_CONFIGS/gtk-2.0 $CONFIG_DIR/
    # GTK 3
    rm -rf $CONFIG_DIR/gtk-3.0
    cp -r $EXTERNAL_CONFIGS/gtk-3.0 $CONFIG_DIR/
    # GTK 4
    rm -rf $CONFIG_DIR/gtk-4.0
    cp -r $EXTERNAL_CONFIGS/gtk-4.0 $CONFIG_DIR/
    # Kvantum
    rm -rf $CONFIG_DIR/Kvantum
    cp -r $EXTERNAL_CONFIGS/Kvantum $CONFIG_DIR/
    ;;
  esac
  read -p "Done..."
}

# 6. Hyprshade
hyprshade_config() {
  sub_menu "Hyprshade"
  read -p "Select an option: " option

  case $option in
  1)
    rm -rf $EXTERNAL_CONFIGS/hyprshade
    sudo cp -r /usr/share/hyprshade $EXTERNAL_CONFIGS/
    ;;
  2)
    rm -rf /usr/share/hyprshade
    sudo cp -r $EXTERNAL_CONFIGS/hyprshade /usr/share/
    ;;
  esac
  read -p "Done..."
}

main
