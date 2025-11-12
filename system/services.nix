{
  services = {
    libinput = {
      mouse = {
        accelProfile = "flat";
      };
    };

    xserver = {
      enable = true;
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
          banner = ''
            0858244115 - fionnbennett06@gmail.com
          '';
        };
      };
      xkb = {
        variant = "";
        layout = "us";
      };
    };

    udisks2 = {
      enable = true;
    };

    hardware.openrgb.enable = true;

    flatpak = {
      enable = true;
      update = {
        onActivation = true;
      };
      uninstallUnmanaged = true;
      overrides = {
        global = {
          Environment = {
            XCURSOR_SIZE = "16";
            MOZ_ENABLE_WAYLAND = "1";
            NIX_OZONE_WL = "1";
            NIX_OZONE = "1";
          };
          Context = {
            filesystems = [
              "/usr/share/icons:ro"
              "~/.icons:ro"
              "~/.themes:ro"
            ];
          };
        };
      };
    };

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
      jack = {
        enable = true;
      };
    };

    gvfs = {
      enable = true;
    };

    devmon = {
      enable = true;
    };

    openssh = {
      enable = true;
    };
  };
}
