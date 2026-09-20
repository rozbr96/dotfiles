---@type HL.WindowRuleSpec[]
local windowRules = {
  {
    match = { class = 'mpv|kitty' },
    float = true,
  },
}

for _, windowRule in ipairs(windowRules) do
  hl.window_rule(windowRule)
end
