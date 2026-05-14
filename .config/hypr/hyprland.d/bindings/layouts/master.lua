if false then
  hl.config({
    general = { layout = 'master' },
    master = { orientation = 'center' },
  })

  hl.bind(HYPR.vars.mainMod .. ' + Q', hl.dsp.exec_cmd('hyprctl dispatch killactive'))

  hl.bind(HYPR.vars.mainMod .. ' + left', hl.dsp.exec_cmd('hyprctl dispatch movefocus l'))
  hl.bind(HYPR.vars.mainMod .. ' + right', hl.dsp.exec_cmd('hyprctl dispatch movefocus r'))
  hl.bind(HYPR.vars.mainMod .. ' + up', hl.dsp.exec_cmd('hyprctl dispatch movefocus u'))
  hl.bind(HYPR.vars.mainMod .. ' + down', hl.dsp.exec_cmd('hyprctl dispatch movefocus d'))

  hl.bind(HYPR.vars.mainMod .. ' + J', hl.dsp.exec_cmd('hyprctl dispatch movefocus l'))
  hl.bind(HYPR.vars.mainMod .. ' + L', hl.dsp.exec_cmd('hyprctl dispatch movefocus r'))
  hl.bind(HYPR.vars.mainMod .. ' + I', hl.dsp.exec_cmd('hyprctl dispatch movefocus u'))
  hl.bind(HYPR.vars.mainMod .. ' + K', hl.dsp.exec_cmd('hyprctl dispatch movefocus d'))

  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + left', hl.dsp.exec_cmd('hyprctl dispatch movewindow l'))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + right', hl.dsp.exec_cmd('hyprctl dispatch movewindow r'))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + up', hl.dsp.exec_cmd('hyprctl dispatch movewindow u'))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + down', hl.dsp.exec_cmd('hyprctl dispatch movewindow d'))

  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + J', hl.dsp.exec_cmd('hyprctl dispatch movewindow l'))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + L', hl.dsp.exec_cmd('hyprctl dispatch movewindow r'))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + I', hl.dsp.exec_cmd('hyprctl dispatch movewindow u'))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + K', hl.dsp.exec_cmd('hyprctl dispatch movewindow d'))

  for i = 1, 10 do
    local key = i % 10
    hl.bind(HYPR.vars.mainMod .. ' + SHIFT + ' .. key, hl.dsp.exec_cmd('hyprctl dispatch movetoworkspace ' .. i))
  end
end
