{
  #imports = [
  #./userChrome.nix
  #./userContent.nix
  #];
  programs.zen-browser = {
    enable = true;
    profiles = {
      #"default" = {
      #settings = {
      #"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      #};
      #};
      "test1234" = {};
    };
  };
}
