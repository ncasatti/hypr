#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for changing blurs on the fly

notif="$HOME/.config/swaync/images/bell.png"
scripts="$HOME/.config/hypr/new-scripts"

STATE=$(hyprctl -j getoption decoration:blur:size | jq ".int")

if [ "${STATE}" == "5" ]; then
	hyprctl keyword decoration:blur:size 3
	hyprctl keyword decoration:blur:passes 2
  # notify-send -e -u low -i "$notif" "Less blur"
elif [ "${STATE}" == "3" ]; then
	hyprctl keyword decoration:blur:size 6
	hyprctl keyword decoration:blur:passes 2
  # notify-send -e -u low -i "$notif" "Normal blur"
elif [ "${STATE}" == "6" ]; then
	hyprctl keyword decoration:blur:size 0
	hyprctl keyword decoration:blur:passes 0
	# swww kill
else
  hyprctl keyword decoration:blur:size 5
	hyprctl keyword decoration:blur:passes 2
	# swww-daemon --format xrgb && swww img "$HOME/.config/rofi/.current_wallpaper" &
	# sleep 0.1
	# ${scripts}/refresh-no-waybar.sh
	# notify-send -e -u low -i "$notif" "Less blur"
fi
