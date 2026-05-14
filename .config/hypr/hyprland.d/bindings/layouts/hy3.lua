hl.bind(HYPR.vars.mainMod .. " + Q", hl.dsp.exec_cmd("hyprctl dispatch hy3:killactive"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + Space", hl.dsp.exec_cmd("hyprctl dispatch hy3:togglefocuslayer"))

hl.bind(HYPR.vars.mainMod .. " + A", hl.dsp.exec_cmd("hyprctl dispatch hy3:changefocus raise"))
hl.bind(HYPR.vars.mainMod .. " + S", hl.dsp.exec_cmd("hyprctl dispatch hy3:changefocus lower"))

hl.bind(HYPR.vars.mainMod .. " + V", hl.dsp.exec_cmd("hyprctl dispatch hy3:makegroup v"))
hl.bind(HYPR.vars.mainMod .. " + H", hl.dsp.exec_cmd("hyprctl dispatch hy3:makegroup h"))
hl.bind(HYPR.vars.mainMod .. " + T", hl.dsp.exec_cmd("hyprctl dispatch hy3:changegroup toggletab"))
hl.bind(HYPR.vars.mainMod .. " + Z", hl.dsp.exec_cmd("hyprctl dispatch hy3:changegroup opposite"))

hl.bind(HYPR.vars.mainMod .. " + left", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus l"))
hl.bind(HYPR.vars.mainMod .. " + right", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus r"))
hl.bind(HYPR.vars.mainMod .. " + up", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus u"))
hl.bind(HYPR.vars.mainMod .. " + down", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus d"))

hl.bind(HYPR.vars.mainMod .. " + L", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus r"))
hl.bind(HYPR.vars.mainMod .. " + K", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus d"))
hl.bind(HYPR.vars.mainMod .. " + J", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus l"))
hl.bind(HYPR.vars.mainMod .. " + I", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus u"))

hl.bind(HYPR.vars.mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow r"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + J", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow l"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow u"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow d"))

hl.bind(HYPR.vars.mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow r"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + left", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow l"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + up", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow u"))
hl.bind(HYPR.vars.mainMod .. " + SHIFT + down", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow d"))

for i = 1, 10 do
  local key = i % 10
  hl.bind(HYPR.vars.mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd("hyprctl dispatch hy3:movetoworkspace " .. i))
end
