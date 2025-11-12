{pkgs, ...}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-venom.yaml";
    targets.cava.rainbow.enable = true;
  };

  programs = {
    fish.functions = {
      fish_greeting = "pokeget duskull --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Black Metal Venom"
      '';
    };
  };
}
