{
  pkgs,
  userSettings,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "${userSettings.cursorName}";
      size = 16;
    };
    targets.nixos-icons.enable = true;
  };
}
