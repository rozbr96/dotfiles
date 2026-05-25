local workspaces = {
  { workspace = '1', default_name = '一', monitor = 'eDP-1' },
  { workspace = '2', default_name = '二', monitor = 'DP-1' },
  { workspace = '2', default_name = '二', monitor = 'DP-2' },
  { workspace = '3', default_name = '三', monitor = 'HDMI-A-1' },
  { workspace = '4', default_name = '四' },
  { workspace = '5', default_name = '五' },
  { workspace = '6', default_name = '六' },
  { workspace = '7', default_name = '七' },
  { workspace = '8', default_name = '八' },
  { workspace = '9', default_name = '九' },
  { workspace = '10', default_name = '十' },
}

for _, workspace in ipairs(workspaces) do
  hl.workspace_rule(workspace)
end
