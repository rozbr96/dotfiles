local function include(filepath)
  File.include('events/' .. filepath)
end

include('eww-main-bar-hovering-count')
include('active-window-focus')
