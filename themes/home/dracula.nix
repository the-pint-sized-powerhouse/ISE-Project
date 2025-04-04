{ pkgs, ... }:

{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    targets.cava.rainbow.enable = true;
  };

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "dracula";
    };
    fish.functions = {
      fish_greeting = "pokeget noibat --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Dracula
      '';
    };
  };
}
