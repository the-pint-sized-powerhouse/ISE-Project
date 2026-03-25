{pkgs, ...}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    excludePackages = [
      pkgs.xterm
      pkgs.nano
    ];
    xkb = {
      variant = "";
      layout = "us";
    };
  };
}
