{
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
