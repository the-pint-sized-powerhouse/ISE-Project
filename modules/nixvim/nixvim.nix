{
  programs.nixvim = {
    enable = true;
  };
  imports = [
    ./autocmds.nix
    ./keymaps.nix
    ./plugins.nix
    ./settings.nix
  ];
}
