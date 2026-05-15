hl.bind(HYPR.keys.mod .. ' + F', hl.dsp.window.fullscreen())

for i = 1, 10 do
  local key = i % 10
  hl.bind(HYPR.keys.mod .. ' + ' .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(HYPR.keys.mod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind('F10', hl.dsp.workspace.toggle_special('special'))
hl.bind('SHIFT + F10', hl.dsp.window.move({ workspace = 'special' }))

hl.bind(HYPR.keys.mod .. ' + mouse_down', hl.dsp.focus({ workspace = 'm-1' }))
hl.bind(HYPR.keys.mod .. ' + Next', hl.dsp.focus({ workspace = 'm+1' }))
hl.bind(HYPR.keys.mod .. ' + mouse_up', hl.dsp.focus({ workspace = 'm+1' }))
hl.bind(HYPR.keys.mod .. ' + Prior', hl.dsp.focus({ workspace = 'm-1' }))

hl.bind(HYPR.keys.mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(HYPR.keys.mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

hl.bind('ALT + SHIFT + Space', hl.dsp.window.float({ action = 'toggle' }))
hl.bind(HYPR.keys.mod .. ' + SHIFT + S', hl.dsp.window.pin())
