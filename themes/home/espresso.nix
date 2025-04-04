{ pkgs, ... }:

{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/espresso.yaml";
    targets.cava.rainbow.enable = true;
  };

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "espresso";
    };
    fish.functions = {
      fish_greeting = "pokeget oddish --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Espresso
      '';
    };
  };
}
