{
  stylix = {
    base16Scheme = {
      base00 = "1a1a1a"; # Deep black iron
      base01 = "2a2a2a"; # Dark steel
      base02 = "3f3f3f"; # Gunmetal
      base03 = "606060"; # Rivet gray
      base04 = "808080"; # Cog silver
      base05 = "c0c0c0"; # Polished metal
      base06 = "e0e0e0"; # Sacred parchment
      base07 = "f8f8f8"; # Luminous white light
      base08 = "8c1d1d"; # Martian red
      base09 = "b25c26"; # Burnished brass
      base0A = "d7c27d"; # Aged parchment
      base0B = "4d7c4d"; # Oxidized green
      base0C = "3d8f8f"; # Techno-glow teal
      base0D = "325ca8"; # Arcane blue
      base0E = "7c4ba8"; # Mystical purple
      base0F = "a67c52"; # Sacred oil / bronze
    };
    targets.cava.rainbow.enable = true;
  };

  programs = {
    fish.functions = {
      fish_greeting = "pokeget oddish --hide-name | fastfetch --file-raw -";
    };
  };

  home.file = {
    ".config/fastfetch/theme" = {
      executable = true;
      text = ''
        echo "Atelier Dune Light"
      '';
    };
  };
}
