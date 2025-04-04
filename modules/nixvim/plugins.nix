{
  imports = [
    # Completions
    ./plugins/cmp/autopairs.nix
    ./plugins/cmp/cmp.nix
    ./plugins/cmp/lspkind.nix
    ./plugins/cmp/schemastore.nix

    # Editor plugins
    ./plugins/editor/illuminate.nix
    ./plugins/editor/indent-blankline.nix
    ./plugins/editor/navic.nix
    ./plugins/editor/neo-tree.nix
    ./plugins/editor/todo-comments.nix
    ./plugins/editor/treesitter.nix

    #LSP
    ./plugins/lsp/conform.nix
    ./plugins/lsp/lsp.nix
    ./plugins/lsp/lspsaga.nix
    ./plugins/lsp/none-ls.nix
    ./plugins/lsp/trouble.nix

    # Markdown
    ./plugins/markdown/markdown-preview.nix
    ./plugins/markdown/render-markdown.nix
    ./plugins/markdown/bullets.nix

    #Org-Mode
    ./plugins/org-mode/neorg.nix

    # Snippets
    ./plugins/snippets/luasnip.nix

    # UI plugins
    ./plugins/ui/bufferline.nix
    ./plugins/ui/lualine.nix
    ./plugins/ui/noice.nix
    ./plugins/ui/notify.nix
    ./plugins/ui/nui.nix
    ./plugins/ui/startup.nix
    ./plugins/ui/colorizer.nix

    # Utils
    ./plugins/utils/fzf-lua.nix
    ./plugins/utils/markdown-preview.nix
    ./plugins/utils/neotest.nix
    ./plugins/utils/telescope.nix
    ./plugins/utils/toggleterm.nix
    ./plugins/utils/web-devicons.nix
    ./plugins/utils/whichkey.nix
    ./plugins/utils/yazi.nix
    ./plugins/utils/neorg.nix
  ];
}
