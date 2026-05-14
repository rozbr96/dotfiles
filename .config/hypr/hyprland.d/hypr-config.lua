hl.config({
  cursor = {
    no_hardware_cursors = true,
  },

  input = {
    kb_layout = 'us,br',
    kb_variant = '',
    kb_model = '',
    kb_options = 'grp:win_space_toggle',
    kb_rules = '',

    numlock_by_default = true,
    follow_mouse = 1,

    touchpad = {
      natural_scroll = false,
    },

    sensitivity = 0,
  },

  general = {
    gaps_in = 5,
    gaps_out = 5,
    border_size = 2,
    col = {
      active_border = { colors = { 'rgba(33ccffee)', 'rgba(00ff99ee)' }, angle = 45 },
      inactive_border = 'rgba(595959aa)',
    },
    allow_tearing = false,

    layout = 'hy3',
  },

  decoration = {
    rounding = 10,
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
    },
  },

  animations = {
    enabled = true,
  },

  misc = {
    force_default_wallpaper = -1,
  },
})
