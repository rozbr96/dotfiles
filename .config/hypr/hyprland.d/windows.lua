---@type HL.WindowRuleSpec[]
local windowRules = {
  {
    match = { class = 'mpv' },
    float = true,
  },
}

for _, windowRule in ipairs(windowRules) do
  hl.window_rule(windowRule)
end
