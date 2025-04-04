{ pkgs-unstable, config, ... }:

{
  programs = {
    librewolf = {
      enable = true;
      package = pkgs-unstable.librewolf;
      profiles."8b2kzims.default" = {
        #profiles."default" = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enable customChrome.cs
          "browser.uidensity" = 0; # Set UI density to normal
          "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
          "browser.theme.dark-private-windows" = false; # Disable private window dark theme
        };
      };
    };
    firefox = {
      enable = true;
      package = pkgs-unstable.librewolf;
      nativeMessagingHosts = [ pkgs-unstable.firefoxpwa ];
      profiles."8b2kzims.default" = {
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.uidensity" = 0; # Set UI density to normal
          "svg.context-properties.content.enabled" = true; # Enable SVG context-propertes
          "browser.theme.dark-private-windows" = false; # Disable private window dark theme
        };
      };
    };
  };
  stylix.targets.librewolf = {
    profileNames = [ "8b2kzims.default" ];
    firefoxGnomeTheme.enable = true;
  };

  home.file.".dotfiles/modules/librewolf/darkreader/src/config/color-schemes.drconf".text =
    with config.lib.stylix.colors; ''
      Default

      DARK
      background: #${base00-hex}
      text: #${base05-hex}

      LIGHT
      background: #${base00-hex}
      text: #${base05-hex}

      ================================

      Catppuccin

      DARK
      background: #1e1e2e
      text: #cdd6f4

      LIGHT
      background: #eff1f5
      text: #4c4f69

      ================================

      Deep Ocean

      DARK
      background: #00222b
      text: #a9b4b4

      LIGHT
      background: #cac5b6
      text: #cdd4d6

      ================================

      Dracula

      DARK
      background: #282b36
      text: #e8e6e3

      ================================

      Everforest

      DARK
      background: #2b3339
      text: #d1c4a9

      LIGHT
      background: #fdf9ed
      text: #5b6971

      ================================

      Github Modern

      DARK
      background: #0d1117
      text: #c9d1d9

      LIGHT
      background: #ffffff
      text: #24292f

      ================================

      Gruvbox

      DARK
      background: #282828
      text: #ebdbb2

      LIGHT
      background: #fbf1c7
      text: #3c3836

      ================================

      Kanagawa

      DARK
      background: #1f1f28
      text: #dcd7ba

      LIGHT
      background: #f4ecca
      text: #1e4887

      ================================

      Material You

      DARK
      background: #1f1b24
      text: #e3e3e3

      LIGHT
      background: #fefbff
      text: #1f1b24

      ================================

      Nord

      DARK
      background: #2e3440
      text: #eceff4

      LIGHT
      background: #eceff4
      text: #3b4252

      ================================

      One Dark

      DARK
      background: #282c34
      text: #abb2bf

      LIGHT
      background: #fafafa
      text: #383a42

      ================================

      Oxocarbon

      DARK
      background: #161616
      text: #f2f4f8

      LIGHT
      background: #f2f4f8
      text: #393939

      ================================

      Rosé Pine

      DARK
      background: #191724
      text: #e0def4

      LIGHT
      background: #faf4ed
      text: #575279

      ================================

      Selenized

      DARK
      background: #103c48
      text: #adbcbc

      LIGHT
      background: #fbf3db
      text: #53676d

      ================================

      Solarized

      DARK
      background: #002b36
      text: #93a1a1

      LIGHT
      background: #fdf6e3
      text: #586e75

      ================================

      Tokyo Night

      DARK
      background: #1a1b26
      text: #a9b1d6

      LIGHT
      background: #d5d6db
      t
    '';
}
