#!/bin/zsh


command="grim"
filename="$(xdg-user-dir PICTURES)/screenshots/$(date).png"


case "$1" in
  window) command="$command -g \"$(~/.bin/hyprland/get_active_window_coords)\"" ;;
  monitor) command="$command -o $(~/.bin/hyprland/get_active_monitor)" ;;
  region) command="$command -g \"$(slurp)\"" ;;
  full) ;;
  *) exit 1 ;;
esac


case "$2" in
  file|both) command="$command \"$filename\"" ;;
  clipboard) command="$command - | wl-copy" ;;
  *) exit 1 ;;
esac


eval $command


if [ "$2" = "both" ]; then
  wl-copy < $filename
fi

