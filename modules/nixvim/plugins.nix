{
  imports = [
    # Completions
    ./plugins/cmp/autopairs.nix
    ./plugins/cmp/cmp.nix
    ./plugins/cmp/lspkind.nix
    ./plugins/cmp/schemastore.nix

    # Editor plugins
    ./plugins/editor/hmts.nix
    ./plugins/editor/illuminate.nix
    ./plugins/editor/indent-blankline.nix
    ./plugins/editor/navic.nix
    ./plugins/editor/neo-tree.nix
    ./plugins/editor/treesitter.nix

    #LSP
    ./plugins/lsp/conform.nix
    ./plugins/lsp/lsp.nix
    ./plugins/lsp/lspsaga.nix
    ./plugins/lsp/none-ls.nix

    # Markdown
    ./plugins/markdown/markdown-preview.nix
    ./plugins/markdown/render-markdown.nix
    ./plugins/markdown/bullets.nix

    # UI plugins
    ./plugins/ui/colorizer.nix
    ./plugins/ui/lualine.nix
    ./plugins/ui/neoscroll.nix
    ./plugins/ui/noice.nix
    ./plugins/ui/notify.nix
    ./plugins/ui/nui.nix
    ./plugins/ui/startup.nix

    # Utils
    ./plugins/utils/web-devicons.nix
    ./plugins/utils/whichkey.nix
  ];
}
