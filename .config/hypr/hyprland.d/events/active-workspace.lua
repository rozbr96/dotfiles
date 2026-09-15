---@param workspace HL.Workspace
local function handleActiveWorspaceChange(workspace)
  hl.exec_cmd('eww update active-workspace-id=' .. workspace.id)
end

---@param monitor HL.Monitor
local function handleActiveMonitorChange(monitor)
  local workspaces = hl.get_workspaces()

  for _, workspace in ipairs(workspaces) do
    if workspace.active and workspace.monitor.id == monitor.id then
      handleActiveWorspaceChange(workspace)
      break
    end
  end
end

hl.on('workspace.active', handleActiveWorspaceChange)
hl.on('monitor.focused', handleActiveMonitorChange)
