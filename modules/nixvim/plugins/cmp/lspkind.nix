{
  # improves code completions by adding icons
  programs.nixvim.plugins.lspkind = {
    enable = true;
    settings = {
      symbolMap.Copilot = " ";
      extraOptions = {
        maxwidth = 50;
        ellipsis_char = "...";
      };
    };
  };
}
