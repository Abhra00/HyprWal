#!/usr/bin/env bash
#  ┏┓┓┏┓ ┏┏┓┓ 
#  ┃┃┗┫┃┃┃┣┫┃ 
#  ┣┛┗┛┗┻┛┛┗┗┛
#             

# choose cureent wallpaper
wallpaper_path=$(readlink "$HOME/.current_wallpaper")

check_file() {
   
  if [ ! -f "$1" ]; then
    echo "File $1 not found!"
    exit 1
  fi
}

check_file "$wallpaper_path"

# generate colors
for opt in $@; do
  case "$opt" in
      no-tty)
        # Do not change terminal colors
        sleep 0.2
        wal -i "$wallpaper_path" -s -t --cols16
      ;;
      *)
        sleep 0.2
        wal -i "$wallpaper_path" -n --cols16
      ;;
  esac
done

# convert and resize the current wallpaper as blurry wallpaper & make it image for rofi

magick "$wallpaper_path" -resize 75% -blur "60x60" $HOME/.config/rofi/images/currentWal.jpg

