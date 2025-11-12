{userSettings, ...}: {
  home = {
    username = "${userSettings.username}";
    homeDirectory = "/home/${userSettings.username}/";
  };
}
