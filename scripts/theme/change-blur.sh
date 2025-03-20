#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for changing blurs on the fly

notif="$HOME/.config/swaync/images/bell.png"
scripts="$HOME/.config/hypr/new-scripts"

STATE=$(hyprctl -j getoption decoration:blur:size | jq ".int")

if [ "${STATE}" == "5" ]; then
	hyprctl keyword decoration:blur:size 3
	hyprctl keyword decoration:blur:passes 2
  notify-send -e -u low -i "$notif" "Blur: 3"
elif [ "${STATE}" == "3" ]; then
	hyprctl keyword decoration:blur:size 6
	hyprctl keyword decoration:blur:passes 3
  notify-send -e -u low -i "$notif" "Blur: 6"
elif [ "${STATE}" == "6" ]; then
	hyprctl keyword decoration:blur:size 0
	hyprctl keyword decoration:blur:passes 0
	notify-send -e -u low -i "$notif" "Blur: 0"
else
  hyprctl keyword decoration:blur:size 5
	hyprctl keyword decoration:blur:passes 2
	notify-send -e -u low -i "$notif" "Blur: 5"
fi
