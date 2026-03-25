{
  inputs,
  pkgs,
  ...
}: {
  programs.spicetify = {
    enable = true;
    enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
      adblock
      shuffle
    ];
  };
}
