#!/bin/zsh

~/.bin/hyprland/get_existing_windows.py | wofi --dmenu --gtk-dark -o $PRIMARY_MONITOR | {
  read -r title

  [[ ! -n $title ]] && exit

  hyprctl dispatch focuswindow title:"$title"
}
