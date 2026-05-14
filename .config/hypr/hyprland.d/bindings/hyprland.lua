hl.bind(HYPR.vars.mainMod .. " + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreen 0"))

for i = 1, 10 do
  local key = i % 10
  hl.bind(HYPR.vars.mainMod .. " + " .. key, hl.dsp.exec_cmd("hyprctl dispatch workspace " .. i))
  hl.bind(HYPR.vars.mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace " .. i))
end

hl.bind(HYPR.vars.mainMod .. " + F12", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace special"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + F12", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special"))
hl.bind("F10", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace special"))
hl.bind("SHIFT + F10", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special"))

hl.bind(HYPR.vars.mainMod .. " + mouse_down", hl.dsp.exec_cmd("hyprctl dispatch workspace m-1"))
hl.bind(HYPR.vars.mainMod .. " + Next", hl.dsp.exec_cmd("hyprctl dispatch workspace m+1"))
hl.bind(HYPR.vars.mainMod .. " + mouse_up", hl.dsp.exec_cmd("hyprctl dispatch workspace m+1"))
hl.bind(HYPR.vars.mainMod .. " + Prior", hl.dsp.exec_cmd("hyprctl dispatch workspace m-1"))

hl.bind(HYPR.vars.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(HYPR.vars.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("ALT + SHIFT + Space", hl.dsp.exec_cmd("hyprctl dispatch togglefloating"))
hl.bind("CONTROL + ALT + Delete", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprctl dispatch pin"))
