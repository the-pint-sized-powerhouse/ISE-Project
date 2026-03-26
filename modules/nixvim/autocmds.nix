{
  # commands to be executed upon opening a new instance of NeoVim
  programs.nixvim.config.autoCmd = [
    {
      command = "set laststatus=0";
      event = [
        "VimEnter"
        "BufEnter"
        "BufWinEnter"
      ];
    }
    {
      command = "set nowrap";
      event = [
        "VimEnter"
        "BufEnter"
        "BufWinEnter"
      ];
    }
  ];
}
