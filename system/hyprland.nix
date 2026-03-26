{pkgs, ...}: {
  # sets WindowManager
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  # Sets display Manager and keyboard layout
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
