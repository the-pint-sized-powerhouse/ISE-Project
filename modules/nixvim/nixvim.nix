{
  programs.nixvim = {
    enable = true;
  };
  imports = [
    ./keymaps.nix
    ./plugins.nix
    ./settings.nix
  ];
}
