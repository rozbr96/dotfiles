hl.bind(HYPR.vars.mainMod .. ' + E', hl.dsp.exec_cmd(HYPR.vars.fileManager))
hl.bind(HYPR.vars.mainMod .. ' + W', hl.dsp.exec_cmd(HYPR.vars.browser))
hl.bind(HYPR.vars.mainMod .. ' + Return', hl.dsp.exec_cmd(HYPR.vars.terminal))
hl.bind('CONTROL + SHIFT + Escape', hl.dsp.exec_cmd(HYPR.vars.terminal .. ' -e btop'))
hl.bind(HYPR.vars.mainMod .. ' + C',
  hl.dsp.exec_cmd('cliphist list | wofi --dmenu --gtk-dark | cliphist decode | wl-copy'))
hl.bind(HYPR.vars.mainMod .. ' + Period', hl.dsp.exec_cmd('wofi-emoji'))
