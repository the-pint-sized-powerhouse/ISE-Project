{
  # ------- KITTY ------- #
  programs.kitty = {
    enable = true;
    shellIntegration.enableFishIntegration = true;
    settings = {
      confirm_os_window_close = 0;
      cursor_trail = 3;
    };
  };
}
