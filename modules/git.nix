{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "fionnbennett06@gmail.com";
        name = "Pint Sized";
      };
      extraConfig.init.defaultBranch = "main";
    };
  };
  home.file.".gitconfig".text = ''
    [user]
    name = Pint Sized
    email = fionnbennett06@gmail.com
  '';
}
