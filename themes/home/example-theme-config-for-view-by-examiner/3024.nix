{pkgs, ...}: {
  # Sets the stylix theme. Theme is imported from the base16-schemes library as a .yaml file. Stylix then applies this theme to all applications
  stylix = {
    base16Scheme = "${pkgs.base16-schemes}/share/themes/3024.yaml";
    targets.cava.rainbow.enable = true;
  };

  programs = {
    # Sets the Pokemon that appears next to the greeting that appears upon opening the terminal. This is an additional piece of "eye candy" as the pokemon chosen matches the colours of the theme
    fish.functions = {
      fish_greeting = "pokeget pidove --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    # creates a basic executable script which can be used by fastfetch in the system greeting to print the name of the theme alongside other system information
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo 3024
      '';
    };
  };
}
