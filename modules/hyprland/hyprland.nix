{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  imports = [
    ./binds.nix
    ./input.nix
    ./general.nix
    ./plugins.nix
    ./pyprland.nix
    ./startup.nix
  ];
}
