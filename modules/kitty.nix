{ config, ... }:

{
  # ------- KITTY ------- #
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      cursor_trail = 3;
    };
  };
  home.file = {
    ".config/kitty/kitty-cava.conf" = {
      text = with config.lib.stylix.colors; ''
        font_family 0xProto Nerd Font Mono
        font_size 10
        shell_integration no-rc
        background_opacity 0
        confirm_os_window_close 0
        active_tab_background #${base00-hex}
        active_tab_foreground #${base05-hex}
        inactive_tab_background #${base01-hex}
        inactive_tab_foreground #${base04-hex}
        tab_bar_background #${base01-hex}

        # The 16 terminal colors
        # normal
        color0 #${base00-hex}
        color1 #${base08-hex}
        color2 #${base0B-hex}
        color3 #${base0A-hex}
        color4 #${base0D-hex}
        color5 #${base0E-hex}
        color6 #${base0C-hex}
        color7 #${base05-hex}

        # bright
        color8 #${base02-hex}
        color9 #${base08-hex}
        color10 #${base0B-hex}
        color11 #${base0A-hex}
        color12 #${base0D-hex}
        color13 #${base0E-hex}
        color14 #${base0C-hex}
        color15 #${base07-hex}

      '';
    };
  };
}
