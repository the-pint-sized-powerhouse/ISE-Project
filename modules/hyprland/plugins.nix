{
  config,
  pkgs,
  ...
}: {
  # adds plugins to Hyprland and controls their settings
  wayland.windowManager.hyprland = with config.lib.stylix.colors; {
    plugins = [
      pkgs.hyprlandPlugins.hyprwinwrap # allows for applications to be used as the wallpaper, used to make audio visualizer the background
      pkgs.hyprlandPlugins.hyprfocus # makes windows flash when focus is put on them
      pkgs.hyprlandPlugins.hypr-dynamic-cursors # makes cursor tilt from side to side when moved
      pkgs.hyprlandPlugins.borders-plus-plus # makes window borders thicker
    ];
    settings.plugin = {
      hyprfocus = {
        enabled = "yes";
        mode = "shrink";
        shrink_percentage = 0.8;
        in_speed = 0.5;
        out_speed = 3;
      };
      borders-plus-plus = {
        add_borders = 1;
        "col.border_1" = "rgba(${base00-rgb-r}, ${base00-rgb-g}, ${base00-rgb-b}, 0.8)";
        border_size_1 = 10;
        natural_rounding = "on";
      };
      dynamic-cursors = {
        enabled = true;
        mode = "tilt";
        threshold = 2;
        shake.enabled = false;
        tilt = {
          limit = 4000;
          function = "negative_quadratic";
        };
      };
      hyprwinwrap.class = "foot";
    };
  };
}
