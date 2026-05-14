hl.config({
  general = { layout = 'master' },
  master = { orientation = 'center' },
})

hl.bind(HYPR.keys.mod .. ' + Q', hl.dsp.window.kill())

hl.bind(HYPR.keys.mod .. ' + left', hl.dsp.focus({ direction = 'l' }))
hl.bind(HYPR.keys.mod .. ' + right', hl.dsp.focus({ direction = 'r' }))
hl.bind(HYPR.keys.mod .. ' + up', hl.dsp.focus({ direction = 'u' }))
hl.bind(HYPR.keys.mod .. ' + down', hl.dsp.focus({ direction = 'd' }))

hl.bind(HYPR.keys.mod .. ' + J', hl.dsp.focus({ direction = 'l' }))
hl.bind(HYPR.keys.mod .. ' + L', hl.dsp.focus({ direction = 'r' }))
hl.bind(HYPR.keys.mod .. ' + I', hl.dsp.focus({ direction = 'u' }))
hl.bind(HYPR.keys.mod .. ' + K', hl.dsp.focus({ direction = 'd' }))

hl.bind(HYPR.keys.mod .. ' + SHIFT + left', hl.dsp.window.move({ direction = 'l' }))
hl.bind(HYPR.keys.mod .. ' + SHIFT + right', hl.dsp.window.move({ direction = 'r' }))
hl.bind(HYPR.keys.mod .. ' + SHIFT + up', hl.dsp.window.move({ direction = 'u' }))
hl.bind(HYPR.keys.mod .. ' + SHIFT + down', hl.dsp.window.move({ direction = 'd' }))

hl.bind(HYPR.keys.mod .. ' + SHIFT + J', hl.dsp.window.move({ direction = 'l' }))
hl.bind(HYPR.keys.mod .. ' + SHIFT + L', hl.dsp.window.move({ direction = 'r' }))
hl.bind(HYPR.keys.mod .. ' + SHIFT + I', hl.dsp.window.move({ direction = 'u' }))
hl.bind(HYPR.keys.mod .. ' + SHIFT + K', hl.dsp.window.move({ direction = 'd' }))

for i = 1, 10 do
  local key = i % 10
  hl.bind(HYPR.keys.mod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end
