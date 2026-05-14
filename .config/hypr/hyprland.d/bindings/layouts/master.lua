if false then
  hl.config({
    general = { layout = 'master' },
    master = { orientation = 'center' },
  })

  hl.bind(HYPR.vars.mainMod .. ' + Q', hl.dsp.window.kill())

  hl.bind(HYPR.vars.mainMod .. ' + left', hl.dsp.focus({ direction = 'l' }))
  hl.bind(HYPR.vars.mainMod .. ' + right', hl.dsp.focus({ direction = 'r' }))
  hl.bind(HYPR.vars.mainMod .. ' + up', hl.dsp.focus({ direction = 'u' }))
  hl.bind(HYPR.vars.mainMod .. ' + down', hl.dsp.focus({ direction = 'd' }))

  hl.bind(HYPR.vars.mainMod .. ' + J', hl.dsp.focus({ direction = 'l' }))
  hl.bind(HYPR.vars.mainMod .. ' + L', hl.dsp.focus({ direction = 'r' }))
  hl.bind(HYPR.vars.mainMod .. ' + I', hl.dsp.focus({ direction = 'u' }))
  hl.bind(HYPR.vars.mainMod .. ' + K', hl.dsp.focus({ direction = 'd' }))

  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + left', hl.dsp.window.move({ direction = 'l' }))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + right', hl.dsp.window.move({ direction = 'r' }))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + up', hl.dsp.window.move({ direction = 'u' }))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + down', hl.dsp.window.move({ direction = 'd' }))

  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + J', hl.dsp.window.move({ direction = 'l' }))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + L', hl.dsp.window.move({ direction = 'r' }))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + I', hl.dsp.window.move({ direction = 'u' }))
  hl.bind(HYPR.vars.mainMod .. ' + SHIFT + K', hl.dsp.window.move({ direction = 'd' }))

  for i = 1, 10 do
    local key = i % 10
    hl.bind(HYPR.vars.mainMod .. ' + SHIFT + ' .. key, hl.dsp.window.move({ workspace = i, follow = false }))
  end
end
