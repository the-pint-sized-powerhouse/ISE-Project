{ inputs, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  imports = [
    ./binds.nix
    ./input.nix
    ./general.nix
    ./plugins.nix
    ./pyprland.nix
    ./startup.nix
    ./variables.nix
  ];
}
