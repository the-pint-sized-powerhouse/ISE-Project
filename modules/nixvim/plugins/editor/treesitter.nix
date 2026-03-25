{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = false;
      indent.enable = true;
      folding.enable = true;
    };
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
}
