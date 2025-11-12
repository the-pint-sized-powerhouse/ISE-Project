{
  programs.git = {
    enable = true;
    userName = "Pint Sized";
    userEmail = "fionnbennett06@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  home.file.".gitconfig".text = ''
    [user]
      name = Pint Sized
      email = fionnbennett06@gmail.com
  '';
}
