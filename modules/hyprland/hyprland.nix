{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true; # enables x11 support
  };
  imports = [
    ./binds.nix
    ./input.nix
    ./general.nix
    ./plugins.nix
    ./pyprland.nix
    ./startup.nix
    ./packages.nix
  ];
}
