{
  config,
  userSettings,
  ...
}: {
  # ------ ZATHURA ---- #
  programs.zathura = with config.lib.stylix.colors; {
    enable = true;
    options = {
      guioptions = "none";
      font = "${userSettings.fontSerif}";
      default-bg = "#${base00-hex}";
      default-fg = "#${base01-hex}";
      statusbar-fg = "#${base04-hex}";
      statusbar-bg = "#${base02-hex}";
      inputbar-bg = "#${base00-hex}";
      inputbar-fg = "#${base07-hex}";
      notification-bg = "#${base00-hex}";
      notification-fg = "#${base07-hex}";
      notification-error-bg = "#${base00-hex}";
      notification-error-fg = "#${base07-hex}";
      notification-warning-bg = "#${base00-hex}";
      notification-warning-fg = "#${base08-hex}";
      highlight-color = "rgba(${base0A-rgb-r}, ${base0A-rgb-g}, ${base0A-rgb-b}, 0.5)";
      highlight-active-color = "rgba(${base0D-rgb-r}, ${base0D-rgb-g}, ${base0D-rgb-b}, 0.5)";
      completion-bg = "#${base01-hex}";
      completion-fg = "#${base0D-hex}";
      completion-highlight-fg = "#${base07-hex}";
      completion-highlight-bg = "#${base0D-hex}";
      recolor = true;
      recolor-lightcolor = "#${base01-hex}";
      recolor-darkcolor = "#${base06-hex}";
    };
  };
}
