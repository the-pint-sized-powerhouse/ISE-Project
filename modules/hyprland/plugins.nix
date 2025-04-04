{
  pkgs-unstable,
  config,
  #hypr-darkwindow,
  ...
}:

{
  wayland.windowManager.hyprland = with config.lib.stylix.colors; {
    plugins = [
      pkgs-unstable.hyprlandPlugins.borders-plus-plus
      pkgs-unstable.hyprlandPlugins.hyprwinwrap
      #pkgs-unstable.hyprlandPlugins.hyprfocus
      pkgs-unstable.hyprlandPlugins.hypr-dynamic-cursors
      #hypr-darkwindow.packages.${pkgs.system}.Hypr-DarkWindow
    ];
    settings.plugin = {
      borders-plus-plus = {
        add_borders = 1;
        "col.border_1" = "rgb(${base00-hex})";
        "col.border_2" = "rgb(${base0E-hex})";
        border_size_1 = 10;
        border_size_2 = -1;
        natural_rounding = "on";
      };
      hyprfocus = {
        enabled = "yes";
        animate_floating = "yes";
        animate_workspacechange = "yes";
        focus_animation = "shrink";
        bezier = [
          "bezIn, 0.5,0.0,1.0,0.5"
          "bezOut, 0.0,0.5,0.5,1.0"
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "realsmooth, 0.28,0.29,.69,1.08"
        ];
        flash = {
          flash_opacity = 0.95;
          in_bezier = "realsmooth";
          in_speed = 0.5;
          out_bezier = "realsmooth";
          out_speed = 3;
        };
        shrink = {
          shrink_percentage = 0.99;
          in_bezier = "realsmooth";
          in_speed = 1;
          out_bezier = "realsmooth";
          out_speed = 2;
        };
      };
      dynamic-cursors = {
        enabled = true;
        mode = "tilt";
        threshold = 2;
        tilt = {
          limit = 4000;
          function = "negative_quadratic";
        };
        shake.enabled = false;
      };
      hyprwinwrap.class = "foot";
    };
  };
}
