{pkgs, ...}: {
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/da-one-paper.yaml";
    targets.cava.rainbow.enable = true;
  };

  programs = {
    fish.functions = {
      fish_greeting = "pokeget ducklett --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Da One Paper"
      '';
    };
  };
}
