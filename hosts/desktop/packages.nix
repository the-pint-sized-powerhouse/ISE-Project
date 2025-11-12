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
      protonup
      openrgb-with-all-plugins
    ])
    ++ (with pkgs-unstable; [
      lm_sensors
      vintagestory
    ]);

  #services.flatpak = {
  #packages = [];
  #};

  programs = {
    coolercontrol = {
      enable = true;
      nvidiaSupport = true;
    };
    gamemode.enable = true;
    steam.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
  };
}
