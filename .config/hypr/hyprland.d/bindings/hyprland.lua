hl.bind(HYPR.vars.mainMod .. ' + F', hl.dsp.exec_cmd('hyprctl dispatch fullscreen 0'))

for i = 1, 10 do
  local key = i % 10
  hl.bind(HYPR.vars.mainMod .. ' + ' .. key,  hl.dsp.focus({workspace = i}))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + ' .. key, hl.dsp.window.move({workspace = i, follow = false}))
end

hl.bind('F10', hl.dsp.workspace.toggle_special('special'))
hl.bind('SHIFT + F10', hl.dsp.window.move({ workspace = 'special' }))

hl.bind(HYPR.vars.mainMod .. ' + mouse_down', hl.dsp.focus({ workspace = 'm-1'}))
hl.bind(HYPR.vars.mainMod .. ' + Next', hl.dsp.focus({ workspace = 'm+1'}))
hl.bind(HYPR.vars.mainMod .. ' + mouse_up', hl.dsp.focus({ workspace = 'm+1'}))
hl.bind(HYPR.vars.mainMod .. ' + Prior', hl.dsp.focus({ workspace = 'm-1'}))

hl.bind(HYPR.vars.mainMod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(HYPR.vars.mainMod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

hl.bind('ALT + SHIFT + Space', hl.dsp.window.float({ action = 'toggle' }))
hl.bind(HYPR.vars.mainMod .. ' + SHIFT + S', hl.dsp.window.pin())
