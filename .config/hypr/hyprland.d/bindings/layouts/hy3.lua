local hy3 = hl.plugin.hy3

hl.bind(HYPR.keys.mod .. ' + Q', hy3.kill_active())
hl.bind(HYPR.keys.mod .. ' + SHIFT + Space', hy3.toggle_focus_layer())

hl.bind(HYPR.keys.mod .. ' + A', hy3.change_focus('raise'))
hl.bind(HYPR.keys.mod .. ' + S', hy3.change_focus('lower'))

hl.bind(HYPR.keys.mod .. ' + V', hy3.make_group('v'))
hl.bind(HYPR.keys.mod .. ' + H', hy3.make_group('h'))
hl.bind(HYPR.keys.mod .. ' + T', hy3.change_group('toggletab'))
hl.bind(HYPR.keys.mod .. ' + Z', hy3.change_group('opposite'))

hl.bind(HYPR.keys.mod .. ' + left', hy3.move_focus('l'))
hl.bind(HYPR.keys.mod .. ' + right', hy3.move_focus('r'))
hl.bind(HYPR.keys.mod .. ' + up', hy3.move_focus('u'))
hl.bind(HYPR.keys.mod .. ' + down', hy3.move_focus('d'))

hl.bind(HYPR.keys.mod .. ' + L', hy3.move_focus('r'))
hl.bind(HYPR.keys.mod .. ' + K', hy3.move_focus('d'))
hl.bind(HYPR.keys.mod .. ' + J', hy3.move_focus('l'))
hl.bind(HYPR.keys.mod .. ' + I', hy3.move_focus('u'))

hl.bind(HYPR.keys.mod .. ' + SHIFT + L', hy3.move_window('r'))
hl.bind(HYPR.keys.mod .. ' + SHIFT + J', hy3.move_window('l'))
hl.bind(HYPR.keys.mod .. ' + SHIFT + I', hy3.move_window('u'))
hl.bind(HYPR.keys.mod .. ' + SHIFT + K', hy3.move_window('d'))

hl.bind(HYPR.keys.mod .. ' + SHIFT + right', hy3.move_window('r'))
hl.bind(HYPR.keys.mod .. ' + SHIFT + left', hy3.move_window('l'))
hl.bind(HYPR.keys.mod .. ' + SHIFT + up', hy3.move_window('u'))
hl.bind(HYPR.keys.mod .. ' + SHIFT + down', hy3.move_window('d'))
