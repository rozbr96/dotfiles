local hy3 = hl.plugin.hy3

hl.bind(HYPR.vars.mainMod .. ' + Q', hy3.kill_active())
hl.bind(HYPR.vars.mainMod .. ' + SHIFT + Space', hy3.toggle_focus_layer())

hl.bind(HYPR.vars.mainMod .. ' + A', hy3.change_focus('raise'))
hl.bind(HYPR.vars.mainMod .. ' + S', hy3.change_focus('lower'))

hl.bind(HYPR.vars.mainMod .. ' + V', hy3.make_group('v'))
hl.bind(HYPR.vars.mainMod .. ' + H', hy3.make_group('h'))
hl.bind(HYPR.vars.mainMod .. ' + T', hy3.change_group('toggletab'))
hl.bind(HYPR.vars.mainMod .. ' + Z', hy3.change_group('opposite'))

hl.bind(HYPR.vars.mainMod .. ' + left', hy3.move_focus('l'))
hl.bind(HYPR.vars.mainMod .. ' + right', hy3.move_focus('r'))
hl.bind(HYPR.vars.mainMod .. ' + up', hy3.move_focus('u'))
hl.bind(HYPR.vars.mainMod .. ' + down', hy3.move_focus('d'))

hl.bind(HYPR.vars.mainMod .. ' + L', hy3.move_focus('r'))
hl.bind(HYPR.vars.mainMod .. ' + K', hy3.move_focus('d'))
hl.bind(HYPR.vars.mainMod .. ' + J', hy3.move_focus('l'))
hl.bind(HYPR.vars.mainMod .. ' + I', hy3.move_focus('u'))

hl.bind(HYPR.vars.mainMod .. ' + SHIFT + L', hy3.move_window('r'))
hl.bind(HYPR.vars.mainMod .. ' + SHIFT + J', hy3.move_window('l'))
hl.bind(HYPR.vars.mainMod .. ' + SHIFT + I', hy3.move_window('u'))
hl.bind(HYPR.vars.mainMod .. ' + SHIFT + K', hy3.move_window('d'))

hl.bind(HYPR.vars.mainMod .. ' + SHIFT + right', hy3.move_window('r'))
hl.bind(HYPR.vars.mainMod .. ' + SHIFT + left', hy3.move_window('l'))
hl.bind(HYPR.vars.mainMod .. ' + SHIFT + up', hy3.move_window('u'))
hl.bind(HYPR.vars.mainMod .. ' + SHIFT + down', hy3.move_window('d'))
