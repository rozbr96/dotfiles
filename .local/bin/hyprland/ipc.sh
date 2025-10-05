
declare -A active_layouts
layouts=("English (US)" "Portuguese (Brazil)")
layouts_flags=("🇺🇸" "🇧🇷")
active_window=""

update_active_workspace() {
  eww update active-workspace-id=$1
}

handle() {
  echo "$1" | awk -F ">>" '{ print $1 " " $2 }' | read -r event data

  case $event in
    activewindowv2)
      active_window=$data
      active_window_layout=$active_layouts[$active_window]

      if [ ! -z $active_window_layout ]; then
        hyprctl switchxkblayout all $active_window_layout
      fi
    ;;

    activelayout)
      layout="$(echo $data | cut -d',' -f2)"
      layout_index=${layouts[(Ie)$layout]}

      if [ $layout_index -gt 0 ]; then
        layout_name="${layouts[$layout_index]}"
        layout_flag=${layouts_flags[$layout_index]}
        layout_index=$(( $layout_index - 1 ))
        active_layouts[$active_window]=$layout_index

        eww update kb-layout-name="$layout_name"
        eww update kb-layout-flag=$layout_flag
      fi
    ;;

    workspacev2)
      workspace_id=$(echo $data | cut -d',' -f1)

      update_active_workspace $workspace_id
    ;;

    focusedmonv2)
      workspace_id=$(echo $data | cut -d',' -f2)

      update_active_workspace $workspace_id
    ;;

    *)
      echo "Unknown Event: $event"
      echo "Input: $1"
      echo ""
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
