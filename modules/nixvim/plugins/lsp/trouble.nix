{
  programs.nixvim.plugins.trouble = {
    enable = true;
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>xQ";
      action = "<CMD>Trouble qflist toggle<CR>";
      options = {
        desc = "Trouble quifick toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>xL";
      action = "<CMD>Trouble loclist toggle<CR>";
      options = {
        desc = "Trouble loclist toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<CMD>Trouble symbols focus=false<CR>";
      options = {
        desc = "Trouble symbols toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>xx";
      action = "<CMD>Trouble diagnostics toggle<CR>";
      options = {
        desc = "Trouble diagnostics toggle";
      };
    }
    {
      mode = "n";
      key = "[c";
      action = ":lua require('trouble').next {skip_groups = true, jump = true }<CR>";
      options = {
        desc = "Trouble next";
      };
    }
    {
      mode = "n";
      key = "]c";
      action = ":lua require('trouble').prev {skip_groups = true, jump = true }<CR>";
      options = {
        desc = "Trouble prev";
      };
    }
  ];
}
