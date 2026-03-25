{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages =
    (with pkgs; [
      liquidctl
      polychromatic
      protontricks
      protonup-ng
      openrgb-with-all-plugins
    ])
    ++ (with pkgs-unstable; [
      lm_sensors
      vintagestory
    ]);

  programs = {
    coolercontrol.enable = true;
    gamemode.enable = true;
    steam.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
