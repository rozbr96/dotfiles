---@param window HL.Window
local handleWindowActivation = function(window)
  if not window then return end
  if not window.address then return end
  if not window.floating then return end

  hl.dispatch(hl.dsp.window.alter_zorder({ mode = 'top', window }))
end

hl.on('window.active', handleWindowActivation)
