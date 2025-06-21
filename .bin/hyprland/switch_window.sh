
~/.bin/hyprland/get_existing_windows.py | wofi --dmenu --gtk-dark -o $PRIMARY_MONITOR | {
  read -r window

  [[ ! -n $window ]] && exit

  window_address=$(echo $window | awk -F ' --- ' '{ print $2 }')

  hyprctl dispatch focuswindow address:"$window_address"
}
