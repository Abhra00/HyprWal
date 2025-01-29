#!/usr/bin/env bash
#  ┏┓┓ ┳┏┓┓┏┳┏┓┏┳┓
#  ┃ ┃ ┃┃┃┣┫┃┗┓ ┃ 
#  ┗┛┗┛┻┣┛┛┗┻┗┛ ┻ 
#                 

case $1 in
    d) cliphist list | rofi -dmenu -replace -theme ~/.config/rofi/applets/cliphist.rasi | cliphist delete
       ;;

    w) if [ `echo -e "Clear\nCancel" | rofi -dmenu -theme ~/.config/rofi/applets/cliphist.rasi` == "Clear" ] ; then
            cliphist wipe
       fi
       ;;

    *) cliphist list | rofi -dmenu -replace -theme ~/.config/rofi/applets/cliphist.rasi | cliphist decode | wl-copy
       ;;
esac
