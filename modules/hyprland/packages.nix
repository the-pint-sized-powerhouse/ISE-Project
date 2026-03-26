{
  pkgs,
  pkgs-master,
  ...
}: {
  # essentail packages for my desktop environment to function
  home.packages =
    (with pkgs; [
      ulauncher
      kdePackages.qt6ct
      libsForQt5.qt5ct
      swayosd
      swww
      waypaper
      wdisplays
      hyprshot
    ])
    ++ (with pkgs-master; [
      pyprland
    ])
    ++ (with pkgs.hyprlandPlugins; [
      hyprwinwrap
      hyprfocus
      hypr-dynamic-cursors
      borders-plus-plus
      hyprfocus
    ]);
}
