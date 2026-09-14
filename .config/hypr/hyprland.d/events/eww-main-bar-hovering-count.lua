local overlappings = {}

local mainMonitor = {
  x = 1920,
  y = 240,
  width = 2560,
  height = 1440,
}

local mainBar = {
  x = mainMonitor.x + 0.05 * mainMonitor.width,
  y = mainMonitor.y + 30,
  right = mainMonitor.x + 0.95 * mainMonitor.width,
  bottom = mainMonitor.y + 30 + 60
}

---@param window HL.Window
---@return boolean
local function isOverlappingMainBar(window)
  local x, y = window.at.x, window.at.y
  local width, height = window.size.x, window.size.y
  local right, bottom = x + width, y + height

  if x > mainBar.right then return false end
  if y > mainBar.bottom then return false end
  if right < mainBar.x then return false end
  if bottom < mainBar.y then return false end

  return true
end

local function updateEwwMainBarHoverCount()
  local overlappingsCount = 0
  for _, overlaps in pairs(overlappings) do
    overlappingsCount = overlappingsCount + (overlaps and 1 or 0)
  end

  hl.exec_cmd('eww update main-bar-hover-count=' .. overlappingsCount)
end

---@param window HL.Window | HL.Workspace
---@return boolean
local function validWindow(window)
  if not window.at then return false end
  if not window.size then return false end
  if not window.address then return false end

  return true
end

---@param window HL.Window | nil
local handleMainBarHoverCount = function(window)
  local lastWindow = hl.get_last_window()
  if lastWindow then
    overlappings[lastWindow.address] = false
  end

  if window and validWindow(window) then
    overlappings[window.address] = window.active and isOverlappingMainBar(window)
  end

  updateEwwMainBarHoverCount()
end

local eventsData = {
  window = {
    'open', 'active', 'fullscreen', 'move_to_workspace', 'close', 'destroy', 'kill',
  },
  workspace = {
    'active', 'created', 'removed'
  },
}

for object, events in pairs(eventsData) do
  for _, event in pairs(events) do
    hl.on(object .. '.' .. event, handleMainBarHoverCount)
  end
end
