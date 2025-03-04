#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for changing blurs on the fly

notif="$HOME/.config/swaync/images/bell.png"
scripts="$HOME/.config/hypr/new-scripts"

STATE=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

if [ "${STATE}" == "1" ]; then
	hyprctl keyword decoration:blur:size 4
	hyprctl keyword decoration:blur:passes 3
  # notify-send -e -u low -i "$notif" "Less blur"
elif [ "${STATE}" == "3" ]; then
	hyprctl keyword decoration:blur:size 4
	hyprctl keyword decoration:blur:passes 5
  # notify-send -e -u low -i "$notif" "Normal blur"
elif [ "${STATE}" == "5" ]; then
	hyprctl keyword decoration:blur:size 0
	hyprctl keyword decoration:blur:passes 0
	swww kill
else
  hyprctl keyword decoration:blur:size 4
	hyprctl keyword decoration:blur:passes 1
	swww-daemon --format xrgb && swww img "$HOME/.config/rofi/.current_wallpaper" &
	sleep 0.1
	${scripts}/refresh-no-waybar.sh
	# notify-send -e -u low -i "$notif" "Less blur"
fi
