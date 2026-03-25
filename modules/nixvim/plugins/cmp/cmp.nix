{
  programs.nixvim = {
    plugins = {
      cmp-emoji.enable = true;
      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental.ghost_text = false;
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet.expand = "luasnip";
          formatting.fields = [
            "kind"
            "abbr"
            "menu"
          ];
          sources = [
            {name = "git";}
            {name = "nvim_lsp";}
            {name = "emoji";}
            {
              name = "buffer"; # text within current buffer
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            {
              name = "path"; # file system paths
              keywordLength = 3;
            }
            {
              name = "luasnip"; # snippets
              keywordLength = 3;
            }
          ];
          window = {
            completion = {
              border = "solid";
            };
            documentation = {
              border = "solid";
            };
          };
          mapping = {
            "<C-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<C-e>" = "cmp.mapping.abort()";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;
      cmp-cmdline.enable = false;
    };
    extraConfigLua = ''
      luasnip = require("luasnip")
      kind_icons = {
        Text = "󰊄",
        Method = " ",
        Function = "󰡱 ",
        Constructor = " ",
        Field = " ",
        Variable = "󱀍 ",
        Class = " ",
        Interface = " ",
        Module = "󰕳 ",
        Property = " ",
        Unit = " ",
        Value = " ",
        Enum = " ",
        Keyword = " ",
        Snippet = " ",
        Color = " ",
        File = "",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
      }

      local cmp = require'cmp'

      cmp.setup.cmdline({'/', "?" }, {
        sources = {
           { name = 'buffer' }
        }
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
           { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
           { name = 'buffer' },
        })
      })

      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
      })
    '';
  };
}
