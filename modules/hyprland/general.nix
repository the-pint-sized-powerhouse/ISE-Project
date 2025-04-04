{ config, ... }:

{
  wayland.windowManager.hyprland = with config.lib.stylix.colors; {
    settings = {
      general = {
        gaps_in = 4;
        gaps_out = "0,10,10,10";
        border_size = 3;
        no_focus_fallback = true;
        "col.active_border" = "rgb(${base0E-hex})";
        "col.inactive_border" = "rgb(${base02-hex})";
        resize_on_border = false;
        allow_tearing = true;
        layout = "dwindle";
        snap = {
          enabled = true;
        };
      };

      decoration = {
        rounding = 4;
        active_opacity = 0.8;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          noise = 0;
          new_optimizations = true;
          contrast = 1.17;
          xray = true;
        };
        shadow = {
          enabled = false;
          ignore_window = true;
          range = 50;
          render_power = 4;
          color = "0xee${base00-hex}";
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 8, myBezier, slide"
          "windowsOut, 1, 8, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
        smart_resizing = false;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        font_family = "0xProto Nerd Font";
        animate_manual_resizes = true;
        close_special_on_empty = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
        vfr = true;
      };
      monitor = [
        "DP-2, 1920x1080@240, 0x0, 1"
        "eDP-1, 1920x1080, 0x0, 1"
      ];

      cursor = {
        no_hardware_cursors = true;
        enable_hyprcursor = true;
        no_warps = true;
        inactive_timeout = 10;
      };
      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];
    };
    systemd.variables = [ "--all" ];
  };
}
