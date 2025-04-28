#!/bin/bash

# Variables
TITLE="KDE CONFIGURATOR"
HOME_CONFIG="$HOME/.config"
CONFIG="$HOME/.config/hypr/.configs"

# Menu
menu() {
  clear
  echo "=== $TITLE ==="
  echo "1. Sync All Configurations"
  echo "0. Exit"
}

# Función para obtener la fecha de modificación más reciente y los archivos modificados
get_latest_modification() {
  local dir1="$1"
  local dir2="$2"
  local modified_files=()

  if [ ! -d "$dir1" ] && [ ! -d "$dir2" ]; then
    return 1
  fi

  local date1=0
  local date2=0

  if [ -d "$dir1" ]; then
    date1=$(find "$dir1" -type f -printf '%T+ %p\n' | sort -r | head -n 1 | cut -d' ' -f1)
  fi

  if [ -d "$dir2" ]; then
    date2=$(find "$dir2" -type f -printf '%T+ %p\n' | sort -r | head -n 1 | cut -d' ' -f1)
  fi

  if [ "$date1" \> "$date2" ]; then
    echo "1"
  else
    echo "2"
  fi
}

# Función para obtener archivos modificados
get_modified_files() {
  local source="$1"
  local dest="$2"
  local modified_files=()

  if [ -d "$source" ] && [ -d "$dest" ]; then
    # Comparar archivos que existen en ambos directorios
    while IFS= read -r file; do
      if [ -f "$dest/${file#$source/}" ]; then
        if [ "$(stat -c %Y "$file")" != "$(stat -c %Y "$dest/${file#$source/}")" ]; then
          modified_files+=("${file#$source/}")
        fi
      else
        modified_files+=("${file#$source/}")
      fi
    done < <(find "$source" -type f)
  elif [ -d "$source" ]; then
    # Si solo existe el directorio fuente, todos los archivos son nuevos
    while IFS= read -r file; do
      modified_files+=("${file#$source/}")
    done < <(find "$source" -type f)
  elif [ -d "$dest" ]; then
    # Si solo existe el directorio destino, todos los archivos son nuevos
    while IFS= read -r file; do
      modified_files+=("${file#$dest/}")
    done < <(find "$dest" -type f)
  fi

  printf '%s\n' "${modified_files[@]}"
}

# Función para sincronizar basado en fecha
sync_by_date() {
  local source="$1"
  local dest="$2"
  local name="$3"

  echo "Checking $name..."
  echo "----------------------------------------"

  local latest=$(get_latest_modification "$source" "$dest")
  local modified_files=($(get_modified_files "$source" "$dest"))

  # if [ ${#modified_files[@]} -gt 0 ]; then
  #   echo "Modified files:"
  #   printf '  - %s\n' "${modified_files[@]}"
  # fi

  if [ "$latest" = "1" ]; then
    echo "$name: System config is newer, copying to external configs..."
    if [ ! -d "$dest" ]; then
      mkdir -p "$dest"
    fi
    rm -rf "$dest"/*
    cp -r "$source"/* "$dest"
  elif [ "$latest" = "2" ]; then
    echo "$name: External config is newer, copying to system..."
    if [ ! -d "$source" ]; then
      mkdir -p "$source"
    fi
    rm -rf "$source"/*
    cp -r "$dest"/* "$source"
  else
    echo "$name: No changes detected"
  fi
  echo "----------------------------------------"
  echo
}

# Función para sincronizar todo
sync_all() {
  echo "Syncing all configurations based on modification dates..."
  echo

  # Rofi
  sync_by_date "$HOME_CONFIG/rofi" "$CONFIG/rofi" "Rofi"

  # Waybar
  sync_by_date "$HOME_CONFIG/waybar" "$CONFIG/waybar" "Waybar"

  # Kitty
  sync_by_date "$HOME_CONFIG/kitty" "$CONFIG/kitty" "Kitty"

  # Wallust
  sync_by_date "$HOME_CONFIG/wallust" "$CONFIG/wallust" "Wallust"

  # Themes
  sync_by_date "$HOME_CONFIG/gtk-2.0" "$CONFIG/gtk-2.0" "GTK 2.0"
  sync_by_date "$HOME_CONFIG/gtk-3.0" "$CONFIG/gtk-3.0" "GTK 3.0"
  sync_by_date "$HOME_CONFIG/gtk-4.0" "$CONFIG/gtk-4.0" "GTK 4.0"
  sync_by_date "$HOME_CONFIG/Kvantum" "$CONFIG/Kvantum" "Kvantum"

  # Hyprshade
  sync_by_date "/usr/share/hyprshade" "$CONFIG/hyprshade" "Hyprshade"

  # Keyd
  sync_by_date "/etc/keyd" "$CONFIG/keyd" "Keyd"

  # zsh
  sync_by_date "~/.oh-my-zsh/custom/plugins" "$CONFIG/zsh/plugins" "Zsh Plugins"
  sync_by_date "~/.oh-my-zsh/custom/themes" "$CONFIG/zsh/themes"  "Zsh Themes"
  sync_by_date "~/.zshrc" "$CONFIG/zsh" "Zsh"

  read -p "Done. Press Enter to continue..."
}

main() {
  while true; do
    menu
    read -p "Select an option: " option

    case $option in
    1)
      sync_all
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
