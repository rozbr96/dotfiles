{
  pkgs,
  config,
  inputs,
  ...
}:
let
  user = "rasp";
  home = "/home/${user}";
in
{
  home = {
    username = user;
    homeDirectory = home;

    stateVersion = "26.05";

    file = {
      ".config/i3".source = config.lib.file.mkOutOfStoreSymlink "${inputs.self}/.config/i3";
    };

    packages = with pkgs; [
      brave
      kitty
    ];
  };
}
