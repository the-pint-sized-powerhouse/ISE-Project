{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = with config.lib.stylix.colors; {
    plugins = [
      pkgs.hyprlandPlugins.hyprwinwrap
      pkgs.hyprlandPlugins.borders-plus-plus
      pkgs.hyprlandPlugins.csgo-vulkan-fix
      pkgs.hyprlandPlugins.hyprexpo
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
    ];
    settings.plugin = {
      borders-plus-plus = {
        add_borders = 1;
        "col.border_1" = "rgba(${base00-rgb-r}, ${base00-rgb-g}, ${base00-rgb-b}, 0.825)";
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
      hyprexpo = {
        columns = 3;
        gap_size = 5;
        bg_col = "rgb(${base00-hex})";
        workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

        enable_gesture = true; # laptop touchpad
        gesture_fingers = 3; # 3 or 4
        gesture_distance = 300; # how far is the "max"
        gesture_positive = true; # positive = swipe down. Negative = swipe up.
      };
    };
  };
}
