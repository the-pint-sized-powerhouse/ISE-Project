{
  programs.nixvim = {
    plugins = {
      markdown-preview = {
        enable = true;
        settings = {
          browser = "firefox";
          echo_preview_url = 1;
          port = "6969";
          theme = "dark";
          preview_options = {
            disable_filename = 1;
            disable_sync_scroll = 1;
            sync_scroll_type = "middle";
          };
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>mp";
        action = "<cmd>MarkdownPreview<cr>";
        options.desc = "Toggle Markdown Preview";
      }
    ];
  };
}
