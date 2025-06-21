
hyprctl -j clients | jq -r '.[] | select(.workspace.name | contains("special") | not) | [.title, .address] | join(" --- ")'

