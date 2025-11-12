{
  programs.nixvim.config = {
    clipboard = {
      providers.wl-copy.enable = true;
    };

    extraConfigLuaPost = ''
      vim.wo.fillchars='eob: '
    '';

    opts = {
      number = false;
      textwidth = 0;
      wrapmargin = 0;
      laststatus = 0;
      relativenumber = false;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      showtabline = 1;
      expandtab = true;
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;
      cursorline = false;
      scrolloff = 2;
      mouse = "a";
      foldmethod = "manual";
      foldenable = false;
      linebreak = true;
      spell = false;
      swapfile = false;
      termguicolors = true;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      cmdheight = 0;
    };
  };
}
