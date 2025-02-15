#!/bin/env zsh

function event_data() {
  echo "$1" | awk -F '>>' '{ print $2 }'
}

function active_monitor() {
  hyprctl monitors -j | jq '.[] | select(.focused == true) | .id'
}

function handle_kb_layout_change() {
  layout=$(echo "$1" | sed 's/.*(\(.*\))$/\1/' | tr 'A-Z' 'a-z')

  eww open kb-layout --duration 1s --arg layout="$layout" --arg monitor=$(active_monitor)
}

function handle() {
  case $1 in
    activelayout*)
      handle_kb_layout_change "$(event_data "$1")" 
    ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
