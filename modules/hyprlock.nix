{ config, userSettings, ... }:

{
  programs.hyprlock = {
    enable = true;
    extraConfig = with config.lib.stylix.colors; ''
      # BACKGROUND
      background {
          monitor =
          path = screenshot
          blur_passes = 2
          blur_size = 5
          contrast = 1.17
      }

      # GENERAL
      general {
          grace = 0
          disable_loading_bar = false
          immediate_render = true
      }


      # Day
      label {
          monitor =
          text = cmd[update:1000] echo -e "$(date +"%A")"
          color = rgba(${base07-rgb-r}, ${base07-rgb-g}, ${base07-rgb-b}, 0.70)
          font_size = 90
          font_family = ${userSettings.fontSerif}
          position = 0, 350
          halign = center
          valign = center
      }

      # Date-Month
      label {
          monitor =
          text = cmd[update:1000] echo -e "$(date +"%d %B")"
          color = rgba(${base07-rgb-r}, ${base07-rgb-g}, ${base07-rgb-b}, 0.70)
          font_size = 40
          font_family = ${userSettings.fontSerif}
          position = 0, 250
          halign = center
          valign = center
      }

      # Time
      label {
          monitor =
          text = cmd[update:1000] echo "<span>$(date +"- %I:%M -")</span>"
          color = rgba(${base07-rgb-r}, ${base07-rgb-g}, ${base07-rgb-b}, 0.70)
          font_size = 20
          font_family = ${userSettings.fontSerif}
          position = 0, 190
          halign = center
          valign = center
      }

      # Profie-Photo
      image {
          monitor =
          path = ~/.dotfiles/wallpapers/wynnie-profile-pic.jpeg
          border_size = 2
          border_color = rgba(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b}, 0.65)
          size = 130
          rounding = -1
          rotate = 0
          reload_time = -1
          reload_cmd = 
          position = 0, 40
          halign = center
          valign = center
      }

      # USER-BOX
      shape {
          monitor =
          size = 300, 60
          color = rgba(${base01-rgb-r}, ${base01-rgb-g}, ${base01-rgb-b}, 0.1)
          rounding = -1
          border_size = 1
          border_color = rgba(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b}, 0)
          rotate = 0
          xray = false # if true, make a "hole" in the background (rectangle of specified size, no rotation)
          position = 0, -130
          halign = center
          valign = center
      }

      # USER
      label {
          monitor =
          text =   $USER
          color = rgba(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b}, 0.80)
          outline_thickness = 2
          dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          font_size = 18
          font_family = 0xProto Nerd Font
          position = 0, -130
          halign = center
          valign = center
      }

      # INPUT FIELD
      input-field {
          monitor =
          size = 300, 60
          outline_thickness = 2
          dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true
          outer_color = rgba(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b}, 0)
          inner_color = rgba(${base01-rgb-r}, ${base01-rgb-g}, ${base01-rgb-b}, 0.1)
          font_color = rgb(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b})
          fade_on_empty = false
          font_family = 0xProto Nerd Font
          placeholder_text = <i><span foreground="##${base05-hex}"> Enter Pass</span></i>
          hide_input = false
          position = 0, -210
          halign = center
          valign = center
      }

      # Power
      label {
          monitor =
          text = 󰐥  󰜉  󰤄
          color = rgba(${base07-rgb-r}, ${base07-rgb-g}, ${base07-rgb-b}, 0.6)
          font_size = 50
          position = 0, 100
          halign = center
          valign = bottom
      }
    '';
  };
}
