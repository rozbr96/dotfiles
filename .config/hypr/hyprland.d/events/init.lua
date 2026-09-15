local function include(filepath)
  File.include('events/' .. filepath)
end

include('active-window-focus')
include('active-workspaces')
include('eww-main-bar-hovering-count')
