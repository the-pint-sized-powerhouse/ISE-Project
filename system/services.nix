{
  # Enables system services
  services = {
    libinput.mouse.accelProfile = "flat";
    udisks2.enable = true;
    hardware.openrgb.enable = true;

    # Sets Flatpak settings using the nix-flatpak module imported in the flake
    flatpak = {
      enable = true;
      update.onActivation = true;
      uninstallUnmanaged = true;
      overrides.global = {
        Environment = {
          XCURSOR_SIZE = "16";
          MOZ_ENABLE_WAYLAND = "1";
          NIX_OZONE_WL = "1";
          NIX_OZONE = "1";
        };
        Context.filesystems = [
          "/usr/share/icons:ro"
          "~/.icons:ro"
          "~/.themes:ro"
          "xdg-data/applications"
          "home"
        ];
      };
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      jack.enable = true;
    };
    gvfs.enable = true;
    devmon.enable = true;
    openssh.enable = true;
  };
}
