local function handleActiveWorkspacesChange()
  hl.exec_cmd([[
    eww update active-workspaces="$(hyprctl -j workspaces | jq '[ .[] | select(.name | contains("special") | not) ] | sort_by(.id)')"
  ]])
end

hl.on('workspace.created', handleActiveWorkspacesChange)
hl.on('workspace.removed', handleActiveWorkspacesChange)

handleActiveWorkspacesChange()
