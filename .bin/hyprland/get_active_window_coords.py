
hyprctl -j activewindow | jq -rc '[.at, .size] | map(join(" ")) | join(" ")' | {
  read -d EOF x y width height

  echo ${x},${y} ${width}x${height}
}

