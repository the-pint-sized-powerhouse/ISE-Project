{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      json
      lua
      make
      markdown
      markdown-inline
      nix
      regex
      toml
      vim
      vimdoc
      xml
      yaml
    ];
  };
}
