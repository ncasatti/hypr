#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Scripts for refreshing ags waybar, rofi, swaync, wallust

SCRIPTSDIR=$HOME/.config/hypr/scripts

# Define file_exists function
file_exists() {
    if [ -e "$1" ]; then
        return 0  # File exists
    else
        return 1  # File does not exist
    fi
}

# Kill already running processes
_ps=(waybar rofi swaync ags)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}"
    fi
done

# quit ags
ags -q

sleep 0.3
#Restart waybar
waybar &

# relaunch swaync
sleep 0.5
swaync > /dev/null 2>&1 &

# relaunch ags
ags &

# Relaunching rainbow borders if the script exists
if file_exists "${SCRIPTSDIR}/theme/rainbow-borders.sh"; then
    ${SCRIPTSDIR}/theme/rainbow-borders.sh &
fi

hyprshade toggle vibrance

exit 0