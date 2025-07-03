
command="grim"
filename="$(xdg-user-dir PICTURES)/screenshots/$(date +%FT%T).png"
file=$(basename "$filename")


case "$1" in
  window)
    title="Window screenshot taken"
    command="$command -g \"$(~/.bin/hyprland/get_active_window_coords)\""
  ;;

  monitor)
    title="Current monitor screenshot taken"
    command="$command -o $(~/.bin/hyprland/get_active_monitor)"
  ;;

  region)
    title="Selection screenshot taken"
    command="$command -g \"$(slurp)\""
  ;;
  full)
    title="Full screenshot taken"
  ;;
  *) exit 1 ;;
esac


case "$2" in
  file|both) command="$command \"$filename\"" ;;
  clipboard) command="$command - | wl-copy" ;;
  *) exit 1 ;;
esac


eval $command


case "$2" in
  file) message="Saved as $file" ;;
  clipboard) message="Copied to clipboard" ;;
  both)
    wl-copy < $filename
    message="Copied to clipboard\n\nSaved as $file"
  ;;
esac

notify-send "$title" "$message"
