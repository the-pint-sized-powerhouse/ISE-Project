{
  programs.nixvim.plugins.neotest = {
    enable = true;
    adapters = {
      plenary = {
        enable = true;
      };
    };
  };
}
