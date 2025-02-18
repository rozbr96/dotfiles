#!/bin/env zsh

function event_data() {
  echo "$1" | awk -F '>>' '{ print $2 }'
}

function active_monitor() {
  hyprctl monitors -j | jq '.[] | select(.focused == true) | .id'
}

function handle_kb_layout_change() {
  layout=$(echo "$1" | sed 's/.*(\(.*\))$/\1/' | tr 'A-Z' 'a-z')

  eww open kb-layout --duration 1s --arg layout="$layout" --arg monitor="$(eww get current-monitor)"
}

function handle_focused_mon_change() {
  eww update current-monitor="$(active_monitor)"
}

function handle_workspace_change() {
  eww update current-workspaces="$(hyprctl workspaces -j | jq "[ sort | .[] | select(.monitorID == $(eww get primary-monitor-id)) ]")"
  eww update current-active-workspace="$(hyprctl activeworkspace -j)"
}

function handle_monitors_change() {
  eww update primary-monitor-id=$(hyprctl monitors -j | jq 'sort_by(-.id) | .[0].id')
  eww close-all
  sleep 5 # TODO workaround
  eww open bottom-center-bar --screen $(eww get primary-monitor-id)
}

function handle() {
  case $1 in
    activelayout*)
      handle_kb_layout_change "$(event_data "$1")" 
    ;;

    focusedmonv2*)
      handle_focused_mon_change
    ;;

    workspacev2*)
      handle_workspace_change
    ;;

    monitorremoved*|monitoradded*)
      handle_monitors_change
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
