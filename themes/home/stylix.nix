{
  userSettings,
  pkgs,
  config,
  ...
}: {
  stylix = {
    enable = true;
    image = ./black.jpg;
    cursor = {
      name = userSettings.cursorName;
      package = pkgs.bibata-cursors;
      size = 16;
    };
    fonts = {
      serif = {
        name = "${userSettings.fontMono}";
      };
      sansSerif = {
        name = "${userSettings.fontMono}";
      };
      monospace = {
        name = "${userSettings.fontMono}";
      };
      sizes = {
        terminal = 11;
      };
    };
    targets = {
      hyprland.enable = false;
      waybar.enable = false;
      hyprlock.enable = true;
      gtk.flatpakSupport.enable = true;
      foot.enable = false;
      xresources.enable = true;
      firefox.profileNames = ["8b2kzims.default"];
      zathura.enable = false;
      nixvim = {
        enable = true;
        plugin = "base16-nvim";
      };
    };
  };
  home.file.".colours".text = with config.lib.stylix.colors; ''
    base00  ->  #${base00-hex}  ->   rgb(${base00-rgb-r}, ${base00-rgb-g}, ${base00-rgb-b})
    base01  ->  #${base01-hex}  ->   rgb(${base01-rgb-r}, ${base01-rgb-g}, ${base01-rgb-b})
    base02  ->  #${base02-hex}  ->   rgb(${base02-rgb-r}, ${base02-rgb-g}, ${base02-rgb-b})
    base03  ->  #${base03-hex}  ->   rgb(${base03-rgb-r}, ${base03-rgb-g}, ${base03-rgb-b})
    base04  ->  #${base04-hex}  ->   rgb(${base04-rgb-r}, ${base04-rgb-g}, ${base04-rgb-b})
    base05  ->  #${base05-hex}  ->   rgb(${base05-rgb-r}, ${base05-rgb-g}, ${base05-rgb-b})
    base06  ->  #${base06-hex}  ->   rgb(${base06-rgb-r}, ${base06-rgb-g}, ${base06-rgb-b})
    base07  ->  #${base07-hex}  ->   rgb(${base07-rgb-r}, ${base07-rgb-g}, ${base07-rgb-b})
    base08  ->  #${base08-hex}  ->   rgb(${base08-rgb-r}, ${base08-rgb-g}, ${base08-rgb-b})
    base09  ->  #${base09-hex}  ->   rgb(${base09-rgb-r}, ${base09-rgb-g}, ${base09-rgb-b})
    base0A  ->  #${base0A-hex}  ->   rgb(${base0A-rgb-r}, ${base0A-rgb-g}, ${base0A-rgb-b})
    base0B  ->  #${base0B-hex}  ->   rgb(${base0B-rgb-r}, ${base0B-rgb-g}, ${base0B-rgb-b})
    base0C  ->  #${base0C-hex}  ->   rgb(${base0C-rgb-r}, ${base0C-rgb-g}, ${base0C-rgb-b})
    base0D  ->  #${base0D-hex}  ->   rgb(${base0D-rgb-r}, ${base0D-rgb-g}, ${base0D-rgb-b})
    base0E  ->  #${base0E-hex}  ->   rgb(${base0E-rgb-r}, ${base0E-rgb-g}, ${base0E-rgb-b})
    base0F  ->  #${base0F-hex}  ->   rgb(${base0F-rgb-r}, ${base0F-rgb-g}, ${base0F-rgb-b})
  '';
}
