-- Hyprland Lua config mirroring this folder's `.conf` setup.
-- Source of truth (previous): `hyprland.conf` + `hyprland.d/**/*.conf`.

local terminal = "kitty"
local fileManager = "kitty -e ranger"
local browser = "google-chrome-stable"
local menu = "wofi --show run"
local binpath = "~/.local/bin"

-- Environment (`hyprland.d/env.conf`)
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "volantes")
hl.env("EDITOR", "nvim")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvida-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("RANGER_LOAD_DEFAULT_RC", "false")
hl.env("PRIMARY_MONITOR", "DP-2")

-- Monitors (`hyprland.d/monitors.conf`)
hl.monitor({ output = "eDP-1",    mode = "1920x1200", position = "0x360",    scale = 1 })
hl.monitor({ output = "DP-1",     mode = "2560x1440", position = "1920x240", scale = 1 })
hl.monitor({ output = "DP-2",     mode = "2560x1440", position = "1920x240", scale = 1 })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "4480x0",   scale = 1, transform = 1 })

-- Core config (`hyprland.conf`)
hl.config({
    cursor = {
        no_hardware_cursors = true,
    },

    input = {
        kb_layout = "us,br",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:win_space_toggle",
        kb_rules = "",

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
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        allow_tearing = false,

        layout = "hy3",
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

-- Animations (`hyprland.conf`)
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })

-- hy3 plugin
-- In `.conf` this was: `plugin = $LIB_HY3_PATH`
-- The Lua `hl.config()` mapping doesn't seem to support the top-level `plugin` directive,
-- so we load it on startup via `hyprctl` (expects `LIB_HY3_PATH` in the environment).

-- Workspaces (`hyprland.d/workspaces.conf`)
hl.workspace_rule({ workspace = 1,  default_name = "一", monitor = "eDP-1" })
hl.workspace_rule({ workspace = 2,  default_name = "二", monitor = "DP-1" })
hl.workspace_rule({ workspace = 2,  default_name = "二", monitor = "DP-2" })
hl.workspace_rule({ workspace = 3,  default_name = "三", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = 4,  default_name = "四" })
hl.workspace_rule({ workspace = 5,  default_name = "五" })
hl.workspace_rule({ workspace = 6,  default_name = "六" })
hl.workspace_rule({ workspace = 7,  default_name = "七" })
hl.workspace_rule({ workspace = 8,  default_name = "八" })
hl.workspace_rule({ workspace = 9,  default_name = "九" })
hl.workspace_rule({ workspace = 10, default_name = "十" })

-- Startup (`hyprland.d/startup.conf`)
hl.on("hyprland.start", function()
  local hy3_path = os.getenv("LIB_HY3_PATH")
  if hy3_path and hy3_path ~= "" then
      hl.exec_cmd("hyprctl plugin load " .. hy3_path)
  end

  hl.exec_cmd("systemctl --user restart hypr-ipc")
  hl.exec_cmd("systemctl --user restart eww")
  hl.exec_cmd("systemctl --user restart network-monitor")
  hl.exec_cmd("systemctl --user restart volume-monitor")

  hl.exec_cmd("mako")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

-- Keybindings (`hyprland.d/bindings/**/*.conf`)
local mainMod = "SUPER"

-- system.conf
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd(binpath .. "/hyprland/switch_window"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind("CONTROL + ALT + L", hl.dsp.exec_cmd("hyprlock"))

-- apps.conf
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(terminal .. " -e htop"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("cliphist list | wofi --dmenu --gtk-dark | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + Period", hl.dsp.exec_cmd("wofi-emoji"))

-- multimedia.conf
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volume increase sink"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volume decrease sink"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("volume mute sink toggle"))
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("volume increase sink 20"), { repeating = true })
hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("volume decrease sink 20"), { repeating = true })
hl.bind("CONTROL + XF86AudioRaiseVolume", hl.dsp.exec_cmd("volume set sink 100"), { repeating = true })
hl.bind("CONTROL + XF86AudioLowerVOlume", hl.dsp.exec_cmd("volume set sink 50"), { repeating = true })

hl.bind("Print", hl.dsp.exec_cmd(binpath .. "/screenshot.sh monitor both"))
hl.bind("CONTROL + Print", hl.dsp.exec_cmd(binpath .. "/screenshot.sh full both"))
hl.bind("ALT + Print", hl.dsp.exec_cmd(binpath .. "/screenshot.sh window both"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(binpath .. "/screenshot.sh region both"))

-- hyprland.conf binds
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("hyprctl dispatch fullscreen 0"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.exec_cmd("hyprctl dispatch workspace " .. i))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace " .. i))
end

hl.bind(mainMod .. " + F12", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace special"))
hl.bind(mainMod .. " + SHIFT + F12", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special"))
hl.bind("F10", hl.dsp.exec_cmd("hyprctl dispatch togglespecialworkspace special"))
hl.bind("SHIFT + F10", hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace special"))

hl.bind(mainMod .. " + mouse_down", hl.dsp.exec_cmd("hyprctl dispatch workspace m-1"))
hl.bind(mainMod .. " + Next", hl.dsp.exec_cmd("hyprctl dispatch workspace m+1"))
hl.bind(mainMod .. " + mouse_up", hl.dsp.exec_cmd("hyprctl dispatch workspace m+1"))
hl.bind(mainMod .. " + Prior", hl.dsp.exec_cmd("hyprctl dispatch workspace m-1"))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("ALT + SHIFT + Space", hl.dsp.exec_cmd("hyprctl dispatch togglefloating"))
hl.bind("CONTROL + ALT + Delete", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprctl dispatch pin"))

-- hy3 layout binds (`hyprland.d/bindings/layouts/hy3.conf`)
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("hyprctl dispatch hy3:killactive"))
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.exec_cmd("hyprctl dispatch hy3:togglefocuslayer"))

hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("hyprctl dispatch hy3:changefocus raise"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprctl dispatch hy3:changefocus lower"))

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("hyprctl dispatch hy3:makegroup v"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("hyprctl dispatch hy3:makegroup h"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("hyprctl dispatch hy3:changegroup toggletab"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("hyprctl dispatch hy3:changegroup opposite"))

hl.bind(mainMod .. " + left", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus l"))
hl.bind(mainMod .. " + right", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus r"))
hl.bind(mainMod .. " + up", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus u"))
hl.bind(mainMod .. " + down", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus d"))

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus r"))
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus d"))
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus l"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("hyprctl dispatch hy3:movefocus u"))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow r"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow l"))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow u"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow d"))

hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow r"))
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow l"))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow u"))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.exec_cmd("hyprctl dispatch hy3:movewindow d"))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd("hyprctl dispatch hy3:movetoworkspace " .. i))
end

-- Master layout config/binds (`hyprland.d/layouts/master.conf` + `hyprland.d/bindings/layouts/master.conf`)
-- Kept disabled on purpose; flip to `if true` when you want to use master.
if false then
    hl.config({
        general = { layout = "master" },
        master = { orientation = "center" },
    })

    hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("hyprctl dispatch killactive"))

    hl.bind(mainMod .. " + left", hl.dsp.exec_cmd("hyprctl dispatch movefocus l"))
    hl.bind(mainMod .. " + right", hl.dsp.exec_cmd("hyprctl dispatch movefocus r"))
    hl.bind(mainMod .. " + up", hl.dsp.exec_cmd("hyprctl dispatch movefocus u"))
    hl.bind(mainMod .. " + down", hl.dsp.exec_cmd("hyprctl dispatch movefocus d"))

    hl.bind(mainMod .. " + J", hl.dsp.exec_cmd("hyprctl dispatch movefocus l"))
    hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprctl dispatch movefocus r"))
    hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("hyprctl dispatch movefocus u"))
    hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl dispatch movefocus d"))

    hl.bind(mainMod .. " + SHIFT + left", hl.dsp.exec_cmd("hyprctl dispatch movewindow l"))
    hl.bind(mainMod .. " + SHIFT + right", hl.dsp.exec_cmd("hyprctl dispatch movewindow r"))
    hl.bind(mainMod .. " + SHIFT + up", hl.dsp.exec_cmd("hyprctl dispatch movewindow u"))
    hl.bind(mainMod .. " + SHIFT + down", hl.dsp.exec_cmd("hyprctl dispatch movewindow d"))

    hl.bind(mainMod .. " + SHIFT + J", hl.dsp.exec_cmd("hyprctl dispatch movewindow l"))
    hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprctl dispatch movewindow r"))
    hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("hyprctl dispatch movewindow u"))
    hl.bind(mainMod .. " + SHIFT + K", hl.dsp.exec_cmd("hyprctl dispatch movewindow d"))

    for i = 1, 10 do
        local key = i % 10
        hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd("hyprctl dispatch movetoworkspace " .. i))
    end
end
