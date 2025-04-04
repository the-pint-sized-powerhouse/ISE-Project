{ pkgs, ... }:

{
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/pasque.yaml";
    targets.cava.rainbow.enable = true;
  };

  programs = {
    nixvim.colorschemes.base16 = {
      enable = true;
      colorscheme = "pasque";
    };
    fish.functions = {
      fish_greeting = "pokeget purrloin --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo Pasque
      '';
    };
  };
}
