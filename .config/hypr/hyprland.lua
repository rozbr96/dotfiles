File = {
  include = function(filepath)
    dofile('/home/hikari/.config/hypr/hyprland.d/' .. filepath .. '.lua')
  end
}

File.include('vars')
File.include('env')
File.include('monitors')
File.include('hypr-config')
File.include('animations')
File.include('workspaces')
File.include('windows')
File.include('startup')
File.include('events/init')
File.include('bindings/system')
File.include('bindings/apps')
File.include('bindings/multimedia')
File.include('bindings/hyprland')
File.include('layouts/' .. HYPR.layout)
