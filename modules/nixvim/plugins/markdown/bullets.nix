{
  programs.nixvim.plugins.bullets = {
    enable = true;
    settings = {
      enable_in_empty_buffers = 0;
      nested_checkboxes = 0;
      enabled_file_types = [
        "markdown"
        "text"
        "gitcommit"
        "scratch"
      ];
    };
  };
}
