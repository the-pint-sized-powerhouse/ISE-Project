{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages =
    (with pkgs; [
      cartridges
      liquidctl
      openrazer-daemon
      polychromatic
      protonup
      openrgb-with-all-plugins
      cartridges
    ])
    ++ (with pkgs-unstable; [
      adwsteamgtk
      lm_sensors
      vintagestory
    ]);

  services.flatpak = {
    packages = [
    ];
  };

  programs = {
    coolercontrol = {
      enable = true;
    };
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
      };
    };
    gamemode = {
      enable = true;
    };

    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
