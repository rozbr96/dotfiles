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
