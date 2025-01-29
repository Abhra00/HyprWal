#!/usr/bin/env bash
#  ┳┓┏┓┏┓┳┓┏┓┏┓┓┏
#  ┣┫┣ ┣ ┣┫┣ ┗┓┣┫
#  ┛┗┗┛┻ ┛┗┗┛┗┛┛┗
#                


# kill already running processes
_ps=(waybar rofi swaync)
for _prs in "${_ps[@]}"; do
    if pidof "${_prs}" >/dev/null; then
        pkill "${_prs}"
    fi
done

# relaunch waybar
sleep 0.2
waybar > /dev/null 2>&1 &

# relaunch swaync
sleep 0.2
swaync > /dev/null 2>&1 &

# for cava pywal colors
cp -r "$HOME/.cache/wal/cava-config.cava" "$HOME/.config/cava/config" || true

# refresh pywal colors for firefox
pywalfox update

# refresh spotify colors
source $HOME/.config/spicetify/Themes/pywal/changecolors.sh

# sourcing pywal colors ls and fzf
source $HOME/.cache/wal/colors.sh 

# refreshing cava
pkill -USR2 cava || cava -p $HOME/.config/cava/config

exit 0


