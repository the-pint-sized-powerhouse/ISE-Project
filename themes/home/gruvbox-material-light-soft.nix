{ pkgs, ... }:

{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-light-soft.yaml";
    targets.cava.rainbow.enable = true;
  };

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "gruvbox-material-light-soft";
    };
    fish.functions = {
      fish_greeting = "pokeget oddish --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Gruvbox Material Light Soft"
      '';
    };
  };
}
