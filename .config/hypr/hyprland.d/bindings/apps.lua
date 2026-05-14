hl.bind(HYPR.keys.mod .. ' + E', hl.dsp.exec_cmd(HYPR.programs.file_manager))
hl.bind(HYPR.keys.mod .. ' + W', hl.dsp.exec_cmd(HYPR.programs.browser))
hl.bind(HYPR.keys.mod .. ' + Return', hl.dsp.exec_cmd(HYPR.programs.terminal))
hl.bind('CONTROL + SHIFT + Escape', hl.dsp.exec_cmd(HYPR.programs.terminal .. ' -e ' .. HYPR.programs.task_manager))
hl.bind(HYPR.keys.mod .. ' + C',
  hl.dsp.exec_cmd('cliphist list | wofi --dmenu --gtk-dark | cliphist decode | wl-copy'))
hl.bind(HYPR.keys.mod .. ' + Period', hl.dsp.exec_cmd('wofi-emoji'))
